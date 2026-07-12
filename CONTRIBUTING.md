# Contributing to Agile Service Desk Platform (ASDP)

Gracias por tu interés en contribuir a **Agile Service Desk Platform (ASDP)**.

ASDP es una plataforma ITSM orientada a la gestión moderna de servicios tecnológicos, diseñada bajo principios de arquitectura limpia, Domain-Driven Design (DDD), buenas prácticas DevOps y desarrollo colaborativo.

Este documento define las reglas y procesos para contribuir al proyecto.

---

# 📌 Código de Conducta

Todos los colaboradores deben mantener un ambiente profesional y respetuoso.

Se espera:

- Comunicación clara y respetuosa.
- Discusión técnica basada en argumentos.
- Respeto por diferentes niveles de experiencia.
- Enfoque en mejorar la calidad del producto.

No se aceptan:

- Ataques personales.
- Discriminación.
- Acoso.
- Publicación de información sensible.

---

# 🚀 Cómo contribuir

Las contribuciones pueden realizarse mediante:

- Reporte de errores.
- Nuevas funcionalidades.
- Mejoras de documentación.
- Mejoras de arquitectura.
- Optimización de rendimiento.
- Pruebas automatizadas.

Antes de comenzar una contribución:

1. Revisar los issues existentes.
2. Crear un issue si la funcionalidad no existe.
3. Esperar aprobación para cambios importantes.
4. Crear una rama de desarrollo.

---

# 🌱 Flujo de trabajo Git

ASDP utiliza una estrategia basada en **Git Flow**.

## Branch principales

### main

Contiene versiones estables del proyecto.

Ejemplo:

```
main
 |
 v1.0.0
```

---

### develop

Contiene la integración de nuevas funcionalidades.

Ejemplo:

```
develop
 |
 feature/login
 feature/tickets
```

---

# Branch de funcionalidades

Las nuevas funcionalidades deben crearse desde `develop`.

Formato:

```
feature/nombre-funcionalidad
```

Ejemplos:

```
feature/authentication
feature/ticket-management
feature/dashboard
feature/asset-module
```

---

# Correcciones

Para solucionar errores:

```
bugfix/nombre-error
```

Ejemplo:

```
bugfix/login-validation
bugfix/database-connection
```

---

# Hotfix

Para errores críticos en producción:

```
hotfix/version-description
```

Ejemplo:

```
hotfix/security-authentication
```

---

# 📝 Commits

ASDP utiliza **Conventional Commits**.

Formato:

```
type(scope): description
```

Ejemplo:

```
feat(ticket): add ticket creation endpoint
fix(auth): resolve JWT expiration issue
docs(readme): update installation guide
```

---

# Tipos permitidos

| Tipo | Descripción |
|-|-|
| feat | Nueva funcionalidad |
| fix | Corrección de errores |
| docs | Cambios documentación |
| style | Formato o estilos |
| refactor | Refactorización |
| test | Nuevas pruebas |
| chore | Mantenimiento |
| perf | Mejoras rendimiento |
| security | Cambios seguridad |

---

# Ejemplos correctos

```
feat(asset): create asset management module

fix(api): resolve invalid ticket response

docs(changelog): update release notes

test(ticket): add ticket service tests
```

---

# 🏗️ Estándares de desarrollo

Todo código debe cumplir:

## Arquitectura

Respetar:

- Clean Architecture.
- Domain-Driven Design.
- Principios SOLID.
- Separación de responsabilidades.

---

## Backend

Buenas prácticas:

- Validación de datos.
- Manejo correcto de excepciones.
- Documentación de endpoints.
- Pruebas unitarias.
- Código mantenible.

---

## Frontend

Buenas prácticas:

- Componentes reutilizables.
- Manejo correcto del estado.
- Diseño responsive.
- Accesibilidad.
- Código limpio.

---

# 🧪 Testing

Toda nueva funcionalidad debe incluir pruebas.

Tipos esperados:

## Unit Testing

Validación de:

- Servicios.
- Casos de uso.
- Reglas de negocio.

---

## Integration Testing

Validación de:

- APIs.
- Base de datos.
- Comunicación entre servicios.

---

## End-to-End

Validación del flujo completo:

Ejemplo:

```
Usuario crea ticket

↓

Sistema asigna prioridad

↓

Técnico recibe notificación

↓

Ticket es cerrado
```

---

# 📚 Documentación

Los cambios importantes deben actualizar:

- README.md
- CHANGELOG.md
- ROADMAP.md
- Documentación técnica

Los nuevos módulos deben incluir:

- Descripción.
- Arquitectura.
- Modelo de dominio.
- API documentation.

---

# 🔍 Pull Requests

Toda contribución debe realizarse mediante Pull Request.

Una Pull Request debe incluir:

## Título

Utilizar Conventional Commits.

Ejemplo:

```
feat(ticket): implement ticket assignment
```

---

## Descripción

Debe explicar:

- Qué problema resuelve.
- Qué cambios fueron realizados.
- Cómo probarlos.
- Capturas si aplica.

Ejemplo:

```markdown
## Description

Implementación del módulo de asignación automática de tickets.

## Changes

- Nuevo servicio AssignmentService.
- Nuevo endpoint POST /tickets/:id/assign.
- Validaciones agregadas.

## Testing

- Unit tests ejecutados.
- API validada mediante Postman.
```

---

# ✅ Checklist Pull Request

Antes de solicitar revisión:

- [ ] El código compila.
- [ ] Los tests pasan.
- [ ] Se agregó documentación.
- [ ] Se actualizó CHANGELOG.md.
- [ ] No existen credenciales expuestas.
- [ ] Se aplicaron reglas de lint.
- [ ] Se revisó la arquitectura.

---

# 🔐 Seguridad

Nunca subir:

- Contraseñas.
- Tokens.
- Claves API.
- Variables privadas.
- Archivos `.env`.

Utilizar:

```
.env.example
```

para documentar variables necesarias.

---

# 🏷️ Versionamiento

ASDP utiliza Semantic Versioning:

```
MAJOR.MINOR.PATCH
```

Ejemplo:

```
1.2.3
```

Donde:

- MAJOR → Cambios incompatibles.
- MINOR → Nuevas funcionalidades.
- PATCH → Correcciones.

---

# 🛠️ Ambiente de Desarrollo

Requisitos mínimos:

- Git
- Docker
- Docker Compose
- Node.js
- PostgreSQL

---

# Instalación

Ejemplo:

```bash
git clone repository-url

cd asdp

docker compose up -d
```

---

# 🧭 Proceso de contribución

Resumen:

```
Fork Repository

↓

Create Branch

↓

Develop Feature

↓

Run Tests

↓

Commit Changes

↓

Create Pull Request

↓

Code Review

↓

Merge
```

---

# Reconocimientos

Todas las contribuciones serán reconocidas dentro del proyecto.

Gracias por ayudar a mejorar **Agile Service Desk Platform (ASDP)**.