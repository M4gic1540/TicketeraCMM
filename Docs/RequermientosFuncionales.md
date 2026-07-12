# Requerimientos Funcionales (FRD)

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform |
| Documento | Requerimientos Funcionales |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

El presente documento define los requerimientos funcionales de Agile Service Desk Platform (ASDP), estableciendo las capacidades que debe proporcionar la plataforma para gestionar servicios tecnológicos mediante un modelo ITSM.

Los requerimientos definidos representan las funcionalidades esperadas para soportar la creación, administración, seguimiento y resolución de solicitudes tecnológicas.

---

# 2. Actores del Sistema

## Usuario Solicitante

Persona que requiere soporte tecnológico.

Permisos:

- Crear solicitudes.
- Consultar estado.
- Responder comentarios.
- Confirmar solución.

---

## Técnico TI

Responsable de atender solicitudes.

Permisos:

- Visualizar tickets asignados.
- Actualizar estados.
- Registrar soluciones.
- Adjuntar evidencias.

---

## Administrador

Responsable de configurar la plataforma.

Permisos:

- Gestionar usuarios.
- Configurar catálogos.
- Administrar permisos.
- Consultar reportes.

---

# 3. Requerimientos Funcionales

---

# RF-001 Autenticación de Usuarios

## Descripción

El sistema debe permitir que los usuarios puedan autenticarse mediante credenciales válidas.

## Criterios de aceptación

- El usuario puede ingresar usuario y contraseña.
- El sistema valida las credenciales.
- El sistema permite acceso según permisos asignados.
- El sistema rechaza credenciales incorrectas.

---

# RF-002 Gestión de Usuarios

## Descripción

El sistema debe permitir administrar usuarios registrados.

## Funcionalidades

- Crear usuarios.
- Editar usuarios.
- Desactivar usuarios.
- Consultar usuarios.

## Criterios

Solo usuarios administradores pueden gestionar usuarios.

---

# RF-003 Gestión de Roles y Permisos

## Descripción

El sistema debe permitir asignar roles y permisos.

Roles iniciales:

- Administrador.
- Técnico.
- Usuario solicitante.

---

# RF-004 Creación de Tickets

## Descripción

El sistema debe permitir que un usuario pueda crear una solicitud de soporte.

Información requerida:

- Título.
- Descripción.
- Categoría.
- Prioridad.
- Dependencia afectada.

---

# RF-005 Identificador Único de Ticket

## Descripción

Cada solicitud creada debe generar automáticamente un identificador único.

Ejemplo:

```
INC-000001
```

---

# RF-006 Consulta de Tickets

## Descripción

El sistema debe permitir consultar solicitudes existentes.

Filtros:

- Estado.
- Prioridad.
- Categoría.
- Fecha.
- Técnico asignado.

---

# RF-007 Actualización de Estado

## Descripción

El sistema debe permitir modificar el estado del ticket.

Estados:

- Nuevo.
- En revisión.
- Asignado.
- En progreso.
- Esperando usuario.
- Resuelto.
- Cerrado.

---

# RF-008 Asignación de Tickets

## Descripción

El sistema debe permitir asignar solicitudes a técnicos.

Criterios:

- Un ticket puede tener un responsable.
- El técnico debe recibir la información necesaria.

---

# RF-009 Gestión de Prioridades

## Descripción

El sistema debe permitir clasificar tickets según prioridad.

Prioridades:

- Baja.
- Media.
- Alta.
- Crítica.

---

# RF-010 Gestión de Categorías

## Descripción

El sistema debe permitir clasificar solicitudes.

Categorías iniciales:

- Hardware.
- Software.
- Redes.
- Impresoras.
- Audiovisual.
- Accesos.

---

# RF-011 Gestión de Dependencias

## Descripción

El sistema debe permitir asociar solicitudes a ubicaciones físicas.

Ejemplos:

- Salas.
- Auditorios.
- Laboratorios.
- Oficinas.

---

# RF-012 Comentarios en Tickets

## Descripción

Los usuarios deben poder agregar comentarios dentro de una solicitud.

Permite:

- Comunicación usuario-técnico.
- Registro histórico.
- Seguimiento.

---

