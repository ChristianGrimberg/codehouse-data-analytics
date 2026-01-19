---
description: Flujo automatizado de GitHub para Commits, Issues, PRs y Reviews - Integrado con estándares del proyecto
---

Este workflow define cómo Antigravity debe interactuar con GitHub y seguir los estándares de construcción y validación de este proyecto.

## 0. Estándares de Construcción y Validación (CRITICO)

Antes de realizar cualquier commit o PR, Antigravity **DEBE** asegurarse de que el código cumple con los estándares del proyecto usando el sistema de construcción `config/make.ps1`.

### Secuencia de Validación Obligatoria:
Cada vez que se realicen cambios, se debe ejecutar la siguiente secuencia (o las tareas relevantes):

// turbo
1. **Inicializar y Analizar PowerShell**: `./config/make.ps1 -Task Init, PowershellAnalysis, PowershellImport`
   - **IMPORTANTE**: Debe pasar con cero errores o advertencias. Si falla, se debe corregir antes de continuar.
2. **Validar .NET**: `./config/make.ps1 -Task Init, DotnetClean, DotnetSolution, ProjectByModule, DotnetRestore, DotnetBuild, DotnetPublish`
   - Asegura la integridad de la solución y los proyectos .NET.
3. **Validar SQL**: `./config/make.ps1 -Task Init, SqlAnalysis, SqlLint, DotnetClean, DotnetSolution, ProjectByModule, DotnetRestore, DotnetBuild, SqlTest, SqlProfile, SqlDacpac, SqlBacpac, SqlPublish`
   - Realiza análisis, linting y publicación de proyectos SQL.


---

## 1. Commits y Push

- Después de completar una tarea y **validar exitosamente** (punto 0):
  - Verificar el estado de git (`git status`).
  - Preparar los archivos (`git add .`).
  - Generar un mensaje de commit descriptivo siguiendo la convención de Git (ej: `feat: add new logging function`).
  - Solicitar confirmación para ejecutar el `git commit` y `git push`.

## 2. Gestión de Documentación (README.md)

Antigravity debe mantener el `README.md` siempre reflejando el estado **actual** del repositorio:
- **Actualización Proactiva**: Si una nueva funcionalidad es agregada o una existente cambia su comportamiento, Antigravity debe proponer la actualización correspondiente en el `README.md`.
- **Sin Historial**: **NO** se debe incluir un historial de cambios, changelog o "Sprints" en el `README.md`. El archivo debe ser una guía técnica del estado presente.
- **Historial de Versiones**: El historial de cambios se gestionará exclusivamente mediante **Git Tags** y **GitHub Releases** al fusionar en `main`.

## 3. Pull Requests y Code Review

- Cuando se trabaje en ramas de funcionalidades:
  - Validar que el flujo completo pase localmente ejecutando las tareas de `tasks.json`.
  - Asegurarse de que el `README.md` esté actualizado si los cambios afectan el funcionamiento o uso.
  - Crear el PR automáticamente usando `gh pr create`.
  - **Auto-Review:** Antigravity ejecutará internamente un `gh pr diff` para realizar una revisión crítica (rendimiento, seguridad y estilo).
  - Presentar un resumen de la revisión al usuario.

## 3. Gestión de Issues

- Antes de comenzar una tarea nueva, buscar issues relacionados (`gh issue list`).
- Al finalizar una tarea, preguntar si desea cerrar el issue asociado (`gh issue close <id>`).

## 4. Arquitectura del Proyecto (Referencia)

Para mantener la integridad, Antigravity debe respetar la siguiente estructura:
- `Modules/`: Contiene los módulos de PowerShell, proyectos .NET y SQL.
- `config/make.ps1`: Orquestador central de construcción.
- No modificar el `global.json` ni `PSScriptAnalyzerSettings.psd1` a menos que sea estrictamente necesario.

---

## Notas de Implementación
- **Entorno**: Usar `powershell` en Windows y `pwsh` en Linux.
- **Rutas**: Siempre usar `/` como separador de rutas para compatibilidad entre plataformas.
- **Timeouts**: Los comandos de `dotnet restore` pueden tardar; usar un timeout de al menos 300s.
