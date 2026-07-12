# Requerimientos No Funcionales (RNF)

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform |
| Documento | Requerimientos No Funcionales |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

El presente documento define los requerimientos no funcionales de Agile Service Desk Platform (ASDP).

Estos requerimientos establecen las características de calidad, seguridad, rendimiento, disponibilidad, mantenibilidad y escalabilidad que debe cumplir la plataforma.

---

# 2. Requerimientos No Funcionales

---

# RNF-001 Disponibilidad del Sistema

## Descripción

La plataforma debe garantizar disponibilidad suficiente para permitir la operación continua del servicio tecnológico.

## Criterios

- El sistema debe estar disponible durante horario operacional.
- Las interrupciones deben ser registradas.
- Deben existir mecanismos de recuperación.

---

# RNF-002 Rendimiento de Respuesta

## Descripción

El sistema debe responder de manera eficiente ante solicitudes de usuarios.

## Criterios

- Las operaciones comunes deben responder en menos de 3 segundos.
- Las consultas simples no deben degradar la experiencia del usuario.

---

# RNF-003 Escalabilidad Horizontal

## Descripción

La arquitectura debe permitir aumentar capacidad agregando nuevos recursos.

## Criterios

Debe permitir:

- Incrementar instancias del backend.
- Separar servicios críticos.
- Distribuir carga.

---

# RNF-004 Seguridad de Autenticación

## Descripción

El acceso al sistema debe estar protegido mediante mecanismos seguros de autenticación.

## Criterios

Debe incluir:

- Contraseñas cifradas.
- Sesiones seguras.
- Control de acceso.

---

# RNF-005 Control de Autorización

## Descripción

El sistema debe limitar las acciones según permisos asignados.

## Criterios

Debe implementar:

- Roles.
- Permisos.
- Validación de privilegios.

---

# RNF-006 Protección de Datos Sensibles

## Descripción

La información sensible debe manejarse de forma segura.

Incluye:

- Credenciales.
- Información de usuarios.
- Configuraciones internas.

## Criterios

- No almacenar contraseñas en texto plano.
- Evitar exposición en logs.

---

# RNF-007 Auditoría del Sistema

## Descripción

El sistema debe mantener registro de actividades importantes.

Debe registrar:

- Usuario.
- Fecha.
- Acción realizada.
- Recurso afectado.

---

# RNF-008 Trazabilidad de Información

## Descripción

Todas las operaciones relevantes deben poder ser rastreadas.

Ejemplo:

```
Creación ticket

↓

Asignación técnico

↓

Cambio estado

↓

Cierre
```

---

# RNF-009 Integridad de Datos

## Descripción

El sistema debe garantizar consistencia de información almacenada.

Criterios:

- Validaciones.
- Restricciones de datos.
- Manejo de transacciones.

---

# RNF-010 Disponibilidad de Respaldos

## Descripción

La plataforma debe permitir realizar copias de seguridad.

Criterios:

- Backups periódicos.
- Recuperación ante fallos.
- Validación de restauración.

---

# RNF-011 Mantenibilidad del Código

## Descripción

El código debe ser fácil de mantener y evolucionar.

Criterios:

Debe cumplir:

- SOLID.
- Clean Architecture.
- Separación de responsabilidades.
- Código documentado.

---

# RNF-012 Modularidad del Sistema

## Descripción

Los componentes deben estar desacoplados.

Beneficios:

- Facilitar cambios.
- Reducir impacto de modificaciones.
- Permitir evolución a microservicios.

---

# RNF-013 Compatibilidad Multiplataforma

## Descripción

La plataforma debe funcionar en diferentes entornos.

Debe soportar:

- Navegadores modernos.
- Sistemas operativos actuales.
- Dispositivos móviles.

---

# RNF-014 Usabilidad

## Descripción

La interfaz debe ser intuitiva para usuarios técnicos y no técnicos.

Criterios:

- Navegación clara.
- Mensajes comprensibles.
- Diseño consistente.

---

# RNF-015 Accesibilidad

## Descripción

La aplicación debe considerar buenas prácticas de accesibilidad.

Criterios:

- Contraste adecuado.
- Navegación clara.
- Componentes accesibles.

---

# RNF-016 Compatibilidad de Navegadores

## Descripción

La aplicación web debe funcionar correctamente en navegadores modernos.

Soporte esperado:

- Google Chrome.
- Mozilla Firefox.
- Microsoft Edge.

---

# RNF-017 Observabilidad

## Descripción

El sistema debe permitir monitoreo operacional.

Debe incluir:

- Logs.
- Métricas.
- Alertas.
- Seguimiento de errores.

Tecnologías propuestas:

- Prometheus.
- Grafana.
- Loki.

---

# RNF-018 Gestión de Errores

## Descripción

El sistema debe manejar errores de manera controlada.

Criterios:

- Mensajes claros al usuario.
- Registro técnico del error.
- Evitar exposición de información interna.

---

# RNF-019 Documentación Técnica

## Descripción

El proyecto debe mantener documentación actualizada.

Debe incluir:

- Arquitectura.
- APIs.
- Instalación.
- Configuración.
- Procesos.

---

# RNF-020 Capacidad de Integración

## Descripción

La plataforma debe permitir comunicación con sistemas externos.

Debe soportar:

- APIs REST.
- Webhooks.
- Servicios de correo.
- Sistemas institucionales.

---

# RNF-021 Seguridad de Comunicación

## Descripción

Toda comunicación entre componentes debe estar protegida.

Criterios:

- Uso de HTTPS.
- Certificados válidos.
- Protección de datos transmitidos.

---

# RNF-022 Control de Versiones

## Descripción

El código fuente debe gestionarse mediante control de versiones.

Requisitos:

- Git.
- Branching definido.
- Historial de cambios.

---

# RNF-023 Automatización de Despliegue

## Descripción

El sistema debe permitir despliegues automatizados.

Debe incluir:

- Pipeline CI/CD.
- Validaciones automáticas.
- Control de versiones.

---

# RNF-024 Pruebas Automatizadas

## Descripción

El sistema debe contar con pruebas que aseguren calidad.

Tipos:

- Unitarias.
- Integración.
- End-to-End.

---

# RNF-025 Recuperación ante Fallos

## Descripción

La plataforma debe disponer de mecanismos de recuperación.

Incluye:

- Restauración de servicios.
- Manejo de errores críticos.
- Estrategias de contingencia.

---

# 3. Resumen de Requerimientos

| ID | Categoría |
|-|-|
| RNF-001 | Disponibilidad |
| RNF-002 | Rendimiento |
| RNF-003 | Escalabilidad |
| RNF-004 | Autenticación |
| RNF-005 | Autorización |
| RNF-006 | Protección de datos |
| RNF-007 | Auditoría |
| RNF-008 | Trazabilidad |
| RNF-009 | Integridad |
| RNF-010 | Backups |
| RNF-011 | Mantenibilidad |
| RNF-012 | Modularidad |
| RNF-013 | Compatibilidad |
| RNF-014 | Usabilidad |
| RNF-015 | Accesibilidad |
| RNF-016 | Navegadores |
| RNF-017 | Observabilidad |
| RNF-018 | Manejo errores |
| RNF-019 | Documentación |
| RNF-020 | Integraciones |
| RNF-021 | Comunicación segura |
| RNF-022 | Versionamiento |
| RNF-023 | CI/CD |
| RNF-024 | Testing |
| RNF-025 | Recuperación |

---

# Control de Versiones

| Versión | Fecha | Descripción |
|-|-|-|
| 0.1 | 2026-07-12 | Creación inicial de requerimientos no funcionales |