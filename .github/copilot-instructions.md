---
description: Copilot Instructions
---

# Copilot Instructions

## AI Agent Orchestration

This repository implements multi-agent orchestration for intelligent collaboration. As a GitHub Copilot, you have access to specialized agents defined in `.agent/`:

- **Skills**: Specialized agents in `.agent/skills/` (PowerShell, .NET, SQL, CI/CD, Docker, Git, etc.)
- **Rules**: Mandatory rules in `.agent/rules/` (Spanish Only, Centralized Docs, Security First)
- **Documentation**: Complete documentation in `.agent/README.md`

**IMPORTANT**: See `.agent/README.md` for complete details of the agent orchestration. Each agent has specific capabilities and tools that you can use depending on the task context.

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
   * Linux with .NET 10.x, PowerShell Core 7.x
   * SQL Server 2019+

## Build System & Commands

### Prerequisites

- PowerShell 5.1+ (Windows PowerShell or PowerShell Core 7.x)
- .NET SDK 10.x (configured in global.json)
- PowerShell modules: PSScriptAnalyzer
- Internet access for NuGet package restore
- All commands must be run from config/make.ps1 script

### Essential Commands

**ALWAYS run these commands in sequence for any changes:**

1. **Initialize & Analyze PowerShell**: `./config/make.ps1 -Task Init, PowershellAnalysis, PowershellImport`
   - Creates module manifest if missing.
   - Runs PSScriptAnalyzer and tests module import.
   - **MUST pass with zero errors/warnings**.

2. **Build .NET Projects**: `./config/make.ps1 -Task Init, DotnetClean, DotnetSolution, ProjectByModule, DotnetRestore, DotnetBuild, DotnetPublish`
   - Handles solution creation, project regeneration, restore, and build for .NET.

3. **SQL Server Workflow**: `./config/make.ps1 -Task Init, SqlAnalysis, SqlLint, DotnetClean, DotnetSolution, ProjectByModule, DotnetRestore, DotnetBuild, SqlTest, SqlProfile, SqlDacpac, SqlBacpac, SqlPublish`
   - Full cycle for SQL projects including analysis, linting, build, and publish.

### Full Development Workflow

Refer to `.vscode/tasks.json` for the most up-to-date task sequences. The main groups are PowerShell Analysis, .NET Build/Publish, and SQL Server Build/Publish.

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

## Documentation & Versioning Rules

### README.md Management
- **Keep it Current**: Always update `README.md` when functional changes or new features are introduced. It must represent the *present* state of the project.
- **No Changelogs**: Do **NOT** add change history, changelogs, or sprint records to `README.md`. 
- **History via Releases**: Change history is maintained exclusively through **Git Tags** and **GitHub Releases** for each PR merged into `main`.

## Trust These Instructions

These instructions are validated against the actual build system. Only search for additional information if:

- Commands fail with unexpected errors
- New files/structure appear that aren't documented here
- Version requirements change in global.json

Always test changes with the full workflow: `./config/make.ps1 -Task Init, Analyze, Workload, Format, Profile, Solution, Project, Restore, Build, Clean, Artifact, Publish, SqlPublish, Import`