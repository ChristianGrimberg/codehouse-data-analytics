[CmdletBinding()]
param (
    [System.String[]]
    $Task,
    [System.String]
    $ApiKey
)

#region Get all relative paths
[String] $originalPath = (Get-Location).Path
[String] $configPath = Resolve-Path -Path (Split-Path -Parent $Script:MyInvocation.MyCommand.Path).ToString() -Relative
[String] $rootPath = Resolve-Path -Path (Split-Path -Parent $configPath).ToString() -Relative
[String] $scriptsPath = Join-Path -Path $configPath -ChildPath "scripts"
[String] $modulesPath = Join-Path -Path $rootPath -ChildPath "Modules"
[String] $templatePath = Join-Path -Path $modulesPath -ChildPath "Templates"
#endregion

#region Module config
[String] $module = (Get-Item -Path $rootPath).BaseName
[String] $manifiest = Join-Path -Path $rootPath -ChildPath ("{0}.psd1" -f $module)
[String] $globalPath = Join-Path -Path $rootPath -ChildPath "global.json"
[String] $rootScriptModuleTemplate = Join-Path -Path $templatePath -ChildPath "RootTemplate.psm1"
[String] $moduleVersion = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).powershell.module
[String] $dotnetRuntime = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).dotnet.runtime
[String] $analysisConfig = Join-Path -Path $rootPath -ChildPath "PSScriptAnalyzerSettings.psd1"
#endregion

#region Get scripts paths
[String] $systemScriptPath = Join-Path -Path $scriptsPath -ChildPath "Get-LocalSystem.ps1"
[String] $systemScriptToRun = "{0} -VersionPath {1}" -f $systemScriptPath, $moduleVersion
$scriptSystemBlock = [System.Management.Automation.ScriptBlock]::Create($systemScriptToRun)

[String] $invokeDotNetCoreScriptPath = Join-Path -Path $scriptsPath -ChildPath "Invoke-DotNetCore.ps1"
$invokeDotNetCoreScriptPath | Out-Host
#endregion

