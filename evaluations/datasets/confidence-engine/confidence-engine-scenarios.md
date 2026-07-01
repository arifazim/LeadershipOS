# Dataset: Confidence Engine Scenarios

**Used by**: `confidence-engine/executive_confidence.md`
**Linked scenarios**: `confidence-engine/features/confidence-engine.feature`
**Purpose**: Standard inputs for regression testing and prompt calibration

Each scenario provides a complete input payload that can be fed to the master confidence engine assessment. The expected output classification is noted for each. Full golden outputs exist for Healthy and Critical cases (see `evaluations/golden/confidence-engine/`).

---

## Scenario CE-01 — Healthy (Canonical)
*Maps to: `@healthy` — "Healthy Confidence — all 6 dimensions green"*
*Full golden output: `evaluations/golden/confidence-engine/confidence-engine-healthy.md`*

```
prediction_confidence: 88 (High)
data_quality: 92 (High)
risk_confidence: 85 (High)
delivery_confidence: 90 (High)
roadmap_confidence: 87 (High)
architecture_confidence: 91 (High)

GitHub: PR cycle time 1.2 days, revert rate 2%, bi-weekly deployments
Jira: Sprint velocity 85%, milestone achievement 88%, story point accuracy 90%
Incidents: 2 P3 incidents, no P1/P2, MTTR 2.5 hours average
Customer Bugs: 0.3 per 1k users, time-to-detect 1.5 days

EM self-assessment: Team operating well with strong delivery track record.
Stakeholder feedback: "Reliable forecasts and trustworthy delivery estimates."

Expected: CONFIDENCE ENGINE STATUS = Green | CONFIDENCE = High | ROOT CAUSE = None
```

---

## Scenario CE-02 — Healthy (Roadmap Clarity Concern)
*Maps to: `@healthy` — "Strong Delivery with Developing Roadmap Clarity"*

```
prediction_confidence: 85 (High)
data_quality: 90 (High)
risk_confidence: 88 (High)
delivery_confidence: 92 (High)
roadmap_confidence: 72 (Yellow)
architecture_confidence: 90 (High)

GitHub: Stable deployment patterns, PR cycle time 1.5 days, revert rate 3%
Jira: Sprint velocity 88%, milestone achievement 90%, story point accuracy 85%
Incidents: 1 P2 incident, MTTR 3 hours, good escalation
Customer Bugs: 0.4 per 1k users

EM self-assessment: Delivery is strong but roadmap scope definition needs work.
Stakeholder feedback: "Delivery reliable but roadmap scope sometimes unclear."

Expected: CONFIDENCE ENGINE STATUS = Green | CONFIDENCE = High | NOTE: roadmap_confidence is Yellow (minor scope clarity gap)
```

---

## Scenario CE-03 — Warning (Data Pipeline Issues)
*Maps to: `@warning` — "Warning Confidence — data quality lag impacting reliability"*

```
prediction_confidence: 75 (Yellow)
data_quality: 68 (At Risk)
risk_confidence: 78 (Yellow)
delivery_confidence: 72 (Yellow)
roadmap_confidence: 75 (Yellow)
architecture_confidence: 70 (Yellow)

GitHub: PR cycle time 2.5 days, revert rate 8%, deployment lag issues
Jira: Sprint velocity 72%, milestone achievement 75%, story point accuracy 78%
Incidents: 3 P3 incidents, 1 P2, MTTR 4 hours, late escalation on 1 incident
Customer Bugs: 1.2 per 1k users, reporting lag 3 days

EM self-assessment: Seeing some variance in data and delivery.
Stakeholder feedback: "Data sometimes stale; delivery dates occasionally slip."

Expected: CONFIDENCE ENGINE STATUS = Yellow | CONFIDENCE = Medium | ROOT CAUSE = Data Quality and Delivery Reliability Gaps
```

---

## Scenario CE-04 — Warning (Scope Management Issues)
*Maps to: `@warning` — "Warning Confidence — roadmap scope drift and delivery variance"*

```
prediction_confidence: 80 (Yellow)
data_quality: 85 (High)
risk_confidence: 75 (Yellow)
delivery_confidence: 65 (At Risk)
roadmap_confidence: 62 (At Risk)
architecture_confidence: 78 (Yellow)

GitHub: Deployment frequency monthly, PR cycle time 3 days, revert rate 12%
Jira: Sprint velocity 68%, milestone achievement 65%, story point accuracy 70%
Incidents: 2 P2 incidents, MTTR 3.5 hours, some risks not escalated
Customer Bugs: 2.1 per 1k users

EM self-assessment: Roadmap scope changes are creating delivery pressure.
Stakeholder feedback: "Roadmap dates not reliable; frequent scope adjustments."

Expected: CONFIDENCE ENGINE STATUS = Yellow | CONFIDENCE = Medium | ROOT CAUSE = Roadmap confidence and Delivery Reliability deficits
```

