[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $RootPath,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $Config
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $Host.UI.RawUI.ForegroundColor = "Green"

    $rootAnalysisPath = Resolve-Path -Path $RootPath -Relative
    $scriptsToAnalyze = @( Get-ChildItem -Path $rootAnalysisPath -Recurse | Where-Object -Property FullName -like "*.ps1" )

    if($scriptsToAnalyze.Count -gt 0) {
        [Int] $scriptSeverityErrorCounter = 0
        [Int] $scriptSeverityWarningCounter = 0
        [Int] $scriptSeverityInformationCounter = 0
        [Int] $totalCounter = 0
        $loadedResults = @()

        "Analyzing the code with PSScriptAnalyzer..." | Out-Host

        foreach ($script in $scriptsToAnalyze) {
            $loadedResults += Invoke-ScriptAnalyzer -Path $script.FullName -Settings $Config
            "Script analysis: {0}" -f $script.FullName | Out-Host
        }

        $scriptSeverityErrorCounter = ($loadedResults | Where-Object "Severity" -eq "Error").Count
        $scriptSeverityWarningCounter = ($loadedResults | Where-Object -Property "Severity" -eq "Warning").Count
        $scriptSeverityInformationCounter = ($loadedResults | Where-Object -Property "Severity" -eq "Information").Count

        if($scriptSeverityErrorCounter -gt 0) {
            $totalCounter += $scriptSeverityErrorCounter

            $Host.UI.RawUI.ForegroundColor = "Red"
            ("Found {0} severities of Error's type in code analysis`n" -f $scriptSeverityErrorCounter) | Out-Host

            ( $loadedResults | Where-Object -Property "Severity" -eq "Error" | Select-Object "ScriptName", "Line", "RuleName", "Message" | Sort-Object -Property ScriptName, Line | Format-Table -AutoSize ) | Out-Host
        }

        if($scriptSeverityWarningCounter -gt 0) {
            $totalCounter += $scriptSeverityWarningCounter

            $Host.UI.RawUI.ForegroundColor = "Yellow"
            ("Found {0} severities of Warning's type in code analysis`n" -f $scriptSeverityWarningCounter) | Out-Host

            ( $loadedResults | Where-Object -Property "Severity" -eq "Warning" | Select-Object "ScriptName", "Line", "RuleName", "Message" | Sort-Object -Property ScriptName, Line | Format-Table -AutoSize ) | Out-Host
        }

        if($scriptSeverityInformationCounter -gt 0) {
            $totalCounter += $scriptSeverityInformationCounter

            $Host.UI.RawUI.ForegroundColor = "White"
            ("Found {0} severities of Information's type in code analysis`n" -f $scriptSeverityInformationCounter) | Out-Host

            ( $loadedResults | Where-Object -Property "Severity" -eq "Information" | Select-Object "ScriptName", "Line", "RuleName", "Message" | Sort-Object -Property ScriptName, Line | Format-Table -AutoSize ) | Out-Host
        }

        if($totalCounter -gt 0) {
            Write-Error -Message "Analysis cannot continue!`n" -Category "InvalidResult" -RecommendedAction "Review the code analysis recommendations`n" -ErrorAction Stop
        }
        else {
            "PowerShell code analysis completed successfully with no issues found.`n" | Out-Host
            $returnValue = $true
        }
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors analyzing scripts: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
