# Regression Results

This directory stores the output of each evaluation run. Each file is a dated record of how the OS performed against its test suite.

---

## File Naming

```
{{YYYY-MM-DD}}-{{skill-or-feature}}-results.md
```

Examples:
- `2025-03-07-sprint-results.md`
- `2025-03-07-incidents-results.md`
- `2025-03-07-full-suite.md`

---

## Result File Format

```markdown
# Regression Run — {{skill or feature}} — {{YYYY-MM-DD}}

Triggered by: [Weekly kaizen / Skill update / Threshold change / Manual]
Skill version: {{commit or date of last change to the skill file}}
Dataset: evaluations/datasets/{{dataset file used}}

## Results

| Scenario | Expected Status | Actual Status | Expected Confidence | Actual Confidence | Pass/Fail | Notes |
|---|---|---|---|---|---|---|
| S-01 Healthy | Green | Green | High | High | PASS | — |
| S-06 Critical | Red | Red | High | High | PASS | — |

## Golden Output Comparison (where applicable)

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| S-01 Healthy | 0 | 0 | PASS |
| S-06 Critical | 0 | 1 (confidence 87% vs. 92% golden) | PASS |

## Overall Result

PASS / FAIL

If FAIL:
- Scenarios failed: {{list}}
- Root cause: {{what changed that broke the scenario}}
- Action: {{update skill / update golden / update threshold / investigate}}

## Notes

{{Anything unusual about this run — edge cases, borderline passes, new failure modes observed}}
```

---

## Pass/Fail Rules

**A run PASSES if**:
- All scenarios produce the correct DELIVERY STATUS (or equivalent primary output)
- All scenarios produce the correct CONFIDENCE label (High/Medium/Low)
- Golden output scenarios have 0 hard failures

**A run FAILS if**:
- Any scenario produces an incorrect primary status
- Any golden output scenario has 1 or more hard failures
- More than 2 soft failures across the full suite

**On failure**: Do not deploy or use the updated skill/prompt until the failure is investigated and the root cause is addressed. Log the failure in `kaizen/failures.md`.

---

## Trend Tracking

After each run, update this table:

| Date | Skill/Feature | Scenarios | Passed | Failed | Overall |
|---|---|---|---|---|---|
| — | — | — | — | — | — |

A declining pass rate over 3 consecutive runs means the OS is degrading. Escalate to a full kaizen review.
