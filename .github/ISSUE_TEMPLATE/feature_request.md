---
name: "Solicitud de nueva funcionalidad"
about: Utilice esta plantilla para solicitar una nueva funcionalidad o característica.
title: 'FEATURE: [Descripción breve de la funcionalidad]'
labels: enhancement
assignees: '@ChristianGrimberg, @Copilot'

---

## Resumen de la Funcionalidad
<!--- Describa brevemente la funcionalidad solicitada en 2-3 oraciones -->

## Problema o Necesidad
<!--- ¿Qué problema o necesidad resolvería esta funcionalidad? -->

### Caso de Uso
<!--- Describa el caso de uso principal -->

**Como** [tipo de usuario]  
**Quiero** [realizar alguna acción]  
**Para que** [obtener algún beneficio]

### Ejemplos de Uso
<!--- Proporcione ejemplos concretos de cómo se usaría esta funcionalidad -->

```powershell
# Ejemplo 1
Get-NuevaFuncion -Parametro1 "valor"

# Ejemplo 2
Invoke-NuevoComando -Opcion A -Detalle "información"
```

## Descripción Detallada
<!--- Describa en detalle cómo debería funcionar la funcionalidad -->

### Comportamiento Esperado
<!--- ¿Qué debería hacer la funcionalidad? -->

### Entradas y Salidas
<!--- Describa las entradas esperadas y las salidas que debería producir -->

**Entradas**:
- 

**Salidas**:
- 

**Efectos secundarios** (si aplica):
- 

## Ámbito de la Funcionalidad
<!--- Marque las áreas del proyecto que afectaría esta funcionalidad -->
- [ ] Nuevas funciones PowerShell (Public/)
- [ ] Nuevas clases .NET (Types/)
- [ ] Nuevas tablas o procedimientos SQL
- [ ] Cambios en API existente
- [ ] Nuevos comandos de build
- [ ] Nuevos workflows CI/CD
- [ ] Actualización de documentación
- [ ] Otros (especificar)

## Requisitos Técnicos
<!--- Marque los requisitos técnicos aplicables -->

### Plataforma
- [ ] Windows (PowerShell 5.1 / .NET Framework 4.8)
- [ ] Linux (PowerShell Core 7.x / .NET 10.x)
- [ ] Multiplataforma

### Componentes
- [ ] Módulos PowerShell
- [ ] Clases y tipos .NET
- [ ] Base de datos SQL Server
- [ ] Integración externa
- [ ] Otros (especificar)

### Dependencias Nuevas
<!--- ¿Requiere nuevas dependencias externas? -->
- [ ] No requiere dependencias nuevas
- [ ] Sí, requiere: ___________

## Prioridad y Justificación

### Prioridad
- [ ] Crítica - Bloqueante para otros desarrollos
- [ ] Alta - Muy solicitada o importante
- [ ] Media - Mejora útil
- [ ] Baja - Nice to have

### Impacto Esperado
<!--- Describa el impacto positivo de implementar esta funcionalidad -->
- 

### Usuarios Beneficiados
<!--- ¿Quiénes se beneficiarían de esta funcionalidad? -->
- 

## Alternativas Consideradas
<!--- ¿Ha considerado otras formas de resolver este problema? -->

## Compatibilidad

### Compatibilidad hacia Atrás
- [ ] No afecta código existente
- [ ] Extiende funcionalidad existente sin romper compatibilidad
- [ ] Requiere cambios en código existente (breaking change)

### Migraciones Requeridas
<!--- Si requiere migración, descríbala aquí -->
- [ ] No requiere migración
- [ ] Requiere migración de datos
- [ ] Requiere actualización de configuración
- [ ] Requiere cambios en código de usuario

## Aceptación y Validación

### Criterios de Aceptación
<!--- Liste los criterios que deben cumplirse para considerar esta funcionalidad como completada -->
- [ ] La funcionalidad hace X
- [ ] La funcionalidad devuelve Y cuando se le pasa Z
- [ ] La funcionalidad maneja error A correctamente
- [ ] La documentación está actualizada
- [ ] Los tests pasan exitosamente

### Casos de Prueba Sugeridos
<!--- Describa casos de prueba que deberían validar esta funcionalidad -->
1. **Test Case 1**: 
   - Input: 
   - Expected Output: 
   
2. **Test Case 2**: 
   - Input: 
   - Expected Output: 

## Plan de Implementación Sugerido
<!--- Si tiene ideas sobre cómo implementar esto, descríbalas aquí -->

### Fases de Desarrollo
1. 
2. 
3. 

### Agentes de IA Sugeridos
<!--- Indique qué agentes deberían trabajar en esta funcionalidad -->
- [ ] powershell_expert - Para desarrollo de cmdlets/funciones
- [ ] dotnet_csharp_developer - Para clases y tipos .NET
- [ ] sql_server_specialist - Para cambios de base de datos
- [ ] ci_cd_engineer - Para automatización
- [ ] documenter - Para documentación
- [ ] code_reviewer - Para revisión de calidad
- [ ] Otros (especificar)

### Estimación de Esfuerzo
- [ ] Pequeño (< 1 día)
- [ ] Mediano (1-3 días)
- [ ] Grande (3-5 días)
- [ ] Muy Grande (> 5 días)

## Referencias y Recursos
<!--- Agregue links, documentación, ejemplos de otros proyectos, etc. -->
- 
- 

## Mockups o Diagramas
<!--- Si tiene mockups, diagramas de flujo, o ejemplos visuales, agréguelos aquí -->

## Contexto Adicional
<!--- Agregue cualquier otro contexto sobre la solicitud de funcionalidad aquí -->

---

**Nota**: Esta solicitud será evaluada y priorizada según la orquestación de agentes definida en `.agent/`. Se considerarán los principios de Spanish Only, Centralized Docs, y Security First durante el desarrollo.
