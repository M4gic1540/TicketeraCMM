# Architecture Decisions

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform |
| Documento | Architecture Decisions |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

Este documento registra las decisiones arquitectónicas relevantes tomadas durante el diseño y evolución de Agile Service Desk Platform (ASDP).

Cada decisión incluye:

- Contexto.
- Problema identificado.
- Alternativas evaluadas.
- Decisión adoptada.
- Consecuencias.

El objetivo es mantener trazabilidad arquitectónica y facilitar futuras modificaciones del sistema.

---

# 2. Principios de Decisión

Las decisiones arquitectónicas de ASDP se basan en:

- Simplicidad operacional.
- Evolución progresiva.
- Bajo acoplamiento.
- Mantenibilidad.
- Seguridad.
- Escalabilidad.
- Alineación con necesidades del negocio.

---

# ADR-001 Arquitectura Modular Inicial

## Estado

Aceptada

## Fecha

2026-07-12

---

## Contexto

ASDP requiere una arquitectura que permita validar rápidamente el producto y evolucionar posteriormente hacia una solución empresarial.

Una arquitectura basada directamente en múltiples microservicios aumenta la complejidad inicial:

- Mayor infraestructura.
- Mayor costo operacional.
- Mayor dificultad de despliegue.
- Mayor tiempo de desarrollo.

---

## Problema

¿Cómo diseñar una arquitectura que permita crecimiento futuro sin introducir complejidad innecesaria?

---

## Alternativas Evaluadas

### Opción 1: Monolito tradicional

Ventajas:

- Desarrollo rápido.
- Fácil despliegue.

Desventajas:

- Mayor acoplamiento.
- Difícil evolución.

---

### Opción 2: Microservicios desde el inicio

Ventajas:

- Alta escalabilidad.
- Separación independiente.

Desventajas:

- Mayor complejidad.
- Requiere infraestructura adicional.

---

### Opción 3: Arquitectura Modular Evolutiva

Ventajas:

- Separación lógica.
- Menor complejidad inicial.
- Preparada para extracción futura.

---

## Decisión

Implementar ASDP inicialmente como una aplicación modular siguiendo principios de Clean Architecture.

La separación por dominios permitirá evolucionar hacia microservicios cuando exista una necesidad real.

---

## Consecuencias

Positivas:

- Desarrollo más rápido.
- Menor complejidad operacional.
- Fácil mantenimiento.

Negativas:

- Algunos módulos compartirán infraestructura inicialmente.

---

# ADR-002 Uso de Clean Architecture

## Estado

Aceptada

---

## Contexto

El sistema requiere mantenerse durante varios años y permitir incorporación de nuevas funcionalidades.

---

## Problema

Evitar que la lógica de negocio quede acoplada a frameworks o tecnologías específicas.

---

## Alternativas

### Arquitectura MVC tradicional

Problemas:

- Mezcla responsabilidades.
- Difícil evolución.

---

### Clean Architecture

Beneficios:

- Separación de capas.
- Mayor facilidad de pruebas.
- Independencia tecnológica.

---

## Decisión

Utilizar Clean Architecture como patrón estructural principal.

Capas:

```
Domain

Application

Infrastructure

Presentation
```

---

## Consecuencias

Positivas:

- Código mantenible.
- Mejor capacidad de testing.

Negativas:

- Mayor cantidad de archivos.
- Mayor curva inicial.

---

# ADR-003 Implementación de Domain Driven Design

## Estado

Aceptada

---

## Contexto

ASDP representa procesos reales de gestión de servicios TI.

---

## Problema

Evitar diseñar el sistema únicamente desde una perspectiva técnica.

---

## Decisión

Modelar el sistema utilizando conceptos del negocio.

Dominios iniciales:

```
Identity

Ticket Management

Asset Management

Notification

Reporting
```

---

## Consecuencias

Positivas:

- Código alineado al negocio.
- Mejor comunicación con stakeholders.

Negativas:

- Requiere análisis previo del dominio.

---

# ADR-004 Base de Datos PostgreSQL

## Estado

Aceptada

---

## Contexto

ASDP requiere almacenar información estructurada:

- Usuarios.
- Tickets.
- Activos.
- Historial.
- Auditoría.

---

## Alternativas

