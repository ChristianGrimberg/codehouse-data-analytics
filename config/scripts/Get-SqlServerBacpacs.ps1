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
$ProgressPreference = 'SilentlyContinue'

try {
    $Host.UI.RawUI.ForegroundColor = "DarkGreen"
    "Creating SQL Server BACPAC artifacts (structure + data)..." | Out-Host

    $sqlProjectDirectories = Get-ChildItem -Path $ModulesPath -Directory | Where-Object { $_.FullName -notmatch "Template|Imported" }

    [Int] $createdBacpacCount = 0

    foreach ($projectModule in $sqlProjectDirectories) {
        # Check if this directory contains a SQL project
        $sqlProjectFile = Get-ChildItem -Path $projectModule.FullName -Filter "*.sqlproj" | Select-Object -First 1
        $publishProfile = Get-ChildItem -Path $projectModule.FullName -Filter "*.publish.xml" | Select-Object -First 1

        if ($null -ne $sqlProjectFile -and $null -ne $publishProfile) {
            $artifactsDirectory = Join-Path -Path $projectModule.FullName -ChildPath "artifacts"
            $artifactsDirectory = Join-Path -Path $projectModule.FullName -ChildPath "artifacts"
            $bacpacDirectory = $artifactsDirectory

            # Parse publish profile to get connection string
            try {
                [xml]$profileXml = Get-Content -Path $publishProfile.FullName
                $targetConnectionString = $profileXml.Project.PropertyGroup.TargetConnectionString
                $targetDatabaseName = $profileXml.Project.PropertyGroup.TargetDatabaseName

                if ([string]::IsNullOrEmpty($targetConnectionString) -or [string]::IsNullOrEmpty($targetDatabaseName)) {
                    $Host.UI.RawUI.ForegroundColor = "Yellow"
                    "Skipping {0}: No connection string or database name in publish profile" -f $projectModule.BaseName | Out-Host
                    continue
                }

                # Ensure Initial Catalog or Database is in the connection string
                if ($targetConnectionString -notlike "*Initial Catalog=*" -and $targetConnectionString -notlike "*Database=*") {
                    if ($targetConnectionString -notmatch ";$") { $targetConnectionString += ";" }
                    $targetConnectionString += "Initial Catalog=$targetDatabaseName"
                }

                # Workaround for SqlPackage quirk: on Windows with LocalDB, sometimes it prefers 'Data Source' over 'Server'
                # and 'Initial Catalog' over 'Database' in the connection string for Export action.
                if ($IsWindows -and $targetConnectionString -match "localdb") {
                    if ($targetConnectionString -match "Server=") {
                        $targetConnectionString = $targetConnectionString -replace "Server=", "Data Source="
                    }
                    if ($targetConnectionString -match "Database=") {
                        $targetConnectionString = $targetConnectionString -replace "Database=", "Initial Catalog="
                    }
                }

                $bacpacFileName = "{0}.bacpac" -f $targetDatabaseName
                $bacpacFilePath = Join-Path -Path $bacpacDirectory -ChildPath $bacpacFileName

                "Exporting BACPAC for {0} to {1}..." -f $targetDatabaseName, $bacpacFileName | Out-Host

                # Check if SqlPackage is available
                $sqlPackageCmd = $null
                $sqlPackagePaths = @(
                    "sqlpackage",
                    "SqlPackage",
                    "C:\Program Files\Microsoft SQL Server\160\DAC\bin\SqlPackage.exe",
                    "C:\Program Files\Microsoft SQL Server\150\DAC\bin\SqlPackage.exe",
                    "/opt/mssql-tools/bin/sqlpackage"
                )

                foreach ($path in $sqlPackagePaths) {
                    try {
                        $testCmd = Get-Command $path -ErrorAction SilentlyContinue
                        if ($null -ne $testCmd) {
                            $sqlPackageCmd = $path
                            break
                        }
                    }
                    catch {
                        continue
                    }
                }

                if ($null -eq $sqlPackageCmd) {
                    $Host.UI.RawUI.ForegroundColor = "Yellow"
                    "SqlPackage not found. BACPAC export requires SqlPackage.exe or sqlpackage CLI.`n" | Out-Host
                    continue
                }

                # Build SqlPackage arguments for BACPAC export
                $sqlPackageArgs = @(
                    "/Action:Export",
                    "/SourceConnectionString:`"$targetConnectionString`"",
                    "/TargetFile:`"$bacpacFilePath`"",
                    "/p:VerifyExtraction=False"
                )

                # Execute SqlPackage
                $Host.UI.RawUI.ForegroundColor = "DarkGreen"
                "Executing: {0} {1}" -f $sqlPackageCmd, ($sqlPackageArgs -join " ") | Out-Host

                # Force .NET roll forward to support .NET 9 since SqlPackage targets .NET 8
                $env:DOTNET_ROLL_FORWARD = "Major"

                $sqlPackageProcess = Start-Process -FilePath $sqlPackageCmd -ArgumentList $sqlPackageArgs -Wait -NoNewWindow -PassThru
                $exitCode = $sqlPackageProcess.ExitCode

                if ($exitCode -eq 0) {
                    if (Test-Path -Path $bacpacFilePath) {
                        $bacpacSize = (Get-Item -Path $bacpacFilePath).Length / 1MB
                        ("BACPAC created successfully for {0}: {1:N2} MB`n" -f $targetDatabaseName, $bacpacSize) | Out-Host
                        $createdBacpacCount++
                    }
                    else {
                        $Host.UI.RawUI.ForegroundColor = "Yellow"
                        "Warning: SqlPackage reported success but BACPAC file not found" | Out-Host
                    }
                }
                else {
                    $Host.UI.RawUI.ForegroundColor = "Yellow"
                    "Warning: SqlPackage exited with code {0} for {1}" -f $exitCode, $projectModule.BaseName | Out-Host

                    # Detect common "database not found" or "login failed" errors to provide better guidance
                    # The error usually shows up in the stdout which we are already seeing in the console
                    if ($exitCode -ne 0) {
                         if ($targetConnectionString -match "localdb" -or $IsWindows) {
                             "Tip: If the error is 'Cannot open database' or 'Login failed', ensure you have run the 'SqlPublish' task first to create and populate the database.`n" | Out-Host
                         }
                         if ($targetConnectionString -match "localhost,1433" -and $IsWindows) {
                             $Host.UI.RawUI.ForegroundColor = "Red"
                             "Warning: Using Linux connection string (localhost,1433) on Windows! Please run 'SqlProfile' task to refresh your profiles.`n" | Out-Host
                         }
                    }
                }
            }
            catch {
                $Host.UI.RawUI.ForegroundColor = "Yellow"
                "Warning: Could not create BACPAC for {0}: {1}" -f $projectModule.BaseName, $_ | Out-Host
            }
        }
        else {
            if ($null -eq $sqlProjectFile) {
                # No SQL project, skip silently
            }
            elseif ($null -eq $publishProfile) {
                $Host.UI.RawUI.ForegroundColor = "Yellow"
                "Skipping {0}: No publish profile found (required for BACPAC export)" -f $projectModule.BaseName | Out-Host
            }
        }
    }

    if ($createdBacpacCount -gt 0) {
        $Host.UI.RawUI.ForegroundColor = "Green"
        ("Successfully created {0} BACPAC file(s)`n" -f $createdBacpacCount) | Out-Host
        $returnValue = $true
    }
    else {
        $Host.UI.RawUI.ForegroundColor = "Yellow"
        "No BACPAC files created.`n" | Out-Host
        $returnValue = $true  # Not a critical failure
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors creating BACPAC artifacts: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
