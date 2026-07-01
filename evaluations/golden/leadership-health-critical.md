# Golden Output: Leadership Health Assessment — Critical

**Skill**: `skills/leadership/master-leadership-health.md`
**Scenario**: `features/leadership-health.feature` → `@critical` — "Critical Leadership — trust and relationship deterioration"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

---

## Input (Canonical Test Data)

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
```

---

## Golden Output

```
LEADERSHIP STATUS: Critical
CONFIDENCE: High — 94%
WEIGHTED SCORE: 54.1/100

DIMENSION SCORECARD:
| Dimension                | Score | Label    | Confidence |
|--------------------------|-------|----------|------------|
| executive_trust_score    | 45    | Red      | High       |
| stakeholder_alignment    | 50    | Red      | High       |
| organizational_clarity   | 55    | Yellow   | High       |
| communication_effectiveness | 48 | Red      | High       |
| delegation_score         | 52    | Red      | High       |
| coaching_score           | 50    | Red      | High       |
| decision_quality         | 45    | Red      | High       |
| ownership_index          | 55    | Red      | High       |
| team_autonomy            | 48    | Red      | High       |
| influence_score          | 42    | Red      | High       |
| political_awareness      | 50    | Red      | High       |
| meeting_quality          | 52    | Red      | High       |
| execution_clarity        | 58    | Yellow   | High       |

PILLAR ASSESSMENT:
- Trust & Relationships: CRITICAL DEFICIT — trust scores in Red across executive, stakeholder, and organizational dimensions
- Communication & Influence: CRITICAL DEFICIT — unclear communication and inability to influence peers
- Execution & Ownership: CRITICAL DEFICIT — micromanagement culture preventing delegation and ownership development
- Team Development: CRITICAL DEFICIT — coaching score in Red with team autonomy at critical low

ROOT CAUSE:
- Primary cause: Trust & Relationship Erosion (combined factors)
- Evidence:
  1. Executive trust score (45) and influence score (42) indicate leadership credibility breakdown
  2. Stakeholder alignment (50) shows executive expectation misalignment
  3. Delegation score (52) and team autonomy (48) show micromanagement pattern
  4. Coaching score (50) indicates team development is not prioritized
- Recurring: Unknown — requires immediate intervention and pattern investigation

RED FLAGS:
- Team questions EM decisions in planning sessions
- Peer EMs bypass on cross-team initiatives
- Micromanagement observed in code reviews and task assignments
- 1:1s devolved to status update format
- Frequent decision reversals causing team confusion

RISKS:
- Team attrition: High likelihood, High impact — trust deficit and lack of autonomy are leading departure factors
- Quality regression: High likelihood, High impact — team waiting for direction leads to rushed decisions
- Stakeholder escalation: High likelihood, High impact — frequent expectation mismatches
- Leadership credibility: High likelihood, High impact — influence score in Red with peer leaders

RECOMMENDATIONS:
- Immediate: EM to engage HR business partner and manager within 48 hours — initiate leadership intervention plan
- Next quarter: Implement 30-60-90 day improvement plan focused on trust rebuilding and delegation
- Systemic: Leadership mentoring required — pair with senior leader for ongoing guidance and shadow sessions

IMMEDIATE ACTIONS:
1. Schedule intervention session with manager within 48 hours
2. Pause sprint commitments and conduct leadership reset with team
3. Engage HRBP to document improvement plan and support structure
4. Begin executive stakeholder 1:1s to rebuild trust and alignment

DEVELOPMENT PRIORITIES:
1. Trust rebuilding — transparent decision log, clear rationales, consistent follow-through
2. Delegation training — hands-on coaching with specific ownership transitions
3. Communication improvement — structured meeting format, clear documentation standards
4. Coaching re-establishment — return to developmental 1:1s with career conversation focus
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| LEADERSHIP STATUS | Exact | Must be "Critical" |
| CONFIDENCE label | Exact | Must be "High" |
| CONFIDENCE score | Range | Must be 90–95% |
| Weighted score | Numeric | Must be 52–58 |
| Root cause primary | Semantic | Must identify Trust & Relationship Erosion as primary driver |
| Red flags | Minimum | Must identify at least 4 critical indicators |
| Immediate recommendation | Semantic | Must include EM engagement with manager and HRBP within 48 hours |
| Risk count | Minimum | Must identify at least 3 material risks |
| Immediate actions count | Minimum | Must include at least 3 immediate actions |

**Hard failures** (output must be rejected if):
- LEADERSHIP STATUS is not Critical
- Burnout/trust risk is not named given the Red trust and influence scores
- Immediate recommendation does not mandate engagement with manager/HRBP within 48 hours
- Root cause is a single cause when the data shows compound trust erosion across multiple dimensions
- Confidence is below High given the volume of clear risk indicators
- Team attrition risk is not identified with High likelihood/high impact

**Critical constraint**: The immediate recommendation MUST address the people signal (trust deficit and team autonomy), not only the delivery signals. An output that focuses only on delivery and ignores the Red trust and influence signals violates People First principle and must be rejected.