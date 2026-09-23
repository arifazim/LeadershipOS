# Slack

**Data read**: not yet pulled into DORA bands. Token presence is recorded on ingest (`slack.configured`).

**Required env**
- `SLACK_TOKEN` — bot token (`auth.test` + `conversations.list`)

**Actions taken**: none (read-only).

**Fallback**: mock if token missing or Slack API `ok` is false.

Channel sentiment is still not a SPACE input; DORA uses GitHub/Jira/PagerDuty.
