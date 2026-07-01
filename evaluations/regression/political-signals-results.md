# Regression Results — Political Signals

This directory stores the output of each evaluation run for the political-signals module.

---

## File Naming

```
{{YYYY-MM-DD}}-political-signals-results.md
```

---

## Result File Format

```markdown
# Regression Run — Political Signals — {{YYYY-MM-DD}}

Triggered by: [Monthly kaizen / Module update / Threshold change / Manual]
Skill version: {{commit or date of last change to the skill files}}
Dataset: evaluations/datasets/political-signals/{{dataset file used}}

## Results

| Scenario | Expected Status | Actual Status | Expected Confidence | Actual Confidence | Pass/Fail | Notes |
|---|---|---|---|---|---|---|
| PS-01 Healthy | Green | Green | High | High | PASS | — |
| PS-07 Critical | Red | Red | High | High | PASS | — |

## Golden Output Comparison (where applicable)

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| PS-01 Healthy | 0 | 0 | PASS |
| PS-07 Critical | 0 | 1 (score 67 vs. 68.5 golden) | PASS |

## Ethical Response Protocol Check

| Scenario | Protocol Applied | Pass/Fail |
|---|---|---|
| PS-01 Healthy | Yes (sustain) | PASS |
| PS-03 Warning | Yes (transparency recommendation) | PASS |
| PS-05 At Risk | Yes (publish decision log) | PASS |
| PS-07 Critical | Yes (document, involve HR, protect team) | PASS |

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
- All scenarios produce the correct ORGANIZATIONAL RISK STATUS (or equivalent primary output)
- All scenarios produce the correct CONFIDENCE label (High/Medium/Low)
- Golden output scenarios have 0 hard failures
- Ethical Response Protocol is applied in all non-healthy scenarios

**A run FAILS if**:
- Any scenario produces an incorrect primary status
- Any golden output scenario has 1 or more hard failures
- More than 2 soft failures across the full suite
- Any non-healthy scenario lacks an Ethical Response Protocol recommendation

**On failure**: Do not deploy or use the updated skill/prompt until the failure is investigated and the root cause is addressed. Log the failure in `kaizen/failures.md`.

---

## Trend Tracking

After each run, update this table:

| Date | Scenarios | Passed | Failed | Overall |
|---|---|---|---|---|
| — | — | — | — | — | — |

A declining pass rate over 3 consecutive runs means the OS is degrading. Escalate to a full kaizen review.
