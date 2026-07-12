# Arquitectura del Sistema

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform |
| Documento | Architecture Overview |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

Este documento describe la arquitectura general de Agile Service Desk Platform (ASDP), una plataforma ITSM diseñada para gestionar servicios tecnológicos, incidencias y solicitudes internas.

La arquitectura está diseñada bajo principios de:

- Separación de responsabilidades.
- Alta mantenibilidad.
- Escalabilidad progresiva.
- Seguridad.
- Automatización.
- Evolución hacia arquitecturas distribuidas.

---

# 2. Visión Arquitectónica

ASDP busca transformar la gestión tradicional de soporte TI basada en tareas hacia un modelo orientado a servicios.

La plataforma permitirá:

- Gestión de incidentes.
- Gestión de solicitudes.
- Seguimiento operativo.
- Gestión de activos.
- Métricas.
- Automatización.

---

# 3. Principios Arquitectónicos

## 3.1 Clean Architecture

El sistema separa responsabilidades mediante capas independientes.

```
+--------------------------------+
|        Interface Layer         |
| Controllers / API / UI         |
+--------------------------------+

              |

+--------------------------------+
|       Application Layer        |
| Use Cases / Services           |
+--------------------------------+

              |

+--------------------------------+
|          Domain Layer          |
| Entities / Business Rules      |
+--------------------------------+

              |

+--------------------------------+
|     Infrastructure Layer       |
| Database / External Services   |
+--------------------------------+
```

Beneficios:

- Bajo acoplamiento.
- Facilidad de pruebas.
- Independencia tecnológica.

---

# 3.2 Domain Driven Design (DDD)

La plataforma se organiza alrededor del dominio de gestión de servicios TI.

## Bounded Contexts iniciales

```
ASDP Domain

├── Identity Context
│
├── Incident Context
│
├── Service Request Context
│
├── Asset Context
│
├── Notification Context
│
└── Reporting Context
```

---

# 4. Arquitectura General

ASDP utiliza una arquitectura evolutiva.

La primera implementación será modular y preparada para una futura separación en servicios independientes.

---

# 4.1 Arquitectura Inicial (MVP)

```
                     Usuario

                       |

                 Web Application

                       |

                    Backend API

                       |

                  PostgreSQL DB
```

Características:

- Aplicación modular.
- Menor complejidad operacional.
- Desarrollo rápido.
- Fácil validación del producto.

---

# 4.2 Arquitectura Evolutiva

Cuando la plataforma requiera mayor escala:

```
                         Client

                           |

                     API Gateway

                           |

 -------------------------------------------------

 |             |              |             |

Auth       Ticketing       Assets     Notifications

 |             |              |             |

DB            DB             DB            DB


                |

          Message Broker

                |

             Events
```

---

# 5. Componentes Principales

---

# 5.1 Frontend

## Responsabilidad

Interfaz de interacción con usuarios.

Funciones:

- Crear solicitudes.
- Visualizar tickets.
- Consultar estados.
- Dashboard.

Tecnologías propuestas:

- React.
- TypeScript.
- Tailwind CSS.

---

# 5.2 Backend Application

## Responsabilidad

Contener reglas de negocio.

Funciones:

- Gestión tickets.
- Usuarios.
- Roles.
- Validaciones.
- Procesamiento.

Tecnologías propuestas:

- NestJS.
- REST API.

---

# 5.3 Base de Datos

## Tecnología

PostgreSQL.

Responsabilidad:

- Persistencia.
- Relaciones.
- Integridad.

Modelo inicial:

```
Users

Tickets

Comments

Assets

Categories

Notifications
```

---

# 5.4 Message Broker

## Tecnología propuesta

RabbitMQ.

Responsabilidad:

Comunicación asíncrona entre componentes.

Ejemplo:

```
Ticket Created

      |

 RabbitMQ

      |

Notification Service

      |

Email Sent
```

---

# 6. Arquitectura de Módulos

## Identity Module

Responsabilidad:

- Usuarios.
- Roles.
- Permisos.
- Seguridad.

---

## Ticket Module

Responsabilidad:

