# Regla: Spanish Only (Solo Español)

## Declaración de la Regla

**Toda la documentación, comentarios de código, mensajes de commit, y comunicación del proyecto DEBE estar en idioma español.**

## Alcance

Esta regla aplica a:

- ✅ **README.md**: Toda la documentación principal
- ✅ **Comentarios de Código**: Comentarios en PowerShell, C#, SQL
- ✅ **Mensajes de Commit**: Descripciones de commits en Git
- ✅ **Issues y Pull Requests**: Títulos y descripciones
- ✅ **Comentarios en Code Review**: Feedback en revisiones
- ✅ **Documentación en `.agent/`**: Todos los archivos de agentes
- ✅ **CHANGELOG.md**: Historial de cambios
- ✅ **Release Notes**: Notas de versiones

## Excepciones

Esta regla NO aplica a:

- ❌ **Código fuente**: Nombres de variables, funciones, clases (usar inglés técnico)
- ❌ **Keywords del lenguaje**: `function`, `class`, `SELECT`, etc.
- ❌ **Nombres de archivos**: `.ps1`, `.cs`, `.sql` (usar convención del lenguaje)
- ❌ **URLs y referencias externas**: Links a documentación en inglés
- ❌ **Dependencias externas**: Nombres de paquetes NuGet, módulos PowerShell

## Justificación

1. **Consistencia**: Todo el equipo y contribuidores hablan español
2. **Claridad**: Evita ambigüedad en comunicación técnica
3. **Accesibilidad**: Facilita colaboración del equipo local
4. **Profesionalismo**: Mantiene estándares de comunicación corporativa

## Ejemplos

### ✅ Correcto

#### README.md
```markdown
## Descripción General

Este proyecto implementa un sistema de ...

### Características

- Integración con ...
- Procesamiento de datos ...
- Sincronización ...
```

#### Comentarios de Código PowerShell
```powershell
function Get-NombreFuncion {
    <#
    .SYNOPSIS
        Obtiene datos de ...
    
    .DESCRIPTION
        Esta función recupera y procesa datos de ...
    #>
    
    # Validar parámetros de entrada
    if ($null -eq $StartDate) {
        throw "La fecha de inicio es obligatoria"
    }
    
    # Procesar registros de fichadas
    Write-Verbose "Procesando registros desde $StartDate"
}
```

#### Comentarios de Código C#
```csharp
/// <summary>
/// Representa un registro de ...
/// </summary>
public class TimesheetRecord
{
    /// <summary>
    /// ID único del registro
    /// </summary>
    public int Id { get; set; }
    
    /// <summary>
    /// Timestamp del registro (marca de tiempo)
    /// </summary>
    public DateTime Timestamp { get; set; }
}
```

#### Comentarios SQL
```sql
-- Procedimiento para ....
-- Autor: Christian Grimberg
-- Fecha: Enero de 2026

CREATE PROCEDURE [dbo].[usp_nombre_procedimiento]
AS
BEGIN
    -- Validar parámetros de entrada
    IF @StartDate IS NULL
        SET @StartDate = DATEADD(DAY, -7, GETDATE());
    
    -- Insertar registros en tabla de staging
    INSERT INTO [dbo].[NombreTabla] (...)
    SELECT ...
END;
```

#### Mensajes de Commit
```bash
git commit -m ":+1: (sql) se agrega procedimiento de ..."
git commit -m ":wrench: (powershell) se corrige validación de ..."
git commit -m ":memo: (readme) actualizar documentación de ..."
```

#### Issues
```markdown
**Título**: Error al procesar ...

**Descripción**: 
Al ejecutar el procedimiento ... se produce un error de ...

**Pasos para reproducir**:
1. Ejecutar procedimiento con ...
2. Esperar ... segundos
3. Ver error en el log de ...

**Comportamiento esperado**:
El procedimiento debería completarse exitosamente con ...
```

### ❌ Incorrecto

#### README.md (Mezclado inglés/español)
```markdown
## Overview

This project implements a ...

### Features

- Integration with ...
- Procesamiento de datos ... (mezclado)
```

**Corrección**: Todo en español

#### Comentarios de Código (Inglés)
```powershell
# Validate input parameters
if ($null -eq $StartDate) {
    throw "Start date is required"
}
```

**Corrección**: Comentarios en español

#### Mensajes de Commit (Inglés)
```bash
git commit -m ":+1: (sql) add ... procedure"
```

**Corrección**: `:wrench: (sql) agregar procedimiento de ...`

## Términos Técnicos Aceptados

Algunos términos técnicos pueden mantenerse en inglés cuando son parte del vocabulario técnico estándar:

- **Workflow**: Flujo de trabajo (preferir español pero workflow es aceptado)
- **Build**: Compilación (preferir español)
- **Deployment**: Despliegue (preferir español)
- **Pull Request**: Solicitud de extracción (PR es aceptado)
- **Commit**: Confirmación (commit es aceptado)
- **Merge**: Fusión (merge es aceptado)
- **Branch**: Rama (preferir español)
- **Tag**: Etiqueta (preferir español)

**Regla general**: Cuando existe término en español, usarlo. Si el término en inglés es universalmente usado en contexto técnico, es aceptable.

## Glosario de Traducción

| Inglés | Español (Preferido) |
|--------|---------------------|
| Build | Compilación |
| Deploy | Desplegar/Despliegue |
| Workflow | Flujo de trabajo |
| Pipeline | Tubería/Secuencia |
| Branch | Rama |
| Tag | Etiqueta |
| Release | Versión/Lanzamiento |
| Issue | Incidencia/Problema |
| Bug | Error/Fallo |
| Feature | Funcionalidad/Característica |
| Fix | Corrección |
| Test | Prueba |
| Troubleshooting | Solución de problemas |
| Checklist | Lista de verificación |
| Rollback | Reversión |

## Validación

### Checklist Pre-Commit

- [ ] README.md está completamente en español
- [ ] Comentarios de código en español
- [ ] Mensajes de commit en español
- [ ] Documentación nueva en español
- [ ] Issues/PRs en español

### Herramientas de Validación

```powershell
# Script simple de validación (ejemplo)
function Test-SpanishOnly {
    # Revisar README.md para términos comunes en inglés
    $content = Get-Content README.md -Raw
    
    $englishTerms = @(
        'This project',
        'Overview',
        'Getting Started',
        'Installation',
        'Usage'
    )
    
    foreach ($term in $englishTerms) {
        if ($content -match $term) {
            Write-Warning "Término en inglés detectado: $term"
        }
    }
}
```

## Consecuencias de Incumplimiento

1. **Pull Requests**: Comentario solicitando corrección a español
2. **Code Review**: Feedback requiriendo traducción
3. **Documentación**: Rechazo hasta que esté en español
4. **Commits**: Revertir si mensaje está en inglés (excepcional)

## Responsable de Enforcement

- **Agente**: documenter
- **Apoyo**: code_reviewer
- **Verificación final**: community_manager

## Referencias

- Real Academia Española: https://www.rae.es/
- Diccionario de Términos Técnicos: https://www.wordreference.com/es/
- Microsoft Language Portal: https://www.microsoft.com/language (para terminología técnica)

---

**Versión**: 1.0  
**Última actualización**: 2026-01-21  
**Estado**: Obligatorio  
**Enforcement**: Estricto
