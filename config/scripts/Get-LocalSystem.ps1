[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $VersionPath
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $Host.UI.RawUI.ForegroundColor = "Magenta"
    "" | Out-Host

    if(-not [System.String]::IsNullOrEmpty([System.Environment]::OSVersion.ToString())) {
        ("Operating System {0}" -f [System.Environment]::OSVersion.ToString()) | Out-Host

        if(-not [System.String]::IsNullOrEmpty([System.Runtime.InteropServices.RuntimeInformation, mscorlib]::FrameworkDescription.ToString())) {
            ("Runtime {0}" -f [System.Runtime.InteropServices.RuntimeInformation, mscorlib]::FrameworkDescription.ToString()) | Out-Host
        }

        ("PowerShell {0} {1}" -f $PSVersionTable.PSEdition, $PSVersionTable.PSVersion) | Out-Host

        if(-not [System.String]::IsNullOrEmpty($VersionPath)) {
            ("Module version {0}`n" -f $VersionPath) | Out-Host
            $returnValue = $true
        }
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors getting system information: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally{
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