### MySQL

Ventajas:

- Amplio uso.
- Fácil administración.

---

### PostgreSQL

Ventajas:

- Excelente soporte relacional.
- Funciones avanzadas.
- Integridad fuerte.
- Open Source.

---

## Decisión

Utilizar PostgreSQL como base de datos principal.

---

## Consecuencias

Positivas:

- Alta confiabilidad.
- Buen soporte empresarial.

Negativas:

- Requiere administración adecuada.

---

# ADR-005 API REST como mecanismo inicial de comunicación

## Estado

Aceptada

---

## Contexto

Frontend y backend requieren comunicación simple y estándar.

---

## Alternativas

- GraphQL.
- SOAP.
- REST.

---

## Decisión

Utilizar REST API como primera estrategia de comunicación.

---

## Consecuencias

Positivas:

- Fácil integración.
- Amplio soporte.
- Simplicidad.

Negativas:

- Puede requerir optimización para escenarios complejos.

---

# ADR-006 Uso de JWT para autenticación

## Estado

Aceptada

---

## Contexto

La plataforma requiere autenticación segura y soporte para múltiples clientes.

---

## Alternativas

- Sesiones tradicionales.
- OAuth completo.
- JWT.

---

## Decisión

Utilizar JWT con refresh tokens.

---

## Consecuencias

Positivas:

- Arquitectura preparada para APIs.
- Fácil integración futura.

Negativas:

- Requiere gestión correcta de expiración.

---

# ADR-007 Uso de RabbitMQ para comunicación asíncrona futura

## Estado

Propuesta

---

## Contexto

ASDP requiere ejecutar acciones desacopladas:

Ejemplo:

```
Ticket creado

      |

Enviar notificación

      |

Actualizar métricas
```

---

## Alternativas

- Comunicación directa.
- Kafka.
- RabbitMQ.

---

## Decisión

Utilizar RabbitMQ como broker inicial cuando la arquitectura lo requiera.

---

## Consecuencias

Positivas:

- Desacoplamiento.
- Procesamiento asíncrono.

Negativas:

- Mayor infraestructura.

---

# ADR-008 Uso de Docker para ambientes

## Estado

Aceptada

---

## Contexto

Se requiere mantener consistencia entre ambientes.

---

## Decisión

Utilizar contenedores Docker.

Ambientes:

- Desarrollo.
- Testing.
- Producción.

---

## Consecuencias

Positivas:

- Portabilidad.
- Instalación reproducible.

Negativas:

- Requiere conocimiento de contenedores.

---

# ADR-009 Implementación CI/CD

## Estado

Aceptada

---

## Contexto

La calidad del software requiere automatización.

---

## Decisión

Implementar pipelines CI/CD.

Flujo:

```
Commit

 ↓

Build

 ↓

Tests

 ↓

Deploy
```

---

## Herramientas

- GitHub Actions.
- Docker.
- Testing automatizado.

---

# ADR-010 Preparación para modelo SaaS Multi-Tenant

## Estado

Propuesta

---

## Contexto

ASDP podría evolucionar hacia un producto SaaS para múltiples organizaciones.

---

## Problema

Evitar diseñar una solución limitada a un único cliente.

---

## Decisión

Diseñar considerando futura separación lógica por organización.

---

## Consideraciones futuras

- Tenant ID.
- Separación de datos.
- Configuración por cliente.
- Administración independiente.

---

# Resumen de Decisiones

| ADR | Decisión | Estado |
|-|-|-|
| ADR-001 | Arquitectura modular evolutiva | Aceptada |
| ADR-002 | Clean Architecture | Aceptada |
| ADR-003 | Domain Driven Design | Aceptada |
| ADR-004 | PostgreSQL | Aceptada |
| ADR-005 | REST API | Aceptada |
| ADR-006 | JWT | Aceptada |
| ADR-007 | RabbitMQ | Propuesta |
| ADR-008 | Docker | Aceptada |
| ADR-009 | CI/CD | Aceptada |
| ADR-010 | SaaS Multi-Tenant | Propuesta |

---

# Control de Versiones

| Versión | Fecha | Descripción |
|-|-|-|
| 0.1 | 2026-07-12 | Creación inicial de decisiones arquitectónicas |