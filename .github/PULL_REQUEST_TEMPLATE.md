## Descripción del Pull Request
<!--- Proporcione una descripción clara y concisa de los cambios introducidos en este PR -->

## Tipo de Cambio
<!--- Marque el tipo de cambio que mejor describa este PR -->
- [ ] 🐛 Bug fix (corrección de error)
- [ ] ✨ Nueva funcionalidad (feature)
- [ ] 💥 Breaking change (cambio que rompe compatibilidad)
- [ ] 📝 Actualización de documentación
- [ ] ♻️ Refactorización (sin cambios funcionales)
- [ ] 🎨 Mejoras de estilo/formato
- [ ] ⚡ Mejoras de rendimiento
- [ ] ✅ Actualización de tests
- [ ] 🔧 Cambios de configuración
- [ ] 🚀 Cambios en CI/CD
- [ ] 🔒 Corrección de seguridad

## Puntos de Compliance y Calidad

### Orquestación de Agentes de IA
<!--- Marque los agentes que han trabajado o validado este PR -->
- [ ] powershell_expert - Análisis y validación de PowerShell
- [ ] dotnet_csharp_developer - Análisis y validación de .NET/C#
- [ ] sql_server_specialist - Análisis y validación de SQL Server
- [ ] ci_cd_engineer - Validación de workflows
- [ ] docker_engineer - Validación de DevContainers
- [ ] git_manager - Gestión de commits y branches
- [ ] code_reviewer - Revisión de calidad de código
- [ ] documenter - Actualización de documentación
- [ ] local_devops - Validación en entorno local

### Reglas Obligatorias Cumplidas
<!--- TODAS estas reglas DEBEN cumplirse antes de aprobar el PR -->
- [ ] **Spanish Only**: Toda la documentación, comentarios y mensajes están en español
- [ ] **Centralized Docs**: README.md actualizado con estado actual (sin changelog)
- [ ] **Security First**: Código validado por PSScriptAnalyzer/.NET Analyzers/SqlLint

### Validaciones de Código
<!--- Marque las validaciones que han pasado exitosamente -->
- [ ] PSScriptAnalyzer ejecutado sin errores ni warnings
- [ ] .NET Build exitoso (sin errores ni warnings)
- [ ] SqlLint ejecutado sin errores (si aplica)
- [ ] Módulo PowerShell se importa correctamente
- [ ] Tests unitarios pasan (si existen)

### Documentación
- [ ] Se ha documentado el código apropiadamente (comentarios en español)
- [ ] README.md actualizado para reflejar estado actual del proyecto
- [ ] CHANGELOG.md actualizado (si existe)
- [ ] Documentación de funciones/cmdlets actualizada (help comments)
- [ ] Archivos de configuración actualizados si es necesario

### Testing y Validación
- [ ] Se han realizado pruebas manuales del código
- [ ] Se ha validado en Windows (si aplica)
- [ ] Se ha validado en Linux (si aplica)
- [ ] Se ha validado con PowerShell 5.1 (si aplica)
- [ ] Se ha validado con PowerShell 7.x (si aplica)
- [ ] Se ha validado con .NET Framework 4.8 (si aplica)
- [ ] Se ha validado con .NET 10.x (si aplica)

### Comandos de Build Ejecutados
<!--- Marque los comandos que han sido ejecutados exitosamente -->
- [ ] `./config/make.ps1 -Task Init`
- [ ] `./config/make.ps1 -Task PowershellAnalysis`
- [ ] `./config/make.ps1 -Task DotnetBuild` (si aplica)
- [ ] `./config/make.ps1 -Task SqlLint` (si aplica)
- [ ] `./config/make.ps1 -Task PowershellImport`
- [ ] Build completo exitoso

## Listado de Cambios Introducidos
<!--- Liste de forma detallada los cambios realizados -->

### Archivos Modificados
- 
- 
- 

### Archivos Nuevos
- 
- 

### Archivos Eliminados
- 
- 

### Funciones/Cmdlets Nuevos o Modificados
<!--- Liste funciones PowerShell nuevas o modificadas -->
- 
- 

