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
    $FunctionsPath
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $Host.UI.RawUI.ForegroundColor = "DarkGreen"
    "Creating SQL Server DACPACs..." | Out-Host

    # Convert to absolute path to work correctly when changing directories
    [String] $functionPath = Resolve-Path (Join-Path -Path $FunctionsPath -ChildPath "Invoke-DotNetCore.ps1")
    $sqlProjectDirectories = Get-ChildItem -Path $ModulesPath -Directory | Where-Object { $_.FullName -notmatch "Template|Imported" }

    [Int] $builtProjectsCount = 0

    foreach ($projectModule in $sqlProjectDirectories) {
        # Check if this directory contains a SQL project
        $sqlProjectFile = Get-ChildItem -Path $projectModule.FullName -Filter "*.sqlproj" | Select-Object -First 1

        if ($null -ne $sqlProjectFile) {
            $artifactsDirectory = Join-Path -Path $projectModule.FullName -ChildPath "artifacts"

            if (-not (Test-Path -Path $artifactsDirectory)) {
                New-Item -Path $artifactsDirectory -ItemType Directory -Force | Out-Null
                "Created artifact directory on {0}" -f $artifactsDirectory | Out-Host
            }

            # Use temporary relative path to separate build output from final artifacts
            $tempRelativePath = "./bin/dacpac_temp"

            # Change to the project directory and run the build with relative path
            $originalLocation = Get-Location
            Set-Location -Path $projectModule.FullName

            # Build the SQL project using dotnet build with relative temporary output directory
            $buildArguments = '"{0}" --configuration Release --output "{1}" --no-incremental' -f $sqlProjectFile.Name, $tempRelativePath

            try {
                if (& $functionPath -Command "build" -Arguments $buildArguments -Privileged $false) {
                    $dacpacName = "{0}.dacpac" -f $sqlProjectFile.BaseName
                    $sourceDacpac = Join-Path -Path $tempRelativePath -ChildPath $dacpacName

                    if (Test-Path -Path $sourceDacpac) {
                        # Move the correct DACPAC to the artifacts directory
                        Copy-Item -Path $sourceDacpac -Destination $artifactsDirectory -Force

                        # Clean up other unrelated DACPACs in the artifacts directory to prevent accumulation
                        Get-ChildItem -Path $artifactsDirectory -Filter "*.dacpac" |
                            Where-Object { $_.Name -ne $dacpacName } |
                            Remove-Item -Force

                        # Remove the temporary build directory
                        Remove-Item -Path $tempRelativePath -Recurse -Force

                        ("SQL Server DACPAC for module {0} has been built successfully`n" -f $projectModule.BaseName) | Out-Host
                        $builtProjectsCount++
                    }
                    else {
                        Write-Warning ("Build succeeded but expected DACPAC '{0}' was not found in '{1}'." -f $dacpacName, $tempRelativePath)
                    }
                }
            }
            catch {
                throw ("Error building SQL Server DACPAC for module {0}: {1}`n" -f $projectModule.BaseName, $_)
            }
            finally {
                # Restore the original location
                Set-Location -Path $originalLocation
            }
        }
    }

    if ($builtProjectsCount -gt 0) {
        $Host.UI.RawUI.ForegroundColor = "DarkGreen"
        ("Successfully built {0} SQL Server projects`n" -f $builtProjectsCount) | Out-Host
        $returnValue = $true
    }
    else {
        $Host.UI.RawUI.ForegroundColor = "Yellow"
        "No SQL Server projects found to build`n" | Out-Host
        $returnValue = $true  # Not an error condition
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors building SQL projects: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue