# Dataset: Leadership Health Scenarios

**Used by**: `skills/leadership/master-leadership-health.md`
**Linked scenarios**: `features/leadership-health.feature`
**Purpose**: Standard inputs for regression testing and prompt calibration

Each scenario provides a complete input payload that can be fed to the leadership health assessment skill. The expected output classification is noted for each. Full golden outputs exist only for the Healthy and Critical cases (see `evaluations/golden/`).

---

## Scenario LH-01 — Healthy (Canonical)
*Maps to: `@healthy` — "Healthy Leadership — all 13 dimensions green"*
*Full golden output: `evaluations/golden/leadership-health-healthy.md`*

```
Leadership assessment period: Q2 2026
Executive trust score: 85/100 (team trust in EM direction)
Stakeholder alignment: 88/100 (engineering priorities match expectations)
Organizational clarity: 90/100 (roles, goals, and decision rights clear)
Communication effectiveness: 87/100 (clarity, frequency, audience fit strong)
Delegation score: 82/100 (balanced ownership distribution)
Coaching score: 91/100 (regular, high-quality 1:1s and development convos)
Decision quality: 86/100 (sound, timely, durable decisions)
Ownership index: 89/100 (initiative-driven work, minimal direction required)
Team autonomy: 84/100 (independent technical and process decisions)
Influence score: 83/100 (shapes outcomes beyond direct authority)
Political awareness: 80/100 (understands org dynamics and stakeholder motivations)
Meeting quality: 85/100 (effective, time-respected, outcome-oriented)
Execution clarity: 90/100 (clear priorities, success criteria, accountability)

Expected: LEADERSHIP STATUS = Healthy | CONFIDENCE = High | ROOT CAUSE = None
```

---

## Scenario LH-02 — Healthy (Development Opportunity)
*Maps to: `@healthy` — "Strong Core with One Developing Dimension"*

```
Leadership assessment period: Q1 2026
Executive trust score: 88/100
Stakeholder alignment: 92/100
Organizational clarity: 85/100
Communication effectiveness: 80/100
Delegation score: 87/100
Coaching score: 90/100
Decision quality: 84/100
Ownership index: 88/100
Team autonomy: 82/100
Influence score: 78/100
Political awareness: 85/100
Meeting quality: 86/100
Execution clarity: 88/100

Expected: LEADERSHIP STATUS = Healthy | CONFIDENCE = High | ROOT CAUSE = Influence Gap (Developing)
```

---

## Scenario LH-03 — Warning (Emerging Risk)
*Maps to: `@warning` — "Warning Leadership — influence gaps emerging"*

```
Leadership assessment period: Q2 2026
Executive trust score: 78/100
Stakeholder alignment: 75/100
Organizational clarity: 80/100
Communication effectiveness: 72/100
Delegation score: 76/100
Coaching score: 78/100
Decision quality: 74/100
Ownership index: 75/100
Team autonomy: 70/100
Influence score: 65/100 (peer leaders not aligned on EM proposals)
Political awareness: 70/100
Meeting quality: 72/100
Execution clarity: 75/100

Expected: LEADERSHIP STATUS = Warning | CONFIDENCE = Medium | ROOT CAUSE = Cross-Dimensional Decline
```

---

## Scenario LH-04 — Warning (Political Awareness Blind Spot)
*Maps to: `@warning` — "Warning Leadership — political awareness blind spots"*

```
Leadership assessment period: Q1 2026
Executive trust score: 82/100
Stakeholder alignment: 78/100
Organizational clarity: 80/100
Communication effectiveness: 85/100
Delegation score: 75/100
Coaching score: 80/100
Decision quality: 77/100
Ownership index: 82/100
Team autonomy: 78/100
Influence score: 72/100
Political awareness: 55/100 (recent reorg impact not recognized early)
Meeting quality: 79/100
Execution clarity: 83/100

Expected: LEADERSHIP STATUS = Warning | ROOT CAUSE = Political Awareness Gap | CONFIDENCE = Medium
```

---

## Scenario LH-05 — At-Risk (Delegation & Autonomy)
*Maps to: `@at-risk` — "At-Risk Leadership — delegation and autonomy concerns"*

```
Leadership assessment period: Q2 2026
Executive trust score: 68/100
Stakeholder alignment: 70/100
Organizational clarity: 72/100
Communication effectiveness: 65/100
Delegation score: 55/100 (team frequently seeking direction)
Coaching score: 68/100
Decision quality: 62/100
Ownership index: 65/100 (initiative-driven work rare)
Team autonomy: 58/100 (team waits for approvals)
Influence score: 60/100
Political awareness: 62/100
Meeting quality: 68/100
Execution clarity: 70/100

Expected: LEADERSHIP STATUS = At Risk | CONFIDENCE = Medium | ROOT CAUSE = Delegation & Autonomy Gap
```

---

## Scenario LH-06 — Critical (Canonical)
*Maps to: `@critical` — "Critical Leadership — trust and relationship deterioration"*
*Full golden output: `evaluations/golden/leadership-health-critical.md`*

```
Leadership assessment period: Q1 2026
Executive trust score: 45/100 (team questions EM decisions regularly)
Stakeholder alignment: 50/100 (executive expectation mismatch frequent)
Organizational clarity: 55/100 (unclear roles in recent reorg)
Communication effectiveness: 48/100 (meeting notes sparse, unclear comms)
Delegation score: 52/100 (micromanagement observed)
Coaching score: 50/100 (irregular 1:1s, mostly status updates)
Decision quality: 45/100 (frequent reversals, team confused)
Ownership index: 55/100 (team waiting for direction constantly)
Team autonomy: 48/100 (team paralyzed without EM presence)
Influence score: 42/100 (peer EMs bypass on cross-team initiatives)
Political awareness: 50/100 (blind to org changes, surprised by decisions)
Meeting quality: 52/100 (meetings run long, no clear outcomes)
Execution clarity: 58/100 (priorities shift without explanation)

Expected: LEADERSHIP STATUS = Critical | CONFIDENCE = High | IMMEDIATE_ACTION = EM to engage HRBP and manager within 48 hours
```

---

## Scenario LH-07 — Critical (Cascading Dysfunction)
*Maps to: `@critical` — "Critical Leadership — cascading team dysfunction"*

```
Leadership assessment period: Q2 2026
Executive trust score: 55/100
Stakeholder alignment: 48/100
Organizational clarity: 52/100
Communication effectiveness: 50/100
Delegation score: 45/100
Coaching score: 48/100
Decision quality: 55/100
Ownership index: 50/100
Team autonomy: 42/100
Influence score: 45/100
Political awareness: 48/100
Meeting quality: 50/100
Execution clarity: 45/100

Expected: LEADERSHIP STATUS = Critical | ROOT CAUSE = Systemic Leadership Failure | CONFIDENCE = High
Critical check: This scenario shows multiple Red-flag indicators across core pillars requiring immediate intervention.
```

---

## Regression Run Instructions

To run regression against all scenarios:

1. Feed each scenario's input block to `skills/leadership/master-leadership-health.md`
2. Compare output to the `Expected:` line for each scenario
3. For LH-01 and LH-06, compare the full output to the golden output files
4. Flag any scenario where LEADERSHIP STATUS or ROOT CAUSE does not match
5. Flag any scenario where CONFIDENCE label is wrong (High/Medium/Low)
6. Record results in `evaluations/regression/{{YYYY-MM-DD}}-leadership-health-results.md`

**Pass threshold**: All 7 scenarios must produce correct LEADERSHIP STATUS and CONFIDENCE label. Full golden output match (with tolerance) required for LH-01 and LH-06.