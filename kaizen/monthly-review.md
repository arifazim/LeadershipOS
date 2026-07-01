# Monthly Kaizen Review

**Cadence**: Last Friday of each month
**Replaces**: That week's regular weekly review (do not run both)
**Duration**: 90–120 minutes
**Output**: Quarterly trend analysis, threshold recalibration decisions, principle audit, OS health score

The monthly review operates at a higher level than the weekly. Weekly reviews fix specific failures. Monthly reviews ask whether the system is working at all.

---

## Part 1 — Weekly Review Audit (15 min)

Before anything else, review the four weekly reviews from this month.

```
WEEKS REVIEWED: {{list the 4 dates}}

Weekly reviews completed: {{N of 4}}
If < 4: what was skipped and why? {{explain — this itself may need to go in failures.md}}

Total OS updates made this month:
- Memory additions: {{count}}
- Skill changes: {{count}}
- Prompt changes: {{count}}
- Playbook changes: {{count}}
- Threshold changes: {{count}}
- New scenarios added to features/: {{count}}

Update cascade completed (all 5 steps) each week: {{Yes / No / Partial}}
If No: where did it break down?
```

---

## Part 2 — Failure Pattern Analysis (20 min)

Run `kaizen/failure-analysis.md` — the full monthly pattern-analysis process now lives there, reading across `kaizen/failures.md`'s entries using the `kaizen/root-cause.md` taxonomy. Paste its summary output here for the archive record.

---

## Part 3 — Prediction Accuracy Review (20 min)

This is the most important part of the monthly review. It asks: is the OS's confidence system calibrated?

Run `kaizen/prediction-review.md`'s Monthly Calibration Analysis section — it now holds the full process (calibration table, summary thresholds, confidence-modifier adjustment rule). Paste its summary output here for the archive record.

---

## Part 4 — Threshold Recalibration (15 min)

Review all thresholds that fired this month. For each:

```
| Feature File | Scenario | Threshold | Fired? | Correct? | Proposed Change |
|---|---|---|---|---|---|
| sprint.feature | Healthy Sprint | velocity >= 90% | Yes | Yes | None |
| incidents.feature | MTTR Breached P1 | > 4 hours | No | N/A | — |
```

**False positive** (threshold fired, situation was actually fine): threshold is too sensitive — relax it.
**False negative** (threshold should have fired, didn't): threshold is not sensitive enough — tighten it.
**No fires all month**: either the team is genuinely healthy, or the threshold is set so high it never triggers. Verify with real data.

Thresholds should only change with Medium or High confidence evidence. Do not change thresholds based on a single data point.

---

## Part 5 — Principle Audit (15 min)

Review `docs/principles.md`. For each of the 13 principles:

```
| Principle | Reflected in OS Artifacts? | Tested in Practice This Month? | Verdict |
|---|---|---|---|
| 1. People First | Yes — burnout.feature, engineering-coach.md | Yes — 1 at-risk signal detected | Holding |
| 2. Business First | Partial — mentioned in prompts | No direct test | Needs scenario |
| ... | | | |
```

Verdict options:
- **Holding**: Principle is in the artifacts and proved correct in practice
- **Needs scenario**: No Gherkin scenario tests this principle — add one
- **Tested and held**: Principle was challenged by a real situation and remained the right answer
- **Revision candidate**: Principle proved incomplete or wrong — flag for revision (requires 2 months of evidence before changing)

A principle that has not been tested in 3 months is not guiding decisions — it is decoration.

---

## Part 6 — Skill Usage Audit (10 min)

Run `kaizen/skill-review.md`'s Monthly Usage Audit section — it now holds the full process (usage tally, the "why isn't it used" decision tree, and the contract-drift check). Paste its summary output here for the archive record.

---

## Part 7 — OS Health Score (5 min)

Score the OS this month on each dimension. Honest scores only.

```
DIMENSION                          | SCORE (1–5) | TREND | NOTES
Prediction accuracy                | {{score}}   | ↑↓→   | {{note}}
Recommendation quality             | {{score}}   | ↑↓→   | {{note}}
Threshold calibration              | {{score}}   | ↑↓→   | {{note}}
Subagent composability             | {{score}}   | ↑↓→   | {{note}}
Skill coverage (no blind spots)    | {{score}}   | ↑↓→   | {{note}}
Kaizen process discipline          | {{score}}   | ↑↓→   | {{note}}
Playbook accuracy (matches reality)| {{score}}   | ↑↓→   | {{note}}

OVERALL OS HEALTH: {{average}} / 5
TREND vs. LAST MONTH: {{Improving / Stable / Declining}}
```

Score guide:
- **5**: Excellent — consistently correct, no known gaps
- **4**: Good — mostly correct, minor calibration needed
- **3**: Acceptable — works but has known issues being addressed
- **2**: Concerning — significant gaps or consistent errors
- **1**: Failing — needs immediate attention before being used

An OS health score below 3 on any dimension is a kaizen priority for next month.

---

## Part 8 — Next Month Priorities (5 min)

Based on everything above, name the top 3 improvements for next month:

```
Priority 1: {{what}} — {{why}} — {{owner}} — {{done by}}
Priority 2: {{what}} — {{why}} — {{owner}} — {{done by}}
Priority 3: {{what}} — {{why}} — {{owner}} — {{done by}}
```

---

## Archive

Add the month's summary to `kaizen/continuous-improvement.md` as a monthly summary row. At the end of each quarter, run `kaizen/quarterly-review.md` instead of this file — it rolls up all three months and produces the Quarterly Rollup archive entry.
