# Dataset: Political Signals Scenarios

**Used by**: `political-signals/political-signals.md`
**Linked scenarios**: `political-signals/features/political-signals.feature`
**Purpose**: Standard inputs for regression testing and prompt calibration

Each scenario provides a complete input payload that can be fed to the political signals master pad. The expected output classification is noted for each. Full golden outputs exist for Healthy and Critical cases (see `evaluations/golden/political-signals/`).

---

## Scenario PS-01 — Healthy (Canonical)
*Maps to: `@healthy` — "Healthy Organization — no significant political signals"*
*Full golden output: `evaluations/golden/political-signals/political-signals-healthy.md`*

```
decision_reversals: 20 (Green)
meeting_exclusion: 15 (Green)
ownership_ambiguity: 18 (Green)
escalation_patterns: 22 (Green)
incentive_misalignment: 25 (Green)

Observation period: 3 months
Data sources: All available
Confidence per signal: All High

Expected: ORGANIZATIONAL RISK STATUS = Green | CONFIDENCE = High | PATTERNS = None
```

---

## Scenario PS-02 — Healthy (One Minor Signal)
*Maps to: `@healthy` — "Low-Risk with One Minor Signal"*

```
decision_reversals: 25 (Green)
meeting_exclusion: 42 (Yellow)
ownership_ambiguity: 20 (Green)
escalation_patterns: 18 (Green)
incentive_misalignment: 22 (Green)

Observation period: 3 months
Data sources: All available
Confidence per signal: All High

Expected: ORGANIZATIONAL RISK STATUS = Green | CONFIDENCE = High | PRIMARY SIGNAL = meeting_exclusion
```

---

## Scenario PS-03 — Warning (Ownership Ambiguity)
*Maps to: `@warning` — "Warning — ownership ambiguity emerging"*

```
decision_reversals: 35 (Yellow)
meeting_exclusion: 28 (Green)
ownership_ambiguity: 55 (Yellow)
escalation_patterns: 30 (Green)
incentive_misalignment: 32 (Green)

Observation period: 3 months
Data sources: Team feedback, decision log
Confidence: Medium (some signals based on inference)

Expected: ORGANIZATIONAL RISK STATUS = Yellow | CONFIDENCE = Medium | PRIMARY SIGNAL = ownership_ambiguity
```

---

## Scenario PS-04 — Warning (Incentive Misalignment)
*Maps to: `@warning` — "Warning — incentive misalignment emerging"*

```
decision_reversals: 30 (Green)
meeting_exclusion: 25 (Green)
ownership_ambiguity: 28 (Green)
escalation_patterns: 35 (Yellow)
incentive_misalignment: 58 (Yellow)

Observation period: 3 months
Data sources: HR data, team feedback
Confidence: Medium

Expected: ORGANIZATIONAL RISK STATUS = Yellow | CONFIDENCE = Medium | PRIMARY SIGNAL = incentive_misalignment
```

---

## Scenario PS-05 — At Risk (Decision Reversals)
*Maps to: `@at-risk` — "At-Risk — decision reversals pattern detected"*

```
decision_reversals: 68 (Red)
meeting_exclusion: 30 (Green)
ownership_ambiguity: 45 (Yellow)
escalation_patterns: 38 (Green)
incentive_misalignment: 35 (Yellow)

Observation period: 3 months
Data sources: Decision log (10 reversals in 30 days), team feedback
Confidence: High

Expected: ORGANIZATIONAL RISK STATUS = At Risk | CONFIDENCE = High | PATTERN = accountability_shield
```

---

## Scenario PS-06 — At Risk (Escalation Bypass)
*Maps to: `@at-risk` — "At-Risk — escalation bypass pattern"*

```
decision_reversals: 40 (Yellow)
meeting_exclusion: 55 (Yellow)
ownership_ambiguity: 60 (Yellow)
escalation_patterns: 72 (Red)
incentive_misalignment: 48 (Yellow)

Observation period: 3 months
Data sources: Escalation log, team feedback, meeting records
Confidence: High

Expected: ORGANIZATIONAL RISK STATUS = At Risk | CONFIDENCE = High | PATTERN = power_vacuum
```

---

## Scenario PS-07 — Critical (Targeted Erasure)
*Maps to: `@critical` — "Critical — targeted erasure pattern"*
*Full golden output: `evaluations/golden/political-signals/political-signals-critical.md`*

```
decision_reversals: 80 (Red)
meeting_exclusion: 75 (Red)
ownership_ambiguity: 70 (Red)
escalation_patterns: 65 (Red)
incentive_misalignment: 60 (Red)

Observation period: 3 months
Data sources: All available, HR data, exit interview themes
Confidence per signal: Most High, escalation_patterns Medium
Context: Recent reorg, 2 voluntary attritions, new director

Expected: ORGANIZATIONAL RISK STATUS = Red | CONFIDENCE = High | PATTERNS = targeted_erasure + accountability_shield | IMMEDIATE_ACTION = Yes
```

---

## Regression Run Instructions

To run regression against all scenarios:

1. Feed each scenario's input block to `political-signals/political-signals.md`
2. Compare output to the `Expected:` line for each scenario
3. For PS-01 and PS-07, compare the full output to the golden output files
4. Flag any scenario where ORGANIZATIONAL RISK STATUS or PATTERN does not match
5. Flag any scenario where CONFIDENCE label is wrong (High/Medium/Low)
6. Record results in `evaluations/regression/{{YYYY-MM-DD}}-political-signals-results.md`

**Pass threshold**: All 7 scenarios must produce correct STATUS and CONFIDENCE label. Full golden output match (with tolerance) required for PS-01 and PS-07. Ethical Response Protocol must be present in all outputs.
