# Regla: Security First (Seguridad Primero)

## Declaración de la Regla

**Todas las modificaciones de código DEBEN pasar validaciones de seguridad antes de ser integradas. La seguridad es una prioridad absoluta y no negociable.**

## Principios de Seguridad

### 1. Prevención de Vulnerabilidades Comunes

Todos los agentes deben prevenir activamente:

- ❌ **SQL Injection**: SQL dinámico sin parametrización
- ❌ **Secrets Exposure**: Credenciales en código fuente
- ❌ **Path Traversal**: Rutas de archivo sin validación
- ❌ **Command Injection**: Comandos shell sin sanitización
- ❌ **Information Disclosure**: Logs con información sensible

### 2. Análisis de Seguridad Obligatorio

Antes de cada merge:

- ✅ **PSScriptAnalyzer**: Análisis de código PowerShell
- ✅ **.NET Analyzers**: Análisis de código C#
- ✅ **SqlLint**: Validación de scripts SQL
- ✅ **CodeQL** (si está disponible): Análisis de seguridad automatizado

### 3. Validación en Capas

```
Desarrollo Local
    ↓
Análisis Pre-Commit
    ↓
CI/CD Validation
    ↓
Code Review
    ↓
Merge a Main
```

## Vulnerabilidades Críticas a Prevenir

### 1. SQL Injection

#### ❌ VULNERABLE

```sql
-- SQL dinámico sin parametrización
DECLARE @Query NVARCHAR(MAX)
SET @Query = 'SELECT * FROM Employee WHERE Id = ' + @EmployeeId
EXEC(@Query)
```

```csharp
// String concatenation en queries
string query = "SELECT * FROM Employee WHERE Id = " + employeeId;
SqlCommand cmd = new SqlCommand(query, connection);
```

```powershell
# SQL dinámico vulnerable
$query = "SELECT * FROM Employee WHERE Id = $EmployeeId"
Invoke-Sqlcmd -Query $query
```

#### ✅ SEGURO

```sql
-- SQL parametrizado con sp_executesql
DECLARE @Query NVARCHAR(MAX)
SET @Query = N'SELECT * FROM [dbo].[Employee] WHERE [Id] = @Id'
EXEC sp_executesql @Query, N'@Id INT', @Id = @EmployeeId
```

```csharp
// Queries parametrizados
string query = "SELECT * FROM [dbo].[Employee] WHERE [Id] = @Id";
SqlCommand cmd = new SqlCommand(query, connection);
cmd.Parameters.AddWithValue("@Id", employeeId);
```

```powershell
# Consulta parametrizada
$query = "SELECT * FROM [dbo].[Employee] WHERE [Id] = @Id"
Invoke-Sqlcmd -Query $query -Variable "Id=$EmployeeId"
```

### 2. Secrets Exposure

#### ❌ VULNERABLE

```powershell
# Hardcoded credentials
$password = "P@ssw0rd123"
$connectionString = "Server=localhost;User=sa;Password=P@ssw0rd123"
```

```csharp
// API keys en código
const string apiKey = "sk-1234567890abcdef";
```

```json
// Secrets en archivos de configuración versionados
{
  "Database": {
    "Password": "MySecretPassword"
  }
}
```

#### ✅ SEGURO

```powershell
# Usar variables de entorno
$password = $env:SQL_PASSWORD
$apiKey = $env:API_KEY

# Usar credenciales seguras
$credential = Get-Credential
```

```csharp
// Usar configuración externa
var password = Environment.GetEnvironmentVariable("SQL_PASSWORD");
var apiKey = configuration["ApiKey"];
```

```json
// .gitignore: secrets.json
// Usar user secrets o Azure Key Vault
{
  "Database": {
    "PasswordKey": "SQL_PASSWORD"  // Referencia a variable de entorno
  }
}
```

### 3. Path Traversal

#### ❌ VULNERABLE

```powershell
# Path sin validación
$filePath = Join-Path $basePath $userInput
Get-Content $filePath
```

```csharp
// Path manipulation sin validar
string path = Path.Combine(baseDirectory, userInput);
File.ReadAllText(path);
```

#### ✅ SEGURO

