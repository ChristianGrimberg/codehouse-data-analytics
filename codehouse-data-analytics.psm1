[CmdletBinding()]
param ()

#region Execution configuration
$WarningPreference = "Stop"
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
$PSDefaultParameterValues['*:Encoding'] = 'UTF8'
#endregion

#region Getting objects to import each module
[String] $rootName = (Get-Item -Path ./).BaseName
[String] $moduleTemplate = Get-Content -Path $PSScriptRoot/Modules/Templates/ModuleTemplate.psm1 -Raw
$modulesToImport = @( Get-ChildItem -Path $PSScriptRoot/Modules -Directory | Where-Object {$_.FullName -notlike "*Template*" } )
$moduleToImportPath = New-Object -TypeName "System.Collections.Generic.List[String]"
[String] $generalModuleManifiest = ("{0}.psd1" -f $rootName)
[String] $generalModuleManifiestPath = Join-Path -Path $PSScriptRoot -ChildPath $generalModuleManifiest
[String] $generalRootModule = ("./{0}.psm1" -f $rootName)
[String] $globalPath = Join-Path -Path $PSScriptRoot -ChildPath "global.json"
[String] $powershellModule = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).powershell.module
[String] $powershellGUID = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).powershell.guid
[String] $powershellVersion = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).powershell.version
[String] $copyright = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).organization.copyright
[String] $organization = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).organization.name
[String] $team = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).organization.team
$publicFunctionsToRootManifiest = New-Object -TypeName "System.Collections.Generic.List[String]"
#endregion

#region Import items from all modules and recreate templates
foreach ($folderModule in $modulesToImport) {
    [String] $itemModuleName = $folderModule.BaseName + ".psm1"
    [String] $itemManifiestPath = Join-Path -Path $folderModule.FullName -ChildPath ($folderModule.BaseName + ".psd1")
    [String] $itemModulePath = Join-Path -Path $folderModule.FullName -ChildPath ($folderModule.BaseName + ".psm1")
    [String] $publicFolderPath = Join-Path -Path $folderModule.FullName -ChildPath "Public"

    if(Test-Path -Path $publicFolderPath) {
        [String[]] $publicFunctionsToExport = @(Get-ChildItem -Path $publicFolderPath).BaseName
        $publicFunctionsToRootManifiest += $publicFunctionsToExport
    }
    else {
        [String] $publicFunctionsToExport = ""
    }

    New-Item -Path $folderModule.FullName -Name $itemModuleName -ItemType File -Value $moduleTemplate -Force
    New-ModuleManifest `
        -Path $itemManifiestPath `
        -RootModule $itemModulePath `
        -CompanyName $organization `
        -Copyright $copyright `
        -Author $team `
        -ModuleVersion $powershellModule `
        -CompatiblePSEditions @("Desktop","Core") `
        -FunctionsToExport $publicFunctionsToExport `
        -Description ("Import " + $itemModuleName) `
        -PowerShellVersion $powershellVersion `
        -PassThru

    $moduleToImportPath += (Get-ChildItem -Path $folderModule.FullName -File -Filter "*.psm1" -ErrorAction SilentlyContinue).FullName
}
#endregion

#region Generate the root manifiest
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

#region Import each module
foreach ($module in $moduleToImportPath) {
    Import-Module -Name $module -Force
}
#endregion
