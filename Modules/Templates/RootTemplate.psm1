<#
.SYNOPSIS
    Script principal que genera manifiestos de modulos y coordina la importacion de todos los submodulos.
.DESCRIPTION
    Este script orquesta la construccion y carga de la estructura completa de modulos PowerShell. Realiza:
    - Configura preferencias de ejecucion (errores, warnings, progreso)
    - Lee configuracion desde global.json (versiones, organizacion, GUIDs)
    - Genera archivos .psm1 para cada modulo usando plantilla ModuleTemplate.psm1
    - Crea manifiestos .psd1 individuales para cada submodulo
    - Crea manifiesto .psd1 raiz que consolida todas las funciones publicas
    - Importa todos los modulos en el entorno actual
.EXAMPLE
    .\RootTemplate.psm1
    Ejecuta el proceso completo de construccion e importacion de modulos.
#>
[CmdletBinding()]
param ()

#region Configuracion de ejecucion del script
# Stop: detiene ejecucion ante warnings o errores
# SilentlyContinue: suprime barras de progreso para mejorar rendimiento
# UTF8: establece codificacion predeterminada para todos los cmdlets
$WarningPreference = "Stop"
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
$PSDefaultParameterValues['*:Encoding'] = 'UTF8'
#endregion

#region Obtiene objetos y rutas necesarios para importar cada modulo
# Lee metadata desde global.json y prepara estructuras de datos
[String] $rootName = (Get-Item -Path ./).BaseName
[String] $moduleTemplate = Get-Content -Path $PSScriptRoot/Modules/Templates/ModuleTemplate.psm1 -Raw
$modulesToImport = @( Get-ChildItem -Path $PSScriptRoot/Modules -Directory | Where-Object {$_.FullName -notlike "*Template*" } )
$moduleToImportPath = New-Object -TypeName "System.Collections.Generic.List[String]"
[String] $generalModuleManifiest = ("{0}.psd1" -f $rootName)
[String] $generalModuleManifiestPath = Join-Path -Path $PSScriptRoot -ChildPath $generalModuleManifiest
[String] $generalRootModule = ("./{0}.psm1" -f $rootName)
[String] $globalPath = Join-Path -Path $PSScriptRoot -ChildPath "global.json"
$global = Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json
[String] $powershellModule = $global.powershell.module
[String] $powershellGUID = $global.powershell.guid
[String] $powershellVersion = $global.powershell.version
[String] $copyright = $global.organization.copyright
[String] $organization = $global.organization.name
[String] $team = $global.organization.team
$publicFunctionsToRootManifiest = New-Object -TypeName "System.Collections.Generic.List[String]"
$powershellModuleGuids = @{}
# Lee GUIDs fijos desde global.json para cada módulo PowerShell
if ($global.powershell.modules) {
    $moduleNames = $global.powershell.modules | Get-Member -MemberType NoteProperty
    foreach ($mod in $moduleNames) {
        if ($global.powershell.modules.($mod.Name).guid) {
            $powershellModuleGuids[$mod.Name] = $global.powershell.modules.($mod.Name).guid
        }
    }
}
#endregion

#region Importa elementos de todos los modulos y recrea plantillas
# Para cada modulo: crea archivo .psm1, genera manifiesto .psd1, registra funciones publicas
foreach ($folderModule in $modulesToImport) {
    [String] $itemModuleName = $folderModule.BaseName + ".psm1"
    [String] $itemManifiestPath = Join-Path -Path $folderModule.FullName -ChildPath ($folderModule.BaseName + ".psd1")
    [String] $itemModulePath = Join-Path -Path $folderModule.FullName -ChildPath ($folderModule.BaseName + ".psm1")
    [String] $publicFolderPath = Join-Path -Path $folderModule.FullName -ChildPath "Public"

    # Recopila nombres de funciones publicas para exportacion en el manifiesto
    if(Test-Path -Path $publicFolderPath) {
        [String[]] $publicFunctionsToExport = @(Get-ChildItem -Path $publicFolderPath).BaseName
        $publicFunctionsToRootManifiest += $publicFunctionsToExport
    }
    else {
        [String] $publicFunctionsToExport = ""
    }

    # Crea archivo .psm1 usando contenido de la plantilla estandar
    New-Item -Path $folderModule.FullName -Name $itemModuleName -ItemType File -Value $moduleTemplate -Force
    
    # Obtiene GUID fijo desde global.json si existe
    $moduleGuid = $null
    if ($powershellModuleGuids.ContainsKey($folderModule.BaseName)) {
        $moduleGuid = $powershellModuleGuids[$folderModule.BaseName]
    }
    
    # Genera manifiesto de modulo con metadata y funciones exportadas
    # Si no hay GUID definido, New-ModuleManifest generará uno automáticamente
    $manifestParams = @{
        Path = $itemManifiestPath
        RootModule = $itemModulePath
        CompanyName = $organization
        Copyright = $copyright
        Author = $team
        ModuleVersion = $powershellModule
        CompatiblePSEditions = @("Desktop","Core")
        FunctionsToExport = $publicFunctionsToExport
        Description = ("Import " + $itemModuleName)
        PowerShellVersion = $powershellVersion
        PassThru = $true
    }
    
    if ($null -ne $moduleGuid) {
        $manifestParams['GUID'] = $moduleGuid
    }
    
    New-ModuleManifest @manifestParams

    # Registra ruta completa del modulo para importacion posterior
    $moduleToImportPath += (Get-ChildItem -Path $folderModule.FullName -File -Filter "*.psm1" -ErrorAction SilentlyContinue).FullName
}
#endregion

#region Genera el manifiesto raiz que consolida todos los submodulos
# Crea .psd1 principal con GUID unico y todas las funciones publicas de submodulos
New-ModuleManifest `
    -Path $generalModuleManifiestPath `
    -RootModule $generalRootModule `
    -CompanyName $organization `
    -Copyright $copyright `
    -Author $team `
    -ModuleVersion $powershellModule `
    -CompatiblePSEditions @("Desktop","Core") `
    -GUID $powershellGUID `
    -FunctionsToExport $publicFunctionsToRootManifiest `
    -Description ("Import " + $generalModuleManifiest) `
    -PowerShellVersion $powershellVersion `
    -PassThru
#endregion

#region Importa cada modulo en el entorno de PowerShell actual
# Force: recarga el modulo incluso si ya estaba cargado previamente
foreach ($module in $moduleToImportPath) {
    Import-Module -Name $module -Force
}
#endregion
