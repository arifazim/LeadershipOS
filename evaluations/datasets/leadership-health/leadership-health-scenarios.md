# Dataset: Leadership Health Scenarios

**Used by**: `leadership-health/master-leadership-health.md`
**Linked scenarios**: `leadership-health/features/leadership-health.feature`
**Purpose**: Standard inputs for regression testing and prompt calibration

Each scenario provides a complete input payload that can be fed to the master leadership health assessment skill. The expected output classification is noted for each. Full golden outputs exist for Healthy and Critical cases (see `evaluations/golden/leadership-health/`).

---

## Scenario LH-01 — Healthy (Canonical)
*Maps to: `@healthy` — "Healthy Leadership — all 13 dimensions green"*
*Full golden output: `evaluations/golden/leadership-health/leadership-health-healthy.md`*

```
executive_trust_score: 85 (High)
stakeholder_alignment: 88 (High)
organizational_clarity: 90 (High)
communication_effectiveness: 87 (High)
delegation_score: 82 (High)
coaching_score: 91 (High)
decision_quality: 86 (High)
ownership_index: 89 (High)
team_autonomy: 84 (High)
influence_score: 83 (Medium)
political_awareness: 80 (High)
meeting_quality: 85 (High)
execution_clarity: 90 (High)

360 feedback: "Reliable follow-through, clear communicator, good coaching. Occasionally defers too much to senior engineers."

Expected: LEADERSHIP HEALTH STATUS = Green | CONFIDENCE = High | ROOT CAUSE = None
```

---

## Scenario LH-02 — Healthy (One Weakness)
*Maps to: `@healthy` — "Strong Core with One Developing Dimension"*

```
executive_trust_score: 88 (High)
stakeholder_alignment: 92 (High)
organizational_clarity: 85 (High)
communication_effectiveness: 80 (High)
delegation_score: 87 (High)
coaching_score: 90 (High)
decision_quality: 84 (High)
ownership_index: 88 (High)
team_autonomy: 82 (High)
influence_score: 78 (Yellow)
political_awareness: 85 (High)
meeting_quality: 86 (High)
execution_clarity: 88 (High)

360 feedback: "Strong delivery and team health. Could improve cross-functional visibility."

Expected: LEADERSHIP HEALTH STATUS = Green | CONFIDENCE = High | NOTE: influence_score is Yellow (lowest dimension)
```

---

## Scenario LH-03 — Warning (Communication Breakdown)
*Maps to: `@warning` — "Warning Leadership — influence gaps emerging"*

```
executive_trust_score: 72 (Yellow)
stakeholder_alignment: 70 (Yellow)
organizational_clarity: 75 (Yellow)
communication_effectiveness: 65 (At Risk)
delegation_score: 73 (Yellow)
coaching_score: 78 (Yellow)
decision_quality: 72 (Yellow)
ownership_index: 76 (Yellow)
team_autonomy: 74 (Yellow)
influence_score: 60 (At Risk)
political_awareness: 68 (At Risk)
meeting_quality: 70 (Yellow)
execution_clarity: 71 (Yellow)

360 feedback: "Direction is sometimes unclear. Team wants more autonomy. Stakeholders report late status updates."

Expected: LEADERSHIP HEALTH STATUS = Yellow | CONFIDENCE = Medium | ROOT CAUSE = Communication and Stakeholder Alignment
```

---

## Scenario LH-04 — Warning (Delegation Gap)
*Maps to: `@warning` — "Warning Leadership — delegation and autonomy tension"*

```
executive_trust_score: 78 (Yellow)
stakeholder_alignment: 80 (Yellow)
organizational_clarity: 82 (Yellow)
communication_effectiveness: 80 (Yellow)
delegation_score: 62 (At Risk)
coaching_score: 82 (Yellow)
decision_quality: 76 (Yellow)
ownership_index: 65 (At Risk)
team_autonomy: 60 (At Risk)
influence_score: 75 (Yellow)
political_awareness: 78 (Yellow)
meeting_quality: 80 (Yellow)
execution_clarity: 72 (Yellow)

360 feedback: "EM is helpful but sometimes jumps in too early. Team wants to own decisions but doesn't feel trusted."

Expected: LEADERSHIP HEALTH STATUS = Yellow | CONFIDENCE = Medium | ROOT CAUSE = Delegation Score and Team Autonomy deficit
```

