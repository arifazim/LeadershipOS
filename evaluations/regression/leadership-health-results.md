# Regression Run — leadership-health — {{YYYY-MM-DD}}

Triggered by: [Weekly kaizen / Skill update / Threshold change / Manual]
Skill version: {{commit or date of last change to the skill file}}
Dataset: evaluations/datasets/leadership-health-scenarios.md

## Results

| Scenario | Expected Status | Actual Status | Expected Confidence | Actual Confidence | Pass/Fail | Notes |
|---|---|---|---|---|---|---|
| LH-01 Healthy | Healthy | — | High | — | — | — |
| LH-02 Healthy | Healthy | — | High | — | — | — |
| LH-03 Warning | Warning | — | Medium | — | — | — |
| LH-04 Warning | Warning | — | Medium | — | — | — |
| LH-05 At Risk | At Risk | — | Medium | — | — | — |
| LH-06 Critical | Critical | — | High | — | — | — |
| LH-07 Critical | Critical | — | High | — | — | — |

## Golden Output Comparison (where applicable)

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| LH-01 Healthy | — | — | — |
| LH-06 Critical | — | — | — |

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

| Date | Skill/Feature | Scenarios | Passed | Failed | Overall |
|---|---|---|---|---|---|
| — | — | — | — | — | — |

A declining pass rate over 3 consecutive runs means the OS is degrading. Escalate to a full kaizen review.