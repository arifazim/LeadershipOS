# PagerDuty

**Data read**: incidents in the last 30 days, MTTR from created→resolved. Written to `pagerduty`.

**Required env**
- `PAGERDUTY_TOKEN` — REST API key

**Actions taken**: none (read-only).

**Fallback**: mock MTTR / incident count / CFR if token missing or the list call fails.

Change failure rate is not a native PagerDuty field; it stays estimated until deploy-failure tagging is defined.
