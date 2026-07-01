# Golden Output: Political Signals — Critical

**Skill**: `political-signals/political-signals.md`
**Scenario**: `political-signals/features/political-signals.feature` → `@critical` — "Critical — targeted erasure pattern"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `political-signals.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

```
decision_reversals: 80 (Red)
meeting_exclusion: 75 (Red)
ownership_ambiguity: 70 (Red)
escalation_patterns: 65 (Red)
incentive_misalignment: 60 (Red)

Observation period: Last 3 months
Data sources: Meeting records (exclusion confirmed), decision log (10 reversals in 30 days), escalation log (bypass pattern), team feedback (multiple concerns raised), HR data (no formal complaints but high attrition risk)
Confidence per signal: Most High, escalation_patterns Medium
Previous assessment: Available — was Yellow 3 months ago
Team context: Recent reorg, new director, 2 voluntary attritions in last quarter
```

---

## Golden Output

```
ORGANIZATIONAL RISK STATUS: Red
CONFIDENCE: High — 88%

HOLISTIC RISK SCORE: 68.5 / 100

DIMENSION SCORECARD:
| Signal                    | Score | Label    | Confidence | Trend |
|---------------------------|-------|----------|------------|-------|
| decision_reversals        | 80    | Critical | High       | Up    |
| meeting_exclusion         | 75    | Critical | High       | Up    |
| ownership_ambiguity       | 70    | Critical | High       | Up    |
| escalation_patterns       | 65    | At Risk  | Medium     | Up    |
| incentive_misalignment    | 60    | At Risk  | High       | Up    |

CROSS-DIMENSIONAL PATTERNS:
- TARGETED ERASURE: decision_reversals (Red) + meeting_exclusion (Red) + ownership_ambiguity (Red). Pattern indicates systematic exclusion of a stakeholder or sub-group from decision-making, followed by reversal of decisions they participated in, with ownership ambiguity preventing accountability.
- ACCOUNTABILITY SHIELD: decision_reversals (Red) + ownership_ambiguity (Red). Frequent reversals combined with ambiguous ownership create a shield where no one is accountable for decisions.

RISK ASSESSMENT:
- Critical: Multiple signals are Red with worsening trend.
- Active patterns indicate systemic exclusion and accountability failure.
- Team attrition risk is elevated; psychological safety is degraded.
- Executive trust in the organization is at risk if patterns continue.

RECOMMENDATIONS (Ethical Response Protocol):
- Immediate: (1) Publish a decision log for the last 30 days with rationale for each reversal.
          (2) EM to request a meeting with the excluded stakeholder(s) within 48 hours.
          (3) Document all instances; involve HR if exclusion is protected-class-related.
- This quarter: (1) Clarify RACI for all major decisions with named owners.
               (2) Implement pre-meeting distribution requirement with rationale for exclusions.
               (3) Align promotion and recognition criteria with team collaboration outcomes.
- Systemic: (1) If patterns persist for 60 days, escalate to skip-level and HR business partner.
            (2) Consider organizational design review of reporting structure and decision rights.

MONITORING PRIORITIES:
1. Track decision reversal rate weekly — target: < 20% of decisions reversed.
2. Track meeting attendance diversity — target: all affected stakeholders invited or informed.
3. Track escalation bypass rate — target: zero bypasses.
4. Conduct skip-levels with affected team members.
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| Risk Status | Exact | Must be "Red" |
| Confidence label | Exact | Must be "High" |
| Holistic Risk Score | Numeric | Must be 64–73 |
| decision_reversals | Label | Must be "Critical" |
| meeting_exclusion | Label | Must be "Critical" |
| ownership_ambiguity | Label | Must be "Critical" |
| Cross-dimensional patterns | Count | Must include at least 2 patterns |
| Recommendations → Immediate | Count | Must include at least 1 item |
| Ethical Response Protocol | Semantic | Must include transparency, dialogue, stakeholder involvement |

**Hard failures** (output must be rejected if):
- Risk Status is not Red
- Confidence is not High
- Less than 2 cross-dimensional patterns are identified
- No immediate actions are listed
- Ethical Response Protocol is not applied

**Soft failures** (flag for review but do not reject):
- Holistic Score outside 64–73 range
- Specific pattern names vary but meanings align
- Recommendation wording varies but intent is preserved
