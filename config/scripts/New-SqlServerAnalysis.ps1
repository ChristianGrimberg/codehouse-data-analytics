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
    $sqlFilesToLint = @( Get-ChildItem -Path $modulesAnalysisPath -Recurse | Where-Object { $_.Extension -eq ".sql" } )

    if ($sqlFilesToLint.Count -gt 0) {
        [Int] $totalIssues = 0
        [Int] $criticalIssues = 0
        [Int] $warningIssues = 0
        [Int] $informationalIssues = 0
        $lintResults = @()

        "Starting comprehensive SQL Server analysis..." | Out-Host
        "Found {0} SQL files to analyze`n" -f $sqlFilesToLint.Count | Out-Host

        # Fall back to enhanced basic validation
        foreach ($sqlFile in $sqlFilesToLint) {
            "Analyzing: {0}" -f $sqlFile.Name | Out-Host

            try {
                $content = Get-Content -Path $sqlFile.FullName -Raw -ErrorAction SilentlyContinue

                # Basic validations
                if ([string]::IsNullOrWhiteSpace($content)) {
                    $lintResults += [PSCustomObject]@{
                        File     = $sqlFile.Name
                        Line     = 0
                        Rule     = "EMPTY-FILE"
                        Severity = "Warning"
                        Message  = "Empty SQL file"
                    }
                    $warningIssues++
                    $totalIssues++
                }

                # Check for common SQL anti-patterns and best practices
                $contentLower = $content.ToLower()

                # Check for SELECT *
                if ($contentLower -match "select\s+\*\s+from") {
                    $lintResults += [PSCustomObject]@{
                        File     = $sqlFile.Name
                        Line     = 0
                        Rule     = "SELECT-STAR"
                        Severity = "Information"
                        Message  = "SELECT * detected - consider specifying explicit columns"
                    }
                    $informationalIssues++
                }

                # Check for missing WHERE clause in DELETE/UPDATE
                # Note: This is a basic check and may have false positives with CTEs, JOINs, or subqueries
                if (($contentLower -match "\bdelete\s+from\b" -or $contentLower -match "\bupdate\b.*\bset\b") -and -not ($contentLower -match "\bwhere\b")) {
                    $lintResults += [PSCustomObject]@{
                        File     = $sqlFile.Name
                        Line     = 0
                        Rule     = "MISSING-WHERE"
                        Severity = "Warning"
                        Message  = "DELETE or UPDATE without WHERE clause detected - verify this is intentional (may be false positive with CTEs/JOINs)"
                    }
                    $warningIssues++
                    $totalIssues++
                    #$informationalIssues++
                }

                # Check for SQL injection vulnerabilities (dynamic SQL without sp_executesql)
                if ($contentLower -match "exec\s*\(" -and -not ($contentLower -match "sp_executesql")) {
                    $lintResults += [PSCustomObject]@{
                        File     = $sqlFile.Name
                        Line     = 0
                        Rule     = "DYNAMIC-SQL"
                        Severity = "Warning"
                        Message  = "Dynamic SQL with EXEC detected - consider using sp_executesql for parameterization"
                    }
                    $warningIssues++
                    $totalIssues++
                }

                # Check for NOLOCK hint
                if ($contentLower -match "with\s*\(\s*nolock\s*\)") {
                    $lintResults += [PSCustomObject]@{
                        File     = $sqlFile.Name
                        Line     = 0
                        Rule     = "NOLOCK-HINT"
                        Severity = "Information"
                        Message  = "NOLOCK hint detected - be aware of dirty reads possibility"
                    }
                    $informationalIssues++
                }

                # Check for missing schema qualification
                [String] $objectNamePattern = "[a-z_][a-z0-9_]*"
                if ($contentLower -match "from\s+$objectNamePattern\s" -and -not ($contentLower -match "from\s+$objectNamePattern\.$objectNamePattern")) {
                    # This is a simplified check - might have false positives
                    $lintResults += [PSCustomObject]@{
                        File     = $sqlFile.Name
                        Line     = 0
                        Rule     = "SCHEMA-QUALIFICATION"
                        Severity = "Information"
                        Message  = "Consider using schema-qualified object names (e.g., dbo.TableName)"
                    }
                    $informationalIssues++
                }

                # Check for cursors (performance concern)
                if ($contentLower -match "\bdeclare\s+\w+\s+cursor\b") {
                    $lintResults += [PSCustomObject]@{
                        File     = $sqlFile.Name
                        Line     = 0
                        Rule     = "CURSOR-USAGE"
                        Severity = "Information"
                        Message  = "CURSOR detected - consider set-based alternatives for better performance"
                    }
                    $informationalIssues++
                }

                # Check for missing error handling in procedures (multiline aware)
                if (($contentLower -match "create\s+(procedure|proc)\b")) {
                    # Use -match with (?s) flag for multiline or check if both try and catch exist separately
                    $hasTry = $contentLower -match "\btry\b"
                    $hasCatch = $contentLower -match "\bcatch\b"
                    if (-not ($hasTry -and $hasCatch)) {
                        $lintResults += [PSCustomObject]@{
                            File     = $sqlFile.Name
                            Line     = 0
                            Rule     = "ERROR-HANDLING"
                            Severity = "Information"
                            Message  = "Stored procedure without TRY-CATCH error handling"
                        }
                        $informationalIssues++
                    }
                }

                # Check for BEGIN TRANSACTION without proper COMMIT/ROLLBACK
                if ($contentLower -match "begin\s+tran" -and -not ($contentLower -match "(commit|rollback)\s+tran")) {
                    $lintResults += [PSCustomObject]@{
                        File     = $sqlFile.Name
                        Line     = 0
                        Rule     = "TRANSACTION-MANAGEMENT"
                        Severity = "Warning"
                        Message  = "BEGIN TRANSACTION without corresponding COMMIT/ROLLBACK"
                    }
                    $warningIssues++
                    $totalIssues++
                }
            } catch {
                $lintResults += [PSCustomObject]@{
                    File     = $sqlFile.Name
                    Line     = 0
                    Rule     = "ANALYSIS-ERROR"
                    Severity = "Critical"
                    Message  = "Error analyzing file: $_"
                }
                $criticalIssues++
                $totalIssues++
            }
        }

        "`n==============================" | Out-Host
        "SQL Linting Analysis Complete" | Out-Host
        "==============================" | Out-Host
        "Total files analyzed: {0}" -f $sqlFilesToLint.Count | Out-Host
        "Total issues found: {0}" -f $totalIssues | Out-Host
        "  - Critical: {0}" -f $criticalIssues | Out-Host
        "  - Warnings: {0}" -f $warningIssues | Out-Host
        "  - Informational: {0}" -f $informationalIssues | Out-Host
        "==============================`n" | Out-Host

        # Display results by severity
        if ($criticalIssues -gt 0) {
            $Host.UI.RawUI.ForegroundColor = "Red"
            "CRITICAL ISSUES:" | Out-Host
            $lintResults | Where-Object Severity -eq "Critical" | Format-Table -AutoSize -Wrap | Out-Host
        }

        if ($warningIssues -gt 0) {
            $Host.UI.RawUI.ForegroundColor = "Yellow"
            "WARNINGS:" | Out-Host
            $lintResults | Where-Object Severity -eq "Warning" | Format-Table -AutoSize -Wrap | Out-Host
        }

        if ($informationalIssues -gt 0) {
            $Host.UI.RawUI.ForegroundColor = "Cyan"
            "INFORMATIONAL:" | Out-Host
            $lintResults | Where-Object Severity -eq "Information" | Select-Object -First 20 | Format-Table -AutoSize -Wrap | Out-Host

            if ($informationalIssues -gt 20) {
                "... and {0} more informational messages" -f ($informationalIssues - 20) | Out-Host
            }
        }

        # Determine if linting passed
        if ($criticalIssues -gt 0) {
            $Host.UI.RawUI.ForegroundColor = "Red"
            Write-Error -Message "SQL analysis found {0} critical issues that must be fixed!" -f $criticalIssues -Category "InvalidResult" -RecommendedAction "Review and fix the critical SQL analysis issues" -ErrorAction Stop
        } elseif ($totalIssues -gt 0) {
            $Host.UI.RawUI.ForegroundColor = "Yellow"
            "SQL analysis completed with {0} warnings. Review recommended but not blocking." -f $totalIssues | Out-Host
            $returnValue = $true
        } else {
            $Host.UI.RawUI.ForegroundColor = "Green"
            "SQL analysis completed successfully with no critical issues!" | Out-Host
            $returnValue = $true
        }
    } else {
        $Host.UI.RawUI.ForegroundColor = "Yellow"
        "No SQL files found to analyse" | Out-Host
        $returnValue = $true
    }
} catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors during SQL analysis: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
} finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
