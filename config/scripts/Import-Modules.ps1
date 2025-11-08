[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $Path
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $host.ui.RawUI.ForegroundColor = "Green"

    if(Test-Path -Path $Path -PathType Container) {
        [String] $rootModule = (Get-Item -Path $Path).BaseName

        "Loading Module {0}..." -f $rootModule | Out-Host
        (Get-Module -ListAvailable -Name $rootModule).Name | Out-Host

        if((Get-Module -ListAvailable -Name $rootModule).Name -eq $rootModule) {
            Get-Module -ListAvailable -Name $rootModule | Uninstall-Module -Force -ErrorAction Stop

            if([System.String]::IsNullOrWhiteSpace((Get-Module -ListAvailable -Name $rootModule).Name)) {
                "The module have been removed" | Out-Host
            }
        }

        Import-Module -Name ("{0}/{1}.psm1" -f $Path, $rootModule) -Force -ErrorAction Stop
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors importing modules: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
    $returnValue = $true
}

return $returnValue