```powershell
# Validar y normalizar paths
$filePath = Join-Path $basePath $userInput
$normalizedPath = [System.IO.Path]::GetFullPath($filePath)

# Verificar que está dentro del directorio permitido
if (-not $normalizedPath.StartsWith($basePath)) {
    throw "Path no permitido: $normalizedPath"
}

Get-Content $normalizedPath
```

```csharp
// Validar paths
string path = Path.Combine(baseDirectory, userInput);
string fullPath = Path.GetFullPath(path);

if (!fullPath.StartsWith(baseDirectory)) {
    throw new SecurityException("Invalid path");
}

File.ReadAllText(fullPath);
```

### 4. Command Injection

#### ❌ VULNERABLE

```powershell
# Ejecutar comandos con input no sanitizado
$output = Invoke-Expression $userInput
```

```csharp
// Process.Start con argumentos no validados
Process.Start("cmd.exe", "/c " + userInput);
```

#### ✅ SEGURO

```powershell
# Validar input antes de ejecutar
$allowedCommands = @('Get-Process', 'Get-Service')
if ($userInput -in $allowedCommands) {
    & $userInput
} else {
    throw "Comando no permitido"
}
```

```csharp
// Usar arrays de argumentos
var startInfo = new ProcessStartInfo {
    FileName = "program.exe",
    Arguments = string.Join(" ", validatedArgs)
};
Process.Start(startInfo);
```

### 5. Information Disclosure

#### ❌ VULNERABLE

```powershell
# Logs con información sensible
Write-Verbose "Conectando con password: $password"
Write-Host "API Key: $apiKey"
```

```csharp
// Exception con stack trace completo al usuario
catch (Exception ex) {
    return ex.ToString();  // Expone detalles internos
}
```

#### ✅ SEGURO

```powershell
# Logs sin información sensible
Write-Verbose "Conectando a base de datos..."
Write-Host "API Key configurado correctamente"

# Redactar información sensible
$redactedPassword = "***REDACTED***"
Write-Verbose "Password: $redactedPassword"
```

```csharp
// Exception sin detalles internos
catch (Exception ex) {
    logger.LogError(ex, "Error al procesar solicitud");
    return "Error al procesar solicitud. Contacte al administrador.";
}
```

## Validaciones de Seguridad Automatizadas

### PSScriptAnalyzer

```powershell
# Ejecutar análisis de seguridad
Invoke-ScriptAnalyzer -Path . -Settings PSScriptAnalyzerSettings.psd1 -Recurse

# Reglas de seguridad específicas
Invoke-ScriptAnalyzer -Path . -IncludeRule @(
    'PSAvoidUsingPlainTextForPassword',
    'PSAvoidUsingConvertToSecureStringWithPlainText',
    'PSUsePSCredentialType'
)
```

### .NET Security Analyzers

```xml
<!-- En .csproj -->
<PropertyGroup>
  <EnableNETAnalyzers>true</EnableNETAnalyzers>
  <AnalysisLevel>latest-All</AnalysisLevel>
  <TreatWarningsAsErrors>true</TreatWarningsAsErrors>
</PropertyGroup>

<ItemGroup>
  <!-- Security analyzers -->
  <PackageReference Include="Microsoft.CodeAnalysis.NetAnalyzers" Version="8.0.0" />
</ItemGroup>
```

### SqlLint - Validaciones de Seguridad SQL

```powershell
# Ejecutar SqlLint
./config/make.ps1 -Task SqlLint

# Detecta:
# - SQL dinámico sin parametrización
# - DELETE/UPDATE sin WHERE
# - SELECT * (anti-patrón de seguridad)
```

## Gestión de Secretos

### Variables de Entorno

```powershell
# .env (NUNCA versionar este archivo)
SQL_PASSWORD=MySecretPassword
API_KEY=sk-1234567890abcdef

# Cargar en sesión
Get-Content .env | ForEach-Object {
    $key, $value = $_.Split('=')
    [Environment]::SetEnvironmentVariable($key, $value)
}
```

### GitHub Secrets

```yaml
# En workflow de GitHub Actions
- name: Deploy
  env:
    SQL_PASSWORD: ${{ secrets.SQL_PASSWORD }}
    API_KEY: ${{ secrets.API_KEY }}
  run: |
    ./deploy.ps1
```

### .gitignore

```gitignore
# Archivos con secretos
.env
secrets.json
*.key
*.pem
*.pfx

# Archivos de configuración local
*local.json
*development.json
```

