<#
.SYNOPSIS
    Plantilla de modulo PowerShell que gestiona dependencias, bibliotecas y funciones.
.DESCRIPTION
    Este script configura e importa un modulo de PowerShell automaticamente. Realiza las siguientes operaciones:
    - Instala modulos requeridos definidos en global.json
    - Carga bibliotecas .NET desde el directorio Libs
    - Ejecuta scripts de configuracion del modulo
    - Importa funciones publicas y privadas
    - Exporta funciones publicas para uso externo
.EXAMPLE
    Import-Module -Name ".\NombreModulo.psm1"
    Carga el modulo y todas sus dependencias, bibliotecas y funciones.
#>
[CmdletBinding()]
param ()

# Obtiene configuraciones basicas del modulo y rutas de sistema
[String] $moduleName = (Get-Item -LiteralPath $PSScriptRoot).BaseName
[String] $modulesPath = Split-Path -Path $PSScriptRoot
[String] $rootFolder = Split-Path -Path $modulesPath
[String] $templatePath = Join-Path -Path $modulesPath -ChildPath "Templates"
[String] $requiredModulesScriptPath = Join-Path -Path $templatePath -ChildPath "RequiredModules.ps1"
[String] $globalPath = Join-Path -Path $rootFolder -ChildPath "global.json"
$powershellRequiredModules = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).powershell.dependencies
$existingDependencies = $powershellRequiredModules | Get-Member -MemberType NoteProperty

# Instala modulos requeridos definidos en el archivo de configuracion global.json
foreach ($dependency in $existingDependencies) {
    $dependencyVersion = $powershellRequiredModules.($dependency.Name).version
    $dependencyModules = $powershellRequiredModules.($dependency.Name).modules
    $dependencyName = $dependency.Name

    # Verifica si este modulo tiene dependencias que deben instalarse
    foreach ($requiredModule in $dependencyModules) {
        if($moduleName -eq $requiredModule) {
            & $requiredModulesScriptPath -ModuleName $dependencyName -ModuleVersion $dependencyVersion -Verbose
        }
    }
}

# Carga bibliotecas .NET (archivos DLL) desde el directorio Libs del modulo
if(Test-Path -Path $PSScriptRoot\Libs) {
    try {
        $librariesToImport = @( Get-ChildItem -Path $PSScriptRoot\Libs -File -Filter "*.dll" -ErrorAction SilentlyContinue | Sort-Object Name )

        foreach ($lib in $librariesToImport) {
            Add-Type -Path $lib.FullName
        }
    }
    catch {
        Write-Error -Message "`nDetailed errors on import libraries:`n$_"
    }
}

# Ejecuta scripts de configuracion especificos del modulo
# Solo ejecuta scripts cuyo nombre coincide con el nombre del directorio del modulo
try {
    $scriptsToConfigure = @(Get-ChildItem -Path $PSScriptRoot -File -Filter "*.ps1" -ErrorAction SilentlyContinue)
    foreach ($script in $scriptsToConfigure) {
        if($script.BaseName -eq $script.Directory.Name) {
            & $script.FullName -Verbose
        }
    }
}
catch {
    Write-Error -Message "`nDetailed errors on run scripts modules:`n$_"
}

# Importa funciones publicas y privadas del modulo, luego exporta solo las publicas
if(Test-Path -Path $PSScriptRoot\Public) {
    try {
        $publicFunctionsToImport = @( Get-ChildItem -Path $PSScriptRoot\Public -File -Filter "*.ps1" -ErrorAction SilentlyContinue | Sort-Object Name )

        # Combina funciones privadas si existen con las publicas para importacion interna
        if(Test-Path -Path $PSScriptRoot\Private) {
            $privateFunctionsToImport = @( Get-ChildItem -Path $PSScriptRoot\Private -File -Filter "*.ps1" -ErrorAction SilentlyContinue | Sort-Object Name )
            $scriptsToImport = $privateFunctionsToImport + $publicFunctionsToImport
        }
        else {
            $scriptsToImport = $publicFunctionsToImport
        }

        # Dot-sourcing: ejecuta cada script de funcion en el contexto actual
        foreach ($function in $scriptsToImport) {
            . $function.FullName
        }

        # Exporta solo funciones publicas para que esten disponibles fuera del modulo
        Export-ModuleMember -Function $publicFunctionsToImport.BaseName
    }
    catch {
        Write-Error -Message "`nDetailed errors on import functions:`n$_"
    }
}
