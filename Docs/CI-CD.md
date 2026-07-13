# Continuous Integration & Continuous Delivery (CI/CD)

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform (ASDP) |
| Documento | CI/CD |
| Versión | 1.0 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Objetivo

Este documento define la estrategia de Integración Continua (CI) y Entrega Continua (CD) utilizada por Agile Service Desk Platform (ASDP).

El propósito es garantizar que cada cambio realizado en el código sea validado automáticamente mediante pruebas, análisis de calidad y controles de seguridad antes de ser desplegado en los distintos ambientes.

---

# 2. Objetivos Específicos

- Automatizar el proceso de construcción del software.
- Detectar errores tempranamente.
- Garantizar la calidad del código.
- Automatizar pruebas.
- Automatizar despliegues.
- Reducir riesgos durante las liberaciones.
- Mantener trazabilidad de cada versión.

---

# 3. Principios

La estrategia CI/CD de ASDP se basa en:

- Automatización.
- Repetibilidad.
- Versionamiento.
- Seguridad.
- Observabilidad.
- Despliegues pequeños y frecuentes.

---

# 4. Flujo General

```text
Developer

↓

Feature Branch

↓

Commit

↓

Push

↓

GitHub

↓

GitHub Actions

↓

CI Pipeline

↓

Tests

↓

Build

↓

Docker Image

↓

Container Registry

↓

CD Pipeline

↓

Development

↓

Testing

↓

Staging

↓

Production
```

---

# 5. Estrategia Git

## Branch Principal

```
main
```

Contiene únicamente versiones estables.

---

## Branch de Desarrollo

```
develop
```

Integra nuevas funcionalidades.

---

## Feature Branch

```
feature/login

feature/tickets

feature/assets
```

Cada funcionalidad se desarrolla de forma independiente.

---

## Bugfix

```
bugfix/authentication

bugfix/dashboard
```

Correcciones durante el desarrollo.

---

## Hotfix

```
hotfix/security-patch
```

Correcciones urgentes sobre producción.

---

# 6. Pipeline de Integración Continua (CI)

Cada Push o Pull Request ejecutará automáticamente:

1. Checkout del código.
2. Instalación de dependencias.
3. Validación del formato.
4. Linter.
5. Compilación.
6. Pruebas unitarias.
7. Pruebas de integración.
8. Escaneo de seguridad.
9. Análisis de calidad.
10. Construcción de imágenes Docker.

---

# 7. Pipeline CI

```text
Push

↓

Checkout

↓

Install

↓

Lint

↓

Format

↓

Unit Tests

↓

Integration Tests

↓

Coverage

↓

Static Analysis

↓

Security Scan

↓

Docker Build

↓

Publish Artifact
```

---

# 8. Validaciones Automáticas

Cada Pull Request deberá aprobar:

- Compilación exitosa.
- Linter sin errores.
- Formato correcto.
- Cobertura mínima.
- Pruebas exitosas.
- Sin vulnerabilidades críticas.
- Revisión de código aprobada.

---

# 9. Cobertura de Código

Cobertura mínima requerida:

| Tipo | Cobertura |
|-------|-----------:|
| Backend | ≥ 80 % |
| Frontend | ≥ 80 % |
| Casos críticos | 100 % |

---

# 10. Calidad del Código

Se realizará análisis estático utilizando:

- ESLint
- Prettier
- SonarQube (opcional en etapas iniciales)

Se evaluarán:

- Complejidad ciclomática.
- Código duplicado.
- Code Smells.
- Vulnerabilidades.
- Mantenibilidad.

---

# 11. Seguridad del Pipeline

Cada ejecución verificará:

- Dependencias vulnerables.
- Secretos expuestos.
- Imágenes Docker.
- Librerías desactualizadas.

Herramientas sugeridas:

- Trivy
- CodeQL
- Gitleaks
- Dependabot

---

# 12. Construcción de Contenedores

Cuando el pipeline sea exitoso se construirán imágenes Docker para:

