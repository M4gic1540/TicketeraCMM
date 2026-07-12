# Casos de Uso del Sistema

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform |
| Documento | Casos de Uso |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

El presente documento describe los principales casos de uso de Agile Service Desk Platform (ASDP).

Los casos de uso representan las interacciones entre los actores del sistema y las funcionalidades disponibles, permitiendo comprender el comportamiento esperado de la plataforma desde una perspectiva funcional.

---

# 2. Actores del Sistema

---

# ACT-001 Usuario Solicitante

## Descripción

Usuario que requiere asistencia tecnológica y genera solicitudes dentro de la plataforma.

## Responsabilidades

- Crear solicitudes.
- Consultar estado de tickets.
- Responder consultas del técnico.
- Confirmar solución.

---

# ACT-002 Técnico TI

## Descripción

Usuario encargado de atender y resolver solicitudes tecnológicas.

## Responsabilidades

- Revisar tickets asignados.
- Actualizar estados.
- Registrar soluciones.
- Solicitar información adicional.

---

# ACT-003 Administrador

## Descripción

Usuario responsable de administrar la plataforma.

## Responsabilidades

- Gestionar usuarios.
- Configurar parámetros.
- Administrar permisos.
- Consultar reportes.

---

# ACT-004 Sistema de Notificaciones

## Descripción

Componente encargado de enviar comunicaciones automáticas.

## Responsabilidades

- Enviar correos.
- Generar alertas.
- Informar cambios relevantes.

---

# 3. Casos de Uso

---

# CU-001 Autenticarse en el Sistema

## Actor Principal

Usuario Solicitante / Técnico / Administrador

## Objetivo

Permitir el acceso seguro a la plataforma según las credenciales y permisos asignados.

## Precondiciones

- El usuario debe estar registrado.
- El usuario debe contar con credenciales válidas.

## Flujo Principal

1. El usuario ingresa sus credenciales.
2. El sistema valida la información.
3. El sistema identifica el rol asociado.
4. El sistema permite acceso a la plataforma.

## Flujos Alternativos

### Credenciales incorrectas

1. El sistema rechaza el acceso.
2. Se informa al usuario.

## Postcondición

El usuario inicia sesión correctamente.

## Requerimientos relacionados

- RF-001
- RF-003

---

# CU-002 Crear Solicitud de Soporte

## Actor Principal

Usuario Solicitante

## Objetivo

Permitir registrar una incidencia o solicitud tecnológica.

## Precondiciones

- Usuario autenticado.
- Usuario con permisos de creación.

## Flujo Principal

1. Usuario selecciona "Crear Ticket".
2. Ingresa información de la solicitud.
3. Selecciona categoría.
4. Selecciona prioridad.
5. Selecciona dependencia afectada.
6. Adjunta evidencia si corresponde.
7. Envía solicitud.
8. Sistema genera identificador único.

## Flujos Alternativos

### Información incompleta

1. Sistema valida campos obligatorios.
2. Solicita completar información faltante.

## Postcondición

El ticket queda registrado en estado:

```
Nuevo
```

## Requerimientos relacionados

- RF-004
- RF-005
- RF-010
- RF-011
- RF-013

---

# CU-003 Consultar Estado de Solicitud

## Actor Principal

Usuario Solicitante

## Objetivo

Permitir conocer el avance de una solicitud.

## Precondiciones

- Usuario autenticado.
- Debe existir al menos un ticket asociado.

## Flujo Principal

1. Usuario ingresa al módulo de tickets.
2. Sistema muestra solicitudes creadas.
3. Usuario selecciona una solicitud.
4. Sistema muestra información detallada.

Información mostrada:

- Estado.
- Técnico asignado.
- Comentarios.
- Historial.

## Postcondición

Usuario obtiene información actualizada.

## Requerimientos relacionados

- RF-006
- RF-014

---

# CU-004 Asignar Ticket a Técnico

## Actor Principal

Administrador / Técnico Supervisor

## Objetivo

Asignar una solicitud al responsable de resolución.

## Precondiciones

- Ticket creado.
- Técnico disponible.

## Flujo Principal

1. Usuario autorizado revisa tickets pendientes.
2. Selecciona técnico.
3. Sistema registra asignación.
4. Sistema cambia estado del ticket.

Estado:

```
Asignado
```

5. Sistema envía notificación.

## Postcondición

Ticket queda asociado a un técnico.

## Requerimientos relacionados

- RF-008
- RF-017

---

# CU-005 Atender Solicitud

## Actor Principal