---

## Scenario LH-05 — At Risk (Trust Erosion)
*Maps to: `@at-risk` — "At-Risk Leadership — trust and execution decline"*

```
executive_trust_score: 55 (At Risk)
stakeholder_alignment: 60 (At Risk)
organizational_clarity: 65 (At Risk)
communication_effectiveness: 58 (At Risk)
delegation_score: 55 (At Risk)
coaching_score: 62 (At Risk)
decision_quality: 58 (At Risk)
ownership_index: 50 (At Risk)
team_autonomy: 55 (At Risk)
influence_score: 50 (At Risk)
political_awareness: 52 (At Risk)
meeting_quality: 55 (At Risk)
execution_clarity: 60 (At Risk)

360 feedback: "Follow-through declining. Team engagement dropping. Stakeholders frustrated with missed commitments."

Expected: LEADERSHIP HEALTH STATUS = At Risk | CONFIDENCE = Medium | ROOT CAUSE = Executive Trust Score and Multiple Red Dimensions
```

---

## Scenario LH-06 — At Risk (Micromanagement Pattern)
*Maps to: `@at-risk` — "At-Risk Leadership — micromanagement and autonomy collapse"*

```
executive_trust_score: 60 (At Risk)
stakeholder_alignment: 62 (At Risk)
organizational_clarity: 68 (At Risk)
communication_effectiveness: 65 (At Risk)
delegation_score: 45 (Critical)
coaching_score: 70 (Yellow)
decision_quality: 55 (At Risk)
ownership_index: 42 (Critical)
team_autonomy: 40 (Critical)
influence_score: 58 (At Risk)
political_awareness: 62 (At Risk)
meeting_quality: 60 (At Risk)
execution_clarity: 58 (At Risk)

360 feedback: "EM makes most decisions and overrides team choices. Engineers report low psychological safety."

Expected: LEADERSHIP HEALTH STATUS = At Risk | CONFIDENCE = High | ROOT CAUSE = Delegation Score and Team Autonomy deficit
```

---

## Scenario LH-07 — Critical (Collapse)
*Maps to: `@critical` — "Critical Leadership — multiple red dimensions and eroding trust"*
*Full golden output: `evaluations/golden/leadership-health/leadership-health-critical.md`*

```
executive_trust_score: 45 (Critical)
stakeholder_alignment: 52 (At Risk)
organizational_clarity: 58 (At Risk)
communication_effectiveness: 48 (Critical)
delegation_score: 40 (Critical)
coaching_score: 55 (At Risk)
decision_quality: 50 (At Risk)
ownership_index: 45 (Critical)
team_autonomy: 42 (Critical)
influence_score: 35 (Critical)
political_awareness: 30 (Critical)
meeting_quality: 38 (Critical)
execution_clarity: 50 (At Risk)

360 feedback: "Follow-through dropped significantly. Team reports unclear direction. Peers say EM avoids difficult conversations."

Expected: LEADERSHIP HEALTH STATUS = Red | CONFIDENCE = High | IMMEDIATE_ACTION = Improvement plan and coaching required
```

---

## Regression Run Instructions

To run regression against all scenarios:

1. Feed each scenario's input block to `leadership-health/master-leadership-health.md`
2. Compare output to the `Expected:` line for each scenario
3. For LH-01 and LH-07, compare the full output to the golden output files
4. Flag any scenario where LEADERSHIP HEALTH STATUS or ROOT CAUSE does not match
5. Flag any scenario where CONFIDENCE label is wrong (High/Medium/Low)
6. Record results in `evaluations/regression/{{YYYY-MM-DD}}-leadership-health-results.md`

**Pass threshold**: All 7 scenarios must produce correct STATUS and CONFIDENCE label. Full golden output match (with tolerance) required for LH-01 and LH-07.
