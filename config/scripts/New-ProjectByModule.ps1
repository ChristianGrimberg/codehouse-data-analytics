[CmdletBinding()]
[OutputType([System.Boolean])]
param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ModulesPath,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $GlobalPath
)

[System.Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor
$host.ui.RawUI.ForegroundColor = "DarkGreen"

try {
    [String] $originalPath = (Get-Location).Path

    $global = Get-Content -Path $GlobalPath -Raw -Encoding Ascii | ConvertFrom-Json

    if ($ModulesPath.Contains("Modules")) {
        $moduleDirectories = Get-ChildItem -Path $ModulesPath -Directory | Where-Object -Property FullName -notmatch "Template|Imported"
    }

    if (-not [System.String]::IsNullOrEmpty($global) -and $moduleDirectories.Length -gt 0) {
        "Creating projects based on global configuration..." | Out-Host

        $globalFileName = (Get-Item -Path $GlobalPath).Name
        [String] $organization = [System.String]::Empty
        [String] $team = [System.String]::Empty

        if (-not [System.String]::IsNullOrEmpty($global.organization.name)) {
            [String] $organization = $global.organization.name
        }

        if (-not [System.String]::IsNullOrEmpty($global.organization.team)) {
            [String] $team = $global.organization.team
        }

        $repositoryDirectoryName = (Get-Item -Path (Split-Path -Parent $GlobalPath)).BaseName

        $globalConfigs = ($global | Get-Member -MemberType NoteProperty).Name

        switch -Wildcard ($globalConfigs) {
            dotnet {
                ".NET JSON configurations detected in {0} file" -f $globalFileName | Out-Host

                $dotnetModules = New-Object "System.Collections.Generic.List[String]"
                $dotnetCommonProperties = New-Object "System.Collections.Generic.List[String]"
                $dotnetModulesWithPackages = New-Object "System.Collections.Generic.List[String]"

                if (-not [System.String]::IsNullOrEmpty($global.dotnet.version)) {
                    [String] $dotnetVersion = $global.dotnet.version
                }

                if (-not [System.String]::IsNullOrEmpty($global.dotnet.runtime)) {
                    [String] $dotnetRuntime = $global.dotnet.runtime
                }

                $dotnetConfigs = ($global.dotnet | Get-Member -MemberType NoteProperty).Name
                $dotnetProjectGuids = @{}
                $dotnetDependencies = @{}
                if ($dotnetConfigs -contains "modules") {
                    $modulesSource = $global.dotnet.modules
                    $modNames = if ($modulesSource -is [System.Array]) { $modulesSource } else { $modulesSource.PSObject.Properties.Name }

                    foreach ($mod in $modNames) {
                        if ($mod -notmatch "Template|Imported") {
                            $dotnetModules.Add($mod)
                            ".NET Module [{0}] found in {1} file" -f $mod, $globalFileName | Out-Host

                            if ($modulesSource -isnot [System.Array]) {
                                if ($modulesSource.$mod.guid) { $dotnetProjectGuids[$mod] = $modulesSource.$mod.guid }
                                if ($modulesSource.$mod.dependencies) { $dotnetDependencies[$mod] = $modulesSource.$mod.dependencies }
                            }
                        }
                    }
                }

                if ($dotnetConfigs -contains "common") {
                    $dotnetExistingProperties = ($global.dotnet.common | Get-Member -MemberType NoteProperty).Name

                    foreach ($prop in $dotnetExistingProperties) {
                        $dotnetCommonProperties.Add($prop)

                        ".NET Property [{0}] found in {1} file" -f $prop, $globalFileName | Out-Host
                    }
                }

                if ($dotnetConfigs -contains "packages") {
                    $dotnetExistingPackages = ($global.dotnet.packages | Get-Member -MemberType NoteProperty).Name

                    foreach ($paq in $dotnetExistingPackages) {
                        foreach ($mod in $global.dotnet.packages.$paq.modules) {
                            if ($mod -notmatch "Template|Imported") {
                                $dotnetModulesWithPackages.Add($mod)

                                ".NET Package [{0}] for module [{1}] found in {2} file" -f $paq, $mod, $globalFileName | Out-Host
                            }
                        }
                    }
                }
            }
            sql {
                "SQL Server JSON configurations detected in {0} file" -f $globalFileName | Out-Host

                $sqlModules = New-Object "System.Collections.Generic.List[String]"
                $sqlModulesWithPackages = New-Object "System.Collections.Generic.List[String]"
                $sqlConfigs = ($global.sql | Get-Member -MemberType NoteProperty).Name

                if (-not [System.String]::IsNullOrEmpty($global.sql.version)) {
                    [String] $sqlVersion = $global.sql.version
                }

                if (-not [System.String]::IsNullOrEmpty($global.sql.dsp)) {
                    [String] $sqlDsp = $global.sql.dsp
                }

                if (-not [System.String]::IsNullOrEmpty($global.sql.modelCollation)) {
                    [String] $sqlModelCollation = $global.sql.modelCollation
                }

                if (-not [System.String]::IsNullOrEmpty($global.sql.runSqlCodeAnalysis)) {
                    [String] $sqlRunSqlCodeAnalysis = $global.sql.runSqlCodeAnalysis
                }

                $sqlProjectGuids = @{}
                $sqlDependencies = @{}
                if ($sqlConfigs -contains "modules") {
                    $modulesSource = $global.sql.modules
                    $modNames = if ($modulesSource -is [System.Array]) { $modulesSource } else { $modulesSource.PSObject.Properties.Name }

                    foreach ($mod in $modNames) {
                        if ($mod -notmatch "Template|Imported") {
                            $sqlModules.Add($mod)
                            "SQL Server Module [{0}] found in {1} file" -f $mod, $globalFileName | Out-Host

                            if ($modulesSource -isnot [System.Array]) {
                                if ($modulesSource.$mod.guid) { $sqlProjectGuids[$mod] = $modulesSource.$mod.guid }
                                if ($modulesSource.$mod.dependencies) { $sqlDependencies[$mod] = $modulesSource.$mod.dependencies }
                            } else {
                                # Fallback scanning for GUID if array (legacy/auto-detect)
                                $sqlProjFile = Join-Path -Path $ModulesPath -ChildPath (Join-Path -Path $mod -ChildPath ("{0}.sqlproj" -f $mod))
                                [String] $guid = [System.Guid]::NewGuid().ToString("B").ToUpper()
                                if (Test-Path -Path $sqlProjFile) {
                                    [Xml]$xml = Get-Content -Path $sqlProjFile -ErrorAction Stop
                                    if ($xml.Project.PropertyGroup.ProjectGuid) { $guid = $xml.Project.PropertyGroup.ProjectGuid }
                                }
                                $sqlProjectGuids[$mod] = $guid
                            }
                        }
                    }
                }

                if ($sqlConfigs -contains "packages") {
                    $sqlExistingPackages = ($global.sql.packages | Get-Member -MemberType NoteProperty).Name

                    foreach ($paq in $sqlExistingPackages) {
                        foreach ($mod in $global.sql.packages.$paq.modules) {
                            if ($mod -notmatch "Template|Imported") {
                                $sqlModulesWithPackages.Add($mod)

                                "SQL Server Package [{0}] for module [{1}] found in {2} file" -f $paq, $mod, $globalFileName | Out-Host
                            }
                        }
                    }
                }
            }
        }

        foreach ($directoryProject in $moduleDirectories) {
            Set-Location -Path $directoryProject.FullName

            if ($null -ne $dotnetModules -and $dotnetModules.Contains($directoryProject.BaseName)) {
                [String] $dotnetProjectBaseName = "{0}.csproj" -f $directoryProject.BaseName
                [String] $dotnetProjectFullName = Join-Path -Path $directoryProject.FullName -ChildPath $dotnetProjectBaseName

                $dotnetProjectFile = New-Object System.XMl.XmlTextWriter($dotnetProjectFullName, $Null)

                if (Test-Path -Path $dotnetProjectFullName -PathType Leaf) {
                    $dotnetProjectFile.Formatting = 'Indented'
                    $dotnetProjectFile.Indentation = 1
                    $dotnetProjectFile.IndentChar = "`t"
                    $dotnetProjectFile.WriteStartDocument()
                    $dotnetProjectFile.WriteComment($repositoryDirectoryName)
                    $dotnetProjectFile.WriteStartElement('Project')
                    $dotnetProjectFile.WriteAttributeString('Sdk', 'Microsoft.NET.Sdk')

                    $dotnetProjectFile.WriteStartElement('ItemGroup')
                    [String] $dotnetTypesPath = Join-Path -Path $directoryProject.FullName -ChildPath "Types"
                    [String] $dotnetControlsPath = Join-Path -Path $directoryProject.FullName -ChildPath "Controls"
                    [String] $dotnetEnumsPath = Join-Path -Path $directoryProject.FullName -ChildPath "Enums"
                    [String] $dotnetInfoPath = Join-Path -Path $directoryProject.FullName -ChildPath "Info"
                    [String] $dotnetPropertiesPath = Join-Path -Path $directoryProject.FullName -ChildPath "Properties"
                    [String] $dotnetUtilitiesPath = Join-Path -Path $directoryProject.FullName -ChildPath "Utilities"
                    [String] $dotnetAppPath = Join-Path -Path $directoryProject.FullName -ChildPath "App"

                    if (Test-Path -Path $dotnetTypesPath -PathType Container) {
                        $dotnetTypesPathClassLibraries = Get-ChildItem -Path $dotnetTypesPath -File | Where-Object -Property FullName -like "*.cs"

                        foreach ($class in $dotnetTypesPathClassLibraries.FullName) {
                            $dotnetRelativeTypesClass = Resolve-Path -Path $class -Relative

                            $dotnetProjectFile.WriteStartElement('Compile')
                            $dotnetProjectFile.WriteAttributeString('Include', $dotnetRelativeTypesClass)
                            $dotnetProjectFile.WriteEndElement()
                        }
                    }

                    if (Test-Path -Path $dotnetControlsPath -PathType Container) {
                        $dotnetControlsPathClassLibraries = Get-ChildItem -Path $dotnetControlsPath -File | Where-Object -Property FullName -like "*.cs"

                        foreach ($class in $dotnetControlsPathClassLibraries.FullName) {
                            $dotnetRelativeControlsClass = Resolve-Path -Path $class -Relative

                            $dotnetProjectFile.WriteStartElement('Compile')
                            $dotnetProjectFile.WriteAttributeString('Include', $dotnetRelativeControlsClass)
                            $dotnetProjectFile.WriteEndElement()
                        }
                    }

                    if (Test-Path -Path $dotnetEnumsPath -PathType Container) {
                        $dotnetEnumsPathClassLibraries = Get-ChildItem -Path $dotnetEnumsPath -File | Where-Object -Property FullName -like "*.cs"

                        foreach ($class in $dotnetEnumsPathClassLibraries.FullName) {
                            $dotnetRelativeEnumsClass = Resolve-Path -Path $class -Relative

                            $dotnetProjectFile.WriteStartElement('Compile')
                            $dotnetProjectFile.WriteAttributeString('Include', $dotnetRelativeEnumsClass)
                            $dotnetProjectFile.WriteEndElement()
                        }
                    }

                    if (Test-Path -Path $dotnetInfoPath -PathType Container) {
                        $dotnetInfoPathClassLibraries = Get-ChildItem -Path $dotnetInfoPath -File | Where-Object -Property FullName -like "*.cs"

                        foreach ($class in $dotnetInfoPathClassLibraries.FullName) {
                            $dotnetRelativeInfoClass = Resolve-Path -Path $class -Relative

                            $dotnetProjectFile.WriteStartElement('Compile')
                            $dotnetProjectFile.WriteAttributeString('Include', $dotnetRelativeInfoClass)
                            $dotnetProjectFile.WriteEndElement()
                        }
                    }

                    if (Test-Path -Path $dotnetPropertiesPath -PathType Container) {
                        $dotnetPropertiesPathClassLibraries = Get-ChildItem -Path $dotnetPropertiesPath -File | Where-Object -Property FullName -like "*.cs"

                        foreach ($class in $dotnetPropertiesPathClassLibraries.FullName) {
                            $dotnetRelativePropertiesClass = Resolve-Path -Path $class -Relative

                            $dotnetProjectFile.WriteStartElement('Compile')
                            $dotnetProjectFile.WriteAttributeString('Include', $dotnetRelativePropertiesClass)
                            $dotnetProjectFile.WriteEndElement()
                        }
                    }

                    if (Test-Path -Path $dotnetUtilitiesPath -PathType Container) {
                        $dotnetUtilitiesPathClassLibraries = Get-ChildItem -Path $dotnetUtilitiesPath -File | Where-Object -Property FullName -like "*.cs"

                        foreach ($class in $dotnetUtilitiesPathClassLibraries.FullName) {
                            $dotnetRelativeUtilitiesClass = Resolve-Path -Path $class -Relative

                            $dotnetProjectFile.WriteStartElement('Compile')
                            $dotnetProjectFile.WriteAttributeString('Include', $dotnetRelativeUtilitiesClass)
                            $dotnetProjectFile.WriteEndElement()
                        }
                    }

                    if (Test-Path -Path $dotnetAppPath -PathType Container) {
                        $dotnetAppPathClassLibraries = Get-ChildItem -Path $dotnetAppPath -File | Where-Object -Property FullName -like "*.cs"

                        foreach ($class in $dotnetAppPathClassLibraries.FullName) {
                            $dotnetRelativeAppClass = Resolve-Path -Path $class -Relative

                            $dotnetProjectFile.WriteStartElement('Compile')
                            $dotnetProjectFile.WriteAttributeString('Include', $dotnetRelativeAppClass)
                            $dotnetProjectFile.WriteEndElement()
                        }
                    }

                    if (($dotnetConfigs -contains "packages") -and
                        ($dotnetModulesWithPackages -contains $directoryProject.BaseName)) {
                        foreach ($dependency in $dotnetExistingPackages) {
                            if ($global.dotnet.packages.$dependency.modules -contains $directoryProject.BaseName) {
                                $versionName = $global.dotnet.packages.$dependency.version

                                $dotnetProjectFile.WriteStartElement('PackageReference')
                                $dotnetProjectFile.WriteAttributeString('Include', $dependency)
                                $dotnetProjectFile.WriteAttributeString('Version', $versionName)
                                $dotnetProjectFile.WriteEndElement()

                                ".NET added package {0} version {1} to project {2}" -f $dependency, $versionName, $directoryProject.BaseName | Out-Host
                            }
                        }
                    }

                    if ($dotnetDependencies.ContainsKey($directoryProject.BaseName)) {
                        foreach ($refMod in $dotnetDependencies[$directoryProject.BaseName]) {
                            $refProjFile = Join-Path -Path ".." -ChildPath (Join-Path -Path $refMod -ChildPath ("{0}.csproj" -f $refMod))
                            $refGuid = $dotnetProjectGuids[$refMod]

                            $dotnetProjectFile.WriteStartElement('ProjectReference')
                            $dotnetProjectFile.WriteAttributeString('Include', $refProjFile)
                            if ($refGuid) {
                                $dotnetProjectFile.WriteElementString('Project', $refGuid)
                            }
                            $dotnetProjectFile.WriteElementString('Name', $refMod)
                            $dotnetProjectFile.WriteEndElement()

                            ".NET added project reference [{0}] to project [{1}]" -f $refMod, $directoryProject.BaseName | Out-Host
                        }
                    }

                    $dotnetProjectFile.WriteEndElement()
                    $dotnetProjectFile.WriteStartElement('PropertyGroup')
                    $dotnetProjectFile.WriteElementString('PackageId', $directoryProject.BaseName)
                    $dotnetProjectFile.WriteElementString('Version', $dotnetVersion)
                    $dotnetProjectFile.WriteElementString('Authors', $team)
                    $dotnetProjectFile.WriteElementString('Company', $organization)
                    $dotnetProjectFile.WriteElementString('TargetFramework', $dotnetRuntime)

                    if ($dotnetCommonProperties.Count -gt 0) {
                        foreach ($prop in $dotnetCommonProperties) {
                            $value = $global.dotnet.common.$prop
                            $dotnetProjectFile.WriteElementString($prop, $value)
                        }
                    }
                }

                $dotnetProjectFile.WriteEndElement()
                $dotnetProjectFile.Flush()
                $dotnetProjectFile.Close()

                ".NET Project file created at {0}" -f $dotnetProjectFullName | Out-Host
            }

            if ($null -ne $sqlModules -and $sqlModules.Contains($directoryProject.BaseName)) {
                [String] $sqlProjectBaseName = "{0}.sqlproj" -f $directoryProject.BaseName
                [String] $sqlProjectFullName = Join-Path -Path $directoryProject.FullName -ChildPath $sqlProjectBaseName
                [String] $sqlProjectGuid = $sqlProjectGuids[$directoryProject.BaseName]

                $sqlProjectFile = New-Object System.XMl.XmlTextWriter($sqlProjectFullName, $Null)

                if (Test-Path -Path $sqlProjectFullName -PathType Leaf) {
                    $sqlProjectFile.Formatting = 'Indented'
                    $sqlProjectFile.Indentation = 1
                    $sqlProjectFile.IndentChar = "`t"
                    $sqlProjectFile.WriteStartDocument()
                    $sqlProjectFile.WriteComment($repositoryDirectoryName)
                    $sqlProjectFile.WriteStartElement('Project')
                    $sqlProjectFile.WriteAttributeString('Sdk', 'Microsoft.Build.Sql/2.0.0')
                    $sqlProjectFile.WriteAttributeString('DefaultTargets', 'Build')
                    $sqlProjectFile.WriteStartElement('ItemGroup')

                    if (($sqlConfigs -contains "packages") -and
                        ($sqlModulesWithPackages -contains $directoryProject.BaseName)) {
                        foreach ($dependency in $sqlExistingPackages) {
                            if ($global.sql.packages.$dependency.modules -contains $directoryProject.BaseName) {
                                $versionName = $global.sql.packages.$dependency.version

                                $sqlProjectFile.WriteStartElement('PackageReference')
                                $sqlProjectFile.WriteAttributeString('Include', $dependency)
                                $sqlProjectFile.WriteAttributeString('Version', $versionName)
                                $sqlProjectFile.WriteEndElement()

                                "SQL Server added package {0} version {1} to project {2}" -f $dependency, $versionName, $directoryProject.BaseName | Out-Host
                            }
                        }
                    }

                    if ($sqlDependencies.ContainsKey($directoryProject.BaseName)) {
                        foreach ($refMod in $sqlDependencies[$directoryProject.BaseName]) {
                            $refProjFile = Join-Path -Path ".." -ChildPath (Join-Path -Path $refMod -ChildPath ("{0}.sqlproj" -f $refMod))
                            $refGuid = $sqlProjectGuids[$refMod]

                            $sqlProjectFile.WriteStartElement('ProjectReference')
                            $sqlProjectFile.WriteAttributeString('Include', $refProjFile)
                            $sqlProjectFile.WriteElementString('Name', $refMod)
                            if ($refGuid) {
                                $sqlProjectFile.WriteElementString('Project', $refGuid)
                            }
                            $sqlProjectFile.WriteElementString('Private', 'False')
                            $sqlProjectFile.WriteElementString('SuppressMissingDependenciesErrors', 'False')
                            $sqlProjectFile.WriteElementString('DatabaseVariableLiteralValue', $refMod)
                            $sqlProjectFile.WriteEndElement()

                            "SQL Server added project reference [{0}] to project [{1}]" -f $refMod, $directoryProject.BaseName | Out-Host
                        }
                    }

                    $sqlModuleDirectories = (Get-ChildItem -Path $directoryProject.FullName -Directory).BaseName | Where-Object { $_ -in @("Databases", "Tables", "Users", "Programmability", "Security", "Views") }
                    $sqlQueriesDirectories = (Get-ChildItem -Path $directoryProject.FullName -Directory).BaseName | Where-Object { $_ -like "Queries*" }
                    $sqlReportsDirectories = (Get-ChildItem -Path $directoryProject.FullName -Directory).BaseName | Where-Object { $_ -like "Reports*" }
                    $sqlScriptsDirectories = (Get-ChildItem -Path $directoryProject.FullName -Directory).BaseName | Where-Object { $_ -eq "scripts" }
                    $sqlPublishProfiles = (Get-ChildItem -Path $directoryProject.FullName -File).Name | Where-Object { $_ -like "*.publish.xml" }

                    foreach ($sqlDirectory in $sqlModuleDirectories) {
                        $sqlProjectFile.WriteStartElement('Folder')
                        $sqlProjectFile.WriteAttributeString('Include', $sqlDirectory)
                        $sqlProjectFile.WriteEndElement()
                    }

                    foreach ($sqlDirectory in $sqlQueriesDirectories) {
                        $sqlProjectFile.WriteStartElement('Build')
                        $sqlProjectFile.WriteAttributeString('Remove', '{0}\**\*.sql' -f $sqlDirectory)
                        $sqlProjectFile.WriteEndElement()
                    }

                    foreach ($sqlDirectory in $sqlReportsDirectories) {
                        $sqlProjectFile.WriteStartElement('Build')
                        $sqlProjectFile.WriteAttributeString('Remove', '{0}\**\*.sql' -f $sqlDirectory)
                        $sqlProjectFile.WriteEndElement()
                    }

                    foreach ($publishProfile in $sqlPublishProfiles) {
                        $sqlProjectFile.WriteStartElement('None')
                        $sqlProjectFile.WriteAttributeString('Include', $publishProfile)
                        $sqlProjectFile.WriteEndElement()
                    }

                    foreach ($sqlDirectory in $sqlScriptsDirectories) {
                        $scriptsPath = Join-Path -Path $directoryProject.FullName -ChildPath $sqlDirectory
                        $scriptFiles = Get-ChildItem -Path $scriptsPath -File | Where-Object { $_.Extension -eq ".sql" }
                        foreach ($script in $scriptFiles) {
                            $sqlProjectFile.WriteStartElement('PostDeploy')
                            $sqlProjectFile.WriteAttributeString('Include', "$sqlDirectory\$($script.Name)")
                            $sqlProjectFile.WriteEndElement()
                        }
                    }

                    <#
                    foreach ($dacpacFile in $sqlDacpacFiles) {
                        # Convert absolute path to relative path for better portability
                        $relativeDacpacPath = Resolve-Path -Path $dacpacFile -Relative

                        $sqlProjectFile.WriteStartElement('ArtifactReference')
                        $sqlProjectFile.WriteAttributeString('Include', $relativeDacpacPath)
                        $sqlProjectFile.WriteEndElement()
                    }
                    #>

                    $sqlProjectFile.WriteEndElement()
                    $sqlProjectFile.WriteStartElement('PropertyGroup')
                    $sqlProjectFile.WriteElementString('PackageId', $directoryProject.BaseName)
                    $sqlProjectFile.WriteElementString('Version', $sqlVersion)
                    $sqlProjectFile.WriteElementString('Authors', $team)
                    $sqlProjectFile.WriteElementString('Company', $organization)
                    $sqlProjectFile.WriteElementString('DSP', $sqlDsp)
                    $sqlProjectFile.WriteElementString('ModelCollation', $sqlModelCollation)
                    $sqlProjectFile.WriteElementString('ProjectGuid', $sqlProjectGuid)
                    $sqlProjectFile.WriteElementString('RunSqlCodeAnalysis', $sqlRunSqlCodeAnalysis)
                }

                $sqlProjectFile.WriteEndElement()
                $sqlProjectFile.Flush()
                $sqlProjectFile.Close()

                "SQL Server Project file created at {0}" -f $sqlProjectFullName | Out-Host
            }
        }
    } else {
        "No projects have been created based on global configuration." | Out-Host
    }

    $returnValue = $true
} catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors creating projects on module directories: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
} finally {
    $Host.UI.RawUI.ForegroundColor = $before
    Set-Location -Path $originalPath
}

return $returnValue
