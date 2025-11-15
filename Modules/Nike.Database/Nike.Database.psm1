[CmdletBinding()]
param ()

# Getting settings
[String] $moduleName = (Get-Item -LiteralPath $PSScriptRoot).BaseName
[String] $modulesPath = Split-Path -Path $PSScriptRoot
[String] $rootFolder = Split-Path -Path $modulesPath
[String] $templatePath = Join-Path -Path $modulesPath -ChildPath "Templates"
[String] $requiredModulesScriptPath = Join-Path -Path $templatePath -ChildPath "RequiredModules.ps1"
[String] $globalPath = Join-Path -Path $rootFolder -ChildPath "global.json"
$powershellRequiredModules = (Get-Content -Path $globalPath -Raw -Encoding Ascii | ConvertFrom-Json).powershell.dependencies
$existingDependencies = $powershellRequiredModules | Get-Member -MemberType NoteProperty

# Install required modules
foreach ($dependency in $existingDependencies) {
    $dependencyVersion = $powershellRequiredModules.($dependency.Name).version
    $dependencyModules = $powershellRequiredModules.($dependency.Name).modules
    $dependencyName = $dependency.Name

    foreach ($requiredModule in $dependencyModules) {
        if($moduleName -eq $requiredModule) {
            & $requiredModulesScriptPath -ModuleName $dependencyName -ModuleVersion $dependencyVersion -Verbose
        }
    }
}

# Add libraries
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

# Special Module's configurations
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

# Import functions
if(Test-Path -Path $PSScriptRoot\Public) {
    try {
        $publicFunctionsToImport = @( Get-ChildItem -Path $PSScriptRoot\Public -File -Filter "*.ps1" -ErrorAction SilentlyContinue | Sort-Object Name )

        if(Test-Path -Path $PSScriptRoot\Private) {
            $privateFunctionsToImport = @( Get-ChildItem -Path $PSScriptRoot\Private -File -Filter "*.ps1" -ErrorAction SilentlyContinue | Sort-Object Name )
            $scriptsToImport = $privateFunctionsToImport + $publicFunctionsToImport
        }
        else {
            $scriptsToImport = $publicFunctionsToImport
        }

        foreach ($function in $scriptsToImport) {
            . $function.FullName
        }

        # Export public functions
        Export-ModuleMember -Function $publicFunctionsToImport.BaseName
    }
    catch {
        Write-Error -Message "`nDetailed errors on import functions:`n$_"
    }
}
