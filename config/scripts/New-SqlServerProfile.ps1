[CmdletBinding()]
[OutputType([System.Boolean])]
Param (
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ModulesPath,
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $ServerInstance = "localhost",
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $Port = "1433",
    [String]
    [ValidateNotNullOrEmpty()]
    [Parameter(Mandatory)]
    $User = "sa"
)

[Boolean] $returnValue = $false
$before = $Host.UI.RawUI.ForegroundColor

# Get password from environment variable or use development default
$plainPassword = if ($env:SQL_PASSWORD) { $env:SQL_PASSWORD } else { "P@ssw0rd" }

try {
    $Host.UI.RawUI.ForegroundColor = "DarkBlue"
    "Creating SQL Server publish profiles..." | Out-Host

    $sqlProjectDirectories = Get-ChildItem -Path $ModulesPath -Directory | Where-Object { $_.FullName -notmatch "Template|Imported" }
    [Int] $createdProfilesCount = 0

    foreach ($projectModule in $sqlProjectDirectories) {
        # Check if this directory contains a SQL project
        $sqlProjectFile = Get-ChildItem -Path $projectModule.FullName -Filter "*.sqlproj" | Select-Object -First 1

        if ($null -ne $sqlProjectFile) {
            $publishProfileName = "{0}.publish.xml" -f $projectModule.BaseName
            $publishProfilePath = Join-Path -Path $projectModule.FullName -ChildPath $publishProfileName

            # Extract database name from project name (remove .Database suffix if present)
            $databaseName = $projectModule.BaseName -replace '\.Database$', ''

            # Create connection string
            $connectionString = "Server={0},{1};Database={2};User ID={3};Password={4};Pooling=False;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Authentication=SqlPassword;Application Name=vscode-mssql-GeneralConnection;Application Intent=ReadWrite;Command Timeout=30" -f $ServerInstance, $Port, $databaseName.ToLower(), $User, $plainPassword

            "Creating publish profile for: {0} -> Database: {1}" -f $projectModule.BaseName, $databaseName.ToLower() | Out-Host

            # Create the publish profile XML content
            $publishProfileContent = @"
<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <IncludeCompositeObjects>True</IncludeCompositeObjects>
    <TargetDatabaseName>$($databaseName.ToLower())</TargetDatabaseName>
    <DeployScriptFileName>$($projectModule.BaseName).sql</DeployScriptFileName>
    <TargetConnectionString>$connectionString</TargetConnectionString>
    <ProfileVersionNumber>1</ProfileVersionNumber>
    <BlockOnPossibleDataLoss>True</BlockOnPossibleDataLoss>
    <BackupDatabaseBeforeChanges>True</BackupDatabaseBeforeChanges>
    <AllowIncompatiblePlatform>False</AllowIncompatiblePlatform>
    <CreateNewDatabase>True</CreateNewDatabase>
    <TreatVerificationErrorsAsWarnings>False</TreatVerificationErrorsAsWarnings>
    <DoNotAlterReplicatedObjects>True</DoNotAlterReplicatedObjects>
    <DoNotAlterChangeDataCaptureObjects>True</DoNotAlterChangeDataCaptureObjects>
    <DisableAndReenableDdlTriggers>True</DisableAndReenableDdlTriggers>
    <DeployDatabaseInSingleUserMode>False</DeployDatabaseInSingleUserMode>
    <IgnorePermissions>False</IgnorePermissions>
    <IgnoreRoleMembership>False</IgnoreRoleMembership>
    <IgnoreIndexes>False</IgnoreIndexes>
    <IgnoreIndexPadding>True</IgnoreIndexPadding>
    <IgnoreKeywordCasing>True</IgnoreKeywordCasing>
    <IgnoreComments>False</IgnoreComments>
    <IgnoreAnsiNulls>False</IgnoreAnsiNulls>
    <IgnoreQuotedIdentifiers>False</IgnoreQuotedIdentifiers>
    <IgnoreIdentitySeed>False</IgnoreIdentitySeed>
    <IgnoreIncrement>False</IgnoreIncrement>
    <IgnoreFillFactor>True</IgnoreFillFactor>
    <IgnoreFileSize>True</IgnoreFileSize>
    <IgnoreFilePath>True</IgnoreFilePath>
    <IgnoreFileAndLogFilePath>True</IgnoreFileAndLogFilePath>
    <ExcludeObjectType>Aggregates</ExcludeObjectType>
    <ExcludeObjectType>Assemblies</ExcludeObjectType>
    <ExcludeObjectType>AsymmetricKeys</ExcludeObjectType>
    <ExcludeObjectType>BrokerPriorities</ExcludeObjectType>
    <ExcludeObjectType>Certificates</ExcludeObjectType>
    <ExcludeObjectType>ColumnEncryptionKeys</ExcludeObjectType>
    <ExcludeObjectType>ColumnMasterKeys</ExcludeObjectType>
    <ExcludeObjectType>Contracts</ExcludeObjectType>
    <ExcludeObjectType>DatabaseRoles</ExcludeObjectType>
    <ExcludeObjectType>DatabaseTriggers</ExcludeObjectType>
    <ExcludeObjectType>Defaults</ExcludeObjectType>
    <ExcludeObjectType>ExtendedProperties</ExcludeObjectType>
    <ExcludeObjectType>ExternalDataSources</ExcludeObjectType>
    <ExcludeObjectType>ExternalFileFormats</ExcludeObjectType>
    <ExcludeObjectType>ExternalTables</ExcludeObjectType>
    <ExcludeObjectType>Filegroups</ExcludeObjectType>
    <ExcludeObjectType>FileTables</ExcludeObjectType>
    <ExcludeObjectType>FullTextCatalogs</ExcludeObjectType>
    <ExcludeObjectType>FullTextStoplists</ExcludeObjectType>
    <ExcludeObjectType>MessageTypes</ExcludeObjectType>
    <ExcludeObjectType>PartitionFunctions</ExcludeObjectType>
    <ExcludeObjectType>PartitionSchemes</ExcludeObjectType>
    <ExcludeObjectType>RemoteServiceBindings</ExcludeObjectType>
    <ExcludeObjectType>RoleMembership</ExcludeObjectType>
    <ExcludeObjectType>Rules</ExcludeObjectType>
    <ExcludeObjectType>SearchPropertyLists</ExcludeObjectType>
    <ExcludeObjectType>SecurityPolicies</ExcludeObjectType>
    <ExcludeObjectType>Sequences</ExcludeObjectType>
    <ExcludeObjectType>Services</ExcludeObjectType>
    <ExcludeObjectType>Signatures</ExcludeObjectType>
    <ExcludeObjectType>SymmetricKeys</ExcludeObjectType>
    <ExcludeObjectType>Synonyms</ExcludeObjectType>
    <ExcludeObjectType>Users</ExcludeObjectType>
    <ExcludeObjectType>UserDefinedDataTypes</ExcludeObjectType>
    <ExcludeObjectType>UserDefinedTableTypes</ExcludeObjectType>
    <ExcludeObjectType>ClrUserDefinedTypes</ExcludeObjectType>
    <ExcludeObjectType>UserDefinedAggregates</ExcludeObjectType>
    <ExcludeObjectType>UserDefinedFunctions</ExcludeObjectType>
    <ExcludeObjectType>XmlSchemaCollections</ExcludeObjectType>
    <ExcludeObjectType>ApplicationRoles</ExcludeObjectType>
  </PropertyGroup>
</Project>
"@

            # Write the publish profile
            Set-Content -Path $publishProfilePath -Value $publishProfileContent -Encoding UTF8

            if (Test-Path -Path $publishProfilePath) {
                ("Created publish profile: {0}`n" -f $publishProfilePath) | Out-Host
                $createdProfilesCount++
            }
        }
    }

    if ($createdProfilesCount -gt 0) {
        $Host.UI.RawUI.ForegroundColor = "DarkBlue"
        ("Successfully created {0} SQL Server publish profiles for {1}:{2}`n" -f $createdProfilesCount, $ServerInstance, $Port) | Out-Host
        $returnValue = $true
    }
    else {
        $Host.UI.RawUI.ForegroundColor = "Yellow"
        "No SQL Server projects found to create publish profiles`n" | Out-Host
        $returnValue = $true  # Not an error condition
    }
}
catch {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Error -Message ("Found errors creating SQL publish profiles: {0}" -f $_) -Category "InvalidOperation" -RecommendedAction "Review the captured error" -ErrorAction Stop
}
finally {
    $Host.UI.RawUI.ForegroundColor = $before
}

return $returnValue
