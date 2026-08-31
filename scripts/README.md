# EM-OS Automation Scripts

This directory contains scripts for automating data ingestion and operational tasks for the Engineering Manager OS.

## 1. Metrics Ingestion (`ingest_metrics.py`)

This script pulls data from external sources (GitHub, Jira, PagerDuty) and stores it in `memory/current_metrics.json` for use by the subagents.

### Setup

1. **Install Dependencies**:
   ```bash
   pip install requests
   ```

2. **Configure Environment Variables**:
   For real data ingestion, set the following environment variables:
   - `GITHUB_TOKEN`
   - `JIRA_TOKEN`
   - `JIRA_BASE_URL`
   - `PAGERDUTY_TOKEN`

3. **Run Ingestion**:
   ```bash
   python scripts/ingest_metrics.py
   ```

### Mock Mode
By default, the script runs in **mock mode** to demonstrate functionality without requiring API keys. To enable real ingestion, modify the `ingestor = MetricsIngestor(mock=True)` line in the script to `mock=False`.

## 2. CI/CD Integration

You can schedule these scripts using GitHub Actions or a local cron job to ensure the OS always has up-to-date context.

Example Crontab:
```cron
0 * * * * /usr/bin/python3 /path/to/engineering-manager-os/scripts/ingest_metrics.py
```
