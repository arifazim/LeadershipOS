# Skill: Escalation Patterns

**Domain**: Political Signals  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or when escalation patterns emerge

---

## Purpose

Detect "Escalation patterns" signal and assess organizational risk from inappropriate escalation behavior that bypasses normal communication channels. This skill analyzes escalation frequency, timing, routing, and outcomes to distinguish healthy escalation from manipulative bypass.

This skill answers three questions:
1. What escalation behaviors are present, and what is the routing pattern?
2. Are escalations appropriate and contextual, or do they bypass for personal positioning?
3. How are escalations resolved, and what is the satisfaction with resolution?

**Invoke this skill when**: Issues are escalated around team members, multiple people escalate the same topic independently, escalations lack context, or you observe "going to the boss" patterns.

**Do not invoke this skill for**: Incident escalations (use `integrations/pagerduty.md`), critical production issues (use `skills/operations/postmortem.md`), or standard support escalation (use `skills/cross-functional/support-escalation.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Escalation log | ticketing system, meeting notes | Last 6 months of escalations with dates and targets |
| Bypass incidents | observation, chat logs | Escalations that went around direct manager or process |
| Context documentation | ticket notes, meeting prep | Whether escalations included prior conversation history |
| Resolution data | follow-up notes | Outcome and satisfaction with each escalation |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Stakeholder satisfaction | surveys, 1:1s | How affected parties feel about escalation handling |
| Escalation outcome tracking | project data | Measurable results of escalations |
| Pattern clustering | incident analysis | Multiple people escalating same topic independently |
| Executive feedback | skip-level notes | Senior leadership perspective on escalation patterns |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Escalation Frequency Analysis

Count escalation incidents in the last 6 months:

| Escalation Count | Interpretation |
|---|---|
| 0–3 escalations | Low — normal escalation patterns |
| 4–8 escalations | Moderate — elevated but may be contextual |
| 9–15 escalations | High — escalation pattern emerging |
| ≥ 16 escalations | Critical — systemic escalation signal |

### Step 2 — Bypass Pattern Analysis

Analyze escalation routing:

| Bypass Pattern | Risk Level | Interpretation |
|---|---|---|
| **Direct chain** | Low | Escalations follow normal manager chain |
| **Lateral escalation** | Medium | Some escalations go to peers/skip-levels |
| **Strategic bypass** | High | Repeated patterns of going around specific individuals |
| **Systemic bypass** | Critical | Multiple people escalating around same decision-maker |

### Step 3 — Context Assessment

Evaluate context provided with escalations:

| Context Level | Indicator |
|---|---|
| **Full context** | Prior conversation documented, attempts at resolution exhausted, clear problem statement |
| **Partial context** | Some prior conversation, but summary incomplete or selective |
| **No context** | Escalation raised without prior attempt at resolution |

### Step 4 — Resolution Analysis

Measure escalation outcomes:

| Resolution Metric | Threshold |
|---|---|
| **Resolution rate** | ≥ 80% = Healthy, 50–79% = Concern, < 50% = Risk |
| **Satisfaction rate** | ≥ 80% = Healthy, 50–79% = Concern, < 50% = Risk |
| **Time to resolution** | ≤ 3 days = Healthy, 4–7 days = Concern, > 7 days = Risk |

### Step 5 — Escalation Classification

Classify each escalation as healthy, bypass, or problematic:

| Classification | Criteria |
|---|---|
| **Healthy escalation** | Appropriate timing and level; full context provided; attempts at resolution exhausted; resolution documented; satisfies all stakeholders |
| **Bypass escalation** | Goes around direct manager; lacks context; used to gain advantage; creates conflict |
| **Context-free escalation** | No prior conversation attempted; lacks problem context; surprises all parties |
| **Cluster escalation** | Multiple people escalate same topic independently; indicates breakdown in communication or trust |

---

## Decision Tree

```
What is the escalation frequency?
│
├── 0–3 escalations ────────────────────────────────────────────────
│   What is the bypass pattern?
│   │
│   ├── No bypass — follows chain
│   │   └── OUTCOME: Healthy escalation environment.
│   │         Recommendation: Monitor and document for pattern detection.
│   │         Confidence: High.
│   │
│   └── Some bypass
│       └── OUTCOME: At-risk despite low frequency.
│             Recommendation: Investigate bypass reasons; require context.
│             Confidence: Medium.
│
├── 4–8 escalations ────────────────────────────────────────────────
│   What is the primary escalation pattern?
│   │
│   ├── Healthy escalations (contextual, resolved)
│   │   └── OUTCOME: Acceptable with improvement opportunities.
│   │         Recommendation: Document learning; reinforce escalation protocol.
│   │         Confidence: Medium.
│   │
│   ├── Bypass pattern (going around manager)
│   │   └── OUTCOME: Bypass escalation emerging.
│   │         Recommendation: Ethical Response Protocol applies.
│   │         Confidence: High.
│   │
│   ├── Context-free escalations
│   │   └── OUTCOME: Context-free escalation risk.
│   │         Recommendation: Require prior conversation attempt.
│   │         Confidence: High.
│   │
│   └── Cluster escalations (multiple independent escalations)
│       └── OUTCOME: Escalation cluster — communication breakdown.
│             Recommendation: Facilitate stakeholder dialogue.
│             Confidence: High.
│
├── 9–15 escalations ───────────────────────────────────────────────
│   What is the bypass rate?
│   │
│   ├── < 30% bypass
│   │   └── OUTCOME: High frequency but mostly healthy.
│   │         Recommendation: Review escalation criteria with team.
│   │         Confidence: Medium.
│   │
│   └── ≥ 30% bypass
│       └── OUTCOME: High-risk escalation pattern.
│             Recommendation: Ethical Response Protocol applies immediately.
│             Confidence: High.
│
└── ≥ 16 escalations ───────────────────────────────────────────────
    OUTCOME: Critical escalation environment — organizational dysfunction.
    Recommendation: Intervene at appropriate level; reset escalation norms.
    Ethical Response Protocol applies — name pattern, demand dialogue, reset protocol.
    Confidence: High.
```

---

## Output

Produce the following artifacts in order.

### 1. Escalation Pattern Risk Summary (3–5 sentences)

State: overall risk level, escalation frequency, bypass rate, context rate, and one immediate ethical action. Include confidence level.

> **Example**: "Escalation pattern risk is Yellow (46). Eight escalations in the last 6 months with 2 bypass incidents. Context provided in 6 of 8 escalations. Resolution rate is 75% with one cluster pattern. Immediate action: Require context documentation for all escalations going forward. Confidence: Medium (75%)."

### 2. Escalation Scorecard

| Signal | Value | Threshold | Status |
|---|---|---|---|
| Escalation frequency (6 months) | {{count}} | 0–3=Green, 4–8=Yellow, 9+=Red | {{G/Y/R}} |
| Bypass rate | {{%}} | <10%=Green, 10–30%=Yellow, >30%=Red | {{G/Y/R}} |
| Context rate | {{%}} | ≥80%=Green, 50–79%=Yellow, <50%=Red | {{G/Y/R}} |
| Resolution rate | {{%}} | ≥80%=Green, 50–79%=Yellow, <50%=Red | {{G/Y/R}} |
| **Risk Score** | **{{0–100}}** | **≤30=Green, 31–60=Yellow, >60=Red** | **{{G/Y/R}}** |

### 3. Escalation Log

| Date | Subject | Target | Context Provided | Bypass? | Resolution | Satisfaction | Classification |
|---|---|---|---|---|---|---|---|
| {{YYYY-MM-DD}} | {{subject}} | {{target}} | {{Y/N}} | {{Y/N}} | {{resolution}} | {{High/Med/Low}} | {{Healthy/Bypass/Context-free/Cluster}} |

### 4. Bypass Pattern Analysis

| Bypass Target | Escalations | Rate | Indicated Issue | Recommended Action |
|---|---|---|---|---|
| {{Person/Role}} | {{count}} | {{rate}} | {{trust/conflict/process}} | {{Action}} |

### 5. Ethical Response Protocol

Apply these recommendations when bypass, context-free, or cluster escalations are detected:

1. **Name the pattern, not the person** — "I've observed escalations bypassing the normal chain without prior conversation" rather than "X keeps going over Y's head"
2. **Recommend transparency** — Request that escalation criteria and process be explicitly documented and shared
3. **Recommend dialogue** — Facilitate conversation between escalator and bypassed party before further escalations
4. **Recommend stakeholder alignment** — Ensure all affected parties understand escalation triggers and process

**Prohibited responses** (never recommend or engage in):
- Escalating without first attempting direct resolution
- Accepting bypass as "the way to get things done"
- Using escalations for personal positioning or advantage
- Allowing repeated escalations without addressing root cause

### 6. Risk Mitigation Recommendations

- **This week**: {{1 immediate action — e.g., establish escalation protocol}}
- **This quarter**: {{1 systemic change — e.g., escalation review process}}
- **Ongoing**: {{Monitoring approach}}

---

## Examples

### Example A — Healthy Escalation Environment

**Inputs**
- Escalation frequency: 2 in last 6 months
- Bypass rate: 0%
- Context rate: 100% (both included prior conversation)
- Resolution: 2 of 2 resolved satisfactorily
- Pattern: No clusters, no bypass

**Output Summary**
> Escalation pattern risk is Green (15). Two escalations in 6 months, both following proper chain with full context. Resolution rate is 100%. No bypass patterns detected. Healthy escalation environment. Confidence: High (90%).

**Risk Score**: 15 (Green)

---

### Example B — Bypass Escalation Pattern

**Inputs**
- Escalation frequency: 7 in last 6 months
- Bypass rate: 43% (3 escalations went around direct manager)
- Context rate: 57% (2 lacked prior conversation)
- Resolution: 5 of 7 resolved; 2 created conflict
- Pattern: Junior engineer escalating around senior manager on roadmap decisions

**Output Summary**
> Escalation pattern risk is Red (64). Seven escalations in 6 months with 43% bypass rate. Three escalations went around the senior manager without prior discussion. Two escalations were context-free. Resolution rate is 71% but created conflict in bypassed cases. Ethical Response Protocol applies — name pattern of bypass escalation, recommend dialogue between parties, require context for all future escalations. Confidence: High (84%).

**Risk Score**: 64 (Red)

**Recommendations**
- *This week*: Facilitate conversation between senior manager and junior engineer about escalation protocol
- *This quarter*: Implement escalation checklist requiring prior conversation documentation
- *Systemic*: Review escalation patterns monthly in team retrospective

---

## Confidence Score

The confidence score reflects how much to trust this assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs with dates and specifics | +10% |
| Resolution data corroborates patterns | +5% |
| Multiple data sources confirm signal | +5% |
| Stakeholder satisfaction data available | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| Missing escalation documentation | −15% each |
| No resolution or satisfaction data | −10% |
| Assessment based on second-hand accounts | −15% |
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
| **Underreporting** | Escalations not tracked or documented | Missing data in escalation log | Require all escalations to be documented in shared system |
| **Context conflation** | Accepting "they know" as context | Escalation marked as contextual but stakeholders surprised | Verify context by checking prior conversation records |
| **Resolution acceptance** | Accepting partial resolution as complete | Escalation "resolved" but underlying tension remains | Track long-term stakeholder satisfaction, not just immediate outcome |
| **Pattern blindness** | Missing cluster patterns | Multiple people raise same topic but not connected | Look for topic clustering across independent escalations |
| **Bypass normalization** | Accepting bypass as normal | Repeated bypass escalations not addressed | Bypass is anti-pattern — require addressing root cause |

---

## References

- `docs/principles.md` — Principle 3: *Default to Transparency*; Principle 8: *Think in Systems*
- `political-signals/README.md` — Module overview and Ethical Response Protocol
- `skills/delivery/review-sprint.md` — Template for structure and confidence scoring
- `skills/cross-functional/support-escalation.md` — Related: formal escalation processes
- `skills/operations/postmortem.md` — Related: escalation in incident context

---

## Related Skills

| Skill | Relationship |
|---|---|
| `political-signals/meeting_exclusion.md` | Exclusion often triggers bypass escalation |
| `political-signals/decision_reversals.md` | Decision reversals drive escalation for clarity |
| `political-signals/ownership_ambiguity.md` | Unclear ownership triggers unnecessary escalation |
| `political-signals/incentive_misalignment.md` — Misaligned incentives drive competitive escalation |
| `political-signals/political-signals.md` | This dimension feeds into the holistic risk score |
| `confidence-engine/executive_confidence.md` | Escalation patterns directly impact confidence in org process |