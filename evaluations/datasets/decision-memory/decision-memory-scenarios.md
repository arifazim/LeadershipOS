# Dataset: Decision Memory Scenarios

**Used by**: `decision-memory/decision-memory.md`
**Linked scenarios**: `decision-memory/features/decision-memory.feature`
**Purpose**: Standard inputs for regression testing and prompt calibration

Each scenario provides a complete input payload that can be fed to the decision memory master pad. The expected output classification is noted for each. Full golden outputs exist for Healthy and Critical cases (see `evaluations/golden/decision-memory/`).

---

## Scenario DM-01 — Healthy History (Canonical)
*Maps to: `@healthy` — "No patterns detected — healthy decision history"*
*Full golden output: `evaluations/golden/decision-memory/decision-memory-healthy.md`*

```
Decision context: New decision needed for vendor selection
Historical records loaded: 24 decisions from past 2 years
Record completeness: 92%
Outcome documentation: 83%
Similar decisions found: 3
Closest analog outcome: Successful
Pattern detection: 0 Critical patterns, 1 Warning (underestimated vendor onboarding - 2 instances, different contexts)
Confidence in historical data: High

Expected: STATUS = Green | CONFIDENCE = High | PATTERNS = None Critical | RECOMMENDATION = Proceed with buffer insight
```

---

## Scenario DM-02 — Recall Exact Match
*Maps to: `@regression` — "Recall exact past decision"*

```
Decision context: Should we use the same vendor we evaluated 8 months ago?
Historical records loaded: 24 decisions
Record completeness: 92%
Outcome documentation: 83%
Similar decisions found: 1 (DEC-2024-010)
Closest analog outcome: Failed because QA capacity underestimated
Pattern detection: No critical patterns
Confidence in historical data: High

Expected: DEC-2024-010 retrieved, similarity >= 80%, past failure surfaced with reason
```

---

## Scenario DM-03 — New Decision
*Maps to: `@regression` — "Record new decision with full context"*

```
Decision context: New architecture decision with 3 alternatives
Alternatives documented: 3
Rationale documented: Yes
Stakeholders consulted: Yes
Expected outcome: Defined with 2 measurable criteria
Confidence at time: Medium
Reversibility: Partial
Historical records loaded: 24 decisions

Expected: New record created, all 8 fields populated, quality score Strong or Excellent
```

---

## Scenario DM-04 — Incomplete Record
*Maps to: `@regression` — "Record decision with missing fields"*

```
Decision context: New decision but minimal documentation
Alternatives documented: 0
Rationale: "Seems like the right call"
Expected outcome: Vague
Historical records loaded: 24 decisions

Expected: Missing fields flagged, quality score Poor or Acceptable, recommendations to improve provided
```

---

## Scenario DM-05 — Warning Pattern
*Maps to: `@warning` — patterns implied in a warning scenario*

```
Decision context: New vendor selection decision
Historical records loaded: 30 decisions
Record completeness: 90%
Outcome documentation: 85%
Similar decisions found: 2 (both vendor evaluations)
Closest analog outcome: Both Mixed outcomes, similar root causes
Pattern detection: 2 Warning patterns (underestimated onboarding time, scope creep)
Confidence in historical data: Medium

Expected: STATUS = Yellow | CONFIDENCE = Medium | WARNING = Underestimated vendor onboarding (2 instances)
```

---

## Scenario DM-06 — At Risk (Multiple Failures)
*Maps to: `@at-risk` — "At-risk decision history"*

```
Decision context: Should we migrate to a new platform?
Historical records loaded: 30 decisions
Record completeness: 88%
Outcome documentation: 80%
Similar decisions found: 4 (2 platform migrations, 1 data migration, 1 vendor switch)
Closest analog outcome: 2 Failed, 1 Mixed, 1 Successful
Pattern detection: 2 Warning patterns (similar failures in migration domain)
Confidence in historical data: High

Expected: STATUS = At Risk | CONFIDENCE = High | PATTERN = Similar failure in migration domain (2 failures)
```

---

## Scenario DM-07 — Critical Pattern (Canonical)
*Maps to: `@critical` — "Repeated failure pattern detected"*
*Full golden output: `evaluations/golden/decision-memory/decision-memory-critical.md`*

```
Decision context: Should we commit to a new architecture migration during Q4?
Historical records loaded: 30 decisions
Record completeness: 93%
Outcome documentation: 87%
Similar decisions found: 3 (all Q4 architecture migrations)
Closest analog outcome: All 3 Failed with similar root causes
Pattern detection: 1 Critical pattern (Q4 freeze architecture failures - 3 of 3)
Confidence in historical data: High
Affected decisions: DEC-2023-008, DEC-2023-012, DEC-2024-003

Expected: STATUS = Red | CONFIDENCE = High | PATTERN = Critical (similar failure, 100% failure rate) | RECOMMENDATION = DO NOT COMMIT
```

---

## Regression Run Instructions

To run regression against all scenarios:

1. Feed each scenario's input block to `decision-memory/decision-memory.md`
2. Compare output to the `Expected:` line for each scenario
3. For DM-01 and DM-07, compare the full output to the golden output files
4. Flag any scenario where STATUS or CONFIDENCE does not match
5. Flag any scenario where pattern detection severity is incorrect
6. Record results in `evaluations/regression/{{YYYY-MM-DD}}-decision-memory-results.md`

**Pass threshold**: All 7 scenarios must produce correct STATUS and CONFIDENCE label. Full golden output match (with tolerance) required for DM-01 and DM-07.
