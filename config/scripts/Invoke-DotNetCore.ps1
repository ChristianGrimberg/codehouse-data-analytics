[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [System.String]
    $Command,
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [System.String]
    $Arguments,
    [Parameter(Mandatory=$false)]
    [System.Boolean]
    $Privileged = $false
)

$returnValue = $false
$before = (Get-Host).UI.RawUI.ForegroundColor

try {
    $dotnetArgs = @()
    $dotnetArgs = $dotnetArgs + $Command
    $dotnetArgs = $dotnetArgs + ($Arguments -split "\s+")

    $Host.UI.RawUI.ForegroundColor = "DarkGreen"

    if($Privileged -and ([System.Environment]::OSVersion.Platform -ne "Win32NT")) {
        ("{0} [DOTNET CLI]: sudo dotnet {1} {2}" -f (Get-Date).ToString("yyyy/MM/dd HH:mm:ss"), $Command, $Arguments) | Out-Host

        $output = & sudo dotnet $dotnetArgs | Out-String
    }
    else{
        ("{0} [DOTNET CLI]: dotnet {1} {2}" -f (Get-Date).ToString("yyyy/MM/dd HH:mm:ss"), $Command, $Arguments) | Out-Host

        $output = & dotnet $dotnetArgs | Out-String
    }

    if ($LASTEXITCODE -ne 0) {
        $Host.UI.RawUI.ForegroundColor = "Red"
        $output -join "; " | Out-Host
        throw "There was an issue running the specified dotnet command."
    }
    else {
        $Host.UI.RawUI.ForegroundColor = "DarkYellow"
        $output -join "; " | Out-Host
        $returnValue = $true
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors invoking .NET CLI: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue