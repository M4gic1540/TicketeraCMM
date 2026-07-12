# 🗺️ Agile Service Desk Platform (ASDP) - Roadmap

> Plataforma ITSM moderna para la gestión de servicios tecnológicos basada en arquitectura de microservicios, Domain-Driven Design (DDD), Clean Architecture y DevOps.

---

# 🎯 Visión

Convertir ASDP en una plataforma ITSM moderna capaz de gestionar el ciclo completo del soporte tecnológico para organizaciones de distintos tamaños, proporcionando automatización, trazabilidad, métricas y escalabilidad.

---

# Estado del Proyecto

| Fase | Estado |
|--------|--------|
| Investigación | ✅ Completado |
| Análisis de Requerimientos | 🔄 En progreso |
| Diseño Arquitectónico | ⏳ Pendiente |
| Desarrollo MVP | ⏳ Pendiente |
| Plataforma Empresarial | ⏳ Pendiente |
| SaaS Multiempresa | ⏳ Pendiente |

---

# Roadmap

---

# 📌 Fase 0 — Descubrimiento y Diseño

**Objetivo**

Definir completamente el producto antes de comenzar el desarrollo.

## Entregables

- [x] BRD
- [x] PRD
- [x] FRD
- [ ] SDD
- [ ] Casos de uso
- [ ] Diagramas UML
- [ ] Modelo de dominio
- [ ] Event Storming
- [ ] C4 Model
- [ ] Arquitectura de Microservicios
- [ ] Diseño Base de Datos
- [ ] API Contract

---

# 🚀 Fase 1 — MVP

Objetivo: disponer de una plataforma funcional para la gestión básica de incidencias.

## Autenticación

- [ ] Login
- [ ] Logout
- [ ] JWT
- [ ] Refresh Token
- [ ] Roles
- [ ] Permisos

---

## Dashboard

- [ ] Tickets abiertos
- [ ] Tickets cerrados
- [ ] Mis tareas
- [ ] Prioridades
- [ ] Estado del sistema

---

## Gestión de Tickets

- [ ] Crear Ticket
- [ ] Editar Ticket
- [ ] Eliminar Ticket
- [ ] Asignar Ticket
- [ ] Cambiar Estado
- [ ] Comentarios
- [ ] Adjuntos
- [ ] Historial

---

## Dependencias

- [ ] Crear Dependencia
- [ ] Editar Dependencia
- [ ] Eliminar Dependencia

Ejemplos:

- Sala
- Auditorio
- Oficina
- Laboratorio
- Biblioteca

---

## Categorías

- [ ] Hardware
- [ ] Software
- [ ] Redes
- [ ] Audiovisual
- [ ] Impresoras
- [ ] Telefonía

---

## Prioridades

- [ ] Baja
- [ ] Media
- [ ] Alta
- [ ] Crítica

---

## Estados

- [ ] Nuevo
- [ ] En revisión
- [ ] Asignado
- [ ] En progreso
- [ ] Esperando usuario
- [ ] Resuelto
- [ ] Cerrado

---

## Usuarios

- [ ] Técnicos
- [ ] Solicitantes
- [ ] Administradores

---

# 🏢 Fase 2 — Gestión ITSM

Objetivo: incorporar funcionalidades propias de una plataforma ITSM.

## SLA

- [ ] Definición de SLA
- [ ] Tiempo de respuesta
- [ ] Tiempo de resolución
- [ ] Incumplimientos
- [ ] Alertas

---

## Gestión de Activos

- [ ] Computadores
- [ ] Notebooks
- [ ] Impresoras
- [ ] Switches
- [ ] Routers
- [ ] Proyectores
- [ ] Monitores

Cada activo tendrá:

- Código
- Marca
- Modelo
- Número de serie
- Ubicación
- Estado
- Historial

---

## Relación Ticket ↔ Activo

- [ ] Asociar activo
- [ ] Historial
- [ ] Cambios

---

## Base de Conocimiento

- [ ] Artículos
- [ ] Búsqueda
- [ ] Etiquetas
- [ ] Versionado

---

## Catálogo de Servicios

- [ ] Solicitud de software
- [ ] Solicitud de hardware
- [ ] Accesos
- [ ] Redes
- [ ] Equipamiento

---

# 📊 Fase 3 — Analítica

