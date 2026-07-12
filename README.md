# 🚀 Agile Service Desk Platform (ASDP)

> Plataforma ITSM (IT Service Management) basada en arquitectura de microservicios para la gestión de incidencias y solicitudes de soporte tecnológico, diseñada bajo principios de Clean Architecture, Domain-Driven Design (DDD), DevOps y metodologías Agile.

---

# 📖 Descripción

Agile Service Desk Platform (ASDP) es una solución desarrollada para optimizar la gestión del soporte tecnológico en organizaciones donde actualmente las incidencias son administradas mediante herramientas genéricas como Trello, correo electrónico o comunicación informal.

La plataforma centraliza el ciclo completo de atención de solicitudes, proporcionando trazabilidad, priorización, automatización, métricas operacionales y observabilidad, permitiendo mejorar la calidad del servicio entregado a los usuarios.

---

# 🎯 Problemática

Actualmente muchas organizaciones administran sus incidencias mediante:

- 📧 Correos electrónicos
- 📋 Trello
- 💬 Comunicación informal
- 📞 Llamadas telefónicas
- 📄 Planillas Excel

Este modelo presenta diversos problemas:

- Incidencias duplicadas.
- Solicitudes olvidadas.
- Ausencia de trazabilidad.
- Falta de indicadores.
- Desconocimiento del estado de una solicitud.
- Asignación manual de técnicos.
- Dificultad para medir tiempos de resolución.
- Imposibilidad de generar métricas para la toma de decisiones.

---

# 💡 Solución

ASDP propone una plataforma ITSM que permite:

- Centralizar todas las solicitudes.
- Gestionar incidencias mediante tickets únicos (UID).
- Priorizar automáticamente la atención.
- Asignar técnicos responsables.
- Registrar tiempos de trabajo.
- Mantener historial completo de cada intervención.
- Generar indicadores para la dirección.
- Automatizar notificaciones.
- Mejorar la experiencia de usuarios y técnicos.

---

# 🏗 Arquitectura

El proyecto utiliza una arquitectura de microservicios basada en principios Cloud Native.

```
                   React + Vite

                         │

                   API Gateway

                         │

──────────────────────────────────────────────

    Auth Service

    User Service

    Ticket Service

    Comment Service

    Notification Service

    Dashboard Service

    Audit Service

──────────────────────────────────────────────

Cada servicio posee su propia base de datos
(Database per Service)

Comunicación:

REST + RabbitMQ

Seguridad:

JWT + RBAC

Resiliencia:

Circuit Breaker
```

---

# 🎯 Objetivos

## Objetivo General

Diseñar e implementar una plataforma ITSM que permita gestionar de manera centralizada las incidencias y solicitudes de soporte tecnológico, optimizando la atención de usuarios mediante metodologías Agile y una arquitectura basada en microservicios.

## Objetivos Específicos

- Centralizar la gestión de solicitudes.
- Implementar autenticación JWT.
- Implementar autorización RBAC.
- Diseñar una arquitectura desacoplada.
- Mejorar la trazabilidad de incidencias.
- Medir indicadores de desempeño.
- Automatizar procesos mediante eventos.
- Implementar prácticas DevOps.

---

# ⚙ Arquitectura del Sistema

- Microservices
- Clean Architecture
- Domain-Driven Design (DDD - Light)
- Database per Service
- Event-Driven Architecture
- Repository Pattern
- Service Layer
- Factory Pattern
- Strategy Pattern
- Observer Pattern
- Specification Pattern
- Circuit Breaker

---

## Mensajería

- RabbitMQ

# 🧩 Patrones de Diseño

## Arquitectónicos

- Microservices
- Database per Service
- Event Driven Architecture
- API Gateway
- Circuit Breaker

## Diseño

- Repository Pattern
- Service Layer
- Factory Pattern
- Strategy Pattern
- Observer Pattern
- Specification Pattern

---

# 📐 Principios Aplicados

- SOLID
- DRY
- KISS
- Separation of Concerns
- Dependency Injection

---

# 🔐 Seguridad

- JWT Authentication
- Refresh Token
- Role Based Access Control (RBAC)
- Password Hashing
- HTTPS Ready
- Security Headers
- Rate Limiting

---

# 👥 Roles

## Administrador

- Gestión completa del sistema.
- Gestión de usuarios.
- Asignación de técnicos.
- Dashboard ejecutivo.
- Auditoría.

---

## Técnico

- Gestionar tickets asignados.
- Registrar tiempo trabajado.
- Agregar comentarios.
- Finalizar incidencias.

---

## Usuario

- Crear solicitudes.
- Consultar estado.
- Adjuntar evidencia.
- Agregar comentarios.

---

# 🎫 Ciclo de Vida del Ticket

```
Sin Asignar

↓

Asignado

↓

En Progreso

↓

Finalizado

↓

Cerrado
```

