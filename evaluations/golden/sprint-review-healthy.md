# Golden Output: Sprint Review — Healthy Sprint

**Skill**: `skills/delivery/review-sprint.md`
**Scenario**: `features/sprint.feature` → `@healthy` — "Healthy Sprint — all signals green"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `review-sprint.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

```
Sprint goal: Ship onboarding flow v2 to production
Committed story points: 40
Completed story points: 38
Sprint goal status: Achieved
Stories committed: 12
Stories completed: 11
Stories carried over: 1 (UX polish — agreed deferral, not a failure)
Blockers reported: 1 (design review delay, resolved day 2)
Unplanned work: 3 points (7.5% of committed capacity)
Deployment frequency: 4 deploys this sprint
Change failure rate: 0%
PR cycle time (P50): 1.6 business days
Team satisfaction signal: Green (no concerns raised in 1:1s)
4-sprint trailing velocity average: 39 points
On-call actionable pages this week: 2
```

---

## Golden Output

```
DELIVERY STATUS: Green
CONFIDENCE: High — 90%

SPRINT SUMMARY:
- Goal: Achieved
- Completion rate: 95% vs. 4-sprint average of 98% (within normal variance)
- Unplanned work ratio: 7.5% (within acceptable range — no structural concern)
- Carry-over stories: 1 — agreed deferral of UX polish (not a failure)

DORA SNAPSHOT:
- Deployment frequency: 4 this sprint — Healthy
- Change failure rate: 0% — Healthy
- PR cycle time (P50): 1.6 business days — Healthy
- MTTR: No incidents this sprint — N/A

ROOT CAUSE: None — sprint goal achieved, all metrics within healthy range

RISKS:
- None material this sprint

RECOMMENDATIONS:
- Immediate: None required
- Next sprint: Sustain current practices — carry-over UX polish story forward as planned
- Systemic: None

RETRO SEEDS:
1. Design review delay on day 2 — is there a way to surface design dependencies during planning?
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| DELIVERY STATUS | Exact | Must be "Green" |
| CONFIDENCE label | Exact | Must be "High" |
| CONFIDENCE score | Range | Must be 85–95% |
| Goal status | Exact | Must be "Achieved" |
| Completion rate | Numeric | Must be 94–96% |
| Root cause | Exact | Must be "None" or equivalent |
| Recommendations → Immediate | Semantic | Must indicate no immediate action required |
| Retro seed count | Minimum | Must include at least 1 seed |
| Retro seed content | Semantic | Must reference the design review delay |

**Hard failures** (output must be rejected if):
- DELIVERY STATUS is not Green
- CONFIDENCE is not High
- Any recommendation names an immediate action that is not warranted
- Root cause names a cause when no cause exists

**Soft failures** (flag for review but do not reject):
- Confidence score outside 85–95% range
- Retro seed content is correct but phrased differently
- Recommendations include additional optional suggestions beyond "sustain"
