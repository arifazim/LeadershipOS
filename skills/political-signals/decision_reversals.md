# Skill: Decision Reversals

**Domain**: Political Signals  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or when reversals occur

---

## Purpose

Detect "Frequent decision reversals" signal and assess organizational risk from inconsistent or unpredictable decision-making patterns. This skill analyzes frequency, timing, and transparency of decision reversals to distinguish legitimate strategic pivoting from manipulative pattern shifts.

This skill answers three questions:
1. How frequently are decisions being reversed, and what is the timing pattern?
2. Are reversals transparent and justified, or do they appear strategically opaque?
3. Who initiates reversals, who is informed, and who is systematically excluded from communication?

**Invoke this skill when**: A decision is unexpectedly reversed, team expresses confusion about priorities, stakeholders receive conflicting messages, or you observe patterns of "flip-flopping" on key initiatives.

**Do not invoke this skill for**: Individual decision-making quality (use `skills/leadership-health/decision_quality.md`), sprint planning changes (use `skills/delivery/review-sprint.md`), or technical pivots based on new information (use `skills/product/roadmap-health.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Decision reversal log | Meeting notes, Slack, email | Last 6 months of reversals with dates, decision types, and stated reasons |
| Communication pattern data | Meeting invites, CC lists | Who was informed vs. who was excluded for each reversal |
| Stated justification | EM/sponsor communication | Reason given for each reversal (new info, strategy shift, error correction) |
| Timeline of reversals | Calendar / decision log | Dates, timing relative to stakeholder commitments |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Initiative timeline | Roadmap / project tracker | Original decisions and their intended timelines |
| Stakeholder commitment data | 1:1 notes, OKRs | What stakeholders committed to before reversals occurred |
| Executive input timing | Meeting notes | When senior leadership became involved in each reversal |
| Team sentiment data | Anonymous surveys, retrospectives | Team reaction to reversals and trust impact |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Frequency Analysis

Count decision reversals in the last 6 months:

| Reversal Count | Interpretation |
|---|---|
| 0–1 reversals | Low frequency — decisions are stable and predictable |
| 2–4 reversals | Moderate frequency — some instability but may be legitimate pivots |
| 5–8 reversals | High frequency — pattern of reversals emerging |
| ≥ 9 reversals | Critical frequency — organizational instability signal |

### Step 2 — Timing Pattern Analysis

Analyze timing of reversals:

| Timing Pattern | Interpretation |
|---|---|
| Reversals spaced > 30 days apart | Stable cadence — time for stakeholders to adjust |
| Reversals within 7–14 days | Quick reversal — potential lack of upfront analysis |
| Reversals within 48 hours | Rapid reversal — high disruption risk |
| Multiple reversals on same decision | Decision cycling — deeper strategic confusion |

### Step 3 — Transparency Assessment

Evaluate transparency of each reversal:

| Transparency Level | Indicator | Risk |
|---|---|---|
| **Explicit reason** | Clear public explanation of why reversal occurred | Low |
| **Implicit reason** | Reason mentioned in passing, not formally communicated | Medium |
| **No reason given** | Decision reversed without explanation | High |
| **Contradictory reasons** | Different reasons given to different stakeholder groups | Critical |

### Step 4 — Stakeholder Inclusion Pattern

Track who is informed about reversals:

| Inclusion Pattern | Risk Level | Interpretation |
|---|---|---|
| All affected stakeholders informed simultaneously | Low | Transparent communication |
| Some stakeholders informed later | Medium | Selective communication |
| Certain stakeholders never informed | High | Targeted exclusion pattern |
| Stakeholders learn from third parties | Critical | Information asymmetry abuse |

### Step 5 — Legitimacy Classification

Classify each reversal as legitimate or manipulative:

| Classification | Criteria |
|---|---|
| **Legitimate reversal** | New information emerged that materially changes the decision basis; communicated transparently with all stakeholders; allows reasonable transition time |
| **Strategy shift** | Strategic pivot with clear rationale; communicated with timeline and transition plan; affects all stakeholders equally |
| **Manipulative reversal** | Motive unclear or inconsistent; communicated selectively; creates information asymmetry; targets specific stakeholders negatively |
| **Error correction** | Previous decision acknowledged as mistake; apology or acknowledgment given; corrective action defined |

---

## Decision Tree

```
What is the reversal frequency in the last 6 months?
│
├── 0–1 reversals ────────────────────────────────────────────────
│   Are reversals transparent and inclusive?
│   │
│   ├── Yes
│   │   └── OUTCOME: Healthy decision-making environment.
│   │         Recommendation: Monitor and document reversals for pattern detection.
│   │         Confidence: High.
│   │
│   └── No (opacity or exclusion)
│       └── OUTCOME: At-risk environment despite low frequency.
│             Recommendation: Request transparent communication for all reversals.
│             Confidence: High.
│
├── 2–4 reversals ───────────────────────────────────────────────
│   Is there a timing pattern?
│   │
│   ├── Random timing, all transparent
│   │   └── OUTCOME: Acceptable with improvement opportunities.
│   │         Recommendation: Stabilize decision cadence.
│   │         Confidence: Medium.
│   │
│   ├── Quick reversals (< 14 days)
│   │   └── OUTCOME: At-risk — insufficient upfront analysis.
│   │         Recommendation: Implement decision review checkpoint before finalization.
│   │         Confidence: Medium.
│   │
│   └── Selective communication
│       └── OUTCOME: At-risk — information control pattern.
│             Recommendation: Ethical Response Protocol applies — name pattern, demand transparency.
│             Confidence: Medium.
│
├── 5–8 reversals ───────────────────────────────────────────────
│   Are reversals targeting specific stakeholders?
│   │
│   ├── No — affects all stakeholders equally
│   │   └── OUTCOME: Pattern of reversals — possible organizational confusion.
│   │         Recommendation: Request decision framework documentation.
│   │         Confidence: Medium to High.
│   │
│   └── Yes — selective targeting
│       └── OUTCOME: Targeted reversal pattern — high risk.
│             Recommendation: Ethical Response Protocol applies — name pattern, initiate dialogue.
│             Confidence: High.
│
└── ≥ 9 reversals ───────────────────────────────────────────────
    OUTCOME: Critical reversal pattern — organizational instability.
    Recommendation: Immediate intervention required.
    Ethical Response Protocol applies — escalate pattern visibility.
    Confidence: High.
```

---

## Output

Produce the following artifacts in order.

### 1. Decision Reversal Risk Summary (3–5 sentences)

State: overall risk level, reversal frequency, transparency rating, stakeholder inclusion rating, and one immediate ethical action. Include confidence level.

> **Example**: "Decision reversal risk is Yellow (42). There have been 4 reversals in the last 6 months, with selective communication in 2 cases. Transparency is moderate — reasons are given but not always consistent. Stakeholder inclusion is at risk — one stakeholder group consistently learns reversals last. Immediate action: Request transparent communication protocol for all future reversals affecting team commitments. Confidence: Medium (78%)."

### 2. Reversal Scorecard

| Signal | Value | Threshold | Status |
|---|---|---|---|
| Reversal frequency (6 months) | {{count}} | 0–1=Green, 2–4=Yellow, 5+=Red | {{G/Y/R}} |
| Average time between reversals | {{days}} | >30=Green, 15–30=Yellow, <15=Red | {{G/Y/R}} |
| Transparency rate | {{%}} | ≥80%=Green, 50–79%=Yellow, <50%=Red | {{G/Y/R}} |
| Stakeholder inclusion rate | {{%}} | ≥80%=Green, 50–79%=Yellow, <50%=Red | {{G/Y/R}} |
| **Risk Score** | **{{0–100}}** | **≤30=Green, 31–60=Yellow, >60=Red** | **{{G/Y/R}}** |

### 3. Reversal Log

| Date | Decision | Stated Reason | Communication Recipients | Excluded Stakeholders | Classification |
|---|---|---|---|---|---|
| {{YYYY-MM-DD}} | {{decision}} | {{reason}} | {{recipients}} | {{excluded}} | {{Legitimate/Strategy/Manipulative/Error}} |

### 4. Stakeholder Impact Matrix

| Stakeholder Group | Reversals Affecting Them | Exclusion Incidents | Trust Impact | Recommended Action |
|---|---|---|---|---|
| {{Group}} | {{count}} | {{count}} | {{High/Med/Low}} | {{Action}} |

### 5. Ethical Response Protocol

Apply these recommendations when reversals are opaque, exclude stakeholders, or occur frequently:

1. **Name the pattern, not the person** — "I've observed a pattern of rapid decision reversals without full stakeholder communication" rather than "X keeps changing their mind"
2. **Recommend transparency** — Request all decisions affecting team commitments be communicated to all affected parties simultaneously
3. **Recommend dialogue** — Suggest a decision audit session to understand the reasoning and timeline
4. **Recommend stakeholder alignment** — Propose inviting all affected stakeholders to future decision reviews

**Prohibited responses** (never recommend or engage in):
- Manipulating information to gain advantage
- Excluding others to consolidate influence
- Using ambiguity to avoid follow-up questions
- Escalating for personal positioning rather than organizational clarity

### 6. Risk Mitigation Recommendations

- **This week**: {{1 immediate action — e.g., request decision communication protocol}}
- **This quarter**: {{1 systemic change — e.g., implement decision checkpoint process}}
- **Ongoing**: {{Monitoring approach}}

---

## Examples

### Example A — Healthy Decision Environment

**Inputs**
- Reversal frequency: 1 in last 6 months
- Reason: New regulatory requirement emerged after initial decision
- Communication: All stakeholders informed within 24 hours
- Timeline: Decision allowed 30-day transition
- Team sentiment: Low impact, understood necessity

**Output Summary**
> Decision reversal risk is Green (18). One reversal occurred due to new regulatory information, communicated to all stakeholders with clear rationale and transition timeline. Transparency and inclusion are both high. No ethical response protocol needed. Confidence: High (92%).

**Risk Score**: 18 (Green)

---

### Example B — At-Risk Decision Environment

**Inputs**
- Reversal frequency: 5 in last 6 months
- Reasons: Varying — "market conditions," "strategy shift," "new priorities" (no consistent pattern)
- Communication: Engineering team consistently not included in reversal announcements
- Timing: Reversals occurring 3-5 days after team commitment
- Team sentiment: "We never know what to count on" theme in retrospectives

**Output Summary**
> Decision reversal risk is Red (68). Five reversals in 6 months with inconsistent stated reasons. Engineering team excluded from 4 of 5 reversal communications. Pattern suggests targeted exclusion and strategic instability. Ethical Response Protocol applies — name pattern, recommend transparent communication protocol, initiate dialogue with decision makers. Confidence: High (88%).

**Risk Score**: 68 (Red)

**Recommendations**
- *This week*: Request explicit inclusion in all future decision communications affecting team commitments
- *This quarter*: Propose a decision audit process to understand reversal triggers
- *Systemic*: Document all reversals and their justifications in a shared log for pattern recognition

---

## Confidence Score

The confidence score reflects how much to trust this assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available with dates and specifics | +10% |
| Stakeholder impact data corroborates signal | +5% |
| Team sentiment data available | +5% |
| Multiple data sources confirm pattern | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| Missing reversal documentation | −15% each |
| No stakeholder inclusion data | −10% |
| Assessment based on second-hand accounts only | −15% |
| Stakeholder group currently in conflict | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in organizational health discussions |
| 70–89% | Medium | Use output; flag any gaps to manager or team |
| 50–69% | Low | Use output as hypothesis; validate with additional data |
| < 50% | Speculative | Do not use for formal assessment; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Selective memory** | Recency bias in reversal counting | Recent reversals over-represented, older ones forgotten | Require documented decision log going back 6 months |
| **Justification conflation** | Legitimate reasons conflated with strategic pivots | Stated reasons are vague or inconsistent across sources | Ask for specific trigger events for each reversal |
| **Inclusion blindness** | EM unaware of who was excluded | Stakeholders report learning reversals late | Cross-check meeting invites and CC lists against stakeholder list |
| **Frequency undercount** | Only major reversals counted, minor ones ignored | Team mentions "small" reversals not in log | Include any decision change affecting stakeholder commitments |
| **Pattern dismissal** | "They're the boss, they can decide" mentality | Reversal analysis dismisses legitimate concerns | Pattern risk is systemic, not individual — assess objectively |

---

## References

- `docs/principles.md` — Principle 3: *Default to Transparency*; Principle 8: *Think in Systems*
- `political-signals/README.md` — Module overview and Ethical Response Protocol
- `skills/delivery/review-sprint.md` — Template for structure and confidence scoring
- `skills/leadership-health/decision_quality.md` — Related: decision-making quality in leadership context
- `skills/operations/postmortem.md` — Decision reversal analysis in incident context
- `skills/executive/executive-communication.md` — Communication protocols for decisions

---

## Related Skills

| Skill | Relationship |
|---|---|
| `political-signals/meeting_exclusion.md` | Meeting exclusion often accompanies targeted reversals |
| `political-signals/escalation_patterns.md` | Bypass escalation often follows opaque decision reversals |
| `political-signals/ownership_ambiguity.md` | Unclear ownership creates decision instability |
| `political-signals/incentive_misalignment.md` | Incentive misalignment can drive strategic pivots |
| `political-signals/political-signals.md` | This dimension feeds into the holistic risk score |
| `confidence-engine/executive_confidence.md` | Decision reversals directly impact executive confidence |
| `skills/leadership-health/decision_quality.md` — Related: decision quality in leadership context |