### Clases/Tipos .NET Nuevos o Modificados
<!--- Liste clases o tipos .NET nuevos o modificados -->
- 
- 

### Cambios de Base de Datos
<!--- Liste cambios en tablas, procedimientos, funciones SQL -->
- 
- 

## Motivación y Contexto
<!--- ¿Por qué se requiere este cambio? ¿Qué problema resuelve? -->

## Impacto del Cambio

### Compatibilidad hacia Atrás
- [ ] No rompe compatibilidad
- [ ] Rompe compatibilidad (breaking change) - Justificar abajo

<!--- Si rompe compatibilidad, explique el impacto y plan de migración -->

### Módulos Afectados
<!--- Marque los módulos del proyecto afectados por este cambio -->
- [ ] Nombre del módulo
- [ ] Configuración global (global.json, .psd1)
- [ ] CI/CD Workflows
- [ ] Otros (especificar)

### Áreas del Sistema Impactadas
- [ ] PowerShell Modules (Public/)
- [ ] PowerShell Modules (Private/)
- [ ] Tipos y Clases .NET (Types/)
- [ ] Proyectos .NET (.csproj)
- [ ] Proyectos SQL Server (.sqlproj)
- [ ] Sistema de Build (config/make.ps1)
- [ ] Workflows GitHub Actions
- [ ] DevContainer
- [ ] Documentación
- [ ] Tests

## Comportamiento Antes y Después

### Antes
<!--- Describa el comportamiento anterior -->

### Después
<!--- Describa el nuevo comportamiento -->

## Capturas de Pantalla o Logs
<!--- Si aplica, agregue capturas de pantalla o logs relevantes -->

### Output de Comandos
```powershell
# Pegue aquí la salida relevante de comandos ejecutados
```

### PSScriptAnalyzer Results
```
# Pegue aquí los resultados de PSScriptAnalyzer
```

### Build Output
```
# Pegue aquí la salida del build
```

## Issues y Work Items Vinculados
<!--- Vincule los issues o work items relacionados -->

**Closes/Fixes**:
- Close #___
- Fixes #___

**Related**:
- Related to #___
- Part of #___

**Depends on**:
- Depends on #___

**Blocks**:
- Blocks #___

## Migraciones o Acciones Requeridas
<!--- ¿Se requieren acciones especiales después del merge? -->
- [ ] No se requieren acciones adicionales
- [ ] Se requiere actualizar configuración local
- [ ] Se requiere ejecutar migración de base de datos
- [ ] Se requiere actualizar dependencias
- [ ] Se requiere actualizar versión de PowerShell/NET
- [ ] Otros (especificar abajo)

<!--- Si se requieren acciones, descríbalas en detalle -->

## Checklist Final
<!--- Verifique que TODO lo siguiente está completo antes de solicitar revisión -->
- [ ] El código sigue las convenciones del proyecto
- [ ] He revisado mi propio código
- [ ] He comentado el código en áreas difíciles de entender
- [ ] He actualizado la documentación correspondiente
- [ ] Mis cambios no generan nuevos warnings
- [ ] He agregado tests que prueban mis cambios (si aplica)
- [ ] Tests nuevos y existentes pasan localmente
- [ ] Commits siguen el formato convencional (emoji + descripción en español)
- [ ] Branch está actualizado con main/master
- [ ] No hay conflictos de merge
- [ ] CI/CD workflows pasan exitosamente

## Notas para Revisores
<!--- Agregue notas especiales para quienes revisen este PR -->

### Áreas que Requieren Atención Especial
- 

### Preguntas Abiertas
- 

### Consideraciones de Seguridad
- 

## Plan de Deployment
<!--- Si es relevante, describa el plan de deployment -->
- [ ] Deploy directo sin consideraciones especiales
- [ ] Requiere deployment coordinado
- [ ] Requiere deployment en ventana de mantenimiento
- [ ] Requiere rollback plan (describir abajo)

---

**Nota**: Este Pull Request será revisado por los agentes de IA especializados según la orquestación definida en `.agent/`. Todos los puntos de compliance deben estar marcados antes de aprobar el merge.