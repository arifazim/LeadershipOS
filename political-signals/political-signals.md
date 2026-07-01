# Skill: Political Signals Master Assessment

**Domain**: Political Signals  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Quarterly or when organizational signals emerge

---

## Purpose

Synthesize all 5 dimension political signals assessments into a holistic view of organizational risk. This master pad takes individual dimension scores, applies cross-dimensional pattern recognition, computes a weighted organizational risk score, and produces prioritized ethical response recommendations.

This skill answers three questions:
1. What is the organization's overall risk profile across all 5 political signal dimensions?
2. What cross-dimensional patterns reveal systemic strengths or risks?
3. What ethical, transparent responses will reduce organizational risk without manipulation?

**Invoke this skill when**: All or most dimension assessments are complete and you need a synthesized organizational risk profile. Use before major decisions, promotions, or role changes.

**Do not invoke this skill for**: Single-dimension assessments (use individual skill files), individual performance reviews (use `skills/people/performance-review.md`), or sprint delivery reviews (use `skills/delivery/review-sprint.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Dimension scores (all 5) | Individual political signals skill outputs | Score 0–100 + label Green/Yellow/Red |
| Dimension confidence levels | Individual skill outputs | High / Medium / Low / Speculative |
| Risk context summary | EM/team observations | 2–3 paragraphs describing observed tensions |
| Cross-dimension pattern notes | Preliminary analysis | Any suspected patterns across dimensions |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Historical risk scores | Previous assessment record | Score 0–100 per dimension |
| Executive feedback themes | Skip-level / QBR notes | Aggregated themes on organizational health |
| Team sentiment data | Surveys / retrospectives | Team perception of trust, clarity, inclusion |
| Incident correlation data | Incident logs, project outcomes | Whether signals correlate with negative outcomes |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Dimension Score Validation

Review each dimension score against its confidence level:

- If confidence is **Speculative** (< 50%): Flag as estimated. Do not include in weighted total until validated.
- If confidence is **Low** (50–69%): Include in weighted total but flag in output. Recommend data collection to improve.
- If confidence is **Medium** (70–89%): Include normally.
- If confidence is **High** (≥ 90%): Include normally; this dimension anchors the assessment.

If more than 2 dimensions are Speculative or Low, pause the synthesis and collect additional data before proceeding.

### Step 2 — Weighted Score Calculation

Apply the following weights to compute the holistic organizational risk score. No single dimension may exceed 30% of the total weight.

| Dimension | Weight | % of Total |
|---|---|---|
| decision_reversals | 0.22 | 22% |
| meeting_exclusion | 0.20 | 20% |
| ownership_ambiguity | 0.18 | 18% |
| escalation_patterns | 0.20 | 20% |
| incentive_misalignment | 0.20 | 20% |

**Calculation**:
```
Holistic Risk Score = Σ (Risk Score × Weight)
```

If any dimension is Speculative, substitute the midpoint of its label range (e.g., Yellow → 45) and flag the substitution in the output.

### Step 3 — Cross-Dimensional Pattern Recognition

Scan all dimension pairs for known risk patterns. Apply the following detection rules:

| Pattern | Condition | Interpretation |
|---|---|---|
| **Targeted erasure pattern** | decision_reversals is Yellow/Red AND meeting_exclusion is Yellow/Red | Specific stakeholders are systematically excluded and their decisions reversed — high risk of deliberate marginalization |
| **Power vacuum pattern** | ownership_ambiguity is Yellow/Red AND escalation_patterns is Yellow/Red | Unclear ownership triggers bypass escalation — leadership gap creates confusion |
| **Accountability shield pattern** | incentive_misalignment is Yellow/Red AND decision_reversals is Yellow/Red | Incentives reward pivoting rather than accountability — reversals shield poor execution |
| **Silence amplification pattern** | meeting_exclusion is Yellow/Red AND escalation_patterns is Yellow/Red | Excluded stakeholders escalate, but their concerns are ignored — information control |
| **Chaos pattern** | All 5 dimensions are Yellow/Red | Systemic organizational dysfunction — multiple concurrent risk signals |
| **Delegation trap pattern** | ownership_ambiguity is Yellow/Red AND incentive_misalignment is Yellow/Red | Unclear ownership combined with misaligned incentives creates free-rider problems |

Count how many patterns are active. More than 2 active patterns is a systemic signal requiring immediate attention, not isolated fixes.

### Step 4 — Trend Analysis (if historical data available)

Compare current scores to the previous quarter:

- **Improving**: +10 points or more in 3+ dimensions
- **Stable**: within ±10 points in most dimensions
- **Deteriorating**: −10 points or more in 3+ dimensions
- **Volatile**: high variance (some dimensions improving, others deteriorating sharply)

A volatile pattern suggests inconsistent organizational practices — risk is context-dependent rather than principled.

### Step 5 — Ethical Response Prioritization

Rank all 5 dimensions by two criteria:

1. **Impact**: How much would addressing this dimension reduce overall organizational risk?
2. **Urgency**: How quickly is intervention needed based on risk level?

Compute: `Priority = Risk Score × Impact Multiplier`

| Dimension | Impact Multiplier |
|---|---|
| decision_reversals | 1.0 |
| meeting_exclusion | 1.0 |
| ownership_ambiguity | 1.0 |
| escalation_patterns | 0.9 |
| incentive_misalignment | 0.8 |

Select the top 2 dimensions as immediate ethical response priorities.

---

## Decision Tree

```
What is the holistic risk score?
│
├── ≤ 30 (Green) ────────────────────────────────────────────────
│   How many cross-dimensional patterns are active?
│   │
│   ├── 0 patterns
│   │   └── OUTCOME: Healthy organizational environment.
│   │         Recommendation: Maintain current practices.
│   │         Monitor quarterly.
│   │         Confidence: High.
│   │
│   └── 1 pattern
│       └── OUTCOME: Green score with emerging pattern.
│             Recommendation: Address the specific pattern with targeted intervention.
│             Track monthly.
│             Confidence: Medium.
│
├── 31–60 (Yellow) ───────────────────────────────────────────────
│   How many dimensions are Yellow/Red?
│   │
│   ├── 1–2 dimensions
│   │   └── OUTCOME: Organizational risk is contained.
│   │         Recommendation: Targeted ethical response on priority dimensions.
│   │         Confidence: Medium.
│   │
│   ├── 3–4 dimensions
│   │   └── OUTCOME: Multiple risk signals — attention needed.
│   │         Recommendation: Implement top 2 priority interventions.
│   │         Monitor weekly.
│   │         Confidence: Medium to High.
│   │
│   └── 5 dimensions
│       └── OUTCOME: Systemic risk signals — immediate action required.
│             Recommendation: Escalate ethical response protocol.
│             Address cross-dimensional patterns first.
│             Confidence: High.
│
└── > 60 (Red) ───────────────────────────────────────────────
    OUTCOME: Organizational risk is critical — multiple patterns active.
    Recommendation: Immediate intervention required.
    Apply full Ethical Response Protocol.
    Escalate to appropriate leadership level.
    Confidence: High.
    Primary focus: Restore transparency and inclusion — these are prerequisite dimensions.
```

---

## Output

Produce the following artifacts in order. Do not produce details before the summary.

### 1. Organizational Risk Summary (3–5 sentences)

State: holistic risk score, score label, number of active cross-dimensional patterns, trend direction (if historical data available), primary ethical response priority, and one immediate action. Include overall confidence level.

> **Example**: "This quarter's organizational risk score is 52 (Yellow), trending deteriorating from 45 last quarter. Four dimensions are Yellow/Red, and 2 cross-dimensional patterns are active: targeted erasure and power vacuum. The primary ethical response priority is decision transparency and ownership clarity. Immediate action: Initiate transparent dialogue about decision-making process with excluded stakeholders. Confidence: Medium (78%)."

### 2. Holistic Risk Scorecard

| Dimension | Score | Label | Confidence | Weight | Weighted Score | Trend |
|---|---|---|---|---|---|---|
| decision_reversals | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 22% | {{0–22}} | {{↑/→/↓}} |
| meeting_exclusion | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 20% | {{0–20}} | {{↑/→/↓}} |
| ownership_ambiguity | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 18% | {{0–18}} | {{↑/→/↓}} |
| escalation_patterns | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 20% | {{0–20}} | {{↑/→/↓}} |
| incentive_misalignment | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 20% | {{0–20}} | {{↑/→/↓}} |
| **TOTAL** | — | — | — | 100% | **{{0–100}}** | — |

### 3. Cross-Dimensional Patterns

List all active patterns detected:

| Pattern | Dimensions Involved | Severity | Evidence |
|---|---|---|---|
| {{Pattern name}} | {{dim1, dim2}} | {{High/Medium/Low}} | {{2–3 specific observations}} |

If no patterns are active, state: "No cross-dimensional risk patterns detected."

### 4. Ethical Response Recommendations

Apply the Ethical Response Protocol to each active pattern:

#### For Targeted Erasure Pattern (if active)
- **Name the pattern**: "I've observed that decisions affecting certain stakeholders are reversed and those stakeholders are excluded from follow-up communication"
- **Recommend transparency**: All future decisions affecting any stakeholder group must include them in communication
- **Recommend dialogue**: Facilitate conversation between decision-makers and affected stakeholders
- **Recommend alignment**: Establish inclusion protocol for all decision-related meetings

#### For Power Vacuum Pattern (if active)
- **Name the pattern**: "I've observed that unclear ownership is driving stakeholders to bypass normal escalation chains"
- **Recommend transparency**: Document decision rights and ownership for all key areas
- **Recommend dialogue**: Hold RACI workshop with all stakeholders
- **Recommend alignment**: Implement ownership review process

#### For Accountability Shield Pattern (if active)
- **Name the pattern**: "I've observed that strategic pivots are being used to obscure rather than clarify next steps"
- **Recommend transparency**: Require explicit rationale for all reversals in writing to all stakeholders
- **Recommend dialogue**: Discuss decision process and reversal criteria openly
- **Recommend alignment**: Align incentives to reward stability and honest course correction

#### For Silence Amplification Pattern (if active)
- **Name the pattern**: "I've observed that excluded stakeholders escalate, but their concerns are not addressed"
- **Recommend transparency**: Publish escalation response criteria
- **Recommend dialogue**: Meet with escalating stakeholders to understand unmet concerns
- **Recommend alignment**: Ensure escalation includes all affected perspectives

### 5. Priority Intervention Plan

| Priority | Dimension | Action | Timeline | Owner |
|---|---|---|---|---|
| 1 | {{dimension}} | {{action}} | {{timeline}} | {{owner}} |
| 2 | {{dimension}} | {{action}} | {{timeline}} | {{owner}} |

### 6. Next Assessment Schedule

| Milestone | Date | Focus |
|---|---|---|
| Next full assessment | {{date}} | All 5 dimensions |
| Mid-quarter pulse | {{date}} | Top 2 priority dimensions |
| Check-in with manager | {{date}} | Share this report; solicit feedback |

---

## Examples

### Example A — Healthy Organization

**Inputs**
- decision_reversals: 22 (Green, High confidence)
- meeting_exclusion: 15 (Green, High confidence)
- ownership_ambiguity: 18 (Green, Medium confidence)
- escalation_patterns: 25 (Green, High confidence)
- incentive_misalignment: 12 (Green, High confidence)
- Previous quarter holistic score: 28 (Green)

**Output Summary**
> This quarter's organizational risk score is 18 (Green), improving from 28 last quarter. All dimensions are Green with one Medium confidence. No cross-dimensional risk patterns are active. The organization has healthy decision-making, inclusive meetings, and clear ownership. Confidence: High (90%).

---

### Example B — Critical Organizational Risk

**Inputs**
- decision_reversals: 68 (Red, High confidence)
- meeting_exclusion: 72 (Red, Medium confidence)
- ownership_ambiguity: 55 (Yellow, High confidence)
- escalation_patterns: 65 (Red, Medium confidence)
- incentive_misalignment: 58 (Yellow, High confidence)
- Previous quarter holistic score: 38 (Yellow)

**Output Summary**
> This quarter's organizational risk score is 64 (Red), a sharp increase of 26 points from last quarter. Three dimensions are Red, two are Yellow. Three cross-dimensional patterns are active: targeted erasure, power vacuum, and accountability shield. This represents systemic organizational dysfunction requiring immediate intervention. Confidence: Medium (78% — 2 dimensions are Medium confidence).

**Recommendations**
- *Immediate*: Initiate transparent dialogue with stakeholders who have been excluded from decision communications
- *This quarter*: Implement RACI workshop to clarify ownership; establish escalation protocol with required context
- *Systemic*: Redesign incentive structure to reward collaborative, stable decision-making

---

## Confidence Score

The confidence score reflects how much to trust this synthesis. Apply modifiers to a base of 75%.

### Base Score
- Start at **75%** (Medium confidence) for a full assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All 5 dimension assessments completed with High or Medium confidence | +10% |
| Historical data available for trend comparison | +5% |
| Risk context summary provided | +5% |
| Cross-dimensional pattern analysis provided | +5% |
| No more than 2 cross-dimensional patterns active | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more dimensions are Speculative | −10% each |
| More than 2 dimensions are Low confidence | −10% |
| No historical data available | −5% |
| No risk context summary provided | −5% |
| More than 3 cross-dimensional patterns active | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in organizational health planning |
| 75–89% | Medium | Use output; flag gaps to manager and team |
| 50–74% | Low | Use output as hypothesis; validate key claims |
| < 50% | Speculative | Do not use for formal planning; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Pattern cherry-picking** | Only obvious correlations considered | Cross-dimensional analysis only includes high-score pairs | Require systematic pairwise analysis of all dimensions |
| **Confidence inflation** | Low/Speculative inputs treated as High | Confidence levels do not match input availability | Audit input sources; downgrade confidence to match evidence |
| **Pattern blindness** | Active cross-dimensional patterns not identified | Multiple dimensions are Yellow/Red but no patterns named | Run pattern detection again; require at least 2 evidence points per pattern |
| **Trend blindness** | Historical data available but not used | Previous quarter data is present but not referenced | Include trend analysis even if partial; note volatility |
| **Priority scattering** | All dimensions receive equal attention | Recommendations address 4+ dimensions without ranking | Limit to top 2 priority dimensions |
| **Mitigation avoidance** | Patterns identified but no ethical response proposed | Risk patterns documented but no recommendations | Always apply Ethical Response Protocol to patterns |

---

## References

- `docs/principles.md` — Principle 3: *Default to Transparency*; Principle 8: *Think in Systems*; Principle 12: *Measure Outcomes*
- `political-signals/README.md` — Module overview and Ethical Response Protocol
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- Each dimension skill — Individual assessment methods feed into this synthesis
- `confidence-engine/executive_confidence.md` — Political signals feed into executive confidence

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/political-signals/decision_reversals.md` | Primary dimension — provides reversal risk score |
| `skills/political-signals/meeting_exclusion.md` | Primary dimension — provides exclusion risk score |
| `skills/political-signals/ownership_ambiguity.md` | Primary dimension — provides ownership risk score |
| `skills/political-signals/escalation_patterns.md` | Primary dimension — provides escalation risk score |
| `skills/political-signals/incentive_misalignment.md` | Primary dimension — provides incentive risk score |
| `leadership-health/political_awareness.md` | EM's political navigation is informed by organizational signal environment |
| `confidence-engine/executive_confidence.md` | Political signals directly impact executive confidence assessment |
| `leadership-health/organizational_clarity.md` | Ownership ambiguity is a clarity failure that signals feed into |
| `leadership-health/stakeholder_alignment.md` | Meeting exclusion and incentive misalignment are forms of misalignment |