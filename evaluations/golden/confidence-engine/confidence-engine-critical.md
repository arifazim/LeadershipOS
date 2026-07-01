# Golden Output: Confidence Engine — Critical

**Skill**: `confidence-engine/executive_confidence.md`
**Scenario**: `confidence-engine/features/confidence-engine.feature` → `@critical` — "Critical Confidence — systemic failure across multiple dimensions"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `executive_confidence.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

```
prediction_confidence: 35 (Critical)
data_quality: 30 (Critical)
risk_confidence: 40 (Critical)
delivery_confidence: 38 (Critical)
roadmap_confidence: 28 (Critical)
architecture_confidence: 32 (Critical)

GitHub: PR cycle time 5+ days, deployment frequency irregular, revert rate 28%
Jira: Sprint velocity 45%, milestone achievement 35%, story point accuracy 52%
Incidents: 4 P1 incidents in last quarter, 8 P2 incidents, average MTTR 6.2 hours
Customer Bugs: 25 escaped defects per release, 8.5 per 1k users, time-to-detect average 4.8 days

EM self-assessment: "I know we're in trouble. Everything is slipping. We're fighting fires constantly. Team is demoralized."
360 feedback: "Delivery dates are missed repeatedly. Data is inconsistent between systems. Critical risks not escalated until they became incidents. System is unstable."
Previous quarter scores available: Yes
Stakeholder feedback: "Cannot rely on forecasts or roadmap dates. Escalation concerns raised in last skip-level."

Attrition data: 2 voluntary departures in last quarter
Executive feedback themes: "Concerned about reliability; expecting improvement plan"
```

---

## Golden Output

```
CONFIDENCE ENGINE STATUS: Red
CONFIDENCE: High — 88%

EXECUTIVE CONFIDENCE SCORE: 38.2 / 100

DIMENSION SCORECARD:
| Dimension            | Score | Label    | Confidence | Trend |
|----------------------|-------|----------|------------|-------|
| prediction_confidence | 35    | Critical | High       | Down  |
| data_quality         | 30    | Critical | High       | Down  |
| risk_confidence      | 40    | Critical | High       | Down  |
| delivery_confidence  | 38    | Critical | High       | Down  |
| roadmap_confidence   | 28    | Critical | High       | Down  |
| architecture_confidence | 32 | Critical | High       | Down  |

CROSS-DIMENSIONAL PATTERNS:
- CASCADE FAILURE: All 6 dimensions in Critical territory. Instability in one area is amplifying failures in others. Prediction breakdown leads to roadmap drift, which creates delivery chaos.
- DATA TRUST COLLAPSE: Critical data_quality (30) undermines all other dimension assessments. GitHub and Jira data conflicts cannot be reconciled with incident patterns.
- TECHNICAL INSTABILITY FEEDBACK LOOP: Critical architecture_confidence (32) drives high change failure rate, which triggers incidents, which overwhelms risk management capacity.
- RISK BLINDNESS WITH HIGH INCIDENT RATE: Risk confidence (40) critically low while incident rate is 3x acceptable threshold — team is not surfacing problems before they materialize.

RISKS:
- Team credibility risk: Already flagged by executive stakeholders; trust recovery will require sustained improvement
- Delivery impact risk: With 65% milestone miss rate and 28% revert rate, any commitments are unreliable
- Talent retention risk: 2 departures in quarter; team morale concerns evident in 360 feedback

RECOMMENDATIONS:
- Immediate: (1) EM to publish 30-day recovery plan within 48 hours covering data integrity and delivery stabilization
  (2) Freeze roadmap changes until delivery and stability are restored
  (3) Escalate to skip-level manager to discuss potential re-scoping or re-allocation
- Next quarter: (1) Implement daily delivery standup to track critical path items
  (2) Run architecture retrospective to identify root cause of instability
  (3) Establish data quality SLA with 95% completeness requirement
- Systemic: (1) If no measurable improvement in 30 days, recommend to leadership that the team's roadmap commitments be reduced and delivery cadence lowered
  (2) Consider external resources for architecture stabilization and data pipeline repair

DEVELOPMENT PRIORITIES:
1. Architecture Confidence (32, Critical) — lowest dimension. Immediate system stabilization required.
2. Roadmaps Confidence (28, Critical) — second-lowest. Complete roadmap reset required.
3. Delivery Confidence (38, Critical) — third priority. Must establish reliable delivery baseline.
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| Confidence Status | Exact | Must be "Red" |
| Confidence label | Exact | Must be "High" |
| Executive Confidence Score | Numeric | Must be 35–42 |
| prediction_confidence | Label | Must be "Critical" |
| roadmap_confidence | Label | Must be "Critical" |
| architecture_confidence | Label | Must be "Critical" |
| cross-dimensional patterns | Count | Must include at least 3 patterns |
| Risk count | Minimum | Must include at least 2 risks |
| Recommendations → Immediate | Count | Must include at least 2 items |
| Development priority count | Minimum | Must include at least 3 priorities |

**Hard failures** (output must be rejected if):
- Confidence Status is not Red
- Confidence is not High
- Less than 3 cross-dimensional patterns are identified
- No risks are listed
- prediction_confidence is not labeled Critical
- roadmap_confidence is not labeled Critical

**Soft failures** (flag for review but do not reject):
- Executive Confidence Score outside 35–42 range
- Development priority content is correct but phrased differently
- Specific recommendation wording varies but intent is preserved