# Regression Run — decision-memory — 2026-07-01

Triggered by: Manual (first-ever run for this module)
Skill version: `decision-memory/decision-memory.md`, fixed during this run
Dataset: evaluations/datasets/decision-memory/decision-memory-scenarios.md

## Results

Unlike the other 3 modules, decision-memory has no weighted numeric formula — status derives from pattern severity/frequency (per `schema.md`'s Pattern Classification), so no arithmetic bug was possible. A documentation gap was found instead (see Overall Result).

| Scenario | Expected Status | Actual Status | Expected Confidence | Pass/Fail |
|---|---|---|---|---|
| DM-01 Healthy (canonical) | Green | Green (0 Critical, 1 Warning-process pattern, first occurrence) | High | PASS |
| DM-02 Recall exact match | N/A (retrieval test) | DEC-2024-010 retrieved, similarity >=80%, past failure surfaced | — | PASS |
| DM-03 New decision, full context | N/A (quality test) | Quality Strong (3 alternatives, rationale, stakeholders, 2 measurable criteria ~ avg 3.0-3.2) | — | PASS |
| DM-04 Incomplete record | N/A (quality test) | Quality Poor (0 alternatives, vague rationale, vague outcome ~ avg 1.0-1.3) | — | PASS |
| DM-05 Warning pattern | Yellow | Yellow (2 Warning-severity process patterns, non-failure) | Medium | PASS |
| DM-06 At Risk (multiple failures) | At Risk | At Risk (failure pattern, Recurring 2x, per new Status Mapping) | High | PASS (after doc fix) |
| DM-07 Critical (canonical) | Red | Red (1 Critical pattern, 3 of 3 failures, Repeated 3x+) | High | PASS |

## Golden Output Comparison

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| DM-01 Healthy | None — 0 Critical patterns, historical analogs provided, quality completeness 92% (>=85% required) | None | PASS |
| DM-07 Critical | None — Red status, Critical severity, 3 of 3 frequency, 3 affected decisions named, "DO NOT COMMIT" warning issued | None | PASS |

## Pattern Detection Check

| Scenario | Pattern Detected | Severity | Frequency | Correct | Pass/Fail |
|---|---|---|---|---|---|
| DM-01 Healthy | Underestimated vendor onboarding | Warning | First occurrence (2 instances, different contexts) | Yes | PASS |
| DM-05 Warning | Underestimated onboarding + scope creep | Warning | Recurring, process-level (not failures) | Yes | PASS |
| DM-06 At Risk | Similar failure, migration domain | Warning-labeled in dataset, but frequency (2 failures) implies At Risk per new mapping | Recurring (2x) | Yes (after doc fix) | PASS |
| DM-07 Critical | Similar failure, Q4 freeze architecture | Critical | Repeated (3x+, 100%) | Yes | PASS |

## Overall Result

**PASS overall (7/7), with one documentation gap found and fixed:**

**Finding**: `decision-memory.md`'s Decision Tree never explicitly mapped its pattern severity/frequency taxonomy (`schema.md`'s Critical/Warning/Healthy severity + First occurrence/Recurring 2x/Repeated 3x+ frequency) to the `DECISION MEMORY STATUS` (Green/Yellow/At Risk/Red) that the regression dataset and golden outputs assume. DM-06 in particular only resolves to "At Risk" (distinct from DM-05's "Yellow") once frequency is factored in — a Warning-severity pattern that's specifically a *recurring failure* (2x) is more severe than a Warning-severity *process* pattern (onboarding estimation, scope creep) that hasn't recurred as an actual failure. Added an explicit Status Mapping table to the skill file.

This is a softer version of the same underlying issue found in the other 3 modules (leadership-health, confidence-engine, political-signals all had an explicit but *wrong* banding formula; decision-memory had no explicit banding at all) — all four modules were shipped without ever being run against their own golden outputs.

## Notes

- This is the first regression run ever executed for this module.
- No arithmetic/formula bug was possible here since there's no weighted score — this strengthens confidence that the missing-band issue found in the other 3 modules is a real, systemic pattern (see `kaizen/failures.md` FAIL-002) rather than a coincidence specific to one module's formula.
- All 7 scenarios were computed by hand (no execution harness exists for these prompt-based skills).

---

## Trend Tracking

| Date | Scenarios | Passed | Failed | Overall |
|---|---|---|---|---|
| 2026-07-01 | 7 | 7 | 0 | PASS (1 documentation gap fixed) |

A declining pass rate over 3 consecutive runs means the OS is degrading. Escalate to a full kaizen review.
