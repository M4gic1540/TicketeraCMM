-- =====================================================================
-- ASDP - Inicialización de PostgreSQL (Fase 1: MVP, DB compartida)
-- Separación lógica por esquemas, siguiendo Docs/Database-Per-Service.md
-- Fase 2 del roadmap. Cada esquema pertenece exclusivamente a su
-- microservicio; ningún servicio debe consultar el esquema de otro.
-- =====================================================================

CREATE SCHEMA IF NOT EXISTS identity;
CREATE SCHEMA IF NOT EXISTS ticketing;
CREATE SCHEMA IF NOT EXISTS assets;
CREATE SCHEMA IF NOT EXISTS notifications;
CREATE SCHEMA IF NOT EXISTS reporting;
CREATE SCHEMA IF NOT EXISTS knowledge;
CREATE SCHEMA IF NOT EXISTS audit;

-- Extensión para UUIDs (usados como PK en todas las entidades)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