## Checklist de Seguridad

### Pre-Commit

- [ ] No hay credenciales hardcoded en código
- [ ] No hay API keys o tokens en archivos
- [ ] SQL dinámico está parametrizado
- [ ] Paths de archivo están validados
- [ ] Input de usuario está sanitizado
- [ ] Logs no exponen información sensible
- [ ] PSScriptAnalyzer pasa sin errores de seguridad
- [ ] .NET Analyzers pasa sin warnings de seguridad
- [ ] SqlLint no reporta vulnerabilidades

### Pre-Merge

- [ ] Code review completo con enfoque en seguridad
- [ ] CI/CD pasa todas las validaciones
- [ ] No hay secretos en archivos nuevos
- [ ] Cambios de seguridad documentados
- [ ] Tests de seguridad ejecutados (si aplica)

## Proceso de Respuesta a Vulnerabilidades

### 1. Detección

- Análisis automatizado detecta vulnerabilidad
- Reporte manual de contribuidor
- Alerta de GitHub Security

### 2. Evaluación

- Clasificar severidad (Critical/High/Medium/Low)
- Determinar impacto y alcance
- Asignar responsable

### 3. Remediación

```bash
# Hotfix inmediato si es crítico
git checkout -b hotfix/security-vulnerability
# Hacer fix
git commit -m "fix(security): parche para CVE-XXXX"
git push

# PR urgente y merge
# Tag de versión PATCH
git tag -a v1.0.9.1 -m "Security patch: CVE-XXXX"
```

### 4. Comunicación

- Notificar a usuarios afectados
- Publicar security advisory en GitHub
- Actualizar CHANGELOG con fix de seguridad

## Mejores Prácticas

### 1. Principio de Mínimo Privilegio

```powershell
# ❌ Ejecutar con privilegios innecesarios
Start-Process powershell.exe -Verb RunAs

# ✅ Ejecutar con mínimos privilegios necesarios
Start-Process powershell.exe -NoNewWindow
```

### 2. Validar Todo Input

```powershell
function Process-UserInput {
    param(
        [ValidatePattern('^[a-zA-Z0-9]+$')]
        [string]$Input
    )
    
    # Input ya validado por parámetro
    Write-Host "Procesando: $Input"
}
```

### 3. Fail Secure (Fallar Seguro)

```powershell
try {
    # Operación crítica
    Connect-Database -Credential $cred
}
catch {
    # En caso de error, no exponer detalles
    Write-Error "Error al conectar. Contacte al administrador."
    # Log detallado solo para admins
    Write-EventLog -LogName Application -Source "App" -EntryType Error -Message $_.Exception.Message
}
```

### 4. Defense in Depth (Defensa en Profundidad)

```
┌─────────────────────────────────────┐
│  Input Validation                   │  ← Primera línea de defensa
├─────────────────────────────────────┤
│  Parameterized Queries              │  ← Prevención de SQL Injection
├─────────────────────────────────────┤
│  Least Privilege                    │  ← Minimizar permisos
├─────────────────────────────────────┤
│  Encryption in Transit/Rest         │  ← Proteger datos
├─────────────────────────────────────┤
│  Logging & Monitoring               │  ← Detectar anomalías
└─────────────────────────────────────┘
```

## Responsabilidades

### Todos los Agentes

- Seguir prácticas de seguridad en su dominio
- Reportar vulnerabilidades detectadas
- Participar en code review con enfoque en seguridad

### Agente Específico: code_reviewer

- Validar seguridad en todos los PRs
- Rechazar código con vulnerabilidades
- Educar sobre mejores prácticas

### Coordinación: ci_cd_engineer

- Configurar análisis de seguridad en CI/CD
- Asegurar que checks de seguridad pasen
- Bloquear merge si falla validación

## Referencias

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [CWE - Common Weakness Enumeration](https://cwe.mitre.org/)
- [Microsoft Security Development Lifecycle](https://www.microsoft.com/securityengineering/sdl)
- [PowerShell Security Best Practices](https://docs.microsoft.com/powershell/scripting/learn/security/powershell-security-best-practices)

---

**Versión**: 1.0  
**Última actualización**: 2026-01-21  
**Estado**: Obligatorio  
**Enforcement**: Crítico
