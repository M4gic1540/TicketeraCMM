# Security Policy

## Agile Service Desk Platform (ASDP)

Gracias por ayudar a mantener la seguridad de **Agile Service Desk Platform (ASDP)**.

La seguridad es un aspecto fundamental del proyecto debido a que la plataforma está diseñada para gestionar servicios tecnológicos, usuarios, activos e información operacional.

Este documento establece las políticas para reportar vulnerabilidades y las prácticas de seguridad aplicadas dentro del proyecto.

---

# 🔐 Alcance

Esta política aplica a:

- Código fuente de ASDP.
- APIs.
- Servicios backend.
- Aplicaciones frontend.
- Infraestructura de despliegue.
- Configuraciones Docker.
- Dependencias externas.
- Documentación técnica.

---

# 🚨 Reporte de Vulnerabilidades

Si detectas una vulnerabilidad de seguridad, por favor:

1. No publiques la vulnerabilidad en Issues públicos.
2. No compartas detalles técnicos sensibles.
3. Reporta el problema de forma privada al mantenedor del proyecto.

El reporte debe incluir:

- Descripción de la vulnerabilidad.
- Componentes afectados.
- Pasos para reproducir el problema.
- Impacto potencial.
- Evidencia técnica disponible.
- Posible solución (si existe).

---

# 📋 Ejemplo de reporte

```
Título:

Vulnerabilidad de autenticación en endpoint /login


Descripción:

El endpoint permite múltiples intentos sin control de tasa.


Impacto:

Posible ataque de fuerza bruta.


Pasos para reproducir:

1. Ejecutar múltiples solicitudes POST.
2. Observar ausencia de bloqueo.


Recomendación:

Implementar Rate Limiting.
```

---

# ⏱️ Proceso de respuesta

Los reportes serán evaluados según severidad.

## Crítica

Ejemplos:

- Ejecución remota de código.
- Exposición masiva de información.
- Bypass completo de autenticación.

Respuesta objetivo:

```
24 - 48 horas
```

---

## Alta

Ejemplos:

- Escalamiento de privilegios.
- Acceso no autorizado.
- Exposición de datos sensibles.

Respuesta objetivo:

```
72 horas
```

---

## Media

Ejemplos:

- Configuraciones inseguras.
- Validaciones insuficientes.

Respuesta objetivo:

```
7 días
```

---

## Baja

Ejemplos:

- Mejoras preventivas.
- Recomendaciones.

Respuesta objetivo:

```
30 días
```

---

# 🛡️ Principios de Seguridad

ASDP sigue los siguientes principios:

## Security by Design

La seguridad debe considerarse desde la etapa de diseño.

Incluye:

- Modelado seguro.
- Validación de entradas.
- Control de acceso.
- Manejo seguro de información.

---

## Least Privilege

Los usuarios deben tener únicamente los permisos necesarios.

Ejemplo:

```
Solicitante

Puede:
✓ Crear tickets
✓ Consultar sus tickets


No puede:
✗ Administrar usuarios
✗ Modificar configuración global
```

---

# 🔑 Autenticación y Autorización

La plataforma implementa:

- Autenticación basada en tokens.
- JWT.
- Refresh Tokens.
- Control basado en roles (RBAC).

Roles iniciales:

```
ADMIN

TECHNICIAN

USER
```

---

# 🔒 Protección de Datos

ASDP debe proteger:

- Información de usuarios.
- Información de activos.
- Historial de incidencias.
- Comentarios internos.
- Archivos adjuntos.

Buenas prácticas:

- No almacenar contraseñas en texto plano.
- Utilizar hashing seguro.
- Cifrar información sensible.
- Evitar exposición de datos en logs.

---

# 🌐 Seguridad API

Las APIs deben implementar:

- Validación de entrada.
- Manejo correcto de errores.
- Rate limiting.
- Protección CORS.
- Headers seguros.
- Autenticación obligatoria.

Ejemplo:

```
Solicitud

↓

Validación JWT

↓

Validación permisos

↓

Ejecución operación
```

---

# 🗄️ Seguridad Base de Datos

Buenas prácticas:

- Separación de usuarios de base de datos.
- Principio de mínimo privilegio.
- Uso de migraciones.
- Backups periódicos.
- Protección de credenciales.

Nunca almacenar:

```
DATABASE_PASSWORD=password123
```

Utilizar:

```
.env

DATABASE_PASSWORD=${SECRET_DATABASE_PASSWORD}
```

---

# 🐳 Seguridad Docker

Los contenedores deben:

- Ejecutarse con usuarios no root cuando sea posible.
- Mantener imágenes actualizadas.
- Evitar secretos dentro de imágenes.
- Utilizar variables de entorno.
- Escanear vulnerabilidades.

---

# 🔍 Dependencias

Las dependencias deben mantenerse actualizadas.

Herramientas recomendadas:

- npm audit
- Dependabot
- Snyk
- OWASP Dependency Check

---

# 🧪 Seguridad en Desarrollo

Antes de integrar cambios:

- Ejecutar pruebas.
- Revisar código.
- Validar permisos.
- Revisar logs.
- Analizar dependencias.

---

# 🚫 Información que nunca debe publicarse

No subir al repositorio:

```
.env

*.pem

*.key

credentials.json

passwords.txt

tokens

API keys

archivos de configuración productivos
```

---

# 📁 Variables de Entorno

El proyecto debe incluir:

```
.env.example
```

Ejemplo:

```env
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_USER=
DATABASE_PASSWORD=

JWT_SECRET=
```

Nunca:

```
.env
```

---

# 🔄 Actualizaciones de Seguridad

Las vulnerabilidades corregidas serán documentadas en:

```
CHANGELOG.md
```

Ejemplo:

```
Security:

- Fixed authentication bypass vulnerability.
- Updated vulnerable dependencies.
```

---

# 🏷️ Versionamiento de Seguridad

Las correcciones críticas pueden generar versiones especiales:

Ejemplo:

```
v1.0.1

Security Patch Release
```

---

# 🧰 Seguridad Futura

Funcionalidades planificadas:

- OAuth2.
- MFA.
- Auditoría avanzada.
- Cifrado de datos sensibles.
- SIEM Integration.
- Gestión avanzada de sesiones.
- Firma digital de eventos.
- Zero Trust Architecture.

---

# Responsabilidad del Usuario

Los usuarios de ASDP deben:

- Mantener sus credenciales seguras.
- No compartir accesos.
- Reportar actividades sospechosas.
- Utilizar la plataforma según las políticas internas.

---

# Contacto

Para reportar vulnerabilidades de seguridad, contactar al equipo mantenedor del proyecto mediante un canal privado.

---

**Agile Service Desk Platform (ASDP)**  
Security Policy Version: 1.0  
Last Updated: 2026