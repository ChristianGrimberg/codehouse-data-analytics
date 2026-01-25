# Orquestación de Agentes de IA - AGENTS.md

Este archivo sigue el estándar de orquestación de agentes para **OpenCode** y otros sistemas de IA que utilizan el formato AGENTS.md.

## Descripción General

En el repositorio se implementa un sistema de orquestación multi-agente para colaboración inteligente en el desarrollo, mantenimiento y despliegue del proyecto.

## Ubicación de Agentes

Todos los agentes están definidos en el directorio `.agent/`:

- **Skills**: `.agent/skills/` - Agentes especializados
- **Rules**: `.agent/rules/` - Reglas obligatorias
- **Documentation**: `.agent/README.md` - Documentación completa

## Agentes Disponibles

### 1. PowerShell Expert (`powershell_expert.md`)

**Dominio**: PowerShell 5.1+ (Desktop & Core 7.x)

**Responsabilidades**:

- Desarrollo de módulos PowerShell
- Análisis con PSScriptAnalyzer
- Gestión de dependencias
- Testing y validación

**Activación**: Cambios en archivos `.ps1`, `.psm1`, `.psd1`

### 2. .NET C# Developer (`dotnet_csharp_developer.md`)

**Dominio**: .NET SDK 10.x, C# 10+, .NET Framework 4.8

**Responsabilidades**:

- Desarrollo de librerías de clase .NET
- Gestión de soluciones .sln
- Análisis y formato de código
- Publicación y deployment

**Activación**: Cambios en archivos `.cs`, `.csproj`, `.sln`

### 3. SQL Server Specialist (`sql_server_specialist.md`)

**Dominio**: SQL Server 2019+, T-SQL, DACPAC/BACPAC

**Responsabilidades**:

- Desarrollo de bases de datos
- Análisis y linting de SQL
- Gestión de artefactos (DACPAC/BACPAC)
- Deployment y publicación

**Activación**: Cambios en archivos `.sql`, `.sqlproj`, `.publish.xml`

### 4. CI/CD Engineer (`ci_cd_engineer.md`)

**Dominio**: GitHub Actions, Workflows Automation

**Responsabilidades**:

- Gestión de workflows GitHub Actions
- Automatización de validaciones
- Gestión de artifacts
- Protección de ramas

**Activación**: Cambios en `.github/workflows/`

### 5. Docker Engineer (`docker_engineer.md`)

**Dominio**: Docker, VS Code DevContainers

**Responsabilidades**:

- Gestión de DevContainers
- Dockerfiles y composición
- Entorno de desarrollo
- Optimización de rendimiento

**Activación**: Cambios en `.devcontainer/`, `Dockerfile`

### 6. Git Manager (`git_manager.md`)

**Dominio**: Git, GitHub, Branch Strategies

**Responsabilidades**:

