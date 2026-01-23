# Regla: Centralized Docs (Documentación Centralizada)

## Declaración de la Regla

**Toda la documentación funcional y técnica del proyecto DEBE estar centralizada en README.md. NO se debe agregar historial de cambios, changelogs, o notas de sprint a README.md.**

## Principios Fundamentales

### 1. README.md como Fuente Única de Verdad

README.md debe reflejar el **estado ACTUAL** del proyecto:

- ✅ Descripción general y propósito
- ✅ Arquitectura y componentes
- ✅ Comandos de build y uso
- ✅ Configuración de desarrollo
- ✅ Prerequisitos y dependencias
- ✅ Estructura del repositorio
- ✅ Guías de contribución

### 2. Historia en Git, NO en README

El historial de cambios se mantiene mediante:

- ✅ **Git Tags**: Versiones marcadas (v1.0.0, v1.0.1)
- ✅ **GitHub Releases**: Notas de versión con cada tag
- ✅ **CHANGELOG.md**: Archivo separado para historial (opcional)
- ✅ **Git Commits**: Historia detallada de cambios

### 3. Separación de Documentación

```
/
├── README.md              # Estado ACTUAL del proyecto
├── CHANGELOG.md           # Historia de cambios (opcional)
├── .github/
│   ├── CONTRIBUTING.md    # Guía de contribución
│   ├── SUPPORT.md         # Soporte y ayuda
│   └── ISSUE_TEMPLATE/    # Templates de issues
└── docs/                  # Documentación adicional (si es extensa)
```

## ¿Qué SÍ va en README.md?

### ✅ Incluir

1. **Descripción del Proyecto**
   ```markdown
   ## Descripción General
   Este proyecto implementa un sistema para...
   ```

2. **Arquitectura Actual**
   ```markdown
   ## Arquitectura de Módulos
   
   ### 1. [Nombre de directorios dentro de ./Modules]
   Actúa como capa de orquestación...
   ```

3. **Comandos y Uso Actual**
   ```markdown
   ## Sistema de Build

   ./config/make.ps1 -Task Init, Analyze, Build
   ```

4. **Prerequisitos Actuales**
   ```markdown
   ## Prerequisitos
   
   - PowerShell 5.1+
   - .NET SDK 10.x
   - SQL Server 2019+
   ```

5. **Workflows de Desarrollo**
   ```markdown
   ## Workflows de Desarrollo
   ```

   ### Workflow Completo
   ```powershell
   ./config/make.ps1 -Task Init, Analyze, Build, Publish
   ```

6. **Configuración Actual**
   ```markdown
   ## Configuración de Desarrollo
   
   El archivo `global.json` centraliza versiones...
   ```

7. **Troubleshooting Común**
   ```markdown
   ## Troubleshooting
   
   ### Problema: PSScriptAnalyzer falla

   * Solución: ...
   ```

## ¿Qué NO va en README.md?

### ❌ NO Incluir

1. **Changelog o Historia de Cambios**
   ```markdown
   # ❌ INCORRECTO
   
   ## Changelog
   
   ### v1.0.10.0 - 2026-01-21
   - Agregado soporte para agentes AI
   - Corregido bug en procesamiento
   
   ### v1.0.9.0 - 2026-01-15
   - Agregado SqlLint
   ```
   
   **Ubicación correcta**: CHANGELOG.md separado o GitHub Releases

2. **Notas de Sprint o Desarrollo**
   ```markdown
   # ❌ INCORRECTO
   
   ## Sprint 23 (Enero 2026)
   - Completado: Feature X
   - En progreso: Feature Y
   - Pendiente: Feature Z
   ```
   
   **Ubicación correcta**: GitHub Projects, Issues, Milestones

3. **Features Futuras o Roadmap**
   ```markdown
   # ❌ INCORRECTO
   
   ## Roadmap
   
   - Q1 2026: Implementar feature X
   - Q2 2026: Migrar a nueva versión Y
   ```
   
   **Ubicación correcta**: GitHub Projects, Wiki, o archivo ROADMAP.md separado

4. **Referencias a Issues Específicos**
   ```markdown
   # ❌ INCORRECTO
   
   ## Cambios Recientes
   
   - Fixed #123: Error en validación
   - Implemented #124: Nueva funcionalidad
   ```
   
   **Ubicación correcta**: CHANGELOG.md, Releases, o commits

5. **Historial de Decisiones Técnicas**
   ```markdown
   # ❌ INCORRECTO

   ## Decisiones de Diseño

   - 2026-01-15: Decidimos usar .NET 10 en lugar de .NET 8
   - 2026-01-10: Cambiamos de SQLFluff a TSqlLint
   ```

   **Ubicación correcta**: Wiki, ADRs (Architecture Decision Records) separados

## Estructura Recomendada de README.md

