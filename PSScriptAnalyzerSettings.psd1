# PSScriptAnalyzerSettings.psd1
# Settings for PSScriptAnalyzer invocation.
@{
    #IncludeRules = @{}

    ExcludeRules = @(
        "PSUseSingularNouns"
    )

    Severity = @(
        "Warning",
        "Error",
        "Information"
    )
}
