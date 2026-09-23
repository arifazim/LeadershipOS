# Datadog

**Data read**: not yet pulled into DORA bands. App+API key presence is recorded on ingest (`datadog.configured`).

**Required env**
- `DATADOG_API_KEY`
- `DATADOG_APP_KEY`
- `DATADOG_SITE` — optional, default `datadoghq.com`

**Actions taken**: validate credentials; count monitors (read-only).

**Fallback**: mock if keys missing or validate fails.

Deploy frequency / MTTR currently come from GitHub and PagerDuty, not Datadog monitors.