Cada ticket posee un identificador único (UID) para garantizar su trazabilidad.

---

# 📊 Dashboard

La plataforma incorpora indicadores como:

- Tickets abiertos.
- Tickets cerrados.
- Tiempo promedio de resolución.
- SLA.
- Tickets por prioridad.
- Tickets por dependencia.
- Tickets por técnico.
- Carga de trabajo.
- Tendencias mensuales.

---

# 🔄 DevOps

El proyecto incorpora un ciclo DevOps completo.

```
Plan

↓

Code

↓

Build

↓

Test

↓

Release

↓

Deploy

↓

Operate

↓

Monitor
```

---

# ⚡ CI/CD

GitHub Actions automatiza:

- Lint
- Testing
- Build
- Docker Build
- Security Scan
- Deploy

---

# 📦 Tecnologías

## Frontend

- React 19
- Vite
- TypeScript
- TailwindCSS
- React Router DOM
- React Query (TanStack Query)
- React Hook Form
- Axios
- Zod

## Backend

La plataforma está compuesta por múltiples microservicios desarrollados con **NestJS**, siguiendo los principios de **Clean Architecture**, **Domain-Driven Design (DDD)** y una arquitectura **Event-Driven**.

- NestJS
- TypeScript
- Prisma ORM
- PostgreSQL
- Passport.js
- JWT
- Swagger / OpenAPI

# 🧩 Microservicios

| Servicio | Responsabilidad |
|----------|-----------------|
| API Gateway | Punto único de entrada y enrutamiento de solicitudes. |
| Auth Service | Autenticación, autorización y emisión de JWT. |
| User Service | Gestión de usuarios, roles y permisos. |
| Ticket Service | Gestión del ciclo de vida de los tickets. |
| Comment Service | Administración de comentarios y seguimiento. |
| Notification Service | Envío de notificaciones por eventos. |
| Dashboard Service | Agregación de métricas e indicadores. |
| Audit Service | Registro de auditoría y trazabilidad. |

Cada microservicio implementa:

- Repository Pattern
- Service Layer
- Factory Pattern
- Strategy Pattern
- Observer Pattern
- Specification Pattern
- Dependency Injection
- JWT Authentication
- Role-Based Access Control (RBAC)
- Circuit Breaker
- Database per Service

## Infraestructura

- Docker
- Docker Compose
- Traefik (API Gateway)
- Redis

## DevOps

- GitHub Actions
- Prometheus
- Grafana
- Loki
- OpenTelemetry
- Trivy
- ESLint
- Prettier

## Testing

- Jest
- Supertest
- Playwright

---

# 📁 Documentación

La documentación completa se encuentra en la carpeta **docs/**.

| Documento | Descripción |
|-----------|-------------|
| BRD | Business Requirements Document |
| PRD | Product Requirements Document |
| FRD | Functional Requirements Document |
| SDD | Software Design Document |
| Architecture | Arquitectura del sistema |
| API | Documentación OpenAPI |
| DevOps | Pipeline DevOps |
| Testing | Estrategia de pruebas |
| Deployment | Guía de despliegue |
| Roadmap | Plan de desarrollo |

---

# 🛣 Roadmap

El proyecto se desarrolla por fases.

- Fase 0 – Descubrimiento y Arquitectura
- Fase 1 – Infraestructura Base
- Fase 2 – Seguridad
- Fase 3 – Gestión de Usuarios
- Fase 4 – Gestión de Tickets
- Fase 5 – Comunicación entre Microservicios
- Fase 6 – Dashboard
- Fase 7 – DevOps
- Fase 8 – Observabilidad
- Fase 9 – Resiliencia
- Fase 10 – Testing
- Fase 11 – Producción
- Fase 12 – Evolución SaaS

---

# 🎯 Estado del Proyecto

🚧 En desarrollo

Actualmente se encuentra en fase de arquitectura y planificación.

---
# 📂 Estructura del Proyecto

```text
nexusdesk/

├── apps/
│   ├── gateway/
│   ├── auth-service/
│   ├── user-service/
│   ├── ticket-service/
│   ├── comment-service/
│   ├── notification-service/
│   ├── dashboard-service/
│   └── audit-service/
│
├── libs/
│   ├── common/
│   ├── config/
│   ├── messaging/
│   ├── auth/
│   ├── shared/
│   └── dto/
│
├── frontend/
│
├── docs/
│
├── docker/
│
└── .github/
    └── workflows/
```
---

# 📄 Licencia

ASDP is released under a custom non-commercial license.

The source code is available for educational, research and portfolio purposes.
Commercial use, SaaS deployment or redistribution requires explicit permission
from the copyright holder.

See [LICENSE](LICENSE) for full details.

---

# 👨‍💻 Autor

Desarrollado como una solución para optimizar la gestión del soporte tecnológico mediante una plataforma ITSM moderna basada en arquitectura de microservicios, principios de ingeniería de software y prácticas DevOps.