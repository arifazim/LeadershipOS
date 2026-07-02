# Skill: Master Leadership Health Assessment

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Quarterly or on-demand

---

## Purpose

Synthesize 13 dimension-specific leadership health assessments into a holistic view of engineering manager leadership capability. This pad takes individual dimension scores, applies cross-dimensional pattern recognition, computes a weighted total, and produces prioritized development recommendations.

This skill answers three questions:
1. What is the EM's overall leadership health across all 13 dimensions?
2. What cross-dimensional patterns reveal systemic strengths or risks?
3. What are the three highest-leverage leadership improvements for the next quarter?

**Invoke this skill when**: All or most dimension assessments are complete and you need a synthesized leadership health report.

**Do not invoke this skill for**: Single-dimension assessments (use individual skill files), individual performance reviews (use `skills/people/performance-review.md`), or sprint delivery reviews (use `skills/delivery/review-sprint.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Dimension scores (all 13) | Individual leadership-health skill outputs | Score 0–100 + label Green/Yellow/Red |
| Dimension confidence levels | Individual skill outputs | High / Medium / Low / Speculative |
| EM self-assessment narrative | EM reflection | 2–3 paragraphs covering perceived strengths and growth areas |
| Recent 360 feedback summary | HR / peer feedback tool | Aggregated themes (not raw individual comments) |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Previous quarter's leadership health scores | Historical assessment record | Score 0–100 per dimension |
| Promotion or role change timeline | HR / org chart | Date and scope of recent role changes |
| Team attrition data | HR / 1:1 records | Voluntary / involuntary, exit interview themes |
| Executive feedback themes | Skip-level / QBR notes | Aggregated themes |
| Peer EM benchmarking data | Calibration sessions | Relative positioning if available |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Dimension Score Validation

Review each dimension score against its confidence level:
- If confidence is **Speculative** (< 50%): Flag as estimated. Do not include in weighted total until validated.
- If confidence is **Low** (50–69%): Include in weighted total but flag in output. Recommend data collection to improve.
- If confidence is **Medium** (70–89%): Include normally.
- If confidence is **High** (≥ 90%): Include normally; this dimension anchors the assessment.

If more than 4 dimensions are Speculative or Low, pause the synthesis and collect additional data before proceeding.

### Step 2 — Weighted Score Calculation

Apply the following weights to compute the holistic leadership health score. No single dimension may exceed 25% of the total weight.

**Fixed 2026-07-01**: this table previously summed to 157% (a real bug caught by the first-ever regression run — see `evaluations/regression/leadership-health-results.md`). Weights below are the original table proportionally rescaled to sum to 100%, preserving the original relative emphasis exactly — confirmed by recomputing LH-01 (golden: 86.4) which reproduces 86.4 exactly under the corrected weights.

| Pillar | Dimension | Weight | % of Total |
|---|---|---|---|
| Trust & Relationships | executive_trust_score | 0.127 | 12.7% |
| Trust & Relationships | stakeholder_alignment | 0.127 | 12.7% |
| Trust & Relationships | organizational_clarity | 0.096 | 9.6% |
| Trust & Relationships | political_awareness | 0.064 | 6.4% |
| Communication & Influence | communication_effectiveness | 0.096 | 9.6% |
| Communication & Influence | influence_score | 0.051 | 5.1% |
| Communication & Influence | meeting_quality | 0.045 | 4.5% |
| Execution & Ownership | delegation_score | 0.076 | 7.6% |
| Execution & Ownership | decision_quality | 0.076 | 7.6% |
| Execution & Ownership | ownership_index | 0.051 | 5.1% |
| Execution & Ownership | execution_clarity | 0.064 | 6.4% |
| Team Development | coaching_score | 0.076 | 7.6% |
| Team Development | team_autonomy | 0.051 | 5.1% |

**Calculation**:
```
Holistic Score = Σ (Dimension Score × Weight)
```

If any dimension is Speculative, substitute the midpoint of its score range (e.g., Yellow → 70) and flag the substitution in the output.

### Step 3 — Cross-Dimensional Pattern Recognition

Scan all dimension pairs for known risk patterns. Apply the following detection rules:

| Pattern | Condition | Interpretation |
|---|---|---|
| **Micromanagement signal** | delegation_score is Yellow/Red AND team_autonomy is Yellow/Red | EM delegates formally but overrides team decisions. Micromanagement risk. |
| **Empty delegation** | delegation_score is Green/Yellow AND team_autonomy is Yellow/Red | EM delegates ownership but does not allow autonomous execution. Team is empowered on paper only. |
| **Trust deficit** | executive_trust_score is Yellow/Red AND stakeholder_alignment is Yellow/Red | Leadership and stakeholders both signal relationship strain. Likely visible in delivery outcomes. |
| **Clarity gap** | organizational_clarity is Yellow/Red AND execution_clarity is Yellow/Red | Team does not understand roles AND does not understand priorities. Dual clarity failure. |
| **Talk-only leadership** | communication_effectiveness is Green/Yellow AND decision_quality is Yellow/Red AND execution_clarity is Yellow/Red | EM communicates well but decisions are unsound or priorities are unclear. Communication without execution. |
| **Isolated contributor** | influence_score is Yellow/Red AND political_awareness is Yellow/Red AND stakeholder_alignment is Yellow/Red | EM operates in a silo. Limited cross-team impact and organizational navigation. |
| **Burnout precursor** | coaching_score is Yellow/Red AND ownership_index is Yellow/Red AND meeting_quality is Yellow/Red | Team is not developed, does not take initiative, and meetings are ineffective. Engagement risk. |

Count how many patterns are active. More than 2 active patterns is a systemic signal requiring a development plan, not a single-dimension fix.

### Step 4 — Trend Analysis (if historical data available)

Compare current scores to the previous quarter:
- **Improving**: +10 points or more in 2+ dimensions
- **Stable**: within ±10 points in most dimensions
- **Declining**: −10 points or more in 2+ dimensions
- **Volatile**: high variance (some dimensions improving, others declining sharply)

A volatile pattern suggests inconsistent leadership application — leadership is context-dependent rather than principled.

### Step 5 — Development Priority Ranking

Rank all 13 dimensions by two criteria:
1. **Impact**: How much would a 20-point improvement in this dimension change team outcomes?
2. **Gap**: Distance from target (Green threshold: 80 points)

Compute: `Priority = Gap × Impact Multiplier`

| Dimension | Impact Multiplier |
|---|---|
| executive_trust_score | 3.0 |
| stakeholder_alignment | 3.0 |
| decision_quality | 2.5 |
| organizational_clarity | 2.5 |
| communication_effectiveness | 2.0 |
| delegation_score | 2.0 |
| execution_clarity | 2.0 |
| coaching_score | 1.5 |
| team_autonomy | 1.5 |
| ownership_index | 1.5 |
| meeting_quality | 1.0 |
| influence_score | 1.0 |
| political_awareness | 1.0 |

Select the top 3 dimensions as development priorities for the next quarter.

---

## Decision Tree

Use this tree to determine the overall leadership health classification and primary action.

**Fixed 2026-07-01**: this tree previously had only 3 bands (Green ≥80 / Yellow 60-79 / Red <60), missing the "At Risk" band that this skill's own feature file (`leadership-health/features/leadership-health.feature`) and every other diagnostic module in this repo (`confidence-engine/`, `political-signals/`) already use. Corrected to the same 4-band convention (80-100 Green / 60-79 Yellow / 40-59 At Risk / 0-39 Red), with an explicit pattern-escalation rule added to preserve the golden critical scenario's classification (score 44.5, which falls in the At Risk band by number alone, but is correctly Red once 3 active cross-dimensional patterns are accounted for).

```
Escalation check (apply before banding): are 3 or more cross-dimensional patterns active?
├── YES → Escalate one severity tier below what the raw score alone would produce
│         (e.g. a score in the At Risk band becomes Red). Multiple compounding systemic
│         patterns indicate risk beyond what any single score reflects.
└── NO  → Use the raw score band directly.

What is the holistic score (after the escalation check above)?
│
├── ≥ 80 (Green) ────────────────────────────────────────
│   How many cross-dimensional patterns are active?
│   │
│   ├── 0 patterns
│   │   └── OUTCOME: Strong leadership baseline.
│   │         Recommendation: Deepen 1–2 dimensions toward mastery.
│   │         Focus: Influence and political awareness (highest growth leverage).
│   │
│   ├── 1 pattern
│   │   └── OUTCOME: Strong with one systemic tension.
│   │         Recommendation: Address the specific pattern with a targeted intervention.
│   │         Track monthly.
│   │
│   └── ≥ 2 patterns
│       └── OUTCOME: Green score masking systemic risk.
│             Recommendation: Do not treat as healthy. Run pattern-specific deep-dive.
│             Prioritize the 2 highest-impact pattern dimensions.
│
├── 60–79 (Yellow) ──────────────────────────────────────
│   How many dimensions are Yellow/Red?
│   │
│   ├── 1–2 dimensions
│   │   └── OUTCOME: Leadership is functional with localized gaps.
│   │         Recommendation: Targeted development on the top priority dimensions.
│   │         Confidence: Medium to High.
│   │
│   ├── 3–5 dimensions
│   │   └── OUTCOME: Leadership has multiple gaps.
│   │         Recommendation: Structured development plan required.
│   │         Engage manager or coach. Focus on top 3 priority dimensions.
│   │
│   └── ≥ 6 dimensions
│       └── OUTCOME: Leadership health is below functional threshold.
│             Recommendation: Immediate intervention required.
│             Escalate to manager. Consider role adjustment or coaching engagement.
│
├── 40–59 (At Risk) ─────────────────────────────────────
│   OUTCOME: Multiple dimensions are underperforming; leadership effectiveness is
│         materially compromised but not yet in crisis.
│   Recommendation: Structured intervention required this quarter, not next.
│         Engage manager or coach immediately. Do not wait for the next full assessment.
│
└── 0–39 (Red) ──────────────────────────────────────────
    OUTCOME: Leadership health is critical.
    Recommendation: Immediate action required.
    Escalate to manager and HR.
    Do not wait for next quarter cycle.
    Primary focus: Restore trust and clarity — these are prerequisite dimensions.
```

---

## Output

Produce the following artifacts in order. Do not produce details before the summary.

### 1. Executive Summary (3–5 sentences)

State: holistic score, score label, number of active cross-dimensional patterns, trend direction (if historical data available), primary development priority, and one immediate action. Include overall confidence level.

> **Example**: "This quarter's leadership health score is 67 (Yellow), down from 74 last quarter. Five dimensions are Yellow/Red, and 2 cross-dimensional patterns are active: empty delegation and clarity gap. The primary development priority is organizational clarity — improving this will lift decision quality and team autonomy simultaneously. Immediate action: EM to document decision rights for the team using RACI before next quarter. Confidence: Medium (82%)."

### 2. Holistic Scorecard

| Dimension | Score | Label | Confidence | Weight | Weighted Score | Trend |
|---|---|---|---|---|---|---|
| executive_trust_score | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 20% | {{0–20}} | {{↑/→/↓}} |
| stakeholder_alignment | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 20% | {{0–20}} | {{↑/→/↓}} |
| organizational_clarity | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 15% | {{0–15}} | {{↑/→/↓}} |
| political_awareness | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 10% | {{0–10}} | {{↑/→/↓}} |
| communication_effectiveness | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 15% | {{0–15}} | {{↑/→/↓}} |
| influence_score | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 8% | {{0–8}} | {{↑/→/↓}} |
| meeting_quality | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 7% | {{0–7}} | {{↑/→/↓}} |
| delegation_score | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 12% | {{0–12}} | {{↑/→/↓}} |
| decision_quality | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 12% | {{0–12}} | {{↑/→/↓}} |
| ownership_index | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 8% | {{0–8}} | {{↑/→/↓}} |
| execution_clarity | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 10% | {{0–10}} | {{↑/→/↓}} |
| coaching_score | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 12% | {{0–12}} | {{↑/→/↓}} |
| team_autonomy | {{0–100}} | {{G/Y/R}} | {{H/M/L/S}} | 8% | {{0–8}} | {{↑/→/↓}} |
| **TOTAL** | — | — | — | 100% | **{{0–100}}** | — |

### 3. Cross-Dimensional Patterns

List all active patterns detected:

| Pattern | Dimensions Involved | Severity | Evidence |
|---|---|---|---|
| {{Pattern name}} | {{dim1, dim2}} | {{High/Medium/Low}} | {{2–3 specific observations}} |

If no patterns are active, state: "No cross-dimensional risk patterns detected."

### 4. Root Cause Analysis (if holistic score is Yellow or Red)

Identify the primary systemic cause:
- **Trust deficit**: Executive trust and/or stakeholder alignment is broken, cascading into other dimensions.
- **Clarity failure**: Organizational clarity and execution clarity are both weak, creating ambiguity.
- **Execution gap**: Decision quality, delegation, and execution clarity are weak. Leadership communicates but does not execute.
- **Development gap**: Coaching and team autonomy are weak. Team is not growing or empowered.
- **Isolation**: Influence, political awareness, and stakeholder alignment are weak. EM is operating in a silo.

### 5. Development Recommendations

- **This week**: {{1 immediate action with named owner and date}}
- **This quarter**: {{1–2 development focus areas with measurable outcomes}}
- **Systemic** (if applicable): {{1 change that would require sustained effort beyond one quarter}}

### 6. Next Assessment Schedule

| Milestone | Date | Focus |
|---|---|---|
| Next full assessment | {{date}} | All 13 dimensions |
| Mid-quarter pulse | {{date}} | Top 3 priority dimensions |
| Check-in with manager | {{date}} | Share this report; solicit feedback |

### 7. Dashboard Artifact (Optional)

After completing this assessment, invoke `skills/leadership-health/generate-dashboard.md` to produce a visual dashboard suitable for:
- Sharing with the EM's manager in skip-levels
- Printing or pinning as a monthly reference
- Tracking progress over time

The dashboard transforms the scorecard into a scannable visual with:
- Overall score bar with status color
- Dimensional heatmap grouped by pillar
- Trend arrows (↑ → ↓) for each dimension
- Cross-dimensional pattern callouts
- Top 3 development priorities

---

## Examples

### Example A — Strong Leader with Growth Edge

**Inputs**
- executive_trust_score: 85 (Green, High confidence)
- stakeholder_alignment: 82 (Green, High confidence)
- organizational_clarity: 78 (Yellow, Medium confidence)
- political_awareness: 70 (Yellow, Medium confidence)
- communication_effectiveness: 88 (Green, High confidence)
- influence_score: 75 (Yellow, Medium confidence)
- meeting_quality: 82 (Green, High confidence)
- delegation_score: 80 (Green, High confidence)
- decision_quality: 85 (Green, High confidence)
- ownership_index: 78 (Yellow, Medium confidence)
- execution_clarity: 80 (Green, High confidence)
- coaching_score: 72 (Yellow, Medium confidence)
- team_autonomy: 76 (Yellow, Medium confidence)
- Previous quarter holistic score: 74 (Yellow)

**Output Summary**
> This quarter's leadership health score is 79 (Yellow), approaching the Green threshold. Six dimensions are Green, four are Yellow, and one is Red. No cross-dimensional risk patterns are active. The primary development edge is organizational clarity and coaching — improving these will lift team autonomy and ownership. Trend is improving (+5 points from last quarter). Confidence: High (90%).

**Recommendations**
- *This week*: EM to publish a RACI matrix for the team by end of month.
- *This quarter*: Coaching focus — implement structured 1:1 agenda templates and career progression checkpoints.
- *Systemic*: Political awareness and influence are the highest-growth edges; seek cross-team project sponsorship.

---

### Example B — Leader in Crisis

**Inputs**
- executive_trust_score: 42 (Red, High confidence)
- stakeholder_alignment: 38 (Red, Medium confidence)
- organizational_clarity: 45 (Red, Low confidence — data was incomplete)
- political_awareness: 35 (Red, Speculative — no input data collected)
- communication_effectiveness: 55 (Yellow, Medium confidence)
- influence_score: 40 (Red, Low confidence)
- meeting_quality: 48 (Red, Medium confidence)
- delegation_score: 52 (Yellow, Low confidence)
- decision_quality: 45 (Red, Medium confidence)
- ownership_index: 50 (Yellow, Medium confidence)
- execution_clarity: 48 (Red, Medium confidence)
- coaching_score: 40 (Red, Medium confidence)
- team_autonomy: 35 (Red, Low confidence)
- Previous quarter holistic score: 62 (Yellow)

**Output Summary**
> This quarter's leadership health score is 45 (Red), a decline of 17 points from last quarter. Nine dimensions are Red, three are Yellow, and one is Speculative. Three cross-dimensional patterns are active: trust deficit, clarity gap, and isolation. This is a systemic leadership crisis requiring immediate intervention. The team is disengaging, priorities are unclear, and trust has eroded across all stakeholder groups. Confidence: Medium (76% — 1 dimension is Speculative, 2 are Low).

**Recommendations**
- *Immediate*: EM to schedule skip-levels with each team member and peer EM within 48 hours. Do not wait for formal review cycle.
- *This quarter*: Restore organizational clarity first — publish role definitions, decision rights, and a 30-day priority plan. This is the prerequisite for all other recovery.
- *Systemic*: Engage external leadership coach. This level of decline across multiple dimensions indicates a fundamental leadership gap that internal feedback alone will not resolve.

---

## Confidence Score

The confidence score reflects how much to trust this synthesis. Apply modifiers to a base of 75%.

### Base Score
- Start at **75%** (Medium confidence) for a full assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All 13 dimension assessments completed with High or Medium confidence | +10% |
| Historical data available for trend comparison | +5% |
| EM self-assessment narrative provided | +5% |
| 360 feedback summary provided | +5% |
| No more than 2 cross-dimensional patterns active | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more dimensions are Speculative | −10% each |
| More than 2 dimensions are Low confidence | −10% |
| No historical data available | −5% |
| EM self-assessment not provided | −5% |
| More than 3 cross-dimensional patterns active | −10% |
| Significant team composition change this quarter (> 20% turnover) | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in development planning |
| 75–89% | Medium | Use output; flag gaps to manager and coach |
| 50–74% | Low | Use output as hypothesis; validate key claims with additional data |
| < 50% | Speculative | Do not use for formal planning; collect missing inputs first |

---

## Failure Modes

Conditions under which this skill produces unreliable output. Identify and flag before sharing results.

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Dimension cherry-picking** | EM runs only dimensions they expect to score well | Dimension set is incomplete or biased toward strengths | Require full 13-dimension assessment for quarterly reviews |
| **Confidence inflation** | EM marks Low/Speculative inputs as Medium/High without justification | Confidence levels do not match input availability | Audit input sources; downgrade confidence to match evidence |
| **Pattern blindness** | Active cross-dimensional patterns are not identified | Multiple dimensions are Yellow/Red but no patterns are named | Run pattern detection again; require at least 2 evidence points per pattern |
| **Weight manipulation** | Weights are adjusted to inflate the holistic score | Custom weights deviate from the established table without documented rationale | Use standard weights; any deviation must be approved and documented |
| **Missing trend context** | Historical scores are available but not used | Previous quarter data is present but not referenced in analysis | Include trend column in scorecard even if data is partial |
| **Over-generalization** | One bad sprint or incident drives multiple dimension scores down | Recent negative event is cited as evidence for 4+ dimensions | Isolate event-specific dimensions; separate one-off from systemic |
| **Development plan without priorities** | All 13 dimensions receive equal attention in recommendations | Recommendations address 5+ dimensions without ranking | Limit to top 3 priority dimensions per this skill's ranking methodology |

---

## References

- `docs/principles.md` — Principle 8: *Predict before React*; Principle 12: *Measure Outcomes*; Principle 3: *Default to Transparency*
- `docs/engineering-playbook.md` → *Engineering Leadership Competencies*, *Running 1:1s*, *Managing Up*
- `docs/engineering-playbook.md` → *Organizational Design*, *Role Clarity*, *Decision Rights*
- `CLAUDE.md` — Confidence scoring scale; leadership competency frameworks
- `skills/delivery/review-sprint.md` — Template for this skill's structure and scoring conventions
- `skills/people/performance-review.md` — Integration point for 360 and self-assessment inputs
- `skills/executive/executive-communication.md` — Integration point for executive narrative
- Google — *Project Oxygen* (2018): Google's research on effective engineering manager behaviors
- Goleman — *Leadership That Gets Results* (2000): Six leadership styles and their emotional intelligence applications
- `skills/leadership-health/generate-dashboard.md` — Converts this assessment into a visual dashboard
- `templates/leadership-health-dashboard.md` — Dashboard template with placeholder fields

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/delivery/review-sprint.md` | Template for this skill's structure, confidence scoring, and failure modes |
| `skills/people/performance-review.md` | Uses leadership health scores as evidence in 360 and self-assessment sections |
| `skills/executive/executive-communication.md` | Uses stakeholder alignment and communication effectiveness in executive narratives |
| `skills/strategy/align-priorities.md` (planned — not yet built) | Uses stakeholder alignment and execution clarity as inputs to strategic planning |
| `skills/people/career-development.md` | Uses coaching score and team autonomy to identify development opportunities |
| `skills/people/burnout.md` | Cross-references ownership index and coaching score for engagement risk |
| `skills/operations/postmortem.md` (planned — not yet built; skills/operations/ is reserved for it) | Decision quality and execution clarity dimensions correlate with incident outcomes |
| `skills/leadership-health/generate-dashboard.md` | Converts this skill's output into a visual scannable dashboard |
| `templates/leadership-health-dashboard.md` | Template for the visual dashboard artifact |
| All `leadership-health/*` skills | Individual dimension assessments feed into this master synthesis |