Técnico TI

## Objetivo

Permitir resolver una solicitud asignada.

## Precondiciones

- Técnico autenticado.
- Ticket asignado.

## Flujo Principal

1. Técnico revisa información.
2. Cambia estado a:

```
En progreso
```

3. Realiza diagnóstico.
4. Registra comentarios.
5. Adjunta evidencia.
6. Ingresa solución.

## Postcondición

Ticket queda preparado para cierre.

## Requerimientos relacionados

- RF-007
- RF-012
- RF-013

---

# CU-006 Cambiar Estado de Ticket

## Actor Principal

Técnico TI

## Objetivo

Actualizar el ciclo de vida de una solicitud.

## Estados disponibles

```
Nuevo

En revisión

Asignado

En progreso

Esperando usuario

Resuelto

Cerrado
```

## Flujo Principal

1. Técnico selecciona ticket.
2. Modifica estado.
3. Sistema registra cambio.
4. Sistema notifica interesados.

## Requerimientos relacionados

- RF-007
- RF-014
- RF-017

---

# CU-007 Cerrar Solicitud

## Actor Principal

Técnico TI

## Objetivo

Finalizar formalmente una solicitud resuelta.

## Precondiciones

- Debe existir solución registrada.

## Flujo Principal

1. Técnico registra solución.
2. Cambia estado a:

```
Resuelto
```

3. Usuario valida solución.
4. Sistema cambia estado:

```
Cerrado
```

## Postcondición

Solicitud finalizada.

## Requerimientos relacionados

- RF-015

---

# CU-008 Reabrir Solicitud

## Actor Principal

Usuario Solicitante

## Objetivo

Permitir continuar una solicitud cuando el problema persiste.

## Precondiciones

- Ticket cerrado previamente.

## Flujo Principal

1. Usuario solicita reapertura.
2. Sistema registra motivo.
3. Técnico revisa solicitud.
4. Ticket vuelve a estado activo.

## Requerimientos relacionados

- RF-016

---

# CU-009 Gestionar Activos Tecnológicos

## Actor Principal

Administrador

## Objetivo

Registrar y mantener información de activos tecnológicos.

## Flujo Principal

1. Administrador accede al módulo activos.
2. Registra activo.
3. Ingresa información técnica.
4. Guarda información.

Datos:

- Tipo.
- Marca.
- Modelo.
- Número serie.
- Ubicación.

## Requerimientos relacionados

- RF-020

---

# CU-010 Asociar Activo a Ticket

## Actor Principal

Técnico TI

## Objetivo

Relacionar una incidencia con un activo tecnológico.

## Flujo Principal

1. Técnico abre ticket.
2. Selecciona activo relacionado.
3. Sistema registra relación.
4. Actualiza historial del activo.

## Requerimientos relacionados

- RF-021

---

# CU-011 Consultar Dashboard Operacional

## Actor Principal

Administrador

## Objetivo

Visualizar indicadores del servicio TI.

## Información mostrada

- Tickets abiertos.
- Tickets cerrados.
- Tickets por prioridad.
- Tickets por categoría.
- Tiempo promedio.

## Requerimientos relacionados

- RF-018
- RF-019

---

# CU-012 Administrar Usuarios y Permisos

## Actor Principal

Administrador

## Objetivo

Gestionar acceso a la plataforma.

## Flujo Principal

1. Administrador crea usuario.
2. Asigna rol.
3. Define permisos.
4. Guarda configuración.

## Requerimientos relacionados

- RF-002
- RF-003

---

# 4. Relación Casos de Uso - Requerimientos

| Caso Uso | Requerimientos |
|-|-|
| CU-001 | RF-001, RF-003 |
| CU-002 | RF-004, RF-005 |
| CU-003 | RF-006 |
| CU-004 | RF-008 |
| CU-005 | RF-007, RF-012 |
| CU-006 | RF-007 |
| CU-007 | RF-015 |
| CU-008 | RF-016 |
| CU-009 | RF-020 |
| CU-010 | RF-021 |
| CU-011 | RF-018, RF-019 |
| CU-012 | RF-002, RF-003 |

---

# 5. Flujo General del Sistema

```
Usuario

   |

Crear Solicitud

   |

Clasificación

   |

Asignación Técnico

   |

Diagnóstico

   |

Resolución

   |

Validación Usuario

   |

Cierre

   |

Métricas
```

---

# Control de Versiones

| Versión | Fecha | Descripción |
|-|-|-|
| 0.1 | 2026-07-12 | Creación inicial de casos de uso |