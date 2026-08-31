# Graph Run Audit Log

**Domain**: Graph Engineering
**Owner**: `core/orchestrator.py` (planned)
**Cadence**: One Run node per CLI invocation, loop execution, or migration

---

## Purpose

Every agentic execution produces a bounded Run record — per Ng's requirement that every important output trace to a task, plan, artifact, source, evaluator decision, and execution record.

Run logs live here as dated markdown files until `graph/leadership-graph.json` runtime storage is implemented (Phase 1).

---

## Run Node Format

```
RUN RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ID:               RUN-YYYY-MM-DD-NNN
Date:             YYYY-MM-DDTHH:MM:SSZ
Trigger:          CLI | loop | migration | eval
Command:          {{what was invoked}}
User role:        M1 | M2 | M3 (when configured)
Agents invoked:   [list]
Skills invoked:   [list]
Artifacts produced: [artifact_id list]
Claims written:   [claim_id list]
Conflicts:        [contradicts edge IDs resolved, or "none"]
Migration refs:   [supersedes edges applied, if any]
Outcome:          success | partial | failed
Notes:            {{optional}}
```

---

## Migration Runs

| Run ID | Migration | Description |
|---|---|---|
| RUN-2026-08-20-001 | `2026-08-consolidation` | Graph-native Phase 0: schema, migration map, redirect stubs, README reconciliation |

---

## Related

- `graph/schema.md` — node and edge types
- `graph/migrations/2026-08-consolidation.json` — consolidation supersedes map
- `kaizen/continuous-improvement.md` — OS changelog for structural changes