# RF-013 Adjuntar Archivos

## Descripción

El sistema debe permitir adjuntar archivos asociados a una solicitud.

Ejemplos:

- Imágenes.
- Capturas.
- Documentos.

---

# RF-014 Historial de Cambios

## Descripción

El sistema debe registrar todas las modificaciones realizadas sobre un ticket.

Debe almacenar:

- Usuario responsable.
- Fecha.
- Cambio realizado.

---

# RF-015 Cierre de Solicitudes

## Descripción

El sistema debe permitir cerrar solicitudes resueltas.

Validaciones:

- Debe existir solución registrada.
- Debe quedar historial.

---

# RF-016 Reapertura de Tickets

## Descripción

El sistema debe permitir reabrir solicitudes cuando el problema persiste.

Condiciones:

- Usuario puede solicitar reapertura.
- Técnico debe validar.

---

# RF-017 Notificaciones

## Descripción

El sistema debe enviar notificaciones ante eventos importantes.

Eventos:

- Nuevo ticket.
- Asignación.
- Cambio de estado.
- Resolución.

---

# RF-018 Dashboard Operacional

## Descripción

El sistema debe proporcionar indicadores visuales.

Información:

- Tickets abiertos.
- Tickets cerrados.
- Tickets pendientes.
- Tickets por prioridad.
- Tickets por categoría.

---

# RF-019 Reportes

## Descripción

El sistema debe permitir generar reportes.

Reportes:

- Solicitudes por periodo.
- Tiempo promedio de resolución.
- Productividad técnica.
- Cumplimiento SLA.

---

# RF-020 Gestión de Activos Tecnológicos

## Descripción

El sistema debe permitir registrar activos asociados a solicitudes.

Ejemplos:

- Computadores.
- Impresoras.
- Proyectores.
- Equipamiento de red.

Información:

- Código interno.
- Marca.
- Modelo.
- Número de serie.
- Ubicación.

---

# RF-021 Asociación Ticket-Activo

## Descripción

El sistema debe permitir relacionar tickets con activos tecnológicos.

Beneficios:

- Historial del activo.
- Identificación de fallas recurrentes.

---

# RF-022 Gestión SLA

## Descripción

El sistema debe permitir definir acuerdos de atención.

Debe permitir:

- Tiempo máximo de respuesta.
- Tiempo máximo de resolución.
- Alertas de vencimiento.

---

# RF-023 Base de Conocimiento

## Descripción

El sistema debe permitir almacenar soluciones conocidas.

Debe permitir:

- Crear artículos.
- Buscar soluciones.
- Clasificar contenido.

---

# RF-024 Auditoría del Sistema

## Descripción

El sistema debe registrar acciones relevantes.

Ejemplos:

- Inicio de sesión.
- Cambios administrativos.
- Modificación de permisos.

---

# RF-025 Integraciones Externas

## Descripción

El sistema debe permitir integración con servicios externos.

Ejemplos:

- Correo electrónico.
- Microsoft Teams.
- Sistemas institucionales.
- Webhooks.

---

# 4. Resumen de Requerimientos

| ID | Funcionalidad |
|-|-|
| RF-001 | Autenticación |
| RF-002 | Usuarios |
| RF-003 | Roles y permisos |
| RF-004 | Creación tickets |
| RF-005 | Identificación tickets |
| RF-006 | Consulta tickets |
| RF-007 | Estados |
| RF-008 | Asignación |
| RF-009 | Prioridades |
| RF-010 | Categorías |
| RF-011 | Dependencias |
| RF-012 | Comentarios |
| RF-013 | Adjuntos |
| RF-014 | Historial |
| RF-015 | Cierre |
| RF-016 | Reapertura |
| RF-017 | Notificaciones |
| RF-018 | Dashboard |
| RF-019 | Reportes |
| RF-020 | Activos |
| RF-021 | Relación activo-ticket |
| RF-022 | SLA |
| RF-023 | Base conocimiento |
| RF-024 | Auditoría |
| RF-025 | Integraciones |

---

# Control de Versiones

| Versión | Fecha | Descripción |
|-|-|-|
| 0.1 | 2026-07-12 | Creación inicial de requerimientos funcionales |