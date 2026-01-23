---
name: "Reporte técnico detallado"
about: Utilice esta plantilla para proporcionar información técnica detallada sobre un caso específico.
title: 'INFORMACION TECNICA: [Descripción del caso]'
labels: technical
assignees: '@ChristianGrimberg, @Copilot'

---

## Resumen Técnico
<!--- Proporcione un resumen ejecutivo del caso técnico -->

## Contexto del Sistema
<!--- Describa el contexto técnico donde se presenta el caso -->

### Componentes Involucrados
<!--- Marque los componentes del sistema relacionados -->
- [ ] Módulos PowerShell (.ps1, .psm1, .psd1)
- [ ] Proyectos .NET/C# (.cs, .csproj)
- [ ] Base de datos SQL Server (.sql, .sqlproj)
- [ ] Scripts de build (config/make.ps1)
- [ ] Workflows CI/CD (.github/workflows/)
- [ ] DevContainer (.devcontainer/)
- [ ] Otros (especificar)

### Módulos Específicos Afectados
<!--- Liste los módulos específicos del proyecto -->
- [ ] Nombre del módulo
- [ ] Templates
- [ ] Otros (especificar)

## Pasos para Reproducir el Caso
<!--- Brinde una lista detallada de pasos para reproducir el caso -->

### Prerequisitos
<!--- Liste los prerequisitos necesarios -->
1. 
2. 

### Secuencia de Reproducción
<!--- Pasos detallados -->
1. 
2. 
3. 
4. 

### Comandos Ejecutados
<!--- Si aplica, liste los comandos exactos ejecutados -->
```powershell
# Pegue aquí los comandos
./config/make.ps1 -Task ...
```

## Entorno de Ejecución
<!--- Complete toda la información técnica del entorno -->

### Sistema Operativo
- [ ] Windows 10/11
- [ ] Windows Server
- [ ] Linux (especificar distribución): ___________

### Versiones de Software
- **PowerShell**: 
  - [ ] 5.1 (Windows PowerShell)
  - [ ] 7.x (PowerShell Core) - Versión: ___________
- **.NET SDK**: ___________
- **.NET Runtime**: 
  - [ ] .NET Framework 4.8
  - [ ] .NET 10.x
- **SQL Server**: 
  - [ ] SQL Server 2019+
  - [ ] LocalDB
  - [ ] Otro: ___________

### Versión del Módulo
- **Versión instalada**: ___________
- **Versión esperada**: ___________

### Configuración del Entorno
```json
{
  "PowerShell": "",
  ".NET": "",
  "SQL Server": "",
  "Otros": ""
}
```

## Análisis Técnico
<!--- Proporcione un análisis técnico del caso -->

### Comportamiento Observado
<!--- Describa técnicamente qué está ocurriendo -->

### Comportamiento Esperado
<!--- Describa técnicamente qué debería ocurrir -->

### Logs y Trazas
<!--- Incluya logs relevantes, stack traces, mensajes de error -->

#### PSScriptAnalyzer (si aplica)
```
Pegue aquí la salida de PSScriptAnalyzer
```

#### Build Output (si aplica)
```
Pegue aquí la salida del build
```

#### Runtime Errors (si aplica)
```
Pegue aquí los errores de ejecución
```

#### SQL Server Errors (si aplica)
```
Pegue aquí los errores de SQL Server
```

### Capturas de Pantalla
<!--- Agregue capturas de pantalla si son relevantes -->

## Detalles Técnicos Adicionales

### Dependencias
<!--- Liste dependencias relevantes y sus versiones -->
- 

### Configuración Relevante
<!--- Incluya configuración de global.json, .psd1, o archivos de configuración -->
```json
{
  // Pegue aquí configuración relevante
}
```

### Estado de Git
<!--- Si es relevante, incluya información de Git -->
- **Branch**: 
- **Commit**: 
- **Estado local**: 

### Análisis de Código
<!--- Si ha realizado análisis del código, incluya hallazgos -->

#### Archivos Afectados
1. 
2. 
3. 

#### Funciones/Métodos Involucrados
1. 
2. 
3. 

## Diagnóstico Realizado
<!--- Describa qué diagnóstico ha realizado -->

### Pruebas Ejecutadas
1. 
2. 
3. 

### Resultados Observados
<!--- Describa los resultados de las pruebas -->

## Propuesta de Solución Técnica
<!--- Si tiene una propuesta técnica, descríbala aquí -->

### Cambios Sugeridos
<!--- Liste cambios técnicos específicos -->
1. 
2. 
3. 

### Archivos a Modificar
<!--- Liste archivos específicos que necesitarían cambios -->
- 
- 
- 

### Comandos de Validación
<!--- Comandos para validar la solución -->
```powershell
# Comandos de validación
./config/make.ps1 -Task Init, PowershellAnalysis, DotnetBuild
```

## Impacto y Riesgos Técnicos
<!--- Evalúe el impacto técnico -->

### Impacto
- [ ] Crítico - Afecta funcionalidad core
- [ ] Alto - Afecta múltiples módulos
- [ ] Medio - Afecta módulo específico
- [ ] Bajo - Cambio localizado

### Riesgos
<!--- Liste riesgos técnicos asociados -->
- 

### Dependencias de Otros Issues
<!--- Si depende de otros issues, relaciónelos -->
- Depends on #___
- Related to #___

## Referencias Técnicas
<!--- Agregue referencias técnicas, documentación, RFCs, etc. -->
- 
- 
- 

## Agentes de IA Recomendados
<!--- Indique qué agentes deberían trabajar en este caso técnico -->
- [ ] powershell_expert - Para análisis de PowerShell
- [ ] dotnet_csharp_developer - Para código .NET/C#
- [ ] sql_server_specialist - Para SQL Server
- [ ] ci_cd_engineer - Para CI/CD
- [ ] docker_engineer - Para DevContainers
- [ ] local_devops - Para troubleshooting local
- [ ] code_reviewer - Para revisión de código
- [ ] Otros (especificar)

---

**Nota**: Este reporte técnico será procesado por los agentes especializados según la orquestación definida en `.agent/`. La información detallada facilita el diagnóstico y resolución eficiente del caso.