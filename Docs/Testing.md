# Testing Strategy

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform (ASDP) |
| Documento | Testing Strategy |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

Este documento define la estrategia de pruebas para Agile Service Desk Platform (ASDP).

Su objetivo es garantizar que la plataforma cumpla los requerimientos funcionales y no funcionales, asegurando estabilidad, calidad, seguridad y confiabilidad antes de cada despliegue.

---

# 2. Objetivos

La estrategia de pruebas busca:

- Detectar defectos tempranamente.
- Validar los requerimientos funcionales.
- Verificar los requerimientos no funcionales.
- Reducir regresiones.
- Automatizar la mayor cantidad de pruebas posible.
- Garantizar la calidad antes del despliegue.

---

# 3. Pirámide de Testing

```
               E2E

          Integration

             Unit
```

La mayor cantidad de pruebas deberán ser unitarias, seguidas por pruebas de integración y una menor cantidad de pruebas End-to-End.

---

# 4. Tipos de Pruebas

## 4.1 Pruebas Unitarias

### Objetivo

Validar componentes individuales de forma aislada.

### Cobertura

- Casos de uso.
- Servicios.
- Validadores.
- Utilidades.
- Reglas de negocio.

### Herramientas sugeridas

- Vitest o Jest (Frontend)
- Jest (Backend)

---

## 4.2 Pruebas de Integración

### Objetivo

Validar la interacción entre módulos y componentes.

Ejemplos:

- API ↔ Base de datos
- API ↔ Redis
- API ↔ RabbitMQ
- API ↔ Servicio de correo

---

## 4.3 Pruebas End-to-End (E2E)

### Objetivo

Validar flujos completos desde la perspectiva del usuario.

Ejemplos:

- Inicio de sesión.
- Creación de tickets.
- Asignación de tickets.
- Resolución de incidencias.
- Cierre de solicitudes.

### Herramienta sugerida

- Playwright

---

## 4.4 Pruebas de Regresión

### Objetivo

Verificar que nuevas funcionalidades no afecten las existentes.

Estas pruebas deberán ejecutarse antes de cada liberación.

---

## 4.5 Pruebas de Aceptación

### Objetivo

Confirmar que las funcionalidades cumplen los criterios de aceptación definidos en las historias de usuario.

Responsables:

- Product Owner.
- Stakeholders.

---

## 4.6 Pruebas de Rendimiento

### Objetivo

Medir el comportamiento del sistema bajo diferentes niveles de carga.

Escenarios:

- Usuarios concurrentes.
- Creación masiva de tickets.
- Consultas complejas.
- Generación de reportes.

Herramienta sugerida:

- k6

---

## 4.7 Pruebas de Seguridad

### Objetivo

Detectar vulnerabilidades antes del despliegue.

Incluyen:

- Validación de autenticación.
- Autorización.
- Inyección SQL.
- XSS.
- CSRF.
- Gestión de sesiones.

Herramientas sugeridas:

- OWASP ZAP
- Trivy
- CodeQL

---

## 4.8 Pruebas de Usabilidad

### Objetivo

Evaluar la facilidad de uso de la plataforma.

Aspectos:

- Navegación.
- Claridad.
- Consistencia.
- Accesibilidad.

---

## 4.9 Pruebas de Compatibilidad

### Objetivo

Verificar el funcionamiento en distintos navegadores.

Navegadores soportados:

- Google Chrome
- Microsoft Edge
- Mozilla Firefox

---

# 5. Estrategia de Automatización

Las siguientes pruebas deberán automatizarse:

- Unitarias.
- Integración.
- API.
- End-to-End.
- Seguridad.
- Smoke Tests.

---

# 6. Smoke Tests

Después de cada despliegue deberán ejecutarse pruebas rápidas para verificar:

- Inicio de sesión.
- Acceso al dashboard.
- Creación de ticket.
- Consulta de tickets.
- Estado del sistema.

---

# 7. Cobertura

Objetivos mínimos:

| Tipo | Cobertura |
|-------|-----------:|
| Unitarias | ≥ 80% |
| Integración | ≥ 70% |
| Casos de uso críticos | 100% |

---

# 8. Casos Críticos

Las siguientes funcionalidades deberán estar completamente cubiertas:

- Autenticación.
- Autorización.
- Gestión de usuarios.
- Creación de tickets.
- Asignación.
- Cierre.
- Auditoría.
- Gestión de activos.

---

# 9. Ambientes de Prueba

## Development

Pruebas rápidas durante el desarrollo.

---

## Testing

Validación funcional y técnica.

---

## Staging

Pruebas previas a producción.

---

## Production

Solo pruebas de verificación posteriores al despliegue (Smoke Tests).

---

# 10. Datos de Prueba

Los datos utilizados deberán:

- Ser independientes de producción.
- Poder regenerarse.
- No contener información sensible.
- Ser reproducibles.

---

# 11. Criterios de Entrada

Antes de iniciar pruebas:

- Requerimientos aprobados.
- Código compilando.
- Build exitoso.
- Ambiente disponible.

---

# 12. Criterios de Salida

Las pruebas finalizarán cuando:

- No existan defectos críticos.
- Todos los casos críticos hayan sido ejecutados.
- Cobertura mínima alcanzada.
- Product Owner apruebe la versión.

---

# 13. Gestión de Defectos

Cada defecto deberá registrar:

- Identificador.
- Descripción.
- Severidad.
- Prioridad.
- Estado.
- Responsable.
- Evidencia.

Estados:

- Nuevo.
- En análisis.
- En desarrollo.
- En pruebas.
- Cerrado.

---

# 14. Integración con CI/CD

Las pruebas automatizadas se ejecutarán en cada Pull Request y Merge.

Flujo:

```
Push

↓

Build

↓

Unit Tests

↓

Integration Tests

↓

Security Scan

↓

E2E

↓

Deploy
```

---

# 15. Métricas de Calidad

Se medirán los siguientes indicadores:

| Indicador | Objetivo |
|-----------|----------|
| Cobertura de pruebas | ≥ 80% |
| Build exitosos | ≥ 95% |
| Defectos críticos abiertos | 0 |
| Tiempo de ejecución del pipeline | < 10 min |
| Tasa de éxito de pruebas | ≥ 95% |

---

# 16. Herramientas

| Área | Herramienta |
|------|-------------|
| Unit Testing | Jest |
| Frontend Testing | Vitest / Jest |
| API Testing | Supertest |
| E2E | Playwright |
| Performance | k6 |
| Seguridad | OWASP ZAP |
| Cobertura | Istanbul / V8 Coverage |
| CI/CD | GitHub Actions |

---

# 17. Responsabilidades

| Rol | Responsabilidad |
|-----|------------------|
| Desarrollador | Pruebas unitarias e integración |
| QA | Validación funcional y regresión |
| Product Owner | Aceptación |
| DevOps | Automatización del pipeline |

---

# 18. Roadmap de Testing

## MVP

- Unit Testing.
- Integration Testing.
- Smoke Tests.

---

## Versión 1.0

- End-to-End.
- Performance Testing.
- Security Testing.

---

## Evolución

- Pruebas de carga continuas.
- Automatización completa.
- Reportes de calidad.
- Integración con observabilidad.

---

# Control de Versiones

| Versión | Fecha | Descripción |
|----------|--------|-------------|
| 0.1 | 2026-07-12 | Creación inicial de la estrategia de pruebas |