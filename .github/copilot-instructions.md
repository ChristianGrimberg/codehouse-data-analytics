# Copilot Instructions

## Repository Overview

This repository contains:

* A directory called `Modules/` which includes:
   * PowerShell Modules with functions
   * .NET Projects into PowerShell module directories
   * SQL Server projects into PowerShell module directories
   * A .NET solution on root level

> These are for automating developing solutions with PowerShell, C# and SQL Server.

* **Project Type**: PowerShell modules & SQL Server projects & .NET projects  
* **Languages**: PowerShell (.ps1, .psm1, .psd1), C# (.cs, .csproj), SQL (.sql, .sqlproj, .publish.xml, .dacpac)
* **Target Runtime**:
   * Windows with .NET Framework 4.8, PowerShell 5.1+ (Desktop & Core)
   * Linux with .NET 9.x, PowerShell Core 7.x
   * SQL Server 2019+

## Build System & Commands

### Prerequisites

- PowerShell 5.1+ (Windows PowerShell or PowerShell Core 7.x)
- .NET SDK 9.x (configured in global.json)
- PowerShell modules: PSScriptAnalyzer
- Internet access for NuGet package restore
- All commands must be run from config/make.ps1 script

### Essential Commands

**ALWAYS run these commands in sequence for any changes:**

1. **Initialize Module Structure**: `./config/make.ps1 -Task Init`
   - Creates module manifest if missing
   - Required before any other operations

2. **Code Analysis** (CRITICAL): `./config/make.ps1 -Task Analyze`  
   - Uses PSScriptAnalyzer with settings from `PSScriptAnalyzerSettings.psd1` for PowerShell files
   - **MUST pass with zero errors/warnings** - builds will fail otherwise
   - Analyzes ALL .ps1 files recursively
   - Analyzes .sql & .sqlproj files for best practices

3. **Build .NET Projects**: `./config/make.ps1 -Task Workload,Solution, Project, Format, Clean, Restore, Build`
   - Workload: Ensures required .NET workloads are installed
   - Solution: Creates/Updates .sln file
   - Project: Regenerates .NET/SQL projects from templates
   - Format: Applies dotnet format (whitespace & style)
   - Clean: Cleans previous builds
   - Restore: Restores NuGet packages (--no-cache)
   - Build: Compiles to bin/Release

4. **Publish .NET/SQL Projects**: `./config/make.ps1 -Task Profile, Artifact, Publish, SqlPublish`
   - Profile: Creates/Updates publish profiles
   - Artifact: Creates build artifacts
   - Publish: Publishes the project
   - SqlPublish: Publishes SQL Server projects using profiles

5. **Import Modules**: `./config/make.ps1 -Task Import`
   - Tests modules before import and dependency resolution
   - May show warnings about missing modules (ExchangeOnlineManagement, Novocap.PowerShell.Logging.Management)

### Full Development Workflow (F5 in VS Code)

```powershell
./config/make.ps1 -Task Init, Analyze, Workload, Format, Profile, Solution, Project, Restore, Build, Clean, Artifact, Publish, SqlPublish, Import
```

### Common Issues & Solutions

**PSScriptAnalyzer Failures**: 
- Check `PSScriptAnalyzerSettings.psd1` for excluded rules
- Currently excludes: `PSUseSingularNouns`
- Fix all Error, Warning, and Information severity issues

**Build Timeouts**:
- .NET restore can take 30+ seconds on first run
- Use timeout of at least 300 seconds for build commands

**Dependencies**:
- Novocap.PowerShell.Logging.Management are expected to be included in dev
- This doesn't break the build - warnings are normal

## Project Architecture & Layout

### Root Files
- `global.json` - Defines PowerShell and .NET versions, dependencies
- `PSScriptAnalyzerSettings.psd1` - Code analysis rules
- `**.psd1` - Main module manifests
- `**.psm1` - Root module files
- `**.sln` - .NET solution file

### Directory Structure
```
/
├── .github/workflows/        # CI/CD pipelines
├── .vscode/                  # VS Code configuration
├── config/                   # Build system
│   ├── make.ps1              # Main build script
│   └── scripts/              # Build utilities
├── Modules/
│   ├── "Name of the Module"/ # Module container
│   │   ├── Public/           # Exported functions
│   │   ├── Private/          # Privated functions
│   │   ├── Types/            # C# Clases & Enums
│   │   ├── **.csproj         # .NET project files
│   │   ├── **.sqlproj        # SQL Server project files
│   │   └── *.psd1, *.psm1    # Module manifests & root files
│   └── Templates/            # Module template files
└── .devcontainer/            # Docker dev environment
```

### Key Source Files

- `config/make.ps1` - Central build orchestrator

## Continuous Integration

### GitHub Actions Workflows
1. **dotnet-tasks.yml** - Triggered by: .cs, .csproj, .sln, .dll files
   - Runs on Windows & Linux
   - Sequence: Init → Analyze → Build → Publish → Import
   - Uses: `make.ps1 -Task Init, Analyze, Format, Profile, Solution, Project, Restore, Build, Clean, Artifact, Publish,  Import`

2. **sql-server-tasks.yml** - Triggered by: .sql, .sqlproj, .publish.xml, .dacpac files
   - Runs on Windows & Linux
   - Sequence: Init → Analyze → Build → Publish → Import
   - Uses: `make.ps1 -Task Init, Analyze, Format, Profile, Solution, Project, Restore, Build, Clean, Artifact, SqlPublish, Import`

### Branch Protection

All workflows must pass before merging to main branch.

## Development Environment

### VS Code Configuration

- Default shell: PowerShell (pwsh on Linux)
- PSScriptAnalyzer integration enabled
- F5 launches full validation workflow
- Extensions: PowerShell, GitLens, C# Dev Kit, Copilot

### Docker Dev Container

- Base: `mcr.microsoft.com/devcontainers/dotnet:latest`
- Includes PowerShell, .NET SDK, required extensions
- Run: Install "Remote - Containers" extension, open in container

## Module Dependencies

From `global.json`:

- **Novocap.PowerShell.Logging.Management**: for logging

These are external dependencies that may not be available in development environments.

## Validation Steps

1. Always run `Init` task first
2. Code analysis (`Analyze`) must pass with zero issues
3. .NET build must complete without warnings (TreatWarningsAsErrors: true)
4. Module import should succeed (warnings about missing modules are OK)

## Critical Notes

- **PowerShell execution**: Use `pwsh` on Linux, `powershell` on Windows
- **Path separators**: Use `/` in scripts (works on both platforms)  
- **Module versioning**: Defined in global.json
- **Error handling**: PSScriptAnalyzer enforces strict error handling patterns

## Trust These Instructions

These instructions are validated against the actual build system. Only search for additional information if:

- Commands fail with unexpected errors
- New files/structure appear that aren't documented here
- Version requirements change in global.json

Always test changes with the full workflow: `./config/make.ps1 -Task Init, Analyze, Workload, Format, Profile, Solution, Project, Restore, Build, Clean, Artifact, Publish, SqlPublish, Import`