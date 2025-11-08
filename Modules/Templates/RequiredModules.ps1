[CmdletBinding()]
[OutputType([System.Boolean])]
param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ModuleName,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ModuleVersion
)

$requieredModule = Get-Module -ListAvailable -Name $ModuleName

if(-not([System.String]::IsNullOrWhiteSpace($requieredModule.Name)) -and -not([System.String]::IsNullOrWhiteSpace($requieredModule.Version))) {
    Write-Verbose -Message ("Module {0} version {1} already exists." -f $requieredModule.Name, $requieredModule.Version)

    Import-Module -Name $requieredModule.Name -Force
}
else {
    Install-Module -Name $ModuleName -RequiredVersion $ModuleVersion -Scope CurrentUser -Force -AllowClobber

    $requieredModule = Get-Module -ListAvailable -Name $ModuleName

    if(-not([System.String]::IsNullOrWhiteSpace($requieredModule.Name))) {
        Write-Verbose -Message ("Module {0} version {1} is installed." -f $requieredModule.Name, $requieredModule.Version)

        Import-Module -Name $requieredModule.Name -Force
    }
}