- Frontend
- Backend

Las imágenes serán etiquetadas utilizando SemVer y el identificador del commit.

Ejemplo:

```text
asdp-backend:1.0.0
asdp-backend:1.0.0-4f8d21a
```

---

# 13. Registro de Imágenes

Las imágenes se publicarán en un registro de contenedores.

Alternativas:

- GitHub Container Registry (GHCR)
- Docker Hub
- Amazon ECR

Para el proyecto se recomienda **GitHub Container Registry (GHCR)** por su integración con GitHub Actions y control de acceso.

---

# 14. Entrega Continua (CD)

Los despliegues seguirán la siguiente estrategia:

| Ambiente | Despliegue |
|----------|------------|
| Development | Automático |
| Testing | Automático |
| Staging | Manual o automático según la fase del proyecto |
| Production | Manual con aprobación |

---

# 15. Pipeline CD

```text
Docker Image

↓

Deploy Development

↓

Smoke Tests

↓

Deploy Testing

↓

QA Validation

↓

Deploy Staging

↓

Acceptance Tests

↓

Manual Approval

↓

Deploy Production

↓

Health Checks

↓

Monitoring
```

---

# 16. Gestión de Migraciones

Antes del despliegue se ejecutarán:

- Validación de migraciones.
- Respaldo de la base de datos (producción).
- Aplicación de migraciones.
- Verificación de integridad.

Las migraciones deberán ser reversibles cuando sea posible.

---

# 17. Rollback

En caso de error durante un despliegue:

1. Detener el pipeline.
2. Restaurar la versión anterior.
3. Validar el estado de los servicios.
4. Registrar el incidente.
5. Notificar al equipo.

---

# 18. Monitoreo Posterior al Despliegue

Después de cada despliegue se verificarán:

- Estado de la aplicación.
- Health Checks.
- Logs.
- Uso de CPU.
- Uso de memoria.
- Tiempo de respuesta.
- Errores HTTP.

---

# 19. Métricas DevOps

| Indicador | Objetivo |
|-----------|----------|
| Build Success Rate | ≥ 95 % |
| Cobertura | ≥ 80 % |
| Tiempo de Build | < 10 min |
| Tiempo de Deploy | < 15 min |
| MTTR | Bajo |
| Change Failure Rate | Bajo |

---

# 20. Herramientas

| Área | Herramienta |
|------|-------------|
| Repositorio | GitHub |
| CI/CD | GitHub Actions |
| Contenedores | Docker |
| Registro | GitHub Container Registry |
| Calidad | ESLint, Prettier |
| Análisis Estático | SonarQube (opcional) |
| Seguridad | Trivy, CodeQL, Gitleaks |
| Dependencias | Dependabot |
| Pruebas Backend | Jest |
| Pruebas Frontend | Vitest |
| E2E | Playwright |

---

# 21. Roadmap de Automatización

## MVP

- CI con GitHub Actions.
- Lint.
- Build.
- Pruebas unitarias.
- Docker Build.

---

## Versión 1.0

- Pruebas de integración.
- Escaneo de seguridad.
- Publicación automática de imágenes.

---

## Versión 2.0

- Despliegue automatizado.
- Helm Charts.
- Kubernetes.
- OpenTelemetry.
- Rollback automático.

---

# 22. Buenas Prácticas

- Mantener pipelines rápidos.
- Ejecutar pruebas en cada Pull Request.
- No desplegar código sin validaciones.
- Versionar todas las imágenes.
- Proteger la rama `main`.
- Revisar el código mediante Pull Request.
- Mantener los secretos fuera del repositorio.
- Documentar cada cambio relevante.

---

# Referencias

- DevOps.md
- Deployment.md
- Testing.md
- Architecture.md
- GitHub Actions Documentation
- Docker Documentation

---

# Control de Versiones

| Versión | Fecha | Descripción |
|----------|--------|-------------|
| 1.0 | 2026-07-12 | Definición de la estrategia de Integración Continua y Entrega Continua para ASDP. |