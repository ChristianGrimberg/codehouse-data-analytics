[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $RootPath
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor
$ProgressPreference = 'SilentlyContinue'

try {
    $Host.UI.RawUI.ForegroundColor = "DarkMagenta"
    "Cleaning directories..." | Out-Host

    [String] $corePath = ("{0}/core" -f $RootPath)
    [String[]] $buildDirectories = (Get-ChildItem -Path $RootPath -Directory -Recurse | Where-Object -Property BaseName -in ("bin","obj")).FullName
    [String[]] $libDirectories = (Get-ChildItem -Path $RootPath -Directory -Recurse | Where-Object -Property BaseName -eq "Libs").FullName
    [String[]] $artifactDirectories = (Get-ChildItem -Path $RootPath -Directory -Recurse | Where-Object -Property BaseName -eq "artifacts").FullName
    [String[]] $reportDirectories = (Get-ChildItem -Path $RootPath -Directory -Recurse | Where-Object -Property BaseName -eq "Reports").FullName

    if(Test-Path -Path $corePath -PathType Leaf) {
        Remove-Item -Path $corePath -Force -Confirm:$false -ErrorAction SilentlyContinue
        "Core file has removed`n" | Out-Host
    }

    if($null -ne $buildDirectories) {
        $buildDirectories | Remove-Item -Recurse -Force -Confirm:$false -ErrorAction SilentlyContinue
        "Building directories are clean now" | Out-Host
    }

    if($null -ne $libDirectories) {
        foreach($directory in $libDirectories) {
            $dllFiles = Get-ChildItem -Path $directory -File -Recurse | Where-Object -Property Extension -like "*.dll" -ErrorAction Stop
            $dllFiles | Remove-Item -Force -Confirm:$false -ErrorAction SilentlyContinue
            $dllFiles = Get-ChildItem -Path $directory -File -Recurse | Where-Object -Property Extension -like "*.dll" -ErrorAction Stop
        }

        if(($dllFiles | Measure-Object).Count -eq 0) {
            "Library directories are clean now" | Out-Host
            $returnValue = $true
        }
        else {
            $Host.UI.RawUI.ForegroundColor = "Red"
            "Existing libraries are locked by the system" | Out-Host
        }
    }

    if($null -ne $artifactDirectories) {
        $artifactDirectories | Remove-Item -Recurse -Force -Confirm:$false -ErrorAction SilentlyContinue
        "Artifact directories are clean now" | Out-Host
    }

    if($null -ne $reportDirectories) {
        $reportDirectories | Remove-Item -Recurse -Force -Confirm:$false -ErrorAction SilentlyContinue
        "Report directories are clean now" | Out-Host
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors removing compiled files: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
