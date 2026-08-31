# Golden Output: Leadership Health — Healthy

**Skill**: `skills/leadership-health/leadership-health-engine.md`
**Scenario**: `leadership-health/features/leadership-health.feature` → `@healthy` — "Healthy Leadership — all 13 dimensions green"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `leadership-health-engine.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

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

EM self-assessment: Teams are operating well. Recent skip-level positive. One area to develop: cross-team influence with other EMs.

360 feedback summary: "Reliable follow-through, clear communicator, good coaching. Occasionally defers too much to senior engineers instead of challenging them."

Previous quarter scores available: Yes
Attrition data: No voluntary attrition this quarter
Executive feedback themes: "Predictable, safe, good team health"
```

---

## Golden Output

```
LEADERSHIP HEALTH STATUS: Green
CONFIDENCE: High — 92%

HOLISTIC SCORE: 86.4 / 100

PILLAR BREAKDOWN:
- Trust & Relationships:    87.5% (executive_trust*0.20 + stakeholder*0.20 + org_clarity*0.15 + political*0.10)
- Communication & Influence: 83.5% (comm_eff*0.15 + influence*0.08 + meeting*0.07)
- Execution & Ownership:    85.8% (delegation*0.12 + decision*0.12 + ownership*0.08 + exec_clarity*0.10)
- Team Development:         87.0% (coaching*0.12 + team_autonomy*0.08)

DIMENSION SCORECARD:
| Dimension               | Score | Label  | Confidence | Trend |
|-------------------------|-------|--------|------------|-------|
| executive_trust_score   | 85    | Green  | High       | Stable|
| stakeholder_alignment   | 88    | Green  | High       | Up    |
| organizational_clarity  | 90    | Green  | High       | Stable|
| communication_effectiveness | 87 | Green  | High       | Stable|
| delegation_score        | 82    | Green  | High       | Up    |
| coaching_score          | 91    | Green  | High       | Up    |
| decision_quality        | 86    | Green  | High       | Stable|
| ownership_index         | 89    | Green  | High       | Stable|
| team_autonomy           | 84    | Green  | High       | Up    |
| influence_score         | 83    | Yellow | Medium     | Stable|
| political_awareness     | 80    | Green  | High       | Stable|
| meeting_quality         | 85    | Green  | High       | Stable|
| execution_clarity       | 90    | Green  | High       | Up    |

CROSS-DIMENSIONAL PATTERNS: None material. No conflicting signals detected.

RECOMMENDATIONS:
- Immediate: None required
- Next quarter: (1) Increase cross-team project participation to build influence score
  (2) Challenge senior engineers more directly in technical decisions to deepen ownership
- Systemic: None

DEVELOPMENT PRIORITIES:
1. Influence Score (83, Yellow, Medium confidence) — lowest-scoring dimension. Focus on coalition building and peer EM networking.
2. Delegation Score (82, Green, High confidence) — second-lowest. Review decision ownership matrix for remaining bottlenecks.
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| Leadership Status | Exact | Must be "Green" |
| Confidence label | Exact | Must be "High" |
| Holistic Score | Numeric | Must be 84–89 |
| Any dimension | Label | Must match expected label (Green/Yellow) |
| influence_score | Label | Must be "Yellow" (lowest dimension) |
| Recommendations → Immediate | Semantic | Must indicate no immediate action required |
| Development priority count | Minimum | Must include at least 1 priority |

**Hard failures** (output must be rejected if):
- Leadership Status is not Green
- Confidence is not High
- Any recommendation names an immediate action that is not warranted
- influence_score is labeled Green instead of Yellow

**Soft failures** (flag for review but do not reject):
- Holistic Score outside 84–89 range
- Development priority content is correct but phrased differently
- Recommendations include additional optional suggestions beyond the listed items
