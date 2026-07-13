# Orquestación Local - ASDP

Infraestructura base (Fase 1) para desarrollo local. No incluye aún los
microservicios de negocio (eso es Fase 3-6 del `ROADMAP.md`).

## Servicios incluidos

| Servicio | Puerto host | Descripción |
|---|---|---|
| gateway (Traefik) | 80, 8080 | Reverse proxy / API Gateway. Dashboard en `:8080` |
| postgres | 5432 | Base compartida, esquemas lógicos por dominio |
| redis | 6379 | Caché / rate limiting |
| rabbitmq | 5672, 15672 | Broker de eventos. UI de management en `:15672` |
| prometheus (opcional) | 9090 | Métricas |
| grafana (opcional) | 3300 | Dashboards |
| loki (opcional) | 3100 | Logs |

## Uso

```bash
cp .env.example .env
docker compose up -d
```

Levantar además observabilidad:

```bash
docker compose --profile observability up -d
```

## Verificación

```bash
docker compose ps
curl http://localhost:8080/api/rawdata     # Traefik dashboard API
docker exec -it asdp-postgres psql -U asdp -d asdp_db -c '\dn'   # ver esquemas
```

## Siguiente paso

Agregar `services/identity-service` (NestJS) como primer microservicio real,
con su `Dockerfile`, conexión a esquema `identity` en Postgres, y labels de
Traefik para exponerlo en `/api/v1/auth` y `/api/v1/users`.
