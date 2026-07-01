# Regression Run — confidence-engine — {{YYYY-MM-DD}}

Triggered by: [Weekly kaizen / Skill update / Threshold change / Manual]
Skill version: {{commit or date of last change to the skill file}}
Dataset: evaluations/datasets/confidence-engine/confidence-engine-scenarios.md

## Results

| Scenario | Expected Status | Actual Status | Expected Confidence | Actual Confidence | Pass/Fail | Notes |
|---|---|---|---|---|---|---|
| CE-01 Healthy | Healthy | — | High | — | — | — |
| CE-02 Healthy | Healthy | — | High | — | — | — |
| CE-03 Warning | Warning | — | Medium | — | — | — |
| CE-04 Warning | Warning | — | Medium | — | — | — |
| CE-05 At Risk | At Risk | — | Medium | — | — | — |
| CE-06 At Risk | At Risk | — | High | — | — | — |
| CE-07 Critical | Critical | — | High | — | — | — |

## Golden Output Comparison (where applicable)

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| CE-01 Healthy | — | — | — |
| CE-07 Critical | — | — | — |

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

A declining pass rate over 3 consecutive runs means the confidence engine is degrading. Escalate to a full kaizen review.