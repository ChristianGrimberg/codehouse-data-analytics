[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $GlobalPath
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $Host.UI.RawUI.ForegroundColor = "Cyan"
    "Installing/Updating SQL Server Tools from global.json..." | Out-Host

    if (-not (Test-Path -Path $GlobalPath)) {
        throw "global.json not found at: $GlobalPath"
    }

    $globalJson = Get-Content -Path $GlobalPath -Raw | ConvertFrom-Json

    # Check for sql.tools section
    if ($null -eq $globalJson.sql -or $null -eq $globalJson.sql.tools) {
        "No SQL tools defined in global.json. Skipping." | Out-Host
        return $false
    }

    $sqlTools = ($globalJson.sql.tools | Get-Member -MemberType NoteProperty).Name

    foreach ($toolName in $sqlTools) {
        $version = $globalJson.sql.tools.$toolName.version
        "Ensuring tool {0} version {1} is installed globally..." -f $toolName, $version | Out-Host

        try {
            # Try to install (will update or install if missing)
            & dotnet tool install -g $toolName --version $version --allow-roll-forward

            if ($LASTEXITCODE -ne 0) {
                # Attempt update if install failed (likely already installed)
                & dotnet tool update -g $toolName --version $version --allow-roll-forward
            }
        }
        catch {
            Write-Warning "Failed to install/update $($toolName): $($_.Exception.Message)"
        }

        # Verification step
        $installedTools = & dotnet tool list -g | Out-String
        if ($installedTools -like "*$($toolName.ToLower())*$($version)*") {
            $Host.UI.RawUI.ForegroundColor = "Green"
            ("{0} version {1} is correctly installed and verified`n" -f $toolName, $version) | Out-Host

            $returnValue = $true
        }
        else {
            $Host.UI.RawUI.ForegroundColor = "Red"
            ("Verification failed for {0}. Tool might not be in the path or version mismatch.`n" -f $toolName) | Out-Host
            $returnValue = $false # Mark as failed if any tool fails verification
        }
        $Host.UI.RawUI.ForegroundColor = "Cyan"
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors installing SQL tools: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
