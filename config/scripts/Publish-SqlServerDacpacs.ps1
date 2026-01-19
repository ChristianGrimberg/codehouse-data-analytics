[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ModulesPath,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $GlobalPath
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    # SqlPackage path (should be pre-installed in the development container)
    $sqlPackagePath = "sqlpackage"

    # Force .NET roll forward to support .NET 9 since SqlPackage targets .NET 8
    $env:DOTNET_ROLL_FORWARD = "Major"

    $Host.UI.RawUI.ForegroundColor = "Magenta"
    "Executing SQL Server publish profiles..." | Out-Host

    if (-not (Test-Path -Path $GlobalPath)) {
        throw "global.json not found at: $GlobalPath"
    }

    $globalJson = Get-Content -Path $GlobalPath -Raw | ConvertFrom-Json
    $osKey = if ($IsWindows) { "windows" } else { "linux" }
    $connectionStringTemplate = $globalJson.sql.connectionStrings.$osKey

    if ([string]::IsNullOrWhiteSpace($connectionStringTemplate)) {
        throw "No connection string template found for OS: $osKey in global.json"
    }

    $sqlProjectDirectories = Get-ChildItem -Path $ModulesPath -Directory | Where-Object { $_.FullName -notmatch "Template|Imported" }

    [Int] $executedProfilesCount = 0

    foreach ($projectModule in $sqlProjectDirectories) {
        # Check if this directory contains a SQL project and publish profile
        $sqlProjectFile = Get-ChildItem -Path $projectModule.FullName -Filter "*.sqlproj" | Select-Object -First 1
        $publishProfileFile = Get-ChildItem -Path $projectModule.FullName -Filter "*.publish.xml" | Select-Object -First 1

        if ($null -ne $sqlProjectFile -and $null -ne $publishProfileFile) {
            "Executing publish profile for: {0}" -f $projectModule.BaseName | Out-Host

            try {

            # Validate that the publish profile exists and is not empty
            if (-not (Test-Path -Path $publishProfileFile.FullName) -or (Get-Item $publishProfileFile.FullName).Length -eq 0) {
                $Host.UI.RawUI.ForegroundColor = "Yellow"
                ("Skipping {0}: Publish profile is empty or missing`n" -f $projectModule.BaseName) | Out-Host
                continue
            }

            # Looking for the generated DACPAC file in the artifacts directory
            $artifactsDirectory = Join-Path -Path $projectModule.FullName -ChildPath "artifacts"
            # Explicitly look for the DACPAC matching the project name to avoid picking up dependency DACPACs
            # Use the project filename as source of truth for the DACPAC name, as dotnet build uses this
            $dacpacName = "{0}.dacpac" -f $sqlProjectFile.BaseName
            $dacpacFile = Get-ChildItem -Path $artifactsDirectory -Filter $dacpacName -ErrorAction SilentlyContinue | Select-Object -First 1

            if ($null -eq $dacpacFile) {
                $Host.UI.RawUI.ForegroundColor = "Yellow"
                ("No DACPAC file found for {0} (Expected: {1}). Run Artifact task first.`n" -f $projectModule.BaseName, $dacpacName) | Out-Host
                continue
            }

            # Create reports directory for deployment scripts
            $reportsDirectory = Join-Path -Path $projectModule.FullName -ChildPath "Reports"
            if (-not (Test-Path -Path $reportsDirectory)) {
                New-Item -Path $reportsDirectory -ItemType Directory -Force | Out-Null
            }

            # Use SqlPackage.exe to publish the DACPAC to the development server
            $deployReportPath = Join-Path -Path $reportsDirectory -ChildPath ("{0}_DeployReport.xml" -f $projectModule.BaseName)
            $deployScriptPath = Join-Path -Path $reportsDirectory -ChildPath ("{0}_DeployScript.sql" -f $projectModule.BaseName)

                "Deploying DACPAC: {0}" -f $dacpacFile.Name | Out-Host
                "Target Database: {0}" -f $projectModule.BaseName | Out-Host

                $targetConnectionString = $connectionStringTemplate -f $projectModule.BaseName
                $deployCommand = @(
                    $sqlPackagePath
                    "/Action:Publish"
                    "/SourceFile:$($dacpacFile.FullName)"
                    "/TargetConnectionString:$targetConnectionString"
                    "/DeployReportPath:$deployReportPath"
                    "/DeployScriptPath:$deployScriptPath"
                    "/p:CreateNewDatabase=True"
                    "/p:BlockOnPossibleDataLoss=False"
                )

                $tempCopiedDacpacs = @()

                try {
                    # Stage dependencies: Copy other DACPACs to the artifacts directory temporarily
                    # This ensures SqlPackage can resolve references without permanently accumulating files
                    foreach ($moduleDir in $sqlProjectDirectories) {
                         if ($moduleDir.FullName -eq $projectModule.FullName) { continue }

                         $moduleArtifacts = Join-Path -Path $moduleDir.FullName -ChildPath "artifacts"
                         if (Test-Path -Path $moduleArtifacts) {
                             $foundDacpacs = Get-ChildItem -Path $moduleArtifacts -Filter "*.dacpac"
                             foreach ($dep in $foundDacpacs) {
                                 $dest = Join-Path -Path $artifactsDirectory -ChildPath $dep.Name
                                 # Only copy if it doesn't exist to avoid overwriting the main artifact (unlikely due to check)
                                 if (-not (Test-Path -Path $dest)) {
                                     Copy-Item -Path $dep.FullName -Destination $dest -Force
                                     $tempCopiedDacpacs += $dest
                                 }
                             }
                         }
                    }

                    "Executing SqlPackage deployment..." | Out-Host
                    $null = & $deployCommand[0] $deployCommand[1..($deployCommand.Length-1)]

                    if ($LASTEXITCODE -eq 0) {
                        $Host.UI.RawUI.ForegroundColor = "Green"
                        ("SQL database deployment for {0} completed successfully`n" -f $projectModule.BaseName) | Out-Host
                        ("Deploy report generated: {0}" -f $deployReportPath) | Out-Host
                        ("Deploy script generated: {0}" -f $deployScriptPath) | Out-Host
                        $executedProfilesCount++
                    }
                    else {
                        $Host.UI.RawUI.ForegroundColor = "Red"
                        ("Failed to deploy SQL database for: {0}`n" -f $projectModule.BaseName) | Out-Host
                        ("SqlPackage exit code: {0}" -f $LASTEXITCODE) | Out-Host
                    }
                }
                finally {
                    $ProgressPreference = 'SilentlyContinue'
                    # Cleanup staged dependencies
                    # ENFORCE: Only the project's own DACPAC should remain.
                    # This removes any dependency DACPACs copied (tracked or untracked from previous runs)
                    if (Test-Path -Path $artifactsDirectory) {
                        Get-ChildItem -Path $artifactsDirectory -Filter "*.dacpac" |
                            Where-Object { $_.Name -ne $dacpacName } |
                            Remove-Item -Force -ErrorAction SilentlyContinue
                    }
                }
            }
            catch {
                $Host.UI.RawUI.ForegroundColor = "Red"
                ("Error executing SQL deployment for {0}: {1}`n" -f $projectModule.BaseName, $_) | Out-Host
                # Continue with other projects instead of failing completely
                continue
            }
        }
        elseif ($null -ne $sqlProjectFile -and $null -eq $publishProfileFile) {
            $Host.UI.RawUI.ForegroundColor = "Yellow"
            ("SQL project {0} found but no publish profile available. Run SqlProfile task first.`n" -f $projectModule.BaseName) | Out-Host
        }
    }

    if ($executedProfilesCount -gt 0) {
        $Host.UI.RawUI.ForegroundColor = "Magenta"
        ("Successfully executed {0} SQL Server publish profiles`n" -f $executedProfilesCount) | Out-Host
        $returnValue = $true
    }
    else {
        $Host.UI.RawUI.ForegroundColor = "Yellow"
        "No SQL Server publish profiles were executed. Ensure projects have valid publish profiles.`n" | Out-Host
        $returnValue = $true  # Not necessarily an error condition
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors executing SQL publish profiles: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
