# Guía de Contribución

¡Gracias por tu interés en contribuir en este repositorio! Esta guía te ayudará a entender cómo puedes colaborar efectivamente con el proyecto.

## Tabla de Contenidos

- [Código de Conducta](#código-de-conducta)
- [¿Cómo Puedo Contribuir?](#cómo-puedo-contribuir)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Configuración del Entorno de Desarrollo](#configuración-del-entorno-de-desarrollo)
- [Proceso de Desarrollo](#proceso-de-desarrollo)
- [Estándares de Código](#estándares-de-código)
- [Orquestación de Agentes de IA](#orquestación-de-agentes-de-ia)
- [Reglas Obligatorias](#reglas-obligatorias)
- [Sistema de Build](#sistema-de-build)
- [Commits y Pull Requests](#commits-y-pull-requests)
- [Revisión de Código](#revisión-de-código)
- [Comunidad y Soporte](#comunidad-y-soporte)

## Código de Conducta

Este proyecto se adhiere a un código de conducta de colaboración profesional. Al participar, se espera que:

- Seas respetuoso y profesional en todas las interacciones
- Aceptes críticas constructivas de manera positiva
- Te enfoques en lo que es mejor para el proyecto y la comunidad
- Muestres empatía hacia otros miembros de la comunidad

## ¿Cómo Puedo Contribuir?

### Reportar Bugs

Si encuentras un error, por favor:

1. Verifica que el bug no haya sido reportado previamente en [Issues](../../issues)
2. Usa la plantilla de issue **Bug Report** (`.github/ISSUE_TEMPLATE/bug.md`)
3. Proporciona toda la información solicitada en la plantilla
4. Incluye pasos detallados para reproducir el error
5. Agrega logs, capturas de pantalla y cualquier contexto relevante

### Proponer Mejoras

Para proponer ideas o mejoras:

1. Verifica que la propuesta no exista ya en [Issues](../../issues)
2. Usa la plantilla de issue **Proposal** (`.github/ISSUE_TEMPLATE/proposal.md`)
3. Describe claramente la motivación y beneficios
4. Incluye ejemplos de uso si es posible
5. Considera alternativas y menciónalas

### Solicitar Nuevas Funcionalidades

Para solicitar nuevas funcionalidades:

1. Usa la plantilla de issue **Feature Request** (`.github/ISSUE_TEMPLATE/feature_request.md`)
2. Describe el caso de uso y el problema que resuelve
3. Proporciona ejemplos concretos de cómo se usaría
4. Incluye criterios de aceptación claros

### Reportar Información Técnica

Para casos técnicos complejos:

1. Usa la plantilla de issue **Technical** (`.github/ISSUE_TEMPLATE/technical.md`)
2. Proporciona información técnica detallada
3. Incluye logs, trazas y configuración del entorno
4. Lista comandos ejecutados y resultados observados

## Estructura del Proyecto

```
/
├── .agent/                       # Orquestación de agentes de IA
│   ├── skills/                   # Agentes especializados
│   └── rules/                    # Reglas obligatorias
├── .github/                      # Configuración de GitHub
│   ├── ISSUE_TEMPLATE/           # Templates de issues
│   ├── workflows/                # GitHub Actions CI/CD
│   ├── CONTRIBUTING.md           # Esta guía
│   ├── SUPPORT.md                # Guía de soporte
│   └── PULL_REQUEST_TEMPLATE.md  # Template de PRs
├── .vscode/                      # Configuración VS Code
├── config/                       # Sistema de build
│   └── make.ps1                  # Orquestador central
├── Modules/                      # Módulos PowerShell
│   ├── [Nombre]/                 # Módulo específico
│   │   ├── Public/               # Funciones exportadas
│   │   ├── Private/              # Funciones internas
│   │   ├── Types/                # Clases y tipos .NET
│   │   ├── *.csproj              # Proyectos .NET
│   │   ├── *.sqlproj             # Proyectos SQL Server
│   │   └── *.psd1, *.psm1        # Manifests y módulos
│   └── Templates/                # Plantillas de módulos
├── AGENTS.md                     # Índice de agentes (OpenCode)
├── CHANGELOG.md                  # Historial de cambios
├── README.md                     # Documentación principal
├── global.json                   # Configuración de versiones
└── *.psd1, *.psm1                # Módulo raíz
```

## Configuración del Entorno de Desarrollo

### Prerequisitos

- **Windows**:
  - Windows 10/11 o Windows Server
  - PowerShell 5.1+ (Windows PowerShell)
  - PowerShell 7.x (PowerShell Core) - Recomendado
  - .NET SDK 10.x
  - .NET Framework 4.8
  - SQL Server 2019+ o LocalDB

- **Linux**:
  - Distribución compatible (Ubuntu 20.04+, Debian, etc.)
  - PowerShell Core 7.x
  - .NET SDK 10.x
  - SQL Server 2019+ (Docker container recomendado)

### Instalación de Dependencias

#### Windows

```powershell
# Instalar PowerShell 7.x
winget install Microsoft.PowerShell

# Instalar .NET SDK 10.x
winget install Microsoft.DotNet.SDK.10

# Instalar PSScriptAnalyzer
Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force
```

#### Linux

```bash
# Instalar PowerShell 7.x (Ubuntu/Debian)
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell

# Instalar .NET SDK 10.x
sudo apt-get install -y dotnet-sdk-10.0

# Instalar PSScriptAnalyzer
pwsh -c "Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force"
```

### Configurar VS Code (Recomendado)

1. Instalar VS Code
2. Instalar extensiones recomendadas:
   - PowerShell
   - C# Dev Kit
   - SQL Server (mssql)
   - GitLens
   - GitHub Copilot (opcional)
3. Abrir el proyecto en VS Code
4. Presionar F5 para ejecutar validación completa

### Usar DevContainer (Opcional)

```bash
# Con Docker instalado
code .
# En VS Code: Command Palette (Ctrl+Shift+P) -> "Reopen in Container"
```

## Proceso de Desarrollo

### 1. Crear Branch

```bash
# Actualizar main
git checkout main
git pull origin main

# Crear branch para tu trabajo
git checkout -b feature/nombre-descriptivo
# o
git checkout -b bugfix/nombre-del-bug
# o
git checkout -b hotfix/problema-critico
```

### 2. Hacer Cambios

Sigue estas guías al hacer cambios:

- Haz cambios pequeños e incrementales
- Mantén los commits atómicos (un propósito por commit)
- Escribe código limpio y legible
- Agrega comentarios en español cuando sea necesario
- Documenta funciones y cmdlets apropiadamente

### 3. Validar Cambios

Ejecuta validaciones locales antes de commit:

#### PowerShell

```powershell
# Análisis de código PowerShell
./config/make.ps1 -Task Init, PowershellAnalysis

# Importar módulo
./config/make.ps1 -Task PowershellImport
```

#### .NET

```powershell
# Build de proyectos .NET
./config/make.ps1 -Task Init, DotnetClean, DotnetSolution, ProjectByModule, DotnetRestore, DotnetBuild
```

#### SQL Server

```powershell
# Análisis y build de SQL
./config/make.ps1 -Task Init, SqlAnalysis, SqlLint, DotnetBuild, SqlDacpac
```

#### Validación Completa

```powershell
# Ejecutar todo el workflow
./config/make.ps1 -Task Init, Analyze, Workload, Format, Profile, Solution, Project, Restore, Build, Clean, Artifact, Publish, Import
```

### 4. Hacer Commit

Sigue el formato convencional de commits:

```bash
# Formato: emoji (scope) mensaje en español
git add .
git commit -m ":sparkles: (powershell) agregar nueva función Get-Something"
git commit -m ":bug: (dotnet) corregir validación de parámetros"
git commit -m ":memo: (docs) actualizar README con nuevos comandos"
```

**Emojis Comunes**:
- `:sparkles:` ✨ - Nueva funcionalidad
- `:bug:` 🐛 - Corrección de bug
- `:memo:` 📝 - Documentación
- `:wrench:` 🔧 - Configuración
- `:rocket:` 🚀 - Deployment/Release
- `:art:` 🎨 - Mejoras de estilo
- `:fire:` 🔥 - Eliminación de código
- `:lock:` 🔒 - Seguridad
- `:white_check_mark:` ✅ - Tests
- `:recycle:` ♻️ - Refactoring

### 5. Crear Pull Request

1. Push tu branch:
   ```bash
   git push origin feature/nombre-descriptivo
   ```

2. Ve a GitHub y crea un Pull Request
3. Usa el template de PR (`.github/PULL_REQUEST_TEMPLATE.md`)
4. Completa TODA la información del template
5. Asegúrate de marcar todos los checkboxes de compliance
6. Vincula los issues relacionados

## Estándares de Código

### PowerShell

- Usar PascalCase para funciones y cmdlets: `Get-SomethingUseful`
- Usar camelCase para variables: `$myVariable`
- Seguir convención de cmdlets: `Verb-Noun`
- Incluir comment-based help:
  ```powershell
  function Get-Example {
      <#
      .SYNOPSIS
          Descripción breve en español
      
      .DESCRIPTION
          Descripción detallada en español
      
      .PARAMETER Name
          Descripción del parámetro
      
      .EXAMPLE
          Get-Example -Name "valor"
          Descripción del ejemplo
      #>
      param(
          [Parameter(Mandatory = $true)]
          [string]$Name
      )
      
      # Comentarios en español
      Write-Verbose "Procesando: $Name"
  }
  ```

- Pasar validaciones de PSScriptAnalyzer sin errores ni warnings
- Usar `Write-Verbose` para logging detallado
- Manejar errores apropiadamente con try/catch

### C# (.NET)

- Usar PascalCase para clases, métodos, propiedades
- Usar camelCase para campos privados con `_`: `_privateField`
- Incluir XML documentation comments:
  ```csharp
  /// <summary>
  /// Descripción de la clase en español
  /// </summary>
  public class ExampleClass
  {
      /// <summary>
      /// Descripción de la propiedad
      /// </summary>
      public int Id { get; set; }
      
      /// <summary>
      /// Descripción del método
      /// </summary>
      /// <param name="value">Descripción del parámetro</param>
      /// <returns>Descripción del retorno</returns>
      public bool ProcessValue(string value)
      {
          // Comentarios en español
          return !string.IsNullOrEmpty(value);
      }
  }
  ```

- Pasar build sin warnings (TreatWarningsAsErrors: true)
- Seguir análisis de código .NET

### SQL Server

- Usar PascalCase para objetos: `dbo.MyTable`, `usp_MyProcedure`
- Prefijos estándar:
  - `usp_` para stored procedures
  - `fn_` para funciones
  - `vw_` para vistas
- Incluir comentarios descriptivos:
  ```sql
  -- Descripción del procedimiento en español
  -- Autor: Christian Grimberg
  -- Fecha: Enero 2026
  
  CREATE PROCEDURE [dbo].[usp_ExampleProcedure]
      @Parameter1 INT,
      @Parameter2 NVARCHAR(100)
  AS
  BEGIN
      SET NOCOUNT ON;
      
      -- Validar parámetros
      IF @Parameter1 IS NULL
          THROW 50000, 'Parameter1 no puede ser NULL', 1;
      
      -- Lógica del procedimiento
      SELECT * FROM [dbo].[MyTable]
      WHERE Id = @Parameter1;
  END;
  ```

- Pasar TSqlLint sin errores

## Orquestación de Agentes de IA

Este proyecto utiliza un sistema de orquestación multi-agente. Familiarízate con:

- **`.agent/README.md`**: Documentación completa de agentes
- **`.agent/skills/`**: Agentes especializados disponibles
- **`.agent/rules/`**: Reglas obligatorias del proyecto
- **`AGENTS.md`**: Índice de agentes (OpenCode)

### Agentes Disponibles

- **powershell_expert**: Desarrollo y análisis de PowerShell
- **dotnet_csharp_developer**: Desarrollo .NET/C#
- **sql_server_specialist**: Bases de datos SQL Server
- **ci_cd_engineer**: GitHub Actions y CI/CD
- **docker_engineer**: DevContainers y Docker
- **git_manager**: Control de versiones
- **code_reviewer**: Revisión de código
- **documenter**: Documentación técnica
- **release_manager**: Versiones y releases
- **local_devops**: Troubleshooting local
- **community_manager**: Gestión de comunidad

## Reglas Obligatorias

### 1. Spanish Only
**Toda la documentación, comentarios y comunicación DEBE estar en español.**

- ✅ Comentarios de código en español
- ✅ Documentación en español
- ✅ Mensajes de commit en español
- ✅ Issues y PRs en español
- ❌ Código fuente puede usar inglés técnico

### 2. Centralized Docs
**README.md debe reflejar el estado ACTUAL del proyecto.**

- ✅ README.md con información actual
- ✅ CHANGELOG.md para historial
- ✅ GitHub Releases para versiones
- ❌ NO agregar changelog a README.md
- ❌ NO agregar roadmap a README.md

### 3. Security First
**Todas las modificaciones DEBEN pasar validaciones de seguridad.**

- ✅ PSScriptAnalyzer sin errores
- ✅ .NET Analyzers sin warnings
- ✅ TSqlLint sin errores
- ✅ Código revisado por code_reviewer

## Sistema de Build

Todas las operaciones de build se ejecutan a través de `config/make.ps1`:

```powershell
# Sintaxis general
./config/make.ps1 -Task Tarea1, Tarea2, Tarea3
```

### Tareas Principales

- `Init` - Inicializar estructura
- `PowershellAnalysis` - Analizar código PowerShell
- `DotnetBuild` - Compilar proyectos .NET
- `SqlLint` - Analizar SQL
- `PowershellImport` - Importar y probar módulos
- `DotnetPublish` - Publicar librerías .NET
- `SqlPublish` - Desplegar bases de datos

Ver `README.md` para lista completa de comandos.

## Commits y Pull Requests

### Formato de Commits

```
:emoji: (scope) descripción corta en español

Descripción más detallada si es necesario,
explicando QUÉ cambió y POR QUÉ (no cómo).

Refs #123
```

### Contenido del PR

Al crear un PR, asegúrate de:

1. **Completar el template completo** - No eliminar secciones
2. **Marcar todos los checkboxes** - Especialmente compliance
3. **Vincular issues** - Usar "Close #123", "Fixes #456"
4. **Describir cambios** - Listar archivos y cambios específicos
5. **Incluir contexto** - Explicar motivación y decisiones
6. **Agregar evidencia** - Logs, capturas, output de comandos
7. **Validar localmente** - Todos los comandos deben pasar

### Criterios de Aprobación

Un PR será aprobado si:

- ✅ Pasa todas las validaciones de CI/CD
- ✅ Cumple las 3 reglas obligatorias
- ✅ Código revisado y aprobado por code_reviewer
- ✅ Documentación actualizada
- ✅ Tests pasan (si existen)
- ✅ No hay conflictos de merge
- ✅ Template de PR completado

## Revisión de Código

### Como Autor

- Revisa tu propio código antes de solicitar revisión
- Responde a comentarios de manera constructiva
- Haz cambios solicitados promptamente
- Marca conversaciones como resueltas cuando corresponda

### Como Revisor

- Sé constructivo y respetuoso
- Enfócate en lógica, seguridad y mantenibilidad
- Explica el "por qué" de tus comentarios
- Aprueba solo si el código cumple todos los estándares
- Usa los agentes de IA como apoyo (code_reviewer)

## Comunidad y Soporte

### Obtener Ayuda

- Lee [SUPPORT.md](SUPPORT.md) para recursos de soporte
- Revisa [Issues](../../issues) existentes
- Revisa [Discussions](../../discussions) para preguntas generales
- Consulta la documentación en `.agent/README.md`

### Contacto

- **Equipo**: https://github.com/ChristianGrimberg
- **Email**: Consultar perfil del equipo en GitHub

## Agradecimientos

¡Gracias por contribuir en el repositorio! Tu tiempo y esfuerzo son muy apreciados.

---

**Versión**: 1.0  
**Última actualización**: 2026-01-22  
**Mantenido por**: Christian Grimberg
