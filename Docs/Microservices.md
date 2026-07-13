# Microservices Architecture

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform |
| Documento | Microservices Architecture |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

Este documento describe la arquitectura de microservicios objetivo para Agile Service Desk Platform (ASDP).

Aunque la primera versión del sistema será implementada como una aplicación modular, el diseño contempla una evolución gradual hacia una arquitectura distribuida basada en microservicios cuando los requerimientos de escalabilidad, disponibilidad o crecimiento funcional lo justifiquen.

---

# 2. Objetivos

La arquitectura de microservicios busca:

- Escalar componentes de forma independiente.
- Reducir el acoplamiento entre dominios.
- Facilitar despliegues independientes.
- Mejorar la resiliencia del sistema.
- Permitir integración con sistemas externos.
- Facilitar el crecimiento hacia un modelo SaaS Multi-Tenant.

---

# 3. Estrategia de Evolución

## Fase 1 – MVP

Arquitectura modular.

```
Frontend

      |

Backend

      |

PostgreSQL
```

---

## Fase 2 – Modularización

Separación lógica de dominios.

```
Application

├── Identity
├── Tickets
├── Assets
├── Notifications
└── Reports
```

---

## Fase 3 – Extracción de Servicios

Cada módulo podrá convertirse en un servicio independiente.

---

# 4. Arquitectura Objetivo

```
                        Client

                          |

                    API Gateway

                          |

 -----------------------------------------------------------

 |           |            |             |                 |

Identity   Tickets      Assets     Notifications      Reports

 |           |            |             |                 |

 DB          DB           DB            DB                DB

                          |

                    Message Broker

                          |

                      Event Bus
```

---

# 5. API Gateway

## Responsabilidad

Centralizar el acceso a los servicios.

Funciones:

- Enrutamiento.
- Autenticación.
- Rate Limiting.
- Logging.
- Balanceo de carga.
- Versionado de API.

Tecnologías candidatas:

- Kong
- Traefik
- NGINX
- KrakenD

---

# 6. Microservicios

## 6.1 Identity Service

### Responsabilidad

Gestionar autenticación y autorización.

### Funciones

- Login.
- Refresh Token.
- Gestión de usuarios.
- Roles.
- Permisos.

### Base de Datos

IdentityDB

---

## 6.2 Ticket Service

### Responsabilidad

Administrar incidencias y solicitudes.

### Funciones

- Crear tickets.
- Asignación.
- Estados.
- Prioridades.
- Comentarios.
- Historial.

### Base de Datos

TicketDB

---

## 6.3 Asset Service

### Responsabilidad

Administrar activos tecnológicos.

### Funciones

- Equipos.
- Impresoras.
- Proyectores.
- Laboratorios.
- Salas.
- Historial.

### Base de Datos

AssetDB

---

## 6.4 Notification Service

### Responsabilidad

Gestionar comunicaciones.

### Funciones

- Correos electrónicos.
- Alertas.
- Recordatorios.
- Notificaciones automáticas.

### Base de Datos

NotificationDB

---

## 6.5 Reporting Service

### Responsabilidad

Generar indicadores.

### Funciones

- Dashboard.
- Estadísticas.
- Exportación.
- Métricas SLA.

### Base de Datos

ReportingDB

---

## 6.6 Knowledge Base Service

### Responsabilidad

Administrar artículos de conocimiento.

### Funciones

- Artículos.
- Soluciones frecuentes.
- Búsquedas.
- Versionado.

### Base de Datos

KnowledgeDB

---

## 6.7 Audit Service

### Responsabilidad

Registrar auditoría del sistema.

### Funciones

- Eventos.
- Cambios.
- Accesos.
- Historial.

### Base de Datos

AuditDB

---

# 7. Comunicación entre Servicios

## Comunicación Sincrónica

REST API.

Ejemplos:

```
Frontend

↓

API Gateway

↓

Ticket Service
```

---

## Comunicación Asíncrona

Eventos.

Ejemplo:

```
Ticket Created

↓

Message Broker

↓

Notification Service

↓

Send Email
```

Otros eventos:

- TicketAssigned
- TicketClosed
- UserCreated
- AssetUpdated

---

# 8. Message Broker

## Objetivo

Desacoplar los servicios mediante eventos.

Tecnologías evaluadas:

| Tecnología | Estado |
|------------|--------|
| RabbitMQ | Principal candidato |
| Apache Kafka | Evaluación futura |
| Redis Streams | Alternativa para cargas moderadas |

---

# 9. Base de Datos por Servicio

Cada microservicio será propietario de sus datos.

```
Identity

↓

IdentityDB

----------------------

Tickets

↓

TicketDB

----------------------

Assets

↓

AssetDB

----------------------

Notifications

↓

NotificationDB
```

Beneficios:

- Bajo acoplamiento.
- Escalabilidad.
- Independencia.
- Despliegue autónomo.

---

# 10. Descubrimiento de Servicios

En una etapa futura podrán utilizarse mecanismos de Service Discovery.

Tecnologías candidatas:

- Consul
- Kubernetes DNS
- Eureka

---

# 11. Seguridad

Todos los servicios deberán implementar:

- HTTPS.
- JWT.
- Validación RBAC.
- Cifrado de secretos.
- Auditoría.

---

# 12. Observabilidad

Cada servicio deberá exponer:

- Logs estructurados.
- Health Checks.
- Métricas.
- Trazabilidad distribuida.

Tecnologías propuestas:

- Prometheus
- Grafana
- Loki
- OpenTelemetry

---

# 13. Contenerización

Cada servicio tendrá su propia imagen Docker.

Ejemplo:

```
identity-service

ticket-service

asset-service

notification-service

report-service
```

---

# 14. Orquestación

En producción se contempla el uso de Kubernetes.

Funciones:

- Escalado automático.
- Rolling Updates.
- Auto Recovery.
- Balanceo de carga.

---

# 15. CI/CD

Cada microservicio tendrá un pipeline independiente.

```
Commit

↓

Build

↓

Tests

↓

Docker Image

↓

Registry

↓

Deploy
```

---

# 16. Beneficios Esperados

- Escalado independiente.
- Despliegues desacoplados.
- Alta disponibilidad.
- Mejor mantenibilidad.
- Mayor resiliencia.
- Integración sencilla con nuevos servicios.

---

# 17. Riesgos

- Mayor complejidad operativa.
- Necesidad de observabilidad.
- Comunicación distribuida.
- Gestión de consistencia entre servicios.
- Incremento en infraestructura.

---

# 18. Evolución Prevista

| Fase | Arquitectura |
|------|--------------|
| MVP | Modular |
| Fase 2 | Modular por dominios |
| Fase 3 | Microservicios principales |
| Fase 4 | SaaS Multi-Tenant |

---

# Control de Versiones

| Versión | Fecha | Descripción |
|----------|--------|-------------|
| 0.1 | 2026-07-12 | Primera definición de la arquitectura de microservicios |