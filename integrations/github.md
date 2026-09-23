# GitHub

**Data read**: closed PRs (cycle time), deployments (frequency). Written to `memory/current_metrics.json` → `github`.

**Required env**
- `GITHUB_TOKEN` — classic or fine-grained token with `repo` read
- `GITHUB_REPO` — `owner/repo`

**Actions taken**: none (read-only).

**Fallback**: mock DORA-shaped fields if token/repo missing or the API call fails (`_source`: `mock` or `mock-fallback`).
