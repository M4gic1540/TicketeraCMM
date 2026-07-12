# Software Design Description (SDD)

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform |
| Documento | Software Design Description |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

El presente documento describe el diseño técnico y arquitectónico de Agile Service Desk Platform (ASDP), una plataforma ITSM orientada a la gestión integral de servicios tecnológicos.

Este documento define:

- Arquitectura del sistema.
- Componentes principales.
- Tecnologías utilizadas.
- Patrones de diseño.
- Modelo de comunicación.
- Estrategia de despliegue.
- Consideraciones de seguridad y escalabilidad.

---

# 2. Visión General del Sistema

ASDP es una plataforma diseñada para gestionar el ciclo completo de atención tecnológica:

```
Solicitud Usuario

        ↓

Registro Incidente

        ↓

Clasificación

        ↓

Asignación Técnico

        ↓

Resolución

        ↓

Cierre

        ↓

Métricas
```

El sistema busca evolucionar desde una gestión basada en tareas hacia un modelo ITSM orientado a servicios.

---

# 3. Objetivos Arquitectónicos

La arquitectura debe permitir:

- Alta mantenibilidad.
- Separación de responsabilidades.
- Escalabilidad progresiva.
- Seguridad.
- Fácil incorporación de nuevos módulos.
- Integración con sistemas externos.

---

# 4. Principios de Diseño

## 4.1 Clean Architecture

La solución seguirá una separación por capas:

```
+----------------------------+
|        Presentation        |
| Controllers / API          |
+----------------------------+
             |
             |
+----------------------------+
|        Application         |
| Use Cases                  |
+----------------------------+
             |
             |
+----------------------------+
|           Domain           |
| Entities / Rules           |
+----------------------------+
             |
             |
+----------------------------+
|      Infrastructure        |
| Database / External APIs   |
+----------------------------+
```

---

## 4.2 Domain Driven Design (DDD)

El dominio se dividirá mediante conceptos del negocio:

Bounded Context inicial:

```
ASDP Domain

├── Identity Management
├── Incident Management
├── Service Request
├── Asset Management
├── Notification
└── Reporting
```

---

# 5. Arquitectura General

## 5.1 Arquitectura Evolutiva

ASDP utilizará una arquitectura modular preparada para evolucionar hacia microservicios.

Primera etapa:

```
             Frontend

                |

             Backend API

                |

            PostgreSQL
```

---

Evolución:

```
                  API Gateway

                       |

 ------------------------------------------------

 |          |           |          |            |

Auth    Tickets     Assets   Notification   Reports

 |          |           |          |            |

DB       DB          DB         DB           DB


                |

            Message Broker

                |

             Events
```

---

# 6. Componentes del Sistema

---

# 6.1 Frontend Application

## Responsabilidad

Proporcionar interfaz para usuarios y técnicos.

Funciones:

- Crear solicitudes.
- Visualizar tickets.
- Gestionar estados.
- Consultar dashboards.

Tecnologías propuestas:

- React.
- TypeScript.
- Tailwind CSS.
- React Query.

---

# 6.2 Backend API

## Responsabilidad

Gestionar lógica de negocio.

Funciones:

- Autenticación.
- Gestión de tickets.
- Usuarios.
- Roles.
- Validaciones.

Tecnologías:

- NestJS.
- REST API.
- JWT.

---

# 6.3 Database

## Motor

PostgreSQL.

Responsabilidades:

- Persistencia de información.
- Integridad de datos.
- Relaciones.

---

# 7. Módulos del Dominio

---

# 7.1 Identity Management

Gestiona:

- Usuarios.
- Roles.
- Permisos.
- Autenticación.

Entidades:

```
User

Role

Permission
```

---

# 7.2 Incident Management

Gestiona incidencias.

Entidad principal:

```
Ticket
```

Atributos:

```
id

title

description

priority

status

category

created_at

updated_at
```

---

# 7.3 Asset Management

Gestiona activos tecnológicos.

Ejemplo:

```
Computer

Printer

Projector

Room
```

---

# 7.4 Notification Service

Responsable de:

- Emails.
- Alertas.
- Eventos.

---

# 8. Modelo de Comunicación

## Comunicación Sincrónica

REST API:

Ejemplo:

```
Frontend

     |

GET /tickets

     |

Ticket Controller

```

---

## Comunicación Asíncrona

Eventos:

Ejemplo:

```
Ticket Created

        |

Message Broker

        |

Notification Service

        |

Send Email
```

Tecnología futura:

- RabbitMQ.

---

# 9. Patrones de Diseño

## Repository Pattern

Separación entre dominio y persistencia.

Ejemplo:

```
TicketRepository

        |

PostgresRepository
```

---

## Strategy Pattern

Aplicado a:

- Priorización.
- Notificaciones.
- SLA.

Ejemplo:

```
PriorityStrategy

 ├── CriticalPriority

 ├── HighPriority

 └── NormalPriority
```

---

## Observer Pattern

Para eventos:

```
Ticket Updated

        |

Observers

        |

Notifications

Reports
```

---

# 10. Seguridad

## Autenticación

Implementación:

- JWT.
- Refresh Token.

---

## Autorización

Modelo:

RBAC

Roles:

```
ADMIN

TECHNICIAN

USER
```

---

## Protección API

Medidas:

- Validación entrada.
- Rate Limiting.
- CORS.
- Helmet.
- Auditoría.

---

# 11. Infraestructura

## Desarrollo Local

Docker Compose:

```
Services:

frontend

backend

postgres

redis

rabbitmq
```

---

## Producción

Arquitectura preparada para:

- Docker.
- Kubernetes.
- CI/CD.
- Cloud deployment.

---

# 12. CI/CD

Pipeline esperado:

```
Developer

    |

Git Push

    |

GitHub Actions

    |

Tests

    |

Build Image

    |

Deploy
```

---

# 13. Observabilidad

Componentes futuros:

## Logs

- Loki.

## Métricas

- Prometheus.

## Dashboards

- Grafana.

## Tracing

- OpenTelemetry.

---

# 14. Modelo de Despliegue

Inicial:

```
Docker Host

 |
 |
ASDP Application

 |
 |
PostgreSQL
```

---

Futuro:

```
Kubernetes Cluster


API Gateway


Microservices


Databases


Message Broker
```

---

# 15. Consideraciones de Escalabilidad

La arquitectura permitirá:

- Escalamiento horizontal.
- Separación de servicios.
- Integración con terceros.
- Procesamiento asíncrono.
- Multiempresa SaaS.

---

# 16. Decisiones Técnicas Pendientes

| Decisión | Estado |
|-|-|
| Framework Backend | Pendiente |
| Framework Frontend | Pendiente |
| Broker eventos | Pendiente |
| Cloud Provider | Pendiente |
| Estrategia Multi-Tenant | Pendiente |

---

# 17. Referencias

- Clean Architecture - Robert C. Martin
- Domain Driven Design - Eric Evans
- ITIL 4 Framework
- Twelve-Factor App

---

# Control de Versiones

| Versión | Fecha | Descripción |
|-|-|-|
| 0.1 | 2026-07-12 | Primera definición arquitectónica |