# API Design Specification

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform (ASDP) |
| Documento | API Design Specification |
| Versión | 1.0 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

Este documento define los principios de diseño, convenciones y lineamientos para las APIs de Agile Service Desk Platform (ASDP).

Su objetivo es garantizar consistencia, mantenibilidad y facilidad de integración entre los distintos componentes de la plataforma.

---

# 2. Arquitectura

Durante el MVP la plataforma expondrá una API REST centralizada.

En fases posteriores, cada microservicio publicará su propia API a través de un API Gateway.

```text
Cliente

↓

API Gateway

↓

Backend

↓

PostgreSQL
```

Arquitectura objetivo:

```text
Cliente

↓

API Gateway

↓

Identity Service

Ticket Service

Asset Service

Notification Service

Reporting Service
```

---

# 3. Estilo de API

La plataforma utilizará REST como estilo arquitectónico.

Características:

- Stateless.
- Recursos identificados mediante URI.
- Uso de métodos HTTP estándar.
- Respuestas en formato JSON.
- Versionado de API.

---

# 4. URL Base

Durante desarrollo:

```text
http://localhost:3000/api/v1
```

Producción:

```text
https://api.asdp.example.com/v1
```

---

# 5. Versionado

Formato:

```text
/api/v1
```

Ejemplos:

```text
/api/v1/tickets

/api/v1/users

/api/v2/tickets
```

Las nuevas funcionalidades deberán ser compatibles mientras sea posible.

---

# 6. Formato de Datos

Todas las solicitudes y respuestas utilizarán JSON.

Ejemplo:

```json
{
  "id": "uuid",
  "title": "No puedo imprimir",
  "status": "OPEN"
}
```

---

# 7. Métodos HTTP

| Método | Uso |
|---------|-----|
| GET | Consultar recursos |
| POST | Crear recursos |
| PUT | Reemplazar un recurso |
| PATCH | Actualizar parcialmente |
| DELETE | Eliminar o desactivar un recurso |

---

# 8. Convenciones de URI

Las rutas deberán:

- Utilizar sustantivos.
- Estar en minúsculas.
- Usar guiones cuando sea necesario.
- Evitar verbos.

Ejemplos:

```text
GET /tickets

POST /tickets

GET /tickets/{id}

PATCH /tickets/{id}

DELETE /tickets/{id}
```

---

# 9. Recursos Principales

## Usuarios

```text
/api/v1/users
```

Operaciones:

- Crear.
- Consultar.
- Actualizar.
- Desactivar.

---

## Tickets

```text
/api/v1/tickets
```

Operaciones:

- Crear.
- Consultar.
- Asignar.
- Cambiar estado.
- Cerrar.

---

## Activos

```text
/api/v1/assets
```

Operaciones:

- Registrar.
- Consultar.
- Actualizar.
- Asociar a tickets.

---

## Categorías

```text
/api/v1/categories
```

---

## Prioridades

```text
/api/v1/priorities
```

---

## Estados

```text
/api/v1/statuses
```

---

## Roles

```text
/api/v1/roles
```

---

## Reportes

```text
/api/v1/reports
```

---

# 10. Paginación

Las colecciones deberán soportar paginación.

Ejemplo:

```text
GET /tickets?page=1&size=20
```

Respuesta:

```json
{
  "page": 1,
  "size": 20,
  "totalElements": 245,
  "totalPages": 13,
  "content": []
}
```

---

# 11. Filtrado

Ejemplos:

```text
GET /tickets?status=OPEN

GET /tickets?priority=HIGH

GET /tickets?assignedTo=userId
```

---

# 12. Ordenamiento

Ejemplo:

```text
GET /tickets?sort=createdAt,desc
```

---

# 13. Búsquedas

Ejemplo:

```text
GET /tickets?search=impresora
```

---

# 14. Autenticación

Todas las rutas protegidas requerirán JWT.

Ejemplo:

```http
Authorization: Bearer <token>
```

---

# 15. Autorización

El acceso dependerá de los roles asignados.

Ejemplos:

- Administrador
- Supervisor
- Técnico
- Usuario Final

---

# 16. Códigos HTTP

| Código | Significado |
|---------|-------------|
| 200 | OK |
| 201 | Created |
| 204 | No Content |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 409 | Conflict |
| 422 | Unprocessable Entity |
| 500 | Internal Server Error |

---

# 17. Formato de Error

Todas las respuestas de error deberán seguir el mismo formato.

```json
{
  "timestamp": "2026-07-12T18:30:00Z",
  "status": 404,
  "error": "Not Found",
  "code": "TICKET_NOT_FOUND",
  "message": "El ticket solicitado no existe.",
  "path": "/api/v1/tickets/123"
}
```

---

# 18. Idempotencia

Las operaciones deberán cumplir:

- GET → Idempotente
- PUT → Idempotente
- DELETE → Idempotente
- POST → No necesariamente idempotente
- PATCH → Depende de la implementación

---

# 19. Seguridad

La API deberá implementar:

- HTTPS.
- JWT.
- Validación de entrada.
- Rate Limiting.
- Protección contra ataques comunes (OWASP Top 10).
- Registro de auditoría.

---

# 20. Documentación

La documentación técnica será generada automáticamente mediante OpenAPI.

Herramientas sugeridas:

- Swagger UI
- OpenAPI 3.1

---

# 21. Evolución

## MVP

- API REST monolítica modular.

## Versión 1.0

- API documentada con OpenAPI.

## Versión 2.0

- API Gateway.

## Evolución

- APIs independientes por microservicio.

---

# Referencias

- Architecture.md
- Microservices.md
- Authentication.md
- Authorization.md
- OpenAPI Specification 3.1
- REST Architectural Style (Roy Fielding)

---

# Control de Versiones

| Versión | Fecha | Descripción |
|----------|--------|-------------|
| 1.0 | 2026-07-12 | Definición inicial de la especificación de diseño de la API. |