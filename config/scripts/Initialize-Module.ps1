[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $Manifiest
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $host.ui.RawUI.ForegroundColor = "Yellow"
    ("Testing Manifiest Module of {0}..." -f $module) | Out-Host

    [String] $version = (Test-ModuleManifest -Path $Manifiest -ErrorAction Stop).Version.ToString()
    ("Module version tested {0}" -f $version) | Out-Host
    $returnValue = $true
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors getting manifiest module: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
