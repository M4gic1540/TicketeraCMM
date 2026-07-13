# Database per Service Pattern

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform |
| Documento | Database per Service |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

Este documento describe la estrategia **Database per Service**, considerada como la arquitectura objetivo para ASDP cuando evolucione desde una aplicación modular hacia una arquitectura basada en microservicios.

El objetivo es garantizar independencia entre dominios, reducir el acoplamiento y facilitar el escalado de cada componente.

---

# 2. Contexto

Durante el MVP, ASDP utilizará una base de datos PostgreSQL compartida con separación lógica mediante esquemas y módulos.

En etapas posteriores, cada microservicio será propietario exclusivo de su propia base de datos.

Esta evolución permitirá:

- Escalar servicios de forma independiente.
- Desplegar componentes sin afectar a otros.
- Mantener autonomía entre dominios.
- Reducir el acoplamiento entre equipos de desarrollo.

---

# 3. ¿Qué es Database per Service?

El patrón **Database per Service** establece que cada microservicio administra exclusivamente su propio almacenamiento de datos.

Los demás servicios no pueden acceder directamente a esa base de datos.

Toda comunicación debe realizarse mediante APIs o eventos.

```
            ✔ Correcto

Service A

     │

 Database A

     ▲

 REST / Events

     ▼

Service B

     │

 Database B
```

```
            ✘ Incorrecto

Service A

     │

 Database A

     ▲

     │

Service B
```

---

# 4. Objetivos

La adopción del patrón busca:

- Aislar responsabilidades.
- Favorecer la independencia tecnológica.
- Permitir despliegues autónomos.
- Incrementar la resiliencia.
- Facilitar la evolución del sistema.

---

# 5. Arquitectura Objetivo

```
                   API Gateway

                        │

---------------------------------------------------------

│            │             │            │             │

Identity   Tickets      Assets     Reports   Notifications

│            │             │            │             │

IdentityDB TicketDB    AssetDB    ReportDB NotificationDB
```

Cada servicio administra únicamente su propia información.

---

# 6. Bases de Datos por Dominio

## Identity Service

Responsabilidad:

- Usuarios
- Roles
- Permisos
- Autenticación

Base de datos:

```
IdentityDB
```

Entidades principales:

- User
- Role
- Permission
- Session

---

## Ticket Service

Responsabilidad:

- Incidentes
- Solicitudes
- Comentarios
- Estados
- Prioridades

Base de datos:

```
TicketDB
```

Entidades principales:

- Ticket
- Comment
- Category
- Priority
- Status

---

## Asset Service

Responsabilidad:

- Equipos
- Inventario
- Dependencias
- Historial

Base de datos:

```
AssetDB
```

Entidades principales:

- Asset
- Location
- AssetHistory
- AssetType

---

## Notification Service

Responsabilidad:

- Correos electrónicos
- Alertas
- Plantillas
- Historial de envíos

Base de datos:

```
NotificationDB
```

Entidades:

- Notification
- Template
- EmailQueue
- DeliveryLog

---

## Reporting Service

Responsabilidad:

- Indicadores
- Dashboard
- Estadísticas
- SLA

Base de datos:

```
ReportingDB
```

Entidades:

- KPI
- Dashboard
- Metrics
- SLAReport

---

## Knowledge Base Service

Responsabilidad:

- Base de conocimiento
- Artículos
- Soluciones

Base de datos:

```
KnowledgeDB
```

Entidades:

- Article
- Category
- Tag
- Revision

---

## Audit Service

Responsabilidad:

- Auditoría
- Eventos
- Historial

Base de datos:

```
AuditDB
```

Entidades:

- AuditLog
- Event
- UserAction

---

# 7. Reglas del Patrón

Cada servicio debe cumplir las siguientes reglas:

- Es propietario exclusivo de su base de datos.
- Ningún servicio puede consultar tablas de otro servicio.
- La comunicación entre dominios se realiza mediante APIs o eventos.
- Las transacciones distribuidas deben evitarse cuando sea posible.

---

# 8. Comunicación entre Servicios

## Comunicación Sincrónica

```
Ticket Service

      │

REST API

      │

Identity Service
```

Uso recomendado:

- Validar usuarios.
- Obtener información puntual.
- Consultas rápidas.

---

## Comunicación Asíncrona

```
Ticket Created

       │

 RabbitMQ

       │

Notification Service
```

Eventos comunes:

- TicketCreated
- TicketAssigned
- TicketClosed
- UserCreated
- AssetUpdated

---

# 9. Consistencia de Datos

Al utilizar múltiples bases de datos, la consistencia será principalmente eventual.

Se emplearán eventos de dominio para sincronizar información cuando sea necesario.

Ejemplo:

```
Ticket Closed

↓

Event Published

↓

Reporting Service

↓

Actualización de métricas
```

---

# 10. Ventajas

- Bajo acoplamiento.
- Escalabilidad independiente.
- Mayor resiliencia.
- Despliegues desacoplados.
- Flexibilidad tecnológica.
- Menor impacto ante fallos.

---

# 11. Desafíos

- Mayor complejidad operacional.
- Consistencia eventual.
- Observabilidad distribuida.
- Gestión de eventos.
- Versionado de APIs.

---

# 12. Estrategia de Migración

## Fase 1 – MVP

```
Backend

↓

PostgreSQL
```

Una única base de datos con separación lógica por módulos.

---

## Fase 2 – Modularización

```
Schemas

Identity

Tickets

Assets
```

Separación mediante esquemas dentro de PostgreSQL.

---

## Fase 3 – Extracción

Cada módulo obtiene su propia base de datos.

```
IdentityDB

TicketDB

AssetDB
```

---

## Fase 4 – Microservicios

Servicios totalmente independientes.

```
Service

↓

Database

↓

API

↓

Events
```

---

# 13. Tecnologías Propuestas

| Componente | Tecnología |
|------------|------------|
| Base de datos relacional | PostgreSQL |
| Caché | Redis |
| Broker de mensajes | RabbitMQ |
| ORM | Prisma ORM |
| Migraciones | Prisma Migrate |
| Observabilidad | OpenTelemetry |

---

# 14. Consideraciones de Seguridad

Cada base de datos deberá implementar:

- Credenciales independientes.
- Principio de mínimo privilegio.
- Conexiones cifradas.
- Auditoría.
- Backups independientes.

---

# 15. Conclusiones

La estrategia **Database per Service** permitirá que ASDP evolucione desde una aplicación modular hacia una plataforma distribuida sin necesidad de rediseñar completamente el dominio de negocio.

Esta aproximación favorece la mantenibilidad, la escalabilidad y la independencia entre servicios, manteniendo una arquitectura preparada para el crecimiento futuro.

---

# Referencias

- Chris Richardson. *Microservices Patterns*. Manning Publications.
- Martin Fowler. *Microservices Resource Guide*.
- Eric Evans. *Domain-Driven Design: Tackling Complexity in the Heart of Software*.
- Sam Newman. *Building Microservices (2nd Edition)*.

---

# Control de Versiones

| Versión | Fecha | Descripción |
|----------|--------|-------------|
| 0.1 | 2026-07-12 | Creación inicial del documento Database per Service |