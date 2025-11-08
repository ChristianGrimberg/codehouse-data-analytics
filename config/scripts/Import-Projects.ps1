[CmdletBinding()]
[OutputType([System.Boolean])]
param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ProjectsPath,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $FunctionsPath
)

[System.Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $host.ui.RawUI.ForegroundColor = "DarkGreen"
    "Adding .NET Projects to solution..." | Out-Host

    if($ProjectsPath.Contains("Modules")) {
        [String] $rootPath = (Split-Path -Parent $ProjectsPath).ToString()
        $dotnetProjectDirectories = Get-ChildItem -Path $ProjectsPath -Directory | Where-Object -Property FullName -notlike "*Template*"

        foreach ($directoryProject in $dotnetProjectDirectories) {
            if ($null -ne $directoryProject.FullName -and $directoryProject.FullName.Contains('Modules')) {
                [String] $addProjectScriptToRun = ('{0} -Command sln -Arguments "{1} add {2}"' -f $FunctionsPath, $rootPath, $directoryProject.FullName)
                $scriptAddProjectBlock = [System.Management.Automation.ScriptBlock]::Create($addProjectScriptToRun)

                if(Invoke-Command -ScriptBlock $scriptAddProjectBlock) {
                    "Project {0} included successfully`n" -f $directoryProject.BaseName | Out-Host
                }
            }
        }

        $returnValue = $true
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors adding projects to solution: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
