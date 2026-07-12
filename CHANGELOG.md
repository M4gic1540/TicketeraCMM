# Changelog

Todos los cambios importantes realizados en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/)
y el proyecto utiliza [Semantic Versioning](https://semver.org/lang/es/).

---

# [Unreleased]

Cambios pendientes de la próxima versión.

## Added

- Preparación inicial de la plataforma ITSM.
- Definición del alcance funcional de Agile Service Desk Platform (ASDP).
- Diseño inicial de módulos principales:
  - Gestión de Incidentes.
  - Gestión de Solicitudes.
  - Gestión de Usuarios.
  - Gestión de Dependencias.
  - Gestión de Activos.

## Technical

- Definición inicial de arquitectura basada en:
  - Clean Architecture.
  - Domain-Driven Design (DDD).
  - Principios SOLID.
  - Arquitectura orientada a microservicios.

---

# [0.1.0] - 2026-07-12

## Added

### Project Foundation

- Creación inicial del proyecto Agile Service Desk Platform (ASDP).
- Definición del propósito de la plataforma como solución ITSM.
- Documentación inicial del producto.

### Documentation

Se agregaron documentos base del proyecto:

- `README.md`
- `ROADMAP.md`
- `LICENSE`
- `CHANGELOG.md`

### Product Definition

Se definieron los primeros conceptos del dominio:

- Incidente.
- Solicitud de servicio.
- Técnico.
- Usuario solicitante.
- Dependencia.
- Activo tecnológico.
- Categoría.
- Prioridad.
- Estado del ticket.

### Architecture

Definición preliminar de la arquitectura:

- Frontend separado del backend.
- API REST como mecanismo de comunicación.
- Preparación para evolución hacia microservicios.
- Diseño orientado a escalabilidad.

---

# [0.0.1] - 2026-07-12

## Added

### Initial Planning

- Creación del concepto inicial de Agile Service Desk Platform.
- Identificación del problema:

  - Falta de trazabilidad en solicitudes TI.
  - Uso de herramientas genéricas para gestión de soporte.
  - Dificultad para obtener métricas operacionales.

- Definición de la visión:

> Construir una plataforma ITSM moderna para gestionar servicios tecnológicos mediante automatización, trazabilidad y análisis de datos.

---

# Version History

| Version | Date | Description |
|---|---|---|
| 0.0.1 | 2026-07-12 | Inicio conceptual del proyecto |
| 0.1.0 | 2026-07-12 | Base documental y definición inicial |
| Unreleased | - | Próximos cambios |

---

# Versioning Strategy

ASDP utiliza Semantic Versioning:

```
MAJOR.MINOR.PATCH

Ejemplo:

1.0.0

1 → Cambios incompatibles.
0 → Nuevas funcionalidades.
0 → Correcciones pequeñas.
```

Ejemplos:

```
1.0.0
Primera versión estable.

1.1.0
Nueva funcionalidad compatible.

1.1.1
Corrección de errores.
```

---

# Release Process

Cada versión estable debe incluir:

- Código fuente versionado.
- Documentación actualizada.
- Migraciones de base de datos.
- Pruebas automatizadas.
- Notas de cambios.
- Etiqueta Git correspondiente.

Ejemplo:

```bash
git tag -a v1.0.0 -m "Release 1.0.0"
git push origin v1.0.0
```

---

# Future Releases

Próximas versiones planificadas:

## v0.2.0

Objetivo:

- Inicio del desarrollo Backend.
- Sistema de autenticación.
- Gestión básica de usuarios.
- Primer modelo de tickets.

---

## v0.3.0

Objetivo:

- Gestión completa de incidencias.
- Estados.
- Prioridades.
- Asignación.
- Comentarios.

---

## v1.0.0

Objetivo:

Primera versión MVP funcional.

Incluye:

- Autenticación.
- Tickets.
- Dependencias.
- Usuarios.
- Dashboard.
- Gestión básica del ciclo de vida ITSM.