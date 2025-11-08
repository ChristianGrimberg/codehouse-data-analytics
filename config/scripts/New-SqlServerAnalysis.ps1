[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ModulesPath
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

try {
    $Host.UI.RawUI.ForegroundColor = "Green"

    $modulesAnalysisPath = Resolve-Path -Path $ModulesPath -Relative
    $sqlFilesToAnalyze = @( Get-ChildItem -Path $modulesAnalysisPath -Recurse | Where-Object { $_.Extension -eq ".sql" -or $_.Extension -eq ".sqlproj" } )

    if($sqlFilesToAnalyze.Count -gt 0) {
        [Int] $sqlFileCounter = 0
        [Int] $sqlProjFileCounter = 0
        [Int] $sqlInformationCounter = 0
        [Int] $sqlWarningCounter = 0
        [Int] $sqlErrorCounter = 0
        [Int] $totalCounter = 0
        $analysisResults = @()

        "Analyzing SQL Server code..." | Out-Host

        foreach ($sqlFile in $sqlFilesToAnalyze) {
            "SQL analysis: {0}" -f $sqlFile.FullName | Out-Host

            if ($sqlFile.Extension -eq ".sql") {
                $sqlFileCounter++

                try {
                    $content = Get-Content -Path $sqlFile.FullName -Raw -ErrorAction SilentlyContinue

                    if ([string]::IsNullOrWhiteSpace($content)) {
                        $analysisResults += [PSCustomObject]@{
                            File = $sqlFile.FullName
                            Issue = "Empty SQL file"
                            Severity = "Warning"
                        }
                        $sqlWarningCounter++
                        $totalCounter++
                    }

                    if ($content.Contains([char]0) -or $content.Length -lt 10) {
                        $analysisResults += [PSCustomObject]@{
                            File = $sqlFile.FullName
                            Issue = "Possible encoding issue or corrupted SQL file"
                            Severity = "Warning"
                        }
                        $sqlWarningCounter++
                        $totalCounter++
                    }

                    if ($content.ToLower().Contains("select") -and -not $content.ToLower().Contains("from")) {
                        $analysisResults += [PSCustomObject]@{
                            File = $sqlFile.FullName
                            Issue = "SELECT without FROM clause detected"
                            Severity = "Information"
                        }
                        $sqlInformationCounter++
                    }
                }
                catch {
                    $analysisResults += [PSCustomObject]@{
                        File = $sqlFile.FullName
                        Issue = "Error reading SQL file: $_"
                        Severity = "Error"
                    }
                    $sqlErrorCounter++
                    $totalCounter++
                }
            }
            elseif ($sqlFile.Extension -eq ".sqlproj") {
                $sqlProjFileCounter++
                # Validate SQL project structure
                if (-not (Test-Path -Path $sqlFile.FullName)) {
                    $analysisResults += [PSCustomObject]@{
                        File = $sqlFile.FullName
                        Issue = "SQL project file not accessible"
                        Severity = "Error"
                    }
                    $sqlErrorCounter++
                    $totalCounter++
                }

                try {
                    [xml]$projectXml = Get-Content -Path $sqlFile.FullName

                    # Check for required SDK
                    if (-not $projectXml.Project.Sdk -or $projectXml.Project.Sdk -notlike "*Microsoft.Build.Sql*") {
                        $analysisResults += [PSCustomObject]@{
                            File = $sqlFile.FullName
                            Issue = "Missing or incorrect Microsoft.Build.Sql SDK reference"
                            Severity = "Information"
                        }
                        $sqlInformationCounter++
                    }

                    # Check for project name
                    if (-not $projectXml.Project.PropertyGroup.Name) {
                        $analysisResults += [PSCustomObject]@{
                            File = $sqlFile.FullName
                            Issue = "Info: Project {0} does not specify a project name" -f $sqlFile.Name
                            Severity = "Error"
                        }
                        $sqlErrorCounter++
                        $totalCounter++
                    }
                }
                catch {
                    $analysisResults += [PSCustomObject]@{
                        File = $sqlFile.FullName
                        Issue = "Invalid XML structure in SQL project file: $_"
                        Severity = "Error"
                    }
                    $sqlErrorCounter++
                    $totalCounter++
                }
            }
        }

        "Found {0} SQL files and {1} SQL project files" -f $sqlFileCounter, $sqlProjFileCounter | Out-Host

        if ($sqlInformationCounter -gt 0) {
            $Host.UI.RawUI.ForegroundColor = "Green"
            ("SQL Analysis found {0} informational messages.`n" -f $sqlInformationCounter) | Out-Host
            $analysisResults | Select-Object File, Issue, Severity | Where-Object Severity -eq "Information" | Sort-Object Severity, File | Format-Table -AutoSize -Wrap | Out-Host
        }

        if ($sqlWarningCounter -gt 0) {
            $Host.UI.RawUI.ForegroundColor = "Yellow"
            ("SQL Analysis found {0} warnings that should be reviewed.`n" -f $sqlWarningCounter) | Out-Host
            $analysisResults | Select-Object File, Issue, Severity | Where-Object Severity -eq "Warning" | Sort-Object Severity, File | Format-Table -AutoSize -Wrap | Out-Host
        }

        if ($sqlErrorCounter -gt 0) {
            $Host.UI.RawUI.ForegroundColor = "Red"
            ("SQL Analysis found {0} critical errors that must be fixed!`n" -f $sqlErrorCounter) | Out-Host
            $analysisResults | Select-Object File, Issue, Severity | Where-Object Severity -eq "Error" | Sort-Object Severity, File | Format-Table -AutoSize -Wrap | Out-Host
            Write-Error -Message "SQL Analysis found critical errors!`n" -Category "InvalidResult" -RecommendedAction "Review and fix the SQL analysis issues`n" -ErrorAction Stop
        }

        if ($totalCounter -gt 0) {
            $Host.UI.RawUI.ForegroundColor = "Red"
            Write-Error -Message "Analysis cannot continue!`n" -Category "InvalidResult" -RecommendedAction "Review the code analysis recommendations`n" -ErrorAction Stop
        }
        else {
            "SQL code analysis completed successfully with no issues found.`n" | Out-Host
            $returnValue = $true
        }
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors analyzing SQL code: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue