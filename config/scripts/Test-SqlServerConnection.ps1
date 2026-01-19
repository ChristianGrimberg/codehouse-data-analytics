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
    $Host.UI.RawUI.ForegroundColor = "DarkBlue"
    "Testing SQL Server connections from publish profiles..." | Out-Host

    # Ensure SqlServer module is available
    if (-not (Get-Module -ListAvailable -Name SqlServer)) {
        $Host.UI.RawUI.ForegroundColor = "Yellow"
        "SqlServer module not found. Attempting to install..." | Out-Host
        try {
            Install-Module -Name SqlServer -Force -AllowClobber -Scope CurrentUser -ErrorAction Stop
            $Host.UI.RawUI.ForegroundColor = "DarkBlue"
            "SqlServer module installed successfully" | Out-Host
        }
        catch {
            $Host.UI.RawUI.ForegroundColor = "Red"
            "Failed to install SqlServer module: {0}" -f $_.Exception.Message | Out-Host
            "SqlServer module is required for connection testing." | Out-Host
            "On GitHub Actions runners:" | Out-Host
            "  - Windows: SqlServer module is pre-installed" | Out-Host
            "  - Linux: Module will be installed automatically if PSGallery is available" | Out-Host
            throw "SqlServer module is not available and could not be installed"
        }
    }

    Import-Module SqlServer -ErrorAction Stop

    $sqlProjectDirectories = Get-ChildItem -Path $ModulesPath -Directory | Where-Object { $_.FullName -notmatch "Template|Imported" }
    [Int] $testedProfilesCount = 0
    [Int] $successfulConnectionsCount = 0
    [Array] $failedConnections = @()

    foreach ($projectModule in $sqlProjectDirectories) {
        # Check if this directory contains a SQL project publish profile
        $publishProfileName = "{0}.publish.xml" -f $projectModule.BaseName
        $publishProfilePath = Join-Path -Path $projectModule.FullName -ChildPath $publishProfileName

        if (Test-Path -Path $publishProfilePath) {
            $testedProfilesCount++
            "Testing connection for profile: {0}" -f $publishProfileName | Out-Host

            try {
                # Parse the XML publish profile
                [xml]$profileXml = Get-Content -Path $publishProfilePath -Raw
                $connectionString = $profileXml.Project.PropertyGroup.TargetConnectionString
                $databaseName = $profileXml.Project.PropertyGroup.TargetDatabaseName

                if ([string]::IsNullOrWhiteSpace($connectionString)) {
                    throw "Connection string is empty in profile: $publishProfileName"
                }

                # Parse connection string to extract server, user, and password
                # Pattern matches: key (everything before first '=') and value (everything after first '=')
                # This correctly handles '=' characters in values (e.g., passwords)
                $connectionParams = @{}
                $connectionString -split ';' | ForEach-Object {
                    if ($_ -match '^([^=]+)=(.*)$') {
                        $connectionParams[$matches[1].Trim()] = $matches[2].Trim()
                    }
                }

                $serverInstance = if ($connectionParams['Server']) { $connectionParams['Server'] } else { $connectionParams['Data Source'] }
                $userId = $connectionParams['User ID']
                $password = $connectionParams['Password']
                $integratedSecurity = $connectionParams['Integrated Security'] -eq 'True'

                if ([string]::IsNullOrWhiteSpace($serverInstance)) {
                    throw "Server instance or Data Source not found in connection string"
                }

                # Test connection with simple query
                "  Connecting to: {0} | Database: {1}" -f $serverInstance, $databaseName | Out-Host

                # Build connection parameters
                $sqlParams = @{
                    ServerInstance = $serverInstance
                    Query = "SELECT GETDATE() AS CurrentDateTime, @@VERSION AS ServerVersion"
                    TrustServerCertificate = $true
                    ErrorAction = 'Stop'
                }

                # Add authentication parameters (avoid logging sensitive credentials)
                if ($integratedSecurity) {
                    # No explicit credentials needed for Integrated Security
                }
                elseif (-not [string]::IsNullOrWhiteSpace($userId) -and -not [string]::IsNullOrWhiteSpace($password)) {
                    # Note: Invoke-Sqlcmd requires plain text password, but we avoid logging it
                    $sqlParams['Username'] = $userId
                    $sqlParams['Password'] = $password
                }

                # Execute test query
                $result = Invoke-Sqlcmd @sqlParams

                if ($result) {
                    $Host.UI.RawUI.ForegroundColor = "Green"
                    "  ✓ Connection successful for {0}" -f $databaseName | Out-Host
                    "    Server Time: {0}" -f $result.CurrentDateTime | Out-Host
                    $Host.UI.RawUI.ForegroundColor = "DarkBlue"
                    $successfulConnectionsCount++
                }
            }
            catch {
                $Host.UI.RawUI.ForegroundColor = "Red"
                "  ✗ Connection failed for {0}" -f $projectModule.BaseName | Out-Host
                "    Error: {0}" -f $_.Exception.Message | Out-Host
                $Host.UI.RawUI.ForegroundColor = "DarkBlue"
                $failedConnections += @{
                    Profile = $publishProfileName
                    Database = $databaseName
                    Error = $_.Exception.Message
                }

                exit 1
            }
        }
    }

    # Summary
    $Host.UI.RawUI.ForegroundColor = "DarkBlue"
    "`nConnection Test Summary:" | Out-Host
    "  Total profiles tested: {0}" -f $testedProfilesCount | Out-Host
    "  Successful connections: {0}" -f $successfulConnectionsCount | Out-Host
    "  Failed connections: {0}" -f $failedConnections.Count | Out-Host

    if ($testedProfilesCount -eq 0) {
        $Host.UI.RawUI.ForegroundColor = "Yellow"
        "`nWarning: No SQL Server publish profiles found to test" | Out-Host
        $returnValue = $true  # Not an error condition if no profiles exist
    }
    elseif ($failedConnections.Count -gt 0) {
        $Host.UI.RawUI.ForegroundColor = "Red"
        "`nFailed Connections Details:" | Out-Host
        foreach ($failure in $failedConnections) {
            "  Profile: {0}" -f $failure.Profile | Out-Host
            "  Database: {0}" -f $failure.Database | Out-Host
            "  Error: {0}`n" -f $failure.Error | Out-Host
        }
        throw "One or more SQL Server connection tests failed. Please verify server availability, credentials, and network connectivity."
    }
    else {
        $Host.UI.RawUI.ForegroundColor = "Green"
        "`n✓ All SQL Server connection tests passed successfully!`n" | Out-Host
        $returnValue = $true
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("SQL Server connection test failed: {0}" -f $_.Exception.Message) -Category "ConnectionError" -RecommendedAction "Verify SQL Server is running, credentials are correct, and network connectivity is available" -ErrorAction Stop

    exit 1
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
