[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ModulesPath
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    # SqlPackage path (should be pre-installed in the development container)
    $sqlPackagePath = "sqlpackage"

    $Host.UI.RawUI.ForegroundColor = "Magenta"
    "Executing SQL Server publish profiles..." | Out-Host

    $sqlProjectDirectories = Get-ChildItem -Path $ModulesPath -Directory | Where-Object { $_.FullName -notlike "*Template*" }

    [Int] $executedProfilesCount = 0

    foreach ($projectModule in $sqlProjectDirectories) {
        # Check if this directory contains a SQL project and publish profile
        $sqlProjectFile = Get-ChildItem -Path $projectModule.FullName -Filter "*.sqlproj" | Select-Object -First 1
        $publishProfileFile = Get-ChildItem -Path $projectModule.FullName -Filter "*.publish.xml" | Select-Object -First 1

        if ($null -ne $sqlProjectFile -and $null -ne $publishProfileFile) {
            "Executing publish profile for: {0}" -f $projectModule.BaseName | Out-Host

            # Validate that the publish profile exists and is not empty
            if (-not (Test-Path -Path $publishProfileFile.FullName) -or (Get-Item $publishProfileFile.FullName).Length -eq 0) {
                $Host.UI.RawUI.ForegroundColor = "Yellow"
                ("Skipping {0}: Publish profile is empty or missing`n" -f $projectModule.BaseName) | Out-Host
                continue
            }

            # Look for the generated DACPAC file in the artifacts directory
            $artifactsDirectory = Join-Path -Path $projectModule.FullName -ChildPath "artifacts"
            $dacpacFile = Get-ChildItem -Path $artifactsDirectory -Filter "*.dacpac" -ErrorAction SilentlyContinue | Select-Object -First 1

            if ($null -eq $dacpacFile) {
                $Host.UI.RawUI.ForegroundColor = "Yellow"
                ("No DACPAC file found for {0}. Run Artifact task first.`n" -f $projectModule.BaseName) | Out-Host
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

            try {
                "Deploying DACPAC: {0}" -f $dacpacFile.Name | Out-Host
                "Target Database: {0}" -f $projectModule.BaseName | Out-Host

                # First, test the connection to SQL Server
                "Testing connection to SQL Server..." | Out-Host

                try {
                    # Test SQL Server connection using direct command execution
                    $sqlcmdArgs = @('-S', 'localhost,1433', '-U', 'sa', '-P', 'P@ssw0rd', '-Q', 'SELECT @@VERSION', '-l', '30')
                    $null = & sqlcmd $sqlcmdArgs
                    if ($LASTEXITCODE -eq 0) {
                        "✓ Connection to SQL Server successful" | Out-Host

                        # Now deploy using sqlpackage directly
                        $deployCommand = @(
                            $sqlPackagePath
                            "/Action:Publish"
                            "/SourceFile:$($dacpacFile.FullName)"
                            "/TargetConnectionString:Server=localhost,1433;Database=$($projectModule.BaseName);User Id=sa;Password=P@ssw0rd;TrustServerCertificate=True;Encrypt=false"
                            "/DeployReportPath:$deployReportPath"
                            "/DeployScriptPath:$deployScriptPath"
                            "/p:CreateNewDatabase=True"
                            "/p:BlockOnPossibleDataLoss=False"
                        )

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
                    else {
                        $Host.UI.RawUI.ForegroundColor = "Red"
                        ("Cannot connect to SQL Server at localhost:1433. Please ensure SQL Server is running.`n") | Out-Host
                    }
                }
                catch {
                    $Host.UI.RawUI.ForegroundColor = "Yellow"
                    ("Warning: Cannot test SQL Server connection with sqlcmd. Proceeding with SqlPackage...`n") | Out-Host

                    # Fallback to direct SqlPackage execution without connection test
                    $deployCommand = @(
                        $sqlPackagePath
                        "/Action:Publish"
                        "/SourceFile:$($dacpacFile.FullName)"
                        "/TargetConnectionString:Server=localhost,1433;Database=$($projectModule.BaseName);User Id=sa;Password=P@ssw0rd;TrustServerCertificate=True;Encrypt=false"
                        "/DeployReportPath:$deployReportPath"
                        "/DeployScriptPath:$deployScriptPath"
                        "/p:CreateNewDatabase=True"
                        "/p:BlockOnPossibleDataLoss=False"
                    )

                    $null = & $deployCommand[0] $deployCommand[1..($deployCommand.Length-1)]

                    if ($LASTEXITCODE -eq 0) {
                        $Host.UI.RawUI.ForegroundColor = "Green"
                        ("SQL database deployment for {0} completed successfully`n" -f $projectModule.BaseName) | Out-Host
                        $executedProfilesCount++
                    }
                    else {
                        $Host.UI.RawUI.ForegroundColor = "Red"
                        ("Failed to deploy SQL database for: {0}`n" -f $projectModule.BaseName) | Out-Host
                        ("SqlPackage exit code: {0}" -f $LASTEXITCODE) | Out-Host
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
