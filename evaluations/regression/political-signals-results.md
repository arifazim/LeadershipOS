# Regression Run — political-signals — {{YYYY-MM-DD}}

Triggered by: [Monthly kaizen / Module update / Threshold change / Manual]
Skill version: {{commit or date of last change to the skill files}}
Dataset: evaluations/datasets/political-signals/political-signals-scenarios.md

## Results

| Scenario | Expected Status | Actual Status | Expected Confidence | Actual Confidence | Pass/Fail | Notes |
|---|---|---|---|---|---|---|
| PS-01 Healthy | Healthy | — | High | — | — | — |
| PS-03 Warning | Warning | — | Medium | — | — | — |
| PS-05 At Risk | At Risk | — | High | — | — | — |
| PS-07 Critical | Critical | — | High | — | — | — |

## Golden Output Comparison (where applicable)

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| PS-01 Healthy | — | — | — |
| PS-07 Critical | — | — | — |

## Ethical Response Protocol Check

Module-specific check — not covered by the generic format in `evaluations/regression/README.md`. Every non-healthy scenario must apply an ethical, transparent response per `political-signals/political-signals.md`'s Step 3.

| Scenario | Protocol Applied | Pass/Fail |
|---|---|---|
| PS-01 Healthy | Yes (sustain) | — |
| PS-03 Warning | — | — |
| PS-05 At Risk | — | — |
| PS-07 Critical | — | — |

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