Objetivo: medir el desempeño del área TI.

## Dashboard Ejecutivo

- [ ] Tickets por mes
- [ ] Tickets por categoría
- [ ] Tickets por dependencia
- [ ] SLA
- [ ] Tiempo promedio
- [ ] Técnicos más activos

---

## Reportes

- [ ] PDF
- [ ] Excel
- [ ] CSV

---

## KPIs

- [ ] MTTR
- [ ] MTBF
- [ ] SLA
- [ ] Tiempo promedio
- [ ] Productividad

---

# 🔔 Fase 4 — Automatización

Objetivo: reducir trabajo manual.

## Notificaciones

- [ ] Email
- [ ] Teams
- [ ] Slack
- [ ] Webhook

---

## Automatizaciones

- [ ] Asignación automática
- [ ] Cambio automático de estado
- [ ] Recordatorios
- [ ] Escalamiento

---

## Reglas

Ejemplo:

```
Si prioridad = Crítica

→ Notificar inmediatamente
→ Asignar supervisor
→ SLA 30 minutos
```

---

# ☁️ Fase 5 — Arquitectura Empresarial

Objetivo: migrar completamente a microservicios.

## Servicios

- [ ] API Gateway
- [ ] Auth Service
- [ ] Ticket Service
- [ ] Asset Service
- [ ] Notification Service
- [ ] User Service
- [ ] Dashboard Service
- [ ] Reporting Service

---

## Comunicación

- [ ] RabbitMQ
- [ ] Eventos de Dominio
- [ ] Event Bus

---

## Base de Datos

Cada servicio tendrá su propia base de datos PostgreSQL.

---

# 🐳 Fase 6 — DevOps

## Docker

- [ ] Dockerfiles
- [ ] Docker Compose

---

## CI/CD

- [ ] GitHub Actions
- [ ] Tests automáticos
- [ ] Lint
- [ ] Build
- [ ] Deploy

---

## Calidad

- [ ] SonarQube
- [ ] ESLint
- [ ] Prettier

---

# 📈 Fase 7 — Observabilidad

## Logs

- [ ] Loki

---

## Métricas

- [ ] Prometheus

---

## Dashboards

- [ ] Grafana

---

## Trazabilidad

- [ ] OpenTelemetry

---

# 🔒 Fase 8 — Seguridad

## Autenticación

- [ ] JWT
- [ ] Refresh Token
- [ ] OAuth2

---

## Autorización

- [ ] RBAC
- [ ] Permisos

---

## Seguridad

- [ ] Rate Limiting
- [ ] Helmet
- [ ] CORS
- [ ] Auditoría

---

# 🤖 Fase 9 — Inteligencia Artificial

## IA

- [ ] Clasificación automática
- [ ] Priorización automática
- [ ] Predicción de SLA
- [ ] Recomendación de técnico
- [ ] Chatbot
- [ ] Búsqueda semántica

---

# 🌎 Fase 10 — SaaS

Objetivo: convertir ASDP en una plataforma comercial.

## Multiempresa

- [ ] Multi Tenant
- [ ] Organizaciones
- [ ] Suscripciones

---

## Facturación

- [ ] Planes
- [ ] Pagos
- [ ] Renovaciones

---

## Administración

- [ ] Panel de administración
- [ ] Gestión de clientes
- [ ] Métricas globales

---

# 📱 Fase 11 — Aplicaciones

## Mobile

- [ ] React Native

---

## Desktop

- [ ] Electron

---

# 🔮 Futuro

- IA Generativa
- Integración con Microsoft 365
- Integración con Google Workspace
- Integración con Active Directory
- Integración con LDAP
- CMDB completa
- ITIL v4
- Gestión de Cambios
- Gestión de Problemas
- Gestión de Configuración
- Gestión de Versiones
- API Pública
- Marketplace de Integraciones

---

# 🏁 Objetivo Final

ASDP aspira a convertirse en una plataforma ITSM de nivel empresarial, diseñada para organizaciones que requieren una gestión moderna, escalable y basada en datos de sus servicios tecnológicos. El proyecto busca evolucionar desde un MVP funcional hasta una solución SaaS multiempresa con capacidades de automatización, analítica avanzada e inteligencia artificial, manteniendo una arquitectura alineada con las mejores prácticas de la industria.