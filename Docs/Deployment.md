# Deployment Guide

# Agile Service Desk Platform (ASDP)

---

# Información del Documento

| Campo | Valor |
|---|---|
| Proyecto | Agile Service Desk Platform |
| Documento | Deployment Guide |
| Versión | 0.1 |
| Estado | Draft |
| Fecha | 2026-07-12 |
| Autor | Tomás Gonzalez |

---

# 1. Introducción

## 1.1 Propósito

Este documento describe el proceso de despliegue de Agile Service Desk Platform (ASDP) para los distintos ambientes del proyecto.

El objetivo es garantizar despliegues repetibles, seguros y consistentes mediante automatización y buenas prácticas DevOps.

---

# 2. Ambientes

ASDP contempla cuatro ambientes principales.

| Ambiente | Objetivo |
|----------|----------|
| Development | Desarrollo diario |
| Testing | Validación funcional y técnica |
| Staging | Simulación de producción |
| Production | Operación para usuarios finales |

---

# 3. Arquitectura de Despliegue

```
                Usuario

                   │

             Internet / LAN

                   │

            Reverse Proxy

                   │

        -------------------------

        │                       │

    Frontend SPA           Backend API

                                │

        ------------------------------------

        │          │         │             │

   PostgreSQL   Redis   RabbitMQ   File Storage
```

---

# 4. Requisitos

## Hardware mínimo (Desarrollo)

- CPU: 4 núcleos
- Memoria: 8 GB RAM
- Almacenamiento: 20 GB libres

## Hardware recomendado (Producción)

- CPU: 8 núcleos
- Memoria: 16 GB RAM
- SSD
- Red Gigabit

---

# 5. Software Requerido

- Docker
- Docker Compose
- Git
- Node.js (si aplica)
- PostgreSQL (si no se utiliza contenedor)

---

# 6. Variables de Entorno

La configuración se realizará mediante variables de entorno.

Ejemplo:

```
APP_NAME=ASDP

APP_ENV=development

PORT=3000

DATABASE_HOST=postgres

DATABASE_PORT=5432

DATABASE_NAME=asdp

DATABASE_USER=postgres

DATABASE_PASSWORD=********

JWT_SECRET=********

REDIS_HOST=redis

RABBITMQ_HOST=rabbitmq

SMTP_HOST=smtp.example.com

SMTP_PORT=587
```

Los archivos `.env` nunca deben almacenarse en el repositorio.

---

# 7. Despliegue Local

## Paso 1

Clonar el repositorio.

## Paso 2

Configurar variables de entorno.

## Paso 3

Levantar la infraestructura.

```
docker compose up
```

## Paso 4

Ejecutar migraciones.

## Paso 5

Crear usuario administrador inicial.

## Paso 6

Verificar acceso a la aplicación.

---

# 8. Contenedores

La plataforma estará compuesta por los siguientes servicios.

| Servicio | Descripción |
|----------|-------------|
| frontend | Aplicación React |
| backend | API principal |
| postgres | Base de datos |
| redis | Caché |
| rabbitmq | Mensajería |
| nginx | Reverse Proxy |

---

# 9. Flujo de Despliegue

```
Commit

↓

Pull Request

↓

Revisión

↓

Merge

↓

Pipeline CI

↓

Tests

↓

Build

↓

Docker Image

↓

Registry

↓

Deployment

↓

Verificación
```

---

# 10. Estrategias de Despliegue

## Development

Características:

- Despliegue frecuente.
- Reinicio automático.
- Datos de prueba.

---

## Testing

Características:

- Validación QA.
- Ejecución de pruebas automatizadas.

---

## Staging

Características:

- Réplica de producción.
- Validación antes de liberar.

---

## Production

Características:

- Alta disponibilidad.
- Monitoreo permanente.
- Backups activos.

---

# 11. Pipeline de Despliegue

```
GitHub

↓

GitHub Actions

↓

Build

↓

Tests

↓

Docker Build

↓

Push Registry

↓

Deploy
```

---

# 12. Verificaciones Posteriores

Después del despliegue se debe comprobar:

- La aplicación inicia correctamente.
- La base de datos responde.
- Los servicios están disponibles.
- Las migraciones fueron ejecutadas.
- Los logs no presentan errores críticos.

---

# 13. Health Checks

Cada componente debe exponer un endpoint de estado.

Ejemplos:

```
GET /health

GET /ready

GET /live
```

Información esperada:

- Estado del servicio.
- Base de datos.
- Caché.
- Broker de mensajes.

---

# 14. Rollback

En caso de fallo se deberá:

1. Detener el despliegue.
2. Restaurar la versión estable anterior.
3. Validar funcionamiento.
4. Registrar el incidente.

---

# 15. Base de Datos

Durante el despliegue:

- Ejecutar migraciones pendientes.
- Validar consistencia.
- Verificar integridad.

Las migraciones deben ser reversibles cuando sea posible.

---

# 16. Backups

Antes de cada despliegue en producción:

- Respaldar base de datos.
- Respaldar archivos adjuntos.
- Verificar restauración.

---

# 17. Seguridad

Durante el despliegue:

- Uso obligatorio de HTTPS.
- Secretos gestionados mediante variables de entorno o gestor de secretos.
- No almacenar credenciales en el código fuente.
- Acceso restringido a servidores.

---

# 18. Monitoreo

Después del despliegue se supervisarán:

- Uso de CPU.
- Uso de memoria.
- Tiempo de respuesta.
- Errores HTTP.
- Disponibilidad.
- Latencia.
- Estado de contenedores.

Herramientas propuestas:

- Prometheus
- Grafana
- Loki

---

# 19. Recuperación ante Fallos

Ante una falla crítica:

1. Detectar el incidente.
2. Activar rollback.
3. Restaurar respaldos si es necesario.
4. Verificar servicios.
5. Documentar el incidente.

---

# 20. Estrategia de Alta Disponibilidad

En producción se contempla:

- Balanceador de carga.
- Réplicas del backend.
- Base de datos con mecanismos de respaldo.
- Reinicio automático de contenedores.
- Monitoreo continuo.

---

# 21. Roadmap de Despliegue

## MVP

- Docker Compose.
- Servidor único.
- PostgreSQL.
- Nginx.

---

## Escalabilidad

- Kubernetes.
- Autoescalado.
- Balanceo de carga.
- Observabilidad completa.

---

## SaaS

- Multi-Tenant.
- Despliegues automatizados.
- Alta disponibilidad.
- Recuperación ante desastres.

---

# 22. Checklist de Producción

Antes de publicar una nueva versión verificar:

- Variables de entorno configuradas.
- Migraciones preparadas.
- Backups realizados.
- Pipeline exitoso.
- Pruebas aprobadas.
- Monitoreo activo.
- Health checks operativos.
- Certificados HTTPS válidos.
- Documentación actualizada.

---

# Control de Versiones

| Versión | Fecha | Descripción |
|----------|--------|-------------|
| 0.1 | 2026-07-12 | Creación inicial de la guía de despliegue |