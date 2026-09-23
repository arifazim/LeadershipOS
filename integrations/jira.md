# Jira

**Data read**: issues resolved in the last 14 days (velocity proxy), unplanned/bug labels. Written to `jira`.

**Required env**
- `JIRA_BASE_URL` — e.g. `https://your-domain.atlassian.net`
- `JIRA_EMAIL` — Atlassian account email
- `JIRA_TOKEN` — API token
- `JIRA_PROJECT` — project key

**Actions taken**: none (read-only search).

**Fallback**: mock sprint/roadmap fields if any required var is missing or the search fails.

Commitment accuracy and milestone name stay mock until a board/sprint API mapping is configured for this instance.
