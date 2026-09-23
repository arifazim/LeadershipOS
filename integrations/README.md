# Integrations

**Owner**: `scripts/ingest_metrics.py` → `memory/current_metrics.json` → `dashboard/server.py`

Each source is **independent**. Missing tokens for one source do not block the others. Missing tokens use mock data and set `"_source": "mock"`.

| Tool | Env vars | Guide |
|---|---|---|
| GitHub | `GITHUB_TOKEN`, `GITHUB_REPO=owner/repo` | `integrations/github.md` |
| Jira | `JIRA_TOKEN`, `JIRA_BASE_URL`, `JIRA_EMAIL`, `JIRA_PROJECT` | `integrations/jira.md` |
| PagerDuty | `PAGERDUTY_TOKEN` | `integrations/pagerduty.md` |
| Slack | `SLACK_TOKEN` | `integrations/slack.md` |
| Datadog | `DATADOG_API_KEY`, `DATADOG_APP_KEY` | `integrations/datadog.md` |

Run: `python3 scripts/ingest_metrics.py` then `./bin/em-os status` to see `_source` per tool.
