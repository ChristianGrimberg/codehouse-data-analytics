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
    $FunctionsPath,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $DotNetVersion
)

[System.Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $host.ui.RawUI.ForegroundColor = "DarkGreen"
    "Publishing Class Libraries..." | Out-Host

    [String] $funcionPath = Join-Path -Path $FunctionsPath -ChildPath "Invoke-DotNetCore.ps1"
    $dotnetProjectDirectories = Get-ChildItem -Path $ProjectsPath -Directory | Where-Object { $_.FullName -notlike "*Template*" }

    foreach($projectModule in $dotnetProjectDirectories) {
        [Int] $typeFoldersCount = (Get-ChildItem -Path $projectModule.FullName | Where-Object -Property Name -eq "Types" | Measure-Object).Count

        if($typeFoldersCount -eq 1) {
            $dotnetLibDirectory = Join-Path -Path $projectModule.FullName -ChildPath "Libs"

            $publishArguments = '"{0}" --output "{1}" --framework {2}' -f $projectModule.FullName, $dotnetLibDirectory, $DotNetVersion

            if(& $funcionPath -Command "publish" -Arguments $publishArguments -Privileged $false) {
                ("Class Libraries from {0} has been published`n" -f $projectModule.BaseName) | Out-Host

                $returnValue = $true
            }
        }
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors publishing projects: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
