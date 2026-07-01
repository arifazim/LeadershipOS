# Regression Results — Decision Memory

This directory stores the output of each evaluation run for the decision-memory module.

---

## File Naming

```
{{YYYY-MM-DD}}-decision-memory-results.md
```

---

## Result File Format

```markdown
# Regression Run — Decision Memory — {{YYYY-MM-DD}}

Triggered by: [Monthly kaizen / Module update / Threshold change / Manual]
Skill version: {{commit or date of last change to the skill files}}
Dataset: evaluations/datasets/decision-memory/{{dataset file used}}

## Results

| Scenario | Expected Status | Actual Status | Expected Confidence | Actual Confidence | Pass/Fail | Notes |
|---|---|---|---|---|---|---|
| DM-01 Healthy | Green | Green | High | High | PASS | — |
| DM-07 Critical | Red | Red | High | High | PASS | — |

## Golden Output Comparison (where applicable)

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| DM-01 Healthy | 0 | 0 | PASS |
| DM-07 Critical | 0 | 1 (exact decision IDs differ) | PASS |

## Pattern Detection Check

| Scenario | Pattern Detected | Severity | Correct | Pass/Fail |
|---|---|---|---|---|
| DM-01 Healthy | None | — | Yes | PASS |
| DM-05 Warning | Underestimated vendor onboarding | Warning | Yes | PASS |
| DM-06 At Risk | Similar failure in migration | At Risk | Yes | PASS |
| DM-07 Critical | Similar failure Q4 architecture | Critical | Yes | PASS |

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
- All scenarios produce the correct DECISION MEMORY STATUS
- All scenarios produce the correct CONFIDENCE label (High/Medium/Low)
- Golden output scenarios have 0 hard failures
- Pattern detection produces correct severity classification

**A run FAILS if**:
- Any scenario produces an incorrect primary status
- Any golden output scenario has 1 or more hard failures
- More than 2 soft failures across the full suite
- Pattern detection severity is incorrect for any scenario

**On failure**: Do not deploy or use the updated skill/prompt until the failure is investigated and the root cause is addressed. Log the failure in `kaizen/failures.md`.

---

## Trend Tracking

After each run, update this table:

| Date | Scenarios | Passed | Failed | Overall |
|---|---|---|---|---|
| — | — | — | — | — |

A declining pass rate over 3 consecutive runs means the OS is degrading. Escalate to a full kaizen review.
