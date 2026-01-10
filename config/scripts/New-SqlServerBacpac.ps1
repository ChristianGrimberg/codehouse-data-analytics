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
            $bacpacDirectory = Join-Path -Path $artifactsDirectory -ChildPath "bacpac"

            if (-not (Test-Path -Path $bacpacDirectory)) {
                New-Item -Path $bacpacDirectory -ItemType Directory -Force | Out-Null
                "Created BACPAC directory: {0}" -f $bacpacDirectory | Out-Host
            }

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

                $bacpacFileName = "{0}.bacpac" -f $targetDatabaseName
                $bacpacFilePath = Join-Path -Path $bacpacDirectory -ChildPath $bacpacFileName

                "Exporting BACPAC for {0} to {1}..." -f $targetDatabaseName, $bacpacFileName | Out-Host

                # Check if SqlPackage is available
                $sqlPackageCmd = $null
                $sqlPackagePaths = @(
                    "SqlPackage",
                    "sqlpackage",
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
                    "SqlPackage not found. BACPAC export requires SqlPackage.exe or sqlpackage CLI." | Out-Host
                    "Install from: https://aka.ms/sqlpackage-linux or https://aka.ms/sqlpackage-windows" | Out-Host
                    "Skipping BACPAC generation for {0}" -f $projectModule.BaseName | Out-Host
                    "" | Out-Host
                    continue
                }

                # Build SqlPackage arguments for BACPAC export
                $sqlPackageArgs = @(
                    "/Action:Export",
                    "/SourceConnectionString:`"$targetConnectionString`"",
                    "/TargetFile:`"$bacpacFilePath`"",
                    "/p:VerifyExtraction=True",
                    "/p:Storage=File"
                )

                # Execute SqlPackage
                $Host.UI.RawUI.ForegroundColor = "DarkGreen"
                "Executing: {0} {1}" -f $sqlPackageCmd, ($sqlPackageArgs -join " ") | Out-Host

                $sqlPackageProcess = Start-Process -FilePath $sqlPackageCmd -ArgumentList $sqlPackageArgs -Wait -NoNewWindow -PassThru

                if ($sqlPackageProcess.ExitCode -eq 0) {
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
                    "Warning: SqlPackage exited with code {0} for {1}" -f $sqlPackageProcess.ExitCode, $projectModule.BaseName | Out-Host
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
        "No BACPAC files created. This may be expected if:" | Out-Host
        "  - SqlPackage is not installed" | Out-Host
        "  - No publish profiles exist" | Out-Host
        "  - Database connections are not available" | Out-Host
        "" | Out-Host
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