if(Invoke-Command -ScriptBlock $scriptSystemBlock) {
    switch ($Task) {
        Init {
                if (-not (Get-Module -ListAvailable -Name PSScriptAnalyzer)) {
                    try {
                        if ($IsWindows) {
                            if (-not (Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
                                "Instalando el proveedor de NuGet...`n" | Out-Host
                                Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser -ErrorAction Stop
                            }
                        }

                        Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force -ErrorAction Stop
                        Import-Module PSScriptAnalyzer -ErrorAction Stop
                    }
                    catch {
                        Write-Warning "No se pudo instalar ni importar PSScriptAnalyzer: $($_.Exception.Message)`n"
                    }
                }
                else {
                    Import-Module PSScriptAnalyzer -ErrorAction Stop
                }

                [String] $rootTemplateContent = Get-Content -Path $rootScriptModuleTemplate -Raw
                $rootScriptModule = New-Item -Path $rootPath -Name ("{0}.psm1" -f $module) -ItemType File -Value $rootTemplateContent -Force

                if(Test-Path -Path $rootScriptModule.FullName -PathType Leaf) {
                    ("{0} Module {1} have been created successfully`n" -f [Char]8730, $rootScriptModule.BaseName) | Out-Host
                }
        }
        PowershellAnalysis {
            [String] $pwshAnalysisScriptPath = Join-Path -Path $scriptsPath -ChildPath "New-PowerShellAnalysis.ps1"
            [String] $pwshAnalysisScriptToRun = "{0} -RootPath {1} -Config {2}" -f $pwshAnalysisScriptPath, $rootPath, $analysisConfig
            $pwshScriptAnalysisBlock = [System.Management.Automation.ScriptBlock]::Create($pwshAnalysisScriptToRun)

            if(Invoke-Command -ScriptBlock $pwshScriptAnalysisBlock) {
                ("{0} The code have been verified successfully`n" -f [Char]8730) | Out-Host
            }
        }
        SqlAnalysis {
            [String] $sqlAnalysisScriptPath = Join-Path -Path $scriptsPath -ChildPath "New-SqlServerAnalysis.ps1"
            [String] $sqlAnalysisScriptToRun = "{0} -ModulesPath {1}" -f $sqlAnalysisScriptPath, $modulesPath
            $sqlScriptAnalysisBlock = [System.Management.Automation.ScriptBlock]::Create($sqlAnalysisScriptToRun)

            if(Invoke-Command -ScriptBlock $sqlScriptAnalysisBlock) {
                ("{0} SQL Server code analysis completed successfully`n" -f [Char]8730) | Out-Host
            }
        }
        SqlLint {
            [String] $sqlLintScriptPath = Join-Path -Path $scriptsPath -ChildPath "New-SqlServerLint.ps1"
            [String] $sqlLintScriptToRun = "{0} -ModulesPath {1}" -f $sqlLintScriptPath, $modulesPath
            $sqlScriptLintBlock = [System.Management.Automation.ScriptBlock]::Create($sqlLintScriptToRun)

            if(Invoke-Command -ScriptBlock $sqlScriptLintBlock) {
                ("{0} SQL Server linting completed successfully`n" -f [Char]8730) | Out-Host
            }
        }
        DotnetSolution {
            [String] $createSolutionScriptPath = Join-Path -Path $scriptsPath -ChildPath "New-DotNetSolution.ps1"
            [String] $createSolutionScriptToRun = "{0} -RootPath {1} -FunctionsPath {2}" -f $createSolutionScriptPath, $rootPath, $invokeDotNetCoreScriptPath
            $scriptCreateSolutionBlock = [System.Management.Automation.ScriptBlock]::Create($createSolutionScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptCreateSolutionBlock) {
                ("{0} .NET Solution is ready`n" -f [Char]8730) | Out-Host
            }
        }
        DotnetWorkload {
            [String] $updateWorkloadScriptPath = Join-Path -Path $scriptsPath -ChildPath "Update-DotNetWorkload.ps1"
            [String] $updateWorkloadScriptToRun = "{0} -RootPath {1} -FunctionsPath {2}" -f $updateWorkloadScriptPath, $rootPath, $invokeDotNetCoreScriptPath
            $scriptUpdateWorkloadBlock = [System.Management.Automation.ScriptBlock]::Create($updateWorkloadScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptUpdateWorkloadBlock) {
                ("{0} .NET workload is ready`n" -f [Char]8730) | Out-Host
            }
        }
        ProjectByModule {
            [String] $createProjectsScriptPath = Join-Path -Path $scriptsPath -ChildPath "New-ProjectByModule.ps1"
            [String] $createProjectsScriptToRun = "{0} -ModulesPath {1} -GlobalPath {2}" -f $createProjectsScriptPath, $modulesPath, $globalPath
            $scriptCreateProjectsBlock = [System.Management.Automation.ScriptBlock]::Create($createProjectsScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptCreateProjectsBlock) {
                ("{0} .NET Projects has been regenerated`n" -f [Char]8730) | Out-Host

                [String] $addProjectsScriptPath = Join-Path -Path $scriptsPath -ChildPath "Import-Projects.ps1"
                [String] $addProjectsScriptToRun = "{0} -ProjectsPath {1} -FunctionsPath {2}" -f $addProjectsScriptPath, $modulesPath, $invokeDotNetCoreScriptPath
                $scriptAddProjectsBlock = [System.Management.Automation.ScriptBlock]::Create($addProjectsScriptToRun)

                if(Invoke-Command -ScriptBlock $scriptAddProjectsBlock) {
                    ("{0} .NET Projects has been added to the solution`n" -f [Char]8730) | Out-Host
                }
            }
        }
        DotnetFormat {
            [String] $dotnetFormatWhiteSpaceScriptToRun = 'dotnet format whitespace'
            [String] $dotnetFormatStyleScriptToRun = 'dotnet format style'

            $scriptDotnetFormatWhiteSpace = [System.Management.Automation.ScriptBlock]::Create($dotnetFormatWhiteSpaceScriptToRun)
            $scriptDotnetFormatStyle = [System.Management.Automation.ScriptBlock]::Create($dotnetFormatStyleScriptToRun)

            Invoke-Command -ScriptBlock $scriptDotnetFormatWhiteSpace
            Invoke-Command -ScriptBlock $scriptDotnetFormatStyle
            ("{0} .NET Solution have been formated successfully`n" -f [Char]8730) | Out-Host
        }
        DotnetRestore {
            [String] $dotnetRestoreScriptToRun = ('{0} -Command restore -Arguments "{1} --no-cache"' -f $invokeDotNetCoreScriptPath, $rootPath)
            $scriptDotnetRestoreBlock = [System.Management.Automation.ScriptBlock]::Create($dotnetRestoreScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptDotnetRestoreBlock) {
                ("{0} .NET Solution have been restored successfully`n" -f [Char]8730) | Out-Host
            }
        }
        DotnetBuild {
            [String] $dotnetBuildScriptToRun = ('{0} -Command build -Arguments "{1} --configuration Release --no-restore"' -f $invokeDotNetCoreScriptPath, $rootPath)
            $scriptDotnetBuildBlock = [System.Management.Automation.ScriptBlock]::Create($dotnetBuildScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptDotnetBuildBlock) {
                ("{0} Class Libraries has been built`n" -f [Char]8730) | Out-Host
            }
        }
        DotnetClean {
            [String] $removeScriptPath = Join-Path -Path $scriptsPath -ChildPath "Remove-CompiledFiles.ps1"
            [String] $removeScriptToRun = "{0} -RootPath {1}" -f $removeScriptPath, $rootPath
            $scriptRemoveBlock = [System.Management.Automation.ScriptBlock]::Create($removeScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptRemoveBlock) {
                ("{0} Compiled files are cleaned`n" -f [Char]8730) | Out-Host
            }
        }
        DotnetPublish {
            [String] $publishDotNetScriptPath = Join-Path -Path $scriptsPath -ChildPath "Publish-DotNetLibraries.ps1"
            [String] $publishDotNetScriptToRun = "{0} -ProjectsPath {1} -FunctionsPath {2} -DotNetVersion {3}" -f $publishDotNetScriptPath, $modulesPath, $scriptsPath, $dotnetRuntime
            $scriptPublishDotNetBlock = [System.Management.Automation.ScriptBlock]::Create($publishDotNetScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptPublishDotNetBlock) {
                ("{0} .NET Projects has been published`n" -f [Char]8730) | Out-Host
            }
        }
        PowershellImport {
            $rootModuleName = Get-Item -Path $rootPath
            [String] $rootModuleFile = "{0}/{1}.psm1" -f $rootPath, $rootModuleName.BaseName

            if(Test-Path -Path $rootModuleFile -PathType Leaf) {
                [String] $importModulesScriptPath = Join-Path -Path $scriptsPath -ChildPath "Import-Modules.ps1"
                [String] $importModulesScriptToRun = "{0} -Path {1}" -f $importModulesScriptPath, $rootPath
                $scriptImportModulesBlock = [System.Management.Automation.ScriptBlock]::Create($importModulesScriptToRun)

                if(Invoke-Command -ScriptBlock $scriptImportModulesBlock) {
                    [String] $initializeScriptPath = Join-Path -Path $scriptsPath -ChildPath "Initialize-Module.ps1"
                    [String] $initializeScriptToRun = "{0} -Manifiest {1}" -f $initializeScriptPath, $manifiest
                    $scriptInitializeBlock = [System.Management.Automation.ScriptBlock]::Create($initializeScriptToRun)

                    if(Invoke-Command -ScriptBlock $scriptInitializeBlock) {
                        ("{0} All modules has been imported`n" -f [Char]8730) | Out-Host
                    }
                }
            }
        }
        PowershellGallery {
            [String] $publishModulesScriptPath = Join-Path -Path $scriptsPath -ChildPath "Publish-PowerShellGallery.ps1"
            [String] $publishModulesScriptToRun = "{0} -Path {1} -ApiKey {2}" -f $publishModulesScriptPath, $rootPath, $ApiKey
            $scriptPublishModulesBlock = [System.Management.Automation.ScriptBlock]::Create($publishModulesScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptPublishModulesBlock) {
                ("{0} Module has been published in the PowerShell Gallery`n" -f [Char]8730) | Out-Host
            }
        }
        SqlProfile {
            [String] $sqlProfileScriptPath = Join-Path -Path $scriptsPath -ChildPath "New-SqlServerProfile.ps1"
            # Set environment variable for development container
            $env:SQL_PASSWORD = "P@ssw0rd"

            if(& $sqlProfileScriptPath -ModulesPath $modulesPath -ServerInstance localhost -Port 1433 -User sa) {
                ("{0} SQL Server publish profiles created successfully`n" -f [Char]8730) | Out-Host
            }

            # Clear environment variable after use
            $env:SQL_PASSWORD = $null
        }
        SqlTest {
            [String] $testSqlConnectionScriptPath = Join-Path -Path $scriptsPath -ChildPath "Test-SqlServerConnection.ps1"
            [String] $testSqlConnectionScriptToRun = "{0} -ModulesPath {1}" -f $testSqlConnectionScriptPath, $modulesPath
            $scriptTestSqlConnectionBlock = [System.Management.Automation.ScriptBlock]::Create($testSqlConnectionScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptTestSqlConnectionBlock) {
                ("{0} SQL Server connection tests passed successfully`n" -f [Char]8730) | Out-Host
            }
        }
        SqlDacpac {
            [String] $SqlDacpacScriptPath = Join-Path -Path $scriptsPath -ChildPath "New-SqlServerDacpac.ps1"
            [String] $SqlDacpacScriptToRun = "{0} -ModulesPath {1} -FunctionsPath {2}" -f $SqlDacpacScriptPath, $modulesPath, $scriptsPath
            $scriptSqlDacpacBlock = [System.Management.Automation.ScriptBlock]::Create($SqlDacpacScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptSqlDacpacBlock) {
                ("{0} SQL Server artifacts have been built`n" -f [Char]8730) | Out-Host
            }
        }
        SqlPublish {
            [String] $sqlPublishScriptPath = Join-Path -Path $scriptsPath -ChildPath "Publish-SqlServerArtifacts.ps1"
            [String] $sqlPublishScriptToRun = "{0} -ModulesPath {1}" -f $sqlPublishScriptPath, $modulesPath
            $scriptSqlPublishBlock = [System.Management.Automation.ScriptBlock]::Create($sqlPublishScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptSqlPublishBlock) {
                ("{0} SQL Server databases published successfully`n" -f [Char]8730) | Out-Host
            }
        }
        SqlBacpac {
            [String] $sqlBacpacScriptPath = Join-Path -Path $scriptsPath -ChildPath "New-SqlServerBacpac.ps1"
            [String] $sqlBacpacScriptToRun = "{0} -ModulesPath {1}" -f $sqlBacpacScriptPath, $modulesPath
            $scriptSqlBacpacBlock = [System.Management.Automation.ScriptBlock]::Create($sqlBacpacScriptToRun)

            if(Invoke-Command -ScriptBlock $scriptSqlBacpacBlock) {
                ("{0} SQL Server BACPAC artifacts created successfully`n" -f [Char]8730) | Out-Host
            }
        }
    }
}

Set-Location -Path $originalPath
