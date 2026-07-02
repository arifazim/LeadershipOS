# Regression Run — decision-memory — {{YYYY-MM-DD}}

Triggered by: [Monthly kaizen / Module update / Threshold change / Manual]
Skill version: {{commit or date of last change to the skill files}}
Dataset: evaluations/datasets/decision-memory/decision-memory-scenarios.md

## Results

| Scenario | Expected Status | Actual Status | Expected Confidence | Actual Confidence | Pass/Fail | Notes |
|---|---|---|---|---|---|---|
| DM-01 Healthy | Healthy | — | High | — | — | — |
| DM-05 Warning | Warning | — | Medium | — | — | — |
| DM-06 At Risk | At Risk | — | Medium | — | — | — |
| DM-07 Critical | Critical | — | High | — | — | — |

## Golden Output Comparison (where applicable)

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| DM-01 Healthy | — | — | — |
| DM-07 Critical | — | — | — |

## Pattern Detection Check

Module-specific check — not covered by the generic format in `evaluations/regression/README.md`. Verifies `skills/decision-memory/detect-patterns.md` classifies severity correctly.

| Scenario | Pattern Detected | Severity | Correct | Pass/Fail |
|---|---|---|---|---|
| DM-01 Healthy | None | — | — | — |
| DM-05 Warning | — | — | — | — |
| DM-06 At Risk | — | — | — | — |
| DM-07 Critical | — | — | — | — |

## Overall Result

PASS / FAIL

If FAIL:
- Scenarios failed: {{list}}
- Root cause: {{what changed that broke the scenario}}
- Action: {{update skill / update golden / update threshold / investigate}}

## Notes

{{Anything unusual about this run — edge cases, borderline passes, new failure modes observed}}

---

## Trend Tracking

| Date | Scenarios | Passed | Failed | Overall |
|---|---|---|---|---|
| — | — | — | — | — |

A declining pass rate over 3 consecutive runs means the OS is degrading. Escalate to a full kaizen review.
