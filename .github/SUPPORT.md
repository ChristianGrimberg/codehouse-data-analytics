# Soporte y Ayuda

¿Necesitas ayuda con el repositorio? Esta guía te proporcionará los recursos y canales apropiados para obtener soporte.

## Tabla de Contenidos

- [Antes de Solicitar Ayuda](#antes-de-solicitar-ayuda)
- [Recursos de Documentación](#recursos-de-documentación)
- [Tipos de Soporte](#tipos-de-soporte)
- [Canales de Soporte](#canales-de-soporte)
- [Reportar Problemas](#reportar-problemas)
- [Preguntas Frecuentes (FAQ)](#preguntas-frecuentes-faq)
- [Comunidad y Colaboración](#comunidad-y-colaboración)
- [Contacto del Equipo](#contacto-del-equipo)

## Antes de Solicitar Ayuda

Antes de solicitar soporte, por favor:

1. **Revisa la documentación** - Muchas preguntas están respondidas en la documentación existente
2. **Busca en issues existentes** - Alguien más pudo haber tenido el mismo problema
3. **Verifica tu entorno** - Asegúrate de cumplir con los prerequisitos
4. **Intenta troubleshooting básico** - Ejecuta validaciones locales

## Recursos de Documentación

### Documentación Principal

- **[README.md](../README.md)** - Documentación principal del proyecto
  - Descripción general y arquitectura
  - Sistema de build y comandos
  - Configuración de desarrollo
  - Workflows de desarrollo
  - Estructura del repositorio

- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Guía de contribución
  - Proceso de desarrollo
  - Estándares de código
  - Commits y Pull Requests
  - Revisión de código

- **[CHANGELOG.md](../CHANGELOG.md)** - Historial de cambios
  - Versiones y releases
  - Cambios por versión
  - Features agregados
  - Bugs corregidos

### Documentación de Agentes de IA

- **[.agent/README.md](../.agent/README.md)** - Orquestación de agentes
  - Arquitectura multi-agente
  - Agentes especializados disponibles
  - Reglas obligatorias
  - Cómo usar los agentes

- **[AGENTS.md](../AGENTS.md)** - Índice de agentes (OpenCode)
  - Lista completa de agentes
  - Responsabilidades de cada agente
  - Activación automática y manual

### Documentación Técnica Específica

- **[global.json](../global.json)** - Configuración de versiones
  - Versiones de PowerShell, .NET, SQL Server
  - Dependencias y módulos
  - Paquetes NuGet

- **[PSScriptAnalyzerSettings.psd1](../PSScriptAnalyzerSettings.psd1)** - Reglas de análisis
  - Configuración de PSScriptAnalyzer
  - Reglas excluidas

- **[.vscode/tasks.json](../.vscode/tasks.json)** - Tareas de VS Code
  - Workflows de desarrollo
  - Comandos de build

## Tipos de Soporte

### 1. Soporte de Uso
**Para preguntas sobre cómo usar el proyecto**

- ¿Cómo ejecuto el sistema de build?
- ¿Cómo importo los módulos PowerShell?
- ¿Cómo conecto a la base de datos?
- ¿Cómo uso una función específica?

👉 **Canal**: [GitHub Discussions - Q&A](../../discussions/categories/q-a)

### 2. Soporte de Desarrollo
**Para preguntas sobre desarrollo y contribución**

- ¿Cómo configuro mi entorno de desarrollo?
- ¿Cómo ejecuto validaciones locales?
- ¿Cómo creo un Pull Request?
- ¿Cómo trabajo con los agentes de IA?

👉 **Canal**: [CONTRIBUTING.md](CONTRIBUTING.md) + [GitHub Discussions - Development](../../discussions/categories/development)

### 3. Reportar Bugs
**Para errores o problemas encontrados**

- El módulo falla al importar
- Una función devuelve un error
- El build falla con un error específico
- Los tests no pasan

👉 **Canal**: [GitHub Issues - Bug Report](../../issues/new?template=bug.md)

### 4. Solicitar Funcionalidades
**Para solicitar nuevas características**

- Necesito una nueva función para...
- Sería útil si el sistema pudiera...
- Me gustaría que se agregara...

👉 **Canal**: [GitHub Issues - Feature Request](../../issues/new?template=feature_request.md)

### 5. Proponer Mejoras
**Para proponer cambios o mejoras**

- Tengo una idea para mejorar...
- Propongo cambiar X por Y porque...
- Sugiero agregar soporte para...

👉 **Canal**: [GitHub Issues - Proposal](../../issues/new?template=proposal.md)

### 6. Información Técnica Detallada
**Para casos técnicos complejos**

- Problema complejo que requiere análisis profundo
- Información técnica detallada sobre un caso
- Diagnóstico de un problema específico

👉 **Canal**: [GitHub Issues - Technical](../../issues/new?template=technical.md)

## Canales de Soporte

### GitHub Issues
**Para reportar problemas, solicitar features o proponer mejoras**

- **Cuándo usar**: 
  - Bugs y errores
  - Solicitudes de funcionalidades
  - Propuestas de mejoras
  - Información técnica detallada
- **Plantillas disponibles**:
  - [Bug Report](../../issues/new?template=bug.md)
  - [Feature Request](../../issues/new?template=feature_request.md)
  - [Proposal](../../issues/new?template=proposal.md)
  - [Technical](../../issues/new?template=technical.md)

### GitHub Discussions
**Para preguntas generales, discusiones y ayuda**

- **Cuándo usar**:
  - Preguntas generales
  - Dudas sobre uso
  - Discusiones de diseño
  - Ideas preliminares
- **Categorías**:
  - **Q&A**: Preguntas y respuestas
  - **Development**: Discusiones de desarrollo
  - **Ideas**: Ideas y sugerencias preliminares
  - **Show and Tell**: Compartir cómo estás usando el proyecto

### Pull Requests
**Para contribuir con código o documentación**

- **Cuándo usar**:
  - Contribuir con código
  - Corregir errores
  - Mejorar documentación
  - Agregar funcionalidades
- **Requisitos**:
  - Leer [CONTRIBUTING.md](CONTRIBUTING.md)
  - Seguir estándares de código
  - Completar template de PR
  - Pasar validaciones de CI/CD

### Equipo de Desarrollo
**Para contacto directo (casos especiales)**

- **URL**: https://github.com/ChristianGrimberg
- **Cuándo usar**:
  - Temas de seguridad sensibles
  - Cuestiones organizacionales
  - Colaboraciones especiales
  - Casos que requieren contacto directo

## Reportar Problemas

### Información Requerida

Al reportar un problema, **siempre incluye**:

1. **Descripción clara del problema**
2. **Pasos para reproducir**
3. **Comportamiento esperado vs. actual**
4. **Entorno de ejecución**:
   - Sistema operativo y versión
   - Versión de PowerShell
   - Versión del módulo
   - Versión de .NET
   - Versión de SQL Server (si aplica)
5. **Logs y mensajes de error**
6. **Capturas de pantalla** (si son relevantes)

### Formato de Reporte

Usa las plantillas de issue proporcionadas:

```markdown
## Descripción del Error
[Descripción clara]

## Pasos para Reproducir
1. Paso 1
2. Paso 2
3. Paso 3

## Comportamiento Esperado
[Qué esperabas que sucediera]

## Comportamiento Actual
[Qué sucedió realmente]

## Entorno de Ejecución
- OS: Windows 11
- PowerShell: 7.4.0
- Módulo: 1.0.17.30
- .NET: 10.0.0

## Logs
```
[Logs relevantes]
```
```

## Preguntas Frecuentes (FAQ)

### Instalación y Configuración

**P: ¿Cuáles son los prerequisitos para usar este proyecto?**

R: Necesitas:
- PowerShell 5.1+ (Windows) o PowerShell 7.x (Linux)
- .NET SDK 10.x
- .NET Framework 4.8 (Windows)
- SQL Server 2019+ o LocalDB
- PSScriptAnalyzer (para desarrollo)

Ver [README.md](../README.md#prerequisitos) para más detalles.

**P: ¿Cómo configuro mi entorno de desarrollo?**

R: Sigue la guía en [CONTRIBUTING.md - Configuración del Entorno de Desarrollo](CONTRIBUTING.md#configuración-del-entorno-de-desarrollo).

**P: ¿Puedo usar este proyecto en Linux?**

R: Sí, el proyecto es compatible con Linux usando PowerShell Core 7.x y .NET 10.x. Ver [README.md](../README.md) para configuración específica de Linux.

### Sistema de Build

**P: ¿Cómo ejecuto el build del proyecto?**

R: Usa el orquestador central:
```powershell
./config/make.ps1 -Task Init, PowershellAnalysis, DotnetBuild
```

Ver [README.md - Sistema de Build](../README.md#sistema-de-build-y-comandos) para lista completa de comandos.

**P: El build falla con error de timeout. ¿Qué hago?**

R: Los builds pueden tardar 30+ segundos en la primera ejecución. Usa timeout mayor:
```powershell
./config/make.ps1 -Task Init, DotnetRestore, DotnetBuild
# Espera al menos 5 minutos en primera ejecución
```

**P: PSScriptAnalyzer reporta warnings. ¿Es normal?**

R: No. El proyecto está configurado con `TreatWarningsAsErrors`. Debes corregir todos los errores y warnings antes de commit. Ver `PSScriptAnalyzerSettings.psd1` para reglas.

### Módulos y Funciones

**P: ¿Cómo importo los módulos PowerShell?**

R: Ejecuta:
```powershell
./config/make.ps1 -Task PowershellImport
```

**P: Falta dependencia Novocap.PowerShell.Logging.Management. ¿Es un problema?**

R: No es un problema si estás en desarrollo. Esta dependencia es externa y no rompe el build. Los warnings son normales.

### Agentes de IA

**P: ¿Qué son los agentes de IA y cómo los uso?**

R: Los agentes de IA son herramientas especializadas para automatizar tareas. Ver [.agent/README.md](../.agent/README.md) para documentación completa.

**P: ¿Cuál agente debo usar para mi tarea?**

R: Depende de la tarea:
- Código PowerShell → `powershell_expert`
- Código .NET/C# → `dotnet_csharp_developer`
- SQL Server → `sql_server_specialist`
- CI/CD → `ci_cd_engineer`
- Documentación → `documenter`

Ver [AGENTS.md](../AGENTS.md) para lista completa.

### Contribución

**P: ¿Cómo contribuyo al proyecto?**

R: Lee [CONTRIBUTING.md](CONTRIBUTING.md) para guía completa de contribución.

**P: ¿Puedo contribuir sin ser miembro del equipo?**

R: Sí, las contribuciones externas son bienvenidas. Crea un fork, haz tus cambios y crea un Pull Request.

**P: ¿En qué idioma debo escribir documentación y comentarios?**

R: **Español**. El proyecto sigue la regla "Spanish Only" para toda documentación y comentarios. Ver [.agent/rules/spanish_only.md](../.agent/rules/spanish_only.md).

### Seguridad

**P: Encontré un problema de seguridad. ¿Cómo lo reporto?**

R: Para problemas de seguridad sensibles, contacta directamente al equipo de desarrollo en lugar de crear un issue público. Ver [Contacto del Equipo](#contacto-del-equipo).

**P: ¿Cómo valido que mi código es seguro?**

R: El proyecto tiene validaciones de seguridad automáticas:
- PSScriptAnalyzer para PowerShell
- .NET Analyzers para C#
- TSqlLint para SQL Server

Ejecuta validaciones antes de commit. Ver [CONTRIBUTING.md - Reglas Obligatorias](CONTRIBUTING.md#reglas-obligatorias).

## Comunidad y Colaboración

### Participar en Discusiones

- **GitHub Discussions**: Comparte ideas, haz preguntas, discute diseño
- **Code Reviews**: Participa en revisiones de PRs
- **Issues**: Ayuda a responder preguntas de otros usuarios

### Compartir Feedback

Tu feedback es valioso. Comparte:
- Experiencias usando el proyecto
- Sugerencias de mejora
- Casos de uso interesantes
- Problemas encontrados y soluciones

### Mantenerse Actualizado

- **Watch** el repositorio para recibir notificaciones
- Revisa [CHANGELOG.md](../CHANGELOG.md) para cambios recientes
- Revisa [Releases](../../releases) para nuevas versiones

## Contacto del Equipo

### Equipo de Desarrollo

- **Autor**: [Christian Grimberg](https://github.com/ChristianGrimberg)

### Reportar Problemas de Seguridad

Para problemas de seguridad sensibles que no deben ser públicos:

1. **NO** crear issue público
2. Contactar directamente al equipo
3. Proporcionar detalles del problema de seguridad
4. Esperar confirmación antes de divulgar

### Tiempos de Respuesta

- **Issues críticos**: 24-48 horas
- **Issues regulares**: 3-5 días hábiles
- **Discusiones**: Variable según actividad de la comunidad
- **Pull Requests**: 3-7 días hábiles para revisión inicial

### Horarios de Soporte

El equipo opera en horario de Argentina (UTC-3):
- **Horario laboral**: Lunes a Viernes, 9:00 - 18:00 ART
- **Respuestas más rápidas**: Durante horario laboral
- **Fines de semana**: Respuestas limitadas

## Recursos Adicionales

### Documentación Externa

- **PowerShell**: https://docs.microsoft.com/powershell
- **.NET**: https://docs.microsoft.com/dotnet
- **SQL Server**: https://docs.microsoft.com/sql
- **GitHub Actions**: https://docs.github.com/actions

### Herramientas Recomendadas

- **VS Code**: https://code.visualstudio.com
- **PowerShell Extension**: https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell
- **C# Dev Kit**: https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit
- **GitLens**: https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens

---

**Nota**: Esta guía de soporte se actualiza periódicamente. Si no encuentras respuesta a tu pregunta, no dudes en crear un [Discussion](../../discussions) o contactar al equipo.

**Versión**: 1.0  
**Última actualización**: 2026-01-22  
**Mantenido por**: [Christian Grimberg](https://github.com/ChristianGrimberg)
