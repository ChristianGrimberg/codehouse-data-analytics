[CmdletBinding()]
[OutputType([System.Boolean])]
param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $RootPath,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $FunctionsPath
)

[System.Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $host.ui.RawUI.ForegroundColor = "DarkMagenta"
    "Creating .NET Solution..." | Out-Host
    [String] $originalPath = (Get-Location).Path
    Set-Location -Path $RootPath

    [String] $solutionName = "{0}.sln" -f (Get-Item ./).BaseName

    if(-not([System.String]::IsNullOrEmpty($solutionName))){
        [String] $solutionPath = "./{0}" -f $solutionName

        if(Test-Path -Path $solutionPath -PathType Leaf) {
            (".NET Solution {0} already exists" -f $solutionName) | Out-Host
        }
        else{
            $scriptToSolution = ('{0} -Command new -Arguments "sln --force"' -f $FunctionsPath)
            $scriptToSolutionBlock = [System.Management.Automation.ScriptBlock]::Create($scriptToSolution)

            if(Invoke-Command -ScriptBlock $scriptToSolutionBlock) {
                (".NET Solution {0} has been created`n" -f $solutionName) | Out-Host
            }
        }

        $returnValue = $true
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors creating .NET Solution: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
    Set-Location -Path $originalPath
}

return $returnValue