```markdown
# Nombre del Proyecto

[![Badges de CI/CD]](...)

## Descripción General
[Estado actual del proyecto]

## Arquitectura de Módulos
[Estructura actual]

## Sistema de Build y Comandos
[Comandos actuales]

### Prerequisitos
[Requisitos actuales]

### Essential Commands
[Comandos principales]

## Workflows de Desarrollo
[Flujos de trabajo actuales]

## Integración Continua (CI/CD)
[Workflows actuales]

## Configuración de Desarrollo
[Setup actual]

## Reglas de Análisis de Código
[Configuración actual]

## Estructura del Repositorio
[Árbol de directorios actual]

## Contribuir
[Guía de contribución]

## Licencia
[Información de licencia]

## Contacto
[Información de contacto]
```

## Gestión de Historial: Alternativas a README.md

### 1. CHANGELOG.md

**Formato**: Keep a Changelog

```markdown
# Changelog

## [Unreleased]

## [1.0.10.0] - 2026-01-21

### Added
- Orquestación de agentes AI

### Changed
- Actualizado README con documentación de agentes

### Fixed
- N/A
```

### 2. GitHub Releases

**Crear release en GitHub UI**:
1. Tags → Create new release
2. Tag version: `v1.0.10.0`
3. Release title: `v1.0.10.0`
4. Description: Copiar de CHANGELOG.md
5. Attach artifacts
6. Publish

### 3. Git Tags

```bash
# Tag anotado
git tag -a v1.0.10.0 -m ":rocket: AI Agent Orchestration"

# Ver tags
git tag -l

# Ver detalles de tag
git show v1.0.10.0
```

### 4. GitHub Projects

Para roadmap y planning:
- Crear proyecto en GitHub
- Columnas: Todo, In Progress, Done
- Vincular issues y PRs

## Proceso de Actualización de README.md

### Cuando Actualizar

1. **Nueva Funcionalidad**: Agregar sección o actualizar existente
2. **Comando Nuevo**: Documentar en sección de comandos
3. **Cambio de Prerequisito**: Actualizar sección de instalación
4. **Cambio de Arquitectura**: Actualizar diagrama/descripción

### Qué Eliminar

1. **Información Obsoleta**: Remover inmediatamente
2. **Características Removidas**: Eliminar de documentación
3. **Comandos Deprecados**: Eliminar o marcar como deprecados
4. **Notas Temporales**: Eliminar después de resolver

### Ejemplo de Actualización

```markdown
# Antes (obsoleto)

## Build Commands

Run `make build` to compile

# Después (actualizado)

## Sistema de Build

Ejecutar `./config/make.ps1 -Task DotnetBuild` para compilar
```

## Validación

### Checklist de Revisión

Al actualizar README.md, verificar:

- [ ] **Estado Actual**: Toda la información refleja el código actual
- [ ] **Sin Changelog**: No hay historial de cambios en README
- [ ] **Sin Roadmap**: No hay planes futuros en README
- [ ] **Sin Notas de Sprint**: No hay referencias a sprints específicos
- [ ] **Ejemplos Funcionales**: Todos los comandos funcionan
- [ ] **Links Válidos**: Todos los enlaces apuntan a recursos existentes
- [ ] **Información Actualizada**: No hay secciones obsoletas

### Script de Validación

```powershell
function Test-ReadmeContent {
    $content = Get-Content README.md -Raw
    
    $antiPatterns = @{
        'Changelog' = 'Historial de cambios detectado'
        'Sprint \d+' = 'Referencias a sprints detectadas'
        'Q\d+ \d{4}:' = 'Roadmap detectado'
        'v\d+\.\d+\.\d+ -' = 'Formato de changelog detectado'
    }
    
    foreach ($pattern in $antiPatterns.Keys) {
        if ($content -match $pattern) {
            Write-Warning "$($antiPatterns[$pattern]): $pattern"
        }
    }
}
```

## Responsabilidades

### Agente Responsable: documenter

- Asegurar que README.md refleja estado actual
- Eliminar contenido obsoleto o historial
- Mantener estructura consistente
- Validar antes de cada commit

### Agente de Apoyo: code_reviewer

- Revisar cambios a README.md en PRs
- Rechazar si contiene changelog o roadmap
- Solicitar correcciones si es necesario

### Coordinación: release_manager

- Mantener CHANGELOG.md actualizado
- Crear releases con notas de versión
- Asegurar que historial está en ubicación correcta

## Consecuencias de Incumplimiento

1. **PR con changelog en README**: Solicitar mover a CHANGELOG.md
2. **Roadmap en README**: Solicitar mover a GitHub Projects o archivo separado
3. **Información obsoleta**: Solicitar actualización o eliminación

## Referencias

- [Keep a Changelog](https://keepachangelog.com/)
- [GitHub Releases Documentation](https://docs.github.com/repositories/releasing-projects-on-github)
- [README Best Practices](https://github.com/othneildrew/Best-README-Template)
- [Semantic Versioning](https://semver.org/)

---

**Versión**: 1.0  
**Última actualización**: 2026-01-21  
**Estado**: Obligatorio  
**Enforcement**: Estricto