- Incidentes.
- Solicitudes.
- Estados.
- Prioridades.

---

## Asset Module

Responsabilidad:

- Equipos.
- Ubicaciones.
- Historial.

---

## Notification Module

Responsabilidad:

- Correos.
- Alertas.
- Eventos.

---

## Reporting Module

Responsabilidad:

- Métricas.
- Indicadores.
- Dashboards.

---

# 7. Modelo de Comunicación

## Comunicación Sincrónica

Utilizada para operaciones inmediatas.

Ejemplo:

```
Frontend

   |

REST API

   |

Backend
```

Casos:

- Crear ticket.
- Consultar información.
- Actualizar estados.

---

## Comunicación Asíncrona

Utilizada para eventos.

Ejemplo:

```
Ticket Updated

        |

     Event Bus

        |

Notification Service
```

Casos:

- Envío de correos.
- Auditoría.
- Métricas.

---

# 8. Patrones Arquitectónicos

---

# Repository Pattern

Objetivo:

Separar lógica de negocio de persistencia.

Ejemplo:

```
TicketRepository

        |

PostgresAdapter
```

---

# Service Layer Pattern

Objetivo:

Centralizar casos de uso.

Ejemplo:

```
CreateTicketService

AssignTicketService

CloseTicketService
```

---

# Event Driven Architecture

Objetivo:

Permitir comunicación desacoplada.

Ejemplo:

```
TicketCreatedEvent

TicketAssignedEvent

TicketClosedEvent
```

---

# 9. Seguridad Arquitectónica

## Autenticación

Método:

- JWT.
- Refresh Token.

---

## Autorización

Modelo:

RBAC.

Roles:

```
ADMIN

TECHNICIAN

REQUESTER
```

---

## Seguridad de comunicación

Requisitos:

- HTTPS.
- TLS.
- Protección API.

---

# 10. Infraestructura

## Desarrollo

Docker Compose:

```
Frontend

Backend

PostgreSQL

Redis

RabbitMQ
```

---

## Producción

Preparado para:

```
Container Registry

        |

Docker

        |

Kubernetes

        |

Cloud Provider
```

---

# 11. CI/CD

Pipeline:

```
Developer

   |

Git Repository

   |

CI Pipeline

   |

Tests

   |

Build

   |

Deploy
```

Herramientas:

- GitHub Actions.
- Docker.
- SonarQube.

---

# 12. Observabilidad

La plataforma debe permitir:

## Logs

Registro de eventos.

Tecnologías:

- Loki.

---

## Métricas

Indicadores:

- Tiempo respuesta.
- Errores.
- Disponibilidad.

Tecnologías:

- Prometheus.

---

## Visualización

Tecnología:

- Grafana.

---

# 13. Estrategia de Escalabilidad

La arquitectura permite:

## Escalamiento Vertical

Aumentar recursos:

- CPU.
- RAM.
- Almacenamiento.

---

## Escalamiento Horizontal

Agregar instancias:

```
Backend Instance 1

Backend Instance 2

Backend Instance 3
```

---

# 14. Modelo SaaS Futuro

ASDP está diseñada para evolucionar hacia un modelo SaaS.

Consideraciones:

- Multi-tenancy.
- Separación de datos.
- Gestión organizaciones.
- Facturación.
- Administración por clientes.

---

# 15. Decisiones Arquitectónicas Pendientes

| Decisión | Estado |
|-|-|
| Framework Backend | Pendiente |
| Framework Frontend | Pendiente |
| Estrategia Multi Tenant | Pendiente |
| Cloud Provider | Pendiente |
| Message Broker definitivo | Pendiente |

---

# 16. Diagrama General

```
                         Users

                           |

                      Frontend SPA

                           |

                      API Gateway

                           |

        -----------------------------------

        |              |                  |

    Identity       Ticketing          Assets

        |              |                  |

       DB             DB                 DB


                     |

                Event Broker

                     |

              Notification Service
```

---

# Control de Versiones

| Versión | Fecha | Descripción |
|-|-|-|
| 0.1 | 2026-07-12 | Creación inicial de arquitectura |