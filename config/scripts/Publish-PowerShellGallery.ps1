[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $Path,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ApiKey
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $host.ui.RawUI.ForegroundColor = "Magenta"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    if(Test-Path -Path $Path -PathType Container) {
        [String] $rootModule = (Get-Item -Path $Path).BaseName

        "Publishing Module {0} to PowerShell Gallery..." -f $rootModule | Out-Host

        if(-not [System.String]::IsNullOrEmpty($ApiKey)) {
            Publish-Module -Name ("{0}/{1}.psm1" -f $Path, $rootModule) -NuGetApiKey $ApiKey -Force -ErrorAction Stop

            $returnValue = $true
        }
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors publishing to PowerShell Gallery: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
