# EM-OS Automation Scripts

This directory contains scripts for automating data ingestion and operational tasks for the Engineering Manager OS.

## 1. Metrics Ingestion (`ingest_metrics.py`)

Pulls GitHub, Jira, PagerDuty, Slack (`auth.test`), and Datadog (validate + monitor count) into `memory/current_metrics.json` and appends `memory/metrics_history.jsonl`.

```bash
python3 scripts/ingest_metrics.py
```

Each source is independent. Missing env vars → mock data with `"_source": "mock"`. API errors → `"_source": "mock-fallback"`.

Required env vars: see `integrations/README.md` and `HOWTORUN.md` §2.

There is no global `mock=` switch. Do not set `MetricsIngestor(mock=True)`.

## 2. Dashboard golden check (`validate_dashboard.py`)

```bash
python3 scripts/validate_dashboard.py
```

Must print ≥ 90% agreement against `evaluations/golden/dashboard/`.

## 3. Cadence (`cadence.py`)

```bash
python3 scripts/cadence.py
```

Exit 1 if `em-growth` is overdue (`memory/cadence.json`).

## 4. CLI (`cli.py`)

```bash
./bin/em-os list
./bin/em-os status
./bin/em-os run daily
```

## 5. CI/CD Integration

Example crontab:

```cron
0 * * * * /usr/bin/python3 /path/to/engineering-manager-os/scripts/ingest_metrics.py
```
