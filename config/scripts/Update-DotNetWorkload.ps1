[CmdletBinding()]
[OutputType([System.Boolean])]
param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $RootPath,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $FunctionsPath
)

[System.Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $host.ui.RawUI.ForegroundColor = "DarkMagenta"
    "Updating .NET workload..." | Out-Host
    [String] $originalPath = (Get-Location).Path
    Set-Location -Path $RootPath

    $scriptToWorkloadUpdate = ('{0} -Command workload -Arguments "update" -Privileged {1}' -f $FunctionsPath, 1)

    $scriptToWorkloadUpdateBlock = [System.Management.Automation.ScriptBlock]::Create($scriptToWorkloadUpdate)

    if(Invoke-Command -ScriptBlock $scriptToWorkloadUpdateBlock) {
        (".NET workload has been updated`n") | Out-Host
    }

    $returnValue = $true
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors updating .NET workload: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
    Set-Location -Path $originalPath
}

return $returnValue
