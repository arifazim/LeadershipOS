# Skill: Incentive Misalignment

**Domain**: Political Signals  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Quarterly or at OKR/planning cycles

---

## Purpose

Detect "Misaligned incentives" signal and assess organizational risk from incentive structures that reward individual gain over team outcomes. This skill maps formal and informal incentives to identify where behaviors rewarded differ from values claimed.

This skill answers three questions:
1. How do formal incentives (OKRs, promotions, recognition) align with claimed team values?
2. What informal incentives exist, and do they support or undermine team objectives?
3. What patterns of rewarded behavior should be changed?

**Invoke this skill when**: Hero culture is rewarded, collaboration is penalized, promotion patterns seem inconsistent with stated values, or when team behaviors diverge from expected outcomes.

**Do not invoke this skill for**: Individual performance assessment (use `skills/people/performance-review.md`), team performance (use `skills/delivery/review-sprint.md`), or market compensation analysis (use `skills/people/compensation-benchmarking.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Formal incentive mapping | OKRs, promotion criteria, recognition program | What is officially rewarded and how |
| Behavior observation log | retrospectives, chat logs, 1:1s | Observed behaviors and their outcomes |
| Reward pattern analysis | promotion data, recognition logs | Who gets rewarded and for what |
| Value statement comparison | values doc, all-hands, leadership comms | Stated values vs. observed reward patterns |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Resource allocation data | budget, headcount, tool access | Who receives resources and why |
| Project assignment patterns | project assignments, rotations | Who gets choice projects vs. maintenance |
| Promotion alignment | promotion packets, criteria | Whether promoted behaviors match stated values |
| Team sentiment data | surveys, anonymous feedback | Perception of fairness in reward systems |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Alignment Gap Analysis

Compare stated values to rewarded behaviors:

| Alignment Score | Interpretation |
|---|---|
| 90–100% | High — incentives strongly aligned with values |
| 70–89% | Good — incentives mostly aligned with minor gaps |
| 50–69% | At Risk — significant misalignment in key areas |
| < 50% | Critical — incentives actively work against values |

### Step 2 — Formal Incentive Analysis

Evaluate formal incentive structures:

| Incentive Type | Alignment Risk |
|---|---|
| **OKRs** | Risk if individual hero OKRs conflict with team outcomes |
| **Promotions** | Risk if promoted for individual achievement over team enablement |
| **Recognition** | Risk if only visible wins rewarded, not behind-the-scenes work |
| **Compensation** | Risk if financial rewards misaligned with value creation |
| **Resource allocation** | Risk if key resources go to high-visibility work only |

### Step 3 — Informal Incentive Detection

Identify unwritten reward patterns:

| Informal Incentive | Risk Level |
|---|---|
| **Hero treatment** | High — individuals praised for firefighting or last-minute saves |
| **Visibility bias** | High — only visible work gets recognition |
| **Relationship reward** | Medium — favors given based on proximity to power |
| **Comfort zone reward** | Low — being "easy to work with" rewarded over driving change |
| **Status quo reward** | Medium — maintaining existing systems rewarded, innovation penalized |

### Step 4 — Behavior Reward Pattern

Map what actually gets rewarded:

| Behavior Pattern | Risk Level |
|---|---|
| **Rewarded behaviors** | Hero work, visible contributions, firefighting, individual achievement |
| **Penalized behaviors** | Challenging decisions, slowing for quality, collaboration overhead, dissent |
| **Neutral behaviors** | Routine maintenance, process work, documentation |

### Step 5 — Incentive Classification

Classify incentive misalignment:

| Classification | Criteria |
|---|---|
| **Aligned formal incentives** | OKRs, promotions, recognition all reward behaviors that advance team goals and stated values |
| **Misaligned formal incentives** | Formal reward systems explicitly or implicitly reward behaviors that harm team outcomes |
| **Misaligned informal incentives** | Unwritten reward patterns (hero treatment, visibility bias) contradict stated values |
| **Incentive confusion** | Team cannot articulate what behaviors lead to promotion/recognition; inconsistent application |

---

## Decision Tree

```
What is the incentive alignment score?
│
├── 90–100% (Green) ────────────────────────────────────────────────
│   What is the informal incentive pattern?
│   │
│   ├── No problematic informal patterns
│   │   └── OUTCOME: Healthy incentive environment.
│   │         Recommendation: Monitor for drift.
│   │         Confidence: High.
│   │
│   └── Some informal misalignment
│       └── OUTCOME: Green formal, at-risk informal.
│             Recommendation: Address hero culture or visibility bias.
│             Make informal rewards explicit.
│             Confidence: Medium.
│
├── 70–89% (Yellow) ───────────────────────────────────────────────
│   What is the primary misalignement?
│   │
│   ├── Formal incentive gaps
│   │   └── OUTCOME: Misaligened formal incentives.
│   │         Recommendation: Ethical Response Protocol applies.
│   │         Review OKRs and recognition criteria.
│   │         Confidence: High.
│   │
│   ├── Informal incentive dominance
│   │   └── OUTCOME: Misaligened informal incentives.
│   │         Recommendation: Make informal rewards explicit.
│   │         Confidence: High.
│   │
│   └── Incentive confusion
│       └── OUTCOME: Incentive confusion — unclear what is rewarded.
│             Recommendation: Clarify reward criteria with team.
│             Confidence: High.
│
└── < 70% (Red) ───────────────────────────────────────────────
    What is the primary failure mode?
    │
    ├── Formal incentives harm team outcomes
    │   └── OUTCOME: Critical misaligned formal incentives.
    │         Recommendation: Immediate incentive realignment required.
    │         Ethical Response Protocol applies.
    │         Confidence: High.
    │
    ├── Culture rewards anti-team behavior
    │   └── OUTCOME: Critical informal misalignment.
    │         Recommendation: Address hero culture explicitly.
    │         Ethical Response Protocol applies.
    │         Confidence: High.
    │
    └── No clear reward understanding
        └── OUTCOME: Critical incentive confusion.
              Recommendation: Define and communicate reward criteria.
              Ethical Response Protocol applies.
              Confidence: High.
```

---

## Output

Produce the following artifacts in order.

### 1. Incentive Misalignment Risk Summary (3–5 sentences)

State: overall risk level, alignment score, primary misalignment type, behavior pattern, and one immediate ethical action. Include confidence level.

> **Example**: "Incentive misalignment risk is Yellow (47). Alignment score is 65% with gaps in recognition patterns. Formal incentives are reasonably aligned but informal hero treatment is prevalent. Observed behaviors: firefighting rewarded, collaboration not recognized. Immediate action: Propose recognition system that includes behind-the-scenes contributions. Confidence: Medium (74%)."

### 2. Incentive Scorecard

| Signal | Value | Threshold | Status |
|---|---|---|---|
| Alignment score | {{%}} | ≥90%=Green, 70–89%=Yellow, <70%=Red | {{G/Y/R}} |
| Hero culture presence | {{Y/N}} | Absent=Green, Present=Yellow, Dominant=Red | {{G/Y/R}} |
| Recognition consistency | {{%}} | ≥80%=Green, 50–79%=Yellow, <50%=Red | {{G/Y/R}} |
| Promotion-behavior alignment | {{%}} | ≥80%=Green, 50–79%=Yellow, <50%=Red | {{G/Y/R}} |
| **Risk Score** | **{{0–100}}** | **≤30=Green, 31–60=Yellow, >60=Red** | **{{G/Y/R}}** |

### 3. Incentive Mapping Table

| Incentive Type | Stated Value Alignment | Observed Reward Pattern | Gap? |
|---|---|---|---|
| {{Type}} | {{aligned/not aligned}} | {{behavior rewarded}} | {{Y/N}} |

### 4. Behavior Reward Log

| Date | Behavior Observed | Outcome | Reward Type | Team Impact |
|---|---|---|---|---|
| {{YYYY-MM-DD}} | {{behavior}} | {{individual/team}} | {{formal/informal}} | {{positive/negative}} |

### 5. Ethical Response Protocol

Apply these recommendations when incentive misalignment is detected:

1. **Name the pattern, not the person** — "I've observed a pattern where hero work is rewarded over collaborative work" rather than "X always gets praised for saving the day"
2. **Recommend transparency** — Make reward criteria explicit and shared; publish recognition guidelines
3. **Recommend dialogue** — Facilitate discussion about what behaviors should be rewarded
4. **Recommend stakeholder alignment** — Involve team in defining reward criteria aligned with values

**Prohibited responses** (never recommend or engage in):
- Rewarding hero behavior that creates long-term team debt
- Creating competition for recognition that undermines collaboration
- Using promotion or recognition as leverage against team members
- Accepting "that's just how it is" as justification for misalignment

### 6. Risk Mitigation Recommendations

- **This week**: {{1 immediate action — e.g., propose recognition guideline}}
- **This quarter**: {{1 systemic change — e.g., revamp recognition system}}
- **Ongoing**: {{Monitoring approach}}

---

## Examples

### Example A — Healthy Incentive Alignment

**Inputs**
- Alignment score: 92%
- Formal incentives: OKRs reward team outcomes, recognition includes collaboration
- Informal incentives: No hero culture; behind-the-scenes work acknowledged
- Promotion patterns: Promoted engineers who mentored others and improved processes
- Team sentiment: 85% agree rewards match values

**Output Summary**
> Incentive misalignment risk is Green (24). Alignment score is 92% with strong formal alignment. Recognition includes collaboration and mentorship. Promotion patterns consistently reward team enablement. No hero culture observed. Confidence: High (90%).

**Risk Score**: 24 (Green)

---

### Example B — Hero Culture Misalignment

**Inputs**
- Alignment score: 58%
- Formal incentives: OKRs focus on individual metrics, not team outcomes
- Informal incentives: Hero treatment for firefighting is prevalent
- Recognition: Only visible work recognized; no process/documentation credit
- Promotion patterns: Promoted for individual heroics, not team building
- Team sentiment: 42% agree rewards match values; "hard to know what gets you promoted"

**Output Summary**
> Incentive misalignment risk is Red (68). Alignment score is 58% with significant gaps. Formal incentives focus on individual metrics over team outcomes. Hero culture is prevalent — firefighting rewarded, collaboration invisible. Promotion patterns inconsistent with stated team values. Team confused about what is rewarded. Ethical Response Protocol applies — name pattern of hero culture, recommend transparent recognition guidelines, initiate dialogue about reward criteria. Confidence: High (85%).

**Risk Score**: 68 (Red)

**Recommendations**
- *This week*: Propose recognition system that includes behind-the-scenes contributions
- *This quarter*: Revise OKRs to include team outcome metrics alongside individual metrics
- *Systemic*: Establish clear promotion criteria aligned with stated values

---

## Confidence Score

The confidence score reflects how much to trust this assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs with specifics | +10% |
| Team sentiment data corroborates | +5% |
| Multiple data sources confirm patterns | +5% |
| Promotion/assignment data available | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| Missing incentive documentation | −15% each |
| No behavior observation data | −10% |
| Assessment based on hearsay | −15% |
| Stakeholder group in active conflict | −10% |

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
| **Observation bias** | Only visible work noticed | Behind-the-scenes work overlooked in analysis | Actively seek invisible contributions |
| **Retroactive alignment** | Rewriting history to match outcomes | Promotion reasons don't match pre-promotion behaviors | Compare stated criteria to actual decisions |
| **Hero blindness** | Hero behavior accepted as normal | Firefighting rewarded without questioning root cause | Ask why the fire happened; reward prevention too |
| **Recognition capture** | Same people always recognized | Recognition patterns show bias toward certain groups | Diversify recognition sources and criteria |
| **OKR gaming** | Metrics gamed without value creation | High metrics but poor outcomes | Measure outcomes, not just activities |

---

## References

- `docs/principles.md` — Principle 3: *Default to Transparency*; Principle 9: *Optimize for Learning*
- `political-signals/README.md` — Module overview and Ethical Response Protocol
- `skills/delivery/review-sprint.md` — Template for structure and confidence scoring
- `skills/people/performance-review.md` — Related: performance and reward systems
- `docs/operating-model.md` — Related: organizational incentive structures

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/political-signals/decision_reversals.md` | Incentive misalignment can drive strategic pivots to show "progress" |
| `skills/political-signals/meeting_exclusion.md` | Exclusion signals incentive misalignment in stakeholder treatment |
| `skills/political-signals/ownership_ambiguity.md` | Unclear ownership affects how incentives are assigned |
| `skills/political-signals/escalation_patterns.md` — Misaligned incentives drive competitive escalation |
| `political-signals/political-signals.md` | This dimension feeds into the holistic risk score |
| `confidence-engine/quality_confidence.md` | Incentive misalignment undermines quality outcomes |