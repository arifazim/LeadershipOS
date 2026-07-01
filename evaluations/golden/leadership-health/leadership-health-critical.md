# Golden Output: Leadership Health — Critical

**Skill**: `leadership-health/master-leadership-health.md`
**Scenario**: `leadership-health/features/leadership-health.feature` → `@critical` — "Critical Leadership — multiple red dimensions and eroding trust"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `master-leadership-health.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

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

EM self-assessment: "I know I'm stretched thin. Feels like I'm fighting fires on every front. Team is disengaged lately."

360 feedback summary: "Follow-through has dropped significantly. Team reports unclear direction. Peers say EM avoids difficult conversations. Several recent decisions were reversed without explanation."

Previous quarter scores available: Yes
Attrition data: 1 voluntary attrition in last quarter (exit interview: "unclear priorities, micromanaged")
Executive feedback themes: "Concerned about reliability, expecting improvement plan"
```

---

## Golden Output

```
LEADERSHIP HEALTH STATUS: Red
CONFIDENCE: High — 90%

HOLISTIC SCORE: 44.5 / 100

PILLAR BREAKDOWN:
- Trust & Relationships:    48.5% (executive_trust*0.20 + stakeholder*0.20 + org_clarity*0.15 + political*0.10)
- Communication & Influence: 39.8% (comm_eff*0.15 + influence*0.08 + meeting*0.07)
- Execution & Ownership:    44.2% (delegation*0.12 + decision*0.12 + ownership*0.08 + exec_clarity*0.10)
- Team Development:         48.4% (coaching*0.12 + team_autonomy*0.08)

DIMENSION SCORECARD:
| Dimension               | Score | Label    | Confidence | Trend |
|-------------------------|-------|----------|------------|-------|
| executive_trust_score   | 45    | Critical | High       | Down  |
| stakeholder_alignment   | 52    | At Risk  | High       | Down  |
| organizational_clarity  | 58    | At Risk  | High       | Down  |
| communication_effectiveness | 48 | Critical | High       | Down  |
| delegation_score        | 40    | Critical | High       | Down  |
| coaching_score          | 55    | At Risk  | High       | Down  |
| decision_quality        | 50    | At Risk  | High       | Down  |
| ownership_index         | 45    | Critical | High       | Down  |
| team_autonomy           | 42    | Critical | High       | Down  |
| influence_score         | 35    | Critical | High       | Down  |
| political_awareness     | 30    | Critical | Speculative | Down |
| meeting_quality         | 38    | Critical | High       | Down  |
| execution_clarity       | 50    | At Risk  | High       | Down  |

CROSS-DIMENSIONAL PATTERNS:
- MICROMANAGEMENT SIGNAL: High delegation_score deficit (40) paired with high team_autonomy deficit (42) and high ownership_index deficit (45). The EM is both bottlenecking decisions and overriding team ownership.
- EMPTY DELEGATION: Low delegation_score + low decision_quality + low execution_clarity. Even when decisions are delegated, they lack clarity and are frequently reversed.
- TRUST COLLAPSE CASCADE: Critical executive_trust_score (45) is driving erosion in stakeholder_alignment (52), communication_effectiveness (48), and political_awareness (30). Leadership team is withdrawing engagement.

RISKS:
- Critical attrition risk: Already one voluntary loss; team disengagement signal from 360
- Executive intervention risk: Executive feedback themes indicate "improvement plan" expectation
- Delivery impact: Multiple execution dimensions are critical; team autonomy and ownership deficits will compound delivery risk

RECOMMENDATIONS:
- Immediate: (1) Schedule skip-level with direct manager within 48 hours to discuss improvement plan
          (2) EM to write and publish a 30-day improvement commitment covering delegation, follow-through, and clarity
          (3) Pause major new commitments until trust and execution stabilize
- Next quarter: (1) Weekly coaching with external coach or senior EM mentor
                (2) Implement decision ownership matrix and delegation log with weekly audit
                (3) Restore one-on-one cadence with every direct report before QBR
- Systemic: (1) If no measurable improvement in 60 days, escalate to skip-level manager for role reassignment conversation
            (2) Address root cause: high workload + unclear role scope from recent org changes

DEVELOPMENT PRIORITIES:
1. Political Awareness (30, Critical, Speculative) — lowest dimension. Immediate coaching required.
2. Influence Score (35, Critical) — second-lowest. Coalition building and peer relationship repair.
3. Executive Trust Score (45, Critical) — trust recovery is the highest-leverage priority for all other dimensions.
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| Leadership Status | Exact | Must be "Red" |
| Confidence label | Exact | Must be "High" |
| Holistic Score | Numeric | Must be 42–47 |
| executive_trust_score | Label | Must be "Critical" |
| political_awareness | Label | Must be "Critical" |
| cross-dimensional patterns | Count | Must include at least 2 patterns |
| Risk count | Minimum | Must include at least 2 risks |
| Recommendations → Immediate | Count | Must include at least 1 item |
| Development priority count | Minimum | Must include at least 3 priorities |

**Hard failures** (output must be rejected if):
- Leadership Status is not Red
- Confidence is not High
- Less than 2 cross-dimensional patterns are identified
- No risks are listed
- executive_trust_score is not labeled Critical

**Soft failures** (flag for review but do not reject):
- Holistic Score outside 42–47 range
- Development priority content is correct but phrased differently
- Specific recommendation wording varies but intent is preserved