---

## Scenario CE-05 — At Risk (Architecture Concerns)
*Maps to: `@at-risk` — "At-Risk Confidence — architecture instability and risk blindness"*

```
prediction_confidence: 62 (At Risk)
data_quality: 58 (At Risk)
risk_confidence: 55 (At Risk)
delivery_confidence: 65 (At Risk)
roadmap_confidence: 58 (At Risk)
architecture_confidence: 48 (Critical)

GitHub: Unstable master branch, PR cycle time 4 days, revert rate 22%
Jira: Sprint velocity 62%, milestone achievement 58%, story point accuracy 65%
Incidents: 3 P1 incidents, 5 P2 incidents, MTTR 5 hours average, risks under-identified
Customer Bugs: 4.8 per 1k users, time-to-detect 2.5 days

EM self-assessment: Architecture issues are affecting everything. Risk management needs attention.
Stakeholder feedback: "System reliability concerns; don't trust the current roadmap."

Expected: CONFIDENCE ENGINE STATUS = At Risk | CONFIDENCE = Medium | ROOT CAUSE = Architecture Confidence Critical and Risk Management gaps
```

---

## Scenario CE-06 — At Risk (Delivery Collapse)
*Maps to: `@at-risk` — "At-Risk Confidence — delivery failure cascade with data gaps"*

```
prediction_confidence: 58 (At Risk)
data_quality: 45 (Critical)
risk_confidence: 60 (At Risk)
delivery_confidence: 42 (Critical)
roadmap_confidence: 52 (At Risk)
architecture_confidence: 45 (Critical)

GitHub: PR cycle time 5 days, revert rate 25%, deployment failures
Jira: Sprint velocity 55%, milestone achievement 48%, story point accuracy 58%
Incidents: 2 P1 incidents, 6 P2 incidents, MTTR 6.5 hours, some risks missed
Customer Bugs: 6.2 per 1k users, time-to-detect 3.2 days

EM self-assessment: Delivery pipeline is failing. Data is a mess. We need help.
Stakeholder feedback: "Cannot rely on delivery dates. Data is inconsistent."

Expected: CONFIDENCE ENGINE STATUS = At Risk | CONFIDENCE = High | ROOT CAUSE = Delivery Confidence and Data Quality Critical
```

---

## Scenario CE-07 — Critical (Systemic Failure)
*Maps to: `@critical` — "Critical Confidence — systemic failure across multiple dimensions"*
*Full golden output: `evaluations/golden/confidence-engine/confidence-engine-critical.md`*

```
prediction_confidence: 35 (Critical)
data_quality: 30 (Critical)
risk_confidence: 40 (Critical)
delivery_confidence: 38 (Critical)
roadmap_confidence: 28 (Critical)
architecture_confidence: 32 (Critical)

GitHub: PR cycle time 7+ days, revert rate 28%, deployment daily failures
Jira: Sprint velocity 45%, milestone achievement 35%, story point accuracy 52%
Incidents: 4 P1 incidents, 8 P2 incidents, MTTR 6.2 hours, risks not escalated
Customer Bugs: 8.5 per 1k users, time-to-detect 4.8 days

EM self-assessment: Everything is falling apart. We cannot keep commitments.
360 feedback: "Delivery dates missed repeatedly. Critical risks hidden until incidents."
Stakeholder feedback: "Cannot rely on any forecasts or commitments."

Expected: CONFIDENCE ENGINE STATUS = Red | CONFIDENCE = High | IMMEDIATE_ACTION = Full intervention required; trust recovery program needed
```

---

## Regression Run Instructions

To run regression against all scenarios:

1. Feed each scenario's input block to `confidence-engine/executive_confidence.md`
2. Compare output to the `Expected:` line for each scenario
3. For CE-01 and CE-07, compare the full output to the golden output files
4. Flag any scenario where CONFIDENCE ENGINE STATUS or ROOT CAUSE does not match
5. Flag any scenario where CONFIDENCE label is wrong (High/Medium/Low)
6. Record results in `evaluations/regression/{{YYYY-MM-DD}}-confidence-engine-results.md`

**Pass threshold**: All 7 scenarios must produce correct STATUS and CONFIDENCE label. Full golden output match (with tolerance) required for CE-01 and CE-07.