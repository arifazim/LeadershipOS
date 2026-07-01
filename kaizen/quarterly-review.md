# Quarterly Kaizen Review

**Cadence**: Last week of each quarter
**Replaces**: That month's regular monthly review (do not run both)
**Duration**: 2-3 hours
**Extracted from**: `continuous-improvement.md`'s former "Quarterly Rollup" template — that file had the shape of a rollup but no actual process for producing one; this is that process
**Output**: Quarter-level OS health trend, principle revision decisions, next-quarter kaizen priorities

The quarterly review operates one level above the monthly. Monthly reviews ask whether the system is working. Quarterly reviews ask whether the system is *improving* — and whether the improvement is worth what it costs to run this whole kaizen process.

---

## Part 1 — Monthly Review Audit (20 min)

```
MONTHS REVIEWED: {{list the 3 months}}

Monthly reviews completed: {{N of 3}}
Total OS updates made this quarter:
- Memory additions: {{count}}
- Skill changes: {{count}}
- Prompt changes: {{count}}
- Playbook changes: {{count}}
- Threshold changes: {{count}}
- Contract version bumps: {{count}}
```

## Part 2 — Pattern Rollup (30 min)

Pull the Pattern Table from each month's `kaizen/failure-analysis.md`:

```
Patterns opened this quarter: {{count}}
Patterns closed this quarter: {{count}}
Patterns still open at quarter end: {{count}} — each needs an explicit decision: fix in Q+1 or accept as known limitation
Most common root-cause category this quarter: {{category from kaizen/root-cause.md}}
```

## Part 3 — Principle Revision Decision (30 min)

`monthly-review.md` Part 5 flags principles as "Revision candidate" but requires 2 months of evidence before changing. This is where that 2-month clock resolves:

```
| Principle | Revision candidate since | Evidence accumulated | Decision |
|---|---|---|---|
| {{principle}} | {{month}} | {{summary}} | {{Revise / Hold — needs more evidence / Reject}} |
```

Only revise `docs/principles.md` here, at the quarterly cadence — never mid-quarter on a single month's evidence.

## Part 4 — OS Health Trend (20 min)

Pull the OS Health Score from each of the 3 monthly reviews:

```
DIMENSION                          | MONTH 1 | MONTH 2 | MONTH 3 | QUARTER TREND
Prediction accuracy                | {{}}    | {{}}    | {{}}    | {{Improving/Stable/Declining}}
Recommendation quality             | {{}}    | {{}}    | {{}}    | {{}}
Threshold calibration              | {{}}    | {{}}    | {{}}    | {{}}
Subagent composability             | {{}}    | {{}}    | {{}}    | {{}}
Skill coverage (no blind spots)    | {{}}    | {{}}    | {{}}    | {{}}
Kaizen process discipline          | {{}}    | {{}}    | {{}}    | {{}}
Playbook accuracy                  | {{}}    | {{}}    | {{}}    | {{}}

OVERALL QUARTER TREND: {{Improving / Stable / Declining}}
```

A dimension declining for 2+ consecutive months is a quarterly priority regardless of its absolute score.

## Part 5 — Next Quarter Priorities (20 min)

```
Priority 1: {{what}} — {{why}} — {{owner}} — {{done by}}
Priority 2: {{what}} — {{why}} — {{owner}} — {{done by}}
Priority 3: {{what}} — {{why}} — {{owner}} — {{done by}}
```

## Archive Entry

Append to `kaizen/continuous-improvement.md`:

```
## Q{{N}} {{YEAR}} Rollup

Changes this quarter: {{count}}
Most common change category: {{tag}}
Principles revised: {{count — if 0, ask whether principles are being tested}}
Thresholds changed: {{count}} ({{N}} tightened, {{N}} relaxed)
Failures closed: {{count}}
Failures opened: {{count}}
Open failures at quarter end: {{count}}

Trend: {{Is the OS improving? Are failures declining? Are thresholds stabilizing? Write 2-3 sentences.}}

Most impactful change this quarter:
{{Describe the one change that most improved OS quality or manager effectiveness}}

What the OS still cannot do:
{{Capability gap that remains — what the OS consistently gets wrong or cannot cover}}
```
