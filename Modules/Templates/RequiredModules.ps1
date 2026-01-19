<#
.SYNOPSIS
    Instala e importa un modulo de PowerShell requerido con una version especifica.
.DESCRIPTION
    Este script verifica si un modulo de PowerShell con una version especifica esta instalado en el sistema.
    Si el modulo ya existe, lo importa forzando la carga. Si no existe, procede a instalarlo desde el
    repositorio de PowerShell Gallery en el ambito del usuario actual, luego lo importa.
.PARAMETER ModuleName
    Nombre del modulo de PowerShell que se debe verificar, instalar o importar.
.PARAMETER ModuleVersion
    Version especifica del modulo requerida para la instalacion.
.EXAMPLE
    .\RequiredModules.ps1 -ModuleName "Pester" -ModuleVersion "5.3.0"
    Verifica si Pester version 5.3.0 esta instalado, lo instala si es necesario y lo importa.
#>
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

# Obtiene la lista de modulos disponibles que coinciden con el nombre especificado
$requieredModule = Get-Module -ListAvailable -Name $ModuleName

# Verifica si el modulo ya existe en el sistema con nombre y version validos
if(-not([System.String]::IsNullOrWhiteSpace($requieredModule.Name)) -and -not([System.String]::IsNullOrWhiteSpace($requieredModule.Version))) {
    Write-Verbose -Message ("Module {0} version {1} already exists." -f $requieredModule.Name, $requieredModule.Version)

    # Importa el modulo existente forzando la recarga si ya estaba cargado
    Import-Module -Name $requieredModule.Name -Force
}
else {
    # Instala el modulo desde PowerShell Gallery con la version especificada
    Install-Module -Name $ModuleName -RequiredVersion $ModuleVersion -Scope CurrentUser -Force -AllowClobber

    # Vuelve a obtener el modulo recien instalado
    $requieredModule = Get-Module -ListAvailable -Name $ModuleName

    # Verifica que la instalacion fue exitosa y el modulo tiene un nombre valido
    if(-not([System.String]::IsNullOrWhiteSpace($requieredModule.Name))) {
        Write-Verbose -Message ("Module {0} version {1} is installed." -f $requieredModule.Name, $requieredModule.Version)

        # Importa el modulo recien instalado
        Import-Module -Name $requieredModule.Name -Force
    }
}
