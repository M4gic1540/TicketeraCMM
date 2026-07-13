# Product Requirements

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform (ASDP) |
| Documento | Product Requirements |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

Este documento define los requisitos del producto Agile Service Desk Platform (ASDP), proporcionando una visión integral de los objetivos, alcance, funcionalidades y restricciones que guiarán el desarrollo de la plataforma.

Su propósito es servir como referencia común para todas las partes interesadas durante el ciclo de vida del proyecto.

---

# 2. Visión del Producto

ASDP es una plataforma ITSM (IT Service Management) orientada a optimizar la gestión de servicios de tecnologías de la información mediante la administración de incidencias, solicitudes de servicio, activos tecnológicos y métricas operacionales.

La plataforma busca reemplazar la gestión basada en herramientas de propósito general mediante una solución especializada, escalable y preparada para evolucionar hacia un modelo SaaS.

---

# 3. Problema

En muchas organizaciones las solicitudes de soporte se gestionan mediante herramientas genéricas, correos electrónicos o planillas.

Esto genera:

- Baja trazabilidad.
- Dificultad para medir tiempos de respuesta.
- Escasa visibilidad del estado de los trabajos.
- Falta de historial de intervenciones.
- Escasa estandarización de procesos.

---

# 4. Objetivos del Producto

## Objetivo General

Desarrollar una plataforma moderna para la gestión de servicios TI que centralice la administración de incidencias, solicitudes y activos tecnológicos.

## Objetivos Específicos

- Centralizar la gestión de tickets.
- Mejorar la trazabilidad.
- Optimizar la asignación de tareas.
- Gestionar activos tecnológicos.
- Proporcionar indicadores de desempeño.
- Facilitar la comunicación entre usuarios y técnicos.
- Preparar la plataforma para un crecimiento futuro.

---

# 5. Público Objetivo

La plataforma está orientada a:

- Equipos de Soporte TI.
- Mesas de ayuda (Service Desk).
- Departamentos de informática.
- Instituciones educativas.
- Empresas públicas y privadas.
- Organizaciones que gestionan infraestructura tecnológica.

---

# 6. Alcance

## Incluye

- Gestión de usuarios.
- Gestión de roles.
- Gestión de tickets.
- Gestión de activos.
- Dashboard.
- Reportes.
- Auditoría.
- Notificaciones.
- Base de conocimiento.

## No incluye (MVP)

- Gestión financiera.
- Facturación.
- CMDB completa.
- Gestión de contratos.
- Integraciones con herramientas externas.

---

# 7. Personas

## Usuario Final

Solicita soporte y consulta el estado de sus solicitudes.

## Técnico

Gestiona incidencias y solicitudes asignadas.

## Supervisor

Administra el equipo de soporte y supervisa indicadores.

## Administrador

Configura la plataforma y administra usuarios, permisos y parámetros.

---

# 8. Funcionalidades Principales

- Inicio de sesión.
- Gestión de usuarios.
- Gestión de roles.
- Gestión de tickets.
- Gestión de categorías.
- Gestión de prioridades.
- Gestión de estados.
- Gestión de activos.
- Dashboard.
- Reportes.
- Auditoría.
- Base de conocimiento.
- Notificaciones.

---

# 9. Requisitos Funcionales (Resumen)

El producto deberá permitir:

- Crear tickets.
- Asignar tickets.
- Actualizar estados.
- Gestionar comentarios.
- Adjuntar archivos.
- Registrar activos.
- Asociar activos a tickets.
- Generar reportes.
- Consultar indicadores.
- Administrar usuarios.

El detalle completo se encuentra en `requirements/RequerimientosFuncionales.md`.

---

# 10. Requisitos No Funcionales (Resumen)

La plataforma deberá cumplir con requisitos relacionados con:

- Seguridad.
- Disponibilidad.
- Escalabilidad.
- Rendimiento.
- Usabilidad.
- Mantenibilidad.
- Portabilidad.
- Observabilidad.

El detalle completo se encuentra en `requirements/RequerimientosNoFuncionales.md`.

---

# 11. Restricciones

- Arquitectura basada en dominios.
- Backend desacoplado.
- Base de datos PostgreSQL.
- Contenerización mediante Docker.
- Desarrollo incremental.
- Control de versiones mediante Git.

---

# 12. Supuestos

- Los usuarios disponen de un navegador moderno.
- La organización cuenta con conectividad interna.
- El personal de soporte utilizará la plataforma como sistema principal para la gestión de incidencias.

---

# 13. Dependencias

- Servicio de correo electrónico.
- Base de datos PostgreSQL.
- Infraestructura Docker.
- Repositorio Git.
- Sistema de autenticación.

---

# 14. Criterios de Éxito

El producto será considerado exitoso cuando:

- Permita gestionar el ciclo completo de un ticket.
- Reduzca los tiempos de respuesta.
- Facilite la trazabilidad de las incidencias.
- Genere indicadores útiles para la toma de decisiones.
- Sea adoptado por los equipos de soporte.

---

# 15. Roadmap del Producto

## MVP

- Autenticación.
- Gestión de usuarios.
- Gestión de tickets.
- Dashboard básico.

## Versión 1.0

- Gestión de activos.
- Reportes.
- Auditoría.
- Base de conocimiento.

## Versión 2.0

- SLA.
- Automatización.
- Integraciones.
- Multi-organización.

## Evolución SaaS

- Multi-Tenant.
- Facturación.
- Marketplace de integraciones.
- API pública.

---

# 16. Riesgos

- Cambios frecuentes en los requisitos.
- Baja adopción por parte de los usuarios.
- Incremento del alcance del proyecto.
- Dependencia de servicios externos.

---

# 17. Referencias

- BRD
- SDD
- Architecture.md
- RequerimientosFuncionales.md
- RequerimientosNoFuncionales.md
- Product-Backlog.md
- DevOps.md
- Testing.md

---

# Control de Versiones

| Versión | Fecha | Descripción |
|----------|--------|-------------|
| 0.1 | 2026-07-12 | Creación inicial del documento de requisitos del producto |