- Gestión de ramas (main, feature/*, hotfix/*)
- Commits y mensajes
- Pull Requests
- Tags y releases

**Activación**: Operaciones de Git

### 7. Code Reviewer (`code_reviewer.md`)

**Dominio**: Code Review, Quality Assurance

**Responsabilidades**:

- Revisión de Pull Requests
- Validación de calidad
- Feedback constructivo
- Aprobación de cambios

**Activación**: Pull Requests abiertos

### 8. Documenter (`documenter.md`)

**Dominio**: README.md, Markdown, Technical Documentation

**Responsabilidades**:

- Mantenimiento de README.md
- Documentación de cambios
- Adherencia a reglas
- Calidad de documentación

**Activación**: Cambios en archivos `.md`

### 9. Release Manager (`release_manager.md`)

**Dominio**: Versioning, Releases, Deployment

**Responsabilidades**:

- Gestión de versiones (SemVer)
- Creación de releases
- Changelog management
- Deployment

**Activación**: Creación de tags (`v*.*.*`)

### 10. Local DevOps (`local_devops.md`)

**Dominio**: Local Development, Troubleshooting

**Responsabilidades**:

- Configuración de entorno local
- Troubleshooting local
- Optimización de desarrollo
- Validación pre-commit

**Activación**: Desarrollo local

### 11. Community Manager (`community_manager.md`)

**Dominio**: GitHub Issues, Discussions, PR Management

**Responsabilidades**:

- Gestión de issues
- Gestión de Pull Requests
- Documentación y comunicación
- Engagement de comunidad

**Activación**: Issues, Discussions, nuevos contribuidores

## Reglas Obligatorias

Todos los agentes deben seguir estas reglas:

### 1. Spanish Only (`spanish_only.md`)

**Regla**: Toda la documentación, comentarios de código, mensajes de commit, y comunicación del proyecto DEBE estar en idioma español.

**Excepciones**: Código fuente, keywords del lenguaje, nombres de archivos.

### 2. Centralized Docs (`centralized_docs.md`)

**Regla**: Toda la documentación funcional y técnica del proyecto DEBE estar centralizada en README.md. NO se debe agregar historial de cambios, changelogs, o notas de sprint a README.md.

**Alternativas**: CHANGELOG.md, GitHub Releases, Git Tags.

### 3. Security First (`security_first.md`)

**Regla**: Todas las modificaciones de código DEBEN pasar validaciones de seguridad antes de ser integradas.

**Validaciones Obligatorias**: PSScriptAnalyzer, .NET Analyzers, SqlLint.

## Orquestador Central

Todas las tareas se ejecutan a través del orquestador central:

```powershell
./config/make.ps1 -Task <NombreTarea>
```

### Tareas Disponibles

- **Init**: Inicializa estructura del módulo
- **PowershellAnalysis**: Ejecuta PSScriptAnalyzer
- **DotnetBuild**: Compila proyectos .NET
- **SqlLint**: Análisis exhaustivo de SQL
- **PowershellImport**: Importa y prueba módulos
- **DotnetPublish**: Publica librerías .NET
- **SqlPublish**: Despliega bases de datos

## Flujo de Trabajo Multi-Agente

```
Usuario/Prompt
    ↓
Agentes AI (Gemini/Copilot/OpenCode)
    ↓
.agent/ (Skills + Rules)
    ↓
config/make.ps1 (Orquestador)
    ↓
GitHub Actions / VS Code Tasks
```

## Compatibilidad con Plataformas de IA

### Google Gemini / Google Antigravity

Lee directamente `.agent/README.md` y activa habilidades específicas según la tarea.

### GitHub Copilot

Utiliza `.github/copilot-instructions.md` como puente de integración que referencia `.agent/`.

### OpenCode

Utiliza este archivo (`AGENTS.md`) como índice estándar de orquestación.

## Cómo Usar los Agentes

### Activación Automática

Los agentes se activan automáticamente según el contexto:

- Cambios en `.ps1` → `powershell_expert`
- Cambios en `.cs` → `dotnet_csharp_developer`
- Cambios en `.sql` → `sql_server_specialist`
- Pull Requests → `code_reviewer`
- Creación de tags → `release_manager`

### Activación Manual

Puedes invocar específicamente un agente:

```
@powershell_expert: Analiza este script y sugiere mejoras
@sql_server_specialist: Optimiza esta consulta SQL
@documenter: Actualiza la documentación con los nuevos cambios
```

## Estructura de Directorios

```
.agent/
├── README.md                      # Documentación completa de orquestación
├── skills/                        # Agentes especializados
│   ├── powershell_expert.md
│   ├── dotnet_csharp_developer.md
│   ├── sql_server_specialist.md
│   ├── ci_cd_engineer.md
│   ├── docker_engineer.md
│   ├── git_manager.md
│   ├── code_reviewer.md
│   ├── documenter.md
│   ├── release_manager.md
│   ├── local_devops.md
│   └── community_manager.md
└── rules/                         # Reglas obligatorias
    ├── spanish_only.md
    ├── centralized_docs.md
    └── security_first.md
```

## Extensión de Agentes

Para agregar nuevos agentes:

1. Crear archivo `.md` en `.agent/skills/`
2. Definir capacidades, herramientas y comandos
3. Actualizar `.agent/README.md`
4. Actualizar este archivo (`AGENTS.md`)
5. Actualizar `.github/copilot-instructions.md` si es necesario

## Referencias

- [Documentación Completa de Agentes](.agent/README.md)
- [Instrucciones de GitHub Copilot](.github/copilot-instructions.md)
- [Sistema de Build](config/make.ps1)
- [Workflows CI/CD](.github/workflows/)
- [README del Proyecto](README.md)

---

**Versión**: 1.0  
**Última actualización**: 2026-01-21  
**Mantenido por**: [Christian Grimberg](https://github.com/ChristianGrimberg)  
**Estándar**: OpenCode Agent Orchestration
