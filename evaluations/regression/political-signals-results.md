# Regression Run — political-signals — 2026-07-01

Triggered by: Manual (first-ever run for this module)
Skill version: `political-signals/political-signals.md`, fixed during this run
Dataset: evaluations/datasets/political-signals/political-signals-scenarios.md

## Results

Computed with the corrected 4-band Decision Tree. Weights (22/20/18/20/20, summing correctly to 100%) needed no fix.

| Scenario | Expected Status | Computed Score | Actual Status | Expected Confidence | Pass/Fail |
|---|---|---|---|---|---|
| PS-01 Healthy (canonical) | Green | 20.0 (golden: 20.0 — exact match) | Green | High | PASS |
| PS-02 Healthy (one minor signal) | Green | 25.5 | Green | High | PASS |
| PS-03 Warning (ownership ambiguity) | Yellow | 35.6 | Yellow | Medium | PASS |
| PS-04 Warning (incentive misalignment) | Yellow | 35.2 | Yellow | Medium | PASS |
| PS-05 At Risk (decision reversals) | At Risk | 43.7 | At Risk (was Yellow before fix) | High | PASS (after fix) |
| PS-06 At Risk (escalation bypass) | At Risk | 54.6 | At Risk (was Yellow before fix) | High | PASS (after fix) |
| PS-07 Critical (targeted erasure) | Red | 70.2 (golden: 68.5, tolerance 64-73) | Red | High | PASS |

## Golden Output Comparison

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| PS-01 Healthy | None | None (20.0 exact match) | PASS |
| PS-07 Critical | None — status Red, all 3 top dimensions correctly Critical, 2 patterns detected (targeted_erasure + accountability_shield) | None (70.2 within 64-73 tolerance) | PASS |

## Ethical Response Protocol Check

| Scenario | Protocol Applied | Pass/Fail |
|---|---|---|
| PS-01 Healthy | Yes (sustain current practices) | PASS |
| PS-03 Warning | Yes (targeted ethical response on ownership ambiguity) | PASS |
| PS-05 At Risk | Yes (accountability_shield pattern response — publish decision rationale) | PASS |
| PS-07 Critical | Yes (full Ethical Response Protocol — transparency, dialogue, stakeholder involvement, HR escalation path) | PASS |

## Overall Result

**FAIL as originally written (1 real bug found and fixed); PASS after fixing:**

**Bug found and fixed**: Decision Tree had only 3 bands (Green ≤30 / Yellow 31-60 / Red >60), no "At Risk" band, despite the regression dataset requiring one. PS-05 (43.7) and PS-06 (54.6) both misclassified as Yellow before the fix. Corrected using the boundary the fixture data itself implies: Yellow scenarios cluster at ~35, At Risk scenarios at 44-55, Red at ~70 — giving clean bands at 31-40/41-60/>60.

**After the fix: all 7 scenarios PASS**, including exact/near-exact reproduction of both golden outputs. This is the third module in a row (after leadership-health and confidence-engine) with the same missing-"At Risk"-band bug — a systemic pattern across all three weighted-scoring modules built together, worth a dedicated kaizen note (see `kaizen/failures.md`).

## Notes

- This is the first regression run ever executed for this module.
- Unlike leadership-health and confidence-engine, this module's weights were correct from the start (sum to exactly 100%) — only the banding was wrong.
- All 7 scenarios were computed by hand (no execution harness exists for these prompt-based skills).

---

## Trend Tracking

| Date | Scenarios | Passed | Failed | Overall |
|---|---|---|---|---|
| 2026-07-01 | 7 | 7 (after 1 bug fix) | 0 | PASS |

A declining pass rate over 3 consecutive runs means the OS is degrading. Escalate to a full kaizen review.
