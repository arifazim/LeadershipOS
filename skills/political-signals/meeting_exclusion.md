# Skill: Meeting Exclusion

**Domain**: Political Signals  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or when exclusion is suspected

---

## Purpose

Detect "Exclusion from key meetings" signal and assess organizational risk from information and influence asymmetries created by selective meeting attendance. This skill tracks meeting invitation patterns across the organization to distinguish operational efficiency from information control.

This skill answers three questions:
1. What are the patterns of meeting invitation and exclusion across the organization?
2. Are exclusions driven by operational efficiency or by information control?
3. What decisions are made without certain stakeholder groups, and what is the impact?

**Invoke this skill when**: Stakeholders express surprise about decisions, key contributors are absent from planning meetings, information seems to be "circulating" informally, or you observe consistent absence patterns.

**Do not invoke this skill for**: Individual meeting etiquette (use `skills/leadership-health/meeting_quality.md`), sprint ceremonies (use `skills/delivery/review-sprint.md`), or project status updates (use `skills/communication/weekly-update.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Meeting attendance log | Calendar / meeting tool | Last 3 months of relevant meetings with attendees and topics |
| Decision impact mapping | Meeting notes, project updates | Which decisions were made in which meetings |
| Stakeholder presence tracking | Attendance records | Who should have been present but was absent |
| Invitation source | Calendar invites, meeting organizers | Who decided attendance for each meeting |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Decision outcome tracking | Project outcomes | What happened after each decision was made |
| Stakeholder influence mapping | Org analysis | Who has informal vs. formal influence on each topic |
| Exclusion justification | Meeting organizer rationale | Reasons stated for exclusion |
| Alternative communication | Slack, email | Whether excluded stakeholders were informed post-meeting |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Exclusion Frequency Analysis

Count exclusion incidents in the last 3 months:

| Exclusion Count | Interpretation |
|---|---|
| 0–2 exclusions | Low — meeting attendance is generally inclusive |
| 3–6 exclusions | Moderate — some selective attendance patterns |
| 7–12 exclusions | High — systematic exclusion pattern emerging |
| ≥ 13 exclusions | Critical — structural exclusion signal |

### Step 2 — Stakeholder Consistency Analysis

Identify who is consistently excluded:

| Consistency Pattern | Risk Level | Interpretation |
|---|---|---|
| Different stakeholders excluded each time | Low | Ad-hoc exclusions for specific topics |
| Same stakeholders excluded repeatedly | High | Targeted exclusion pattern |
| Dissenting voices systematically excluded | Critical | Strategic exclusion of opposition |
| Entire functional groups excluded | Critical | Systematic information control |

### Step 3 — Decision Impact Assessment

Map decisions to exclusion timing:

| Impact Level | Indicator |
|---|---|
| **Direct impact** | Excluded stakeholder's work directly affected by decision |
| **Indirect impact** | Excluded stakeholder's team affected by decision |
| **No impact** | Decision had no bearing on excluded stakeholder |

### Step 4 — Exclusion Justification Analysis

Evaluate reasons for exclusion:

| Justification | Risk Level |
|---|---|
| "Right people in room" — operational efficiency | Low |
| "Too many people" — meeting size constraint | Medium |
| No reason given | High |
| Contradictory reasons across stakeholder groups | Critical |

### Step 5 — Exclusion Classification

Classify each exclusion as operational, strategic, or systemic:

| Classification | Criteria |
|---|---|
| **Operational exclusion** | Right people are in the room; excluded parties are not directly impacted; rationale is clear and consistent; post-meeting communication provided; aligns with meeting purpose |
| **Strategic exclusion** | Specific stakeholders are excluded to control information flow or influence; decisions made that affect excluded parties; rationale is vague or inconsistent; aligns with shifting power dynamics |
| **Systemic exclusion** | Consistent pattern of excluding entire groups; creates persistent information asymmetry; no post-meeting communication; aligns with structural power imbalances |

---

## Decision Tree

```
What is the exclusion frequency?
│
├── 0–2 exclusions ────────────────────────────────────────────────
│   What is the justification quality?
│   │
│   ├── Clear operational rationale
│   │   └── OUTCOME: Healthy meeting discipline.
│   │         Recommendation: Document meeting criteria for future reference.
│   │         Confidence: High.
│   │
│   └── No rationale or inconsistent
│       └── OUTCOME: At-risk despite low frequency.
│             Recommendation: Request clear meeting inclusion criteria.
│             Confidence: Medium.
│
├── 3–6 exclusions ────────────────────────────────────────────────
│   Are exclusions targeting specific stakeholders?
│   │
│   ├── No — affects different people each time
│   │   └── OUTCOME: Operational exclusion — process improvement needed.
│   │         Recommendation: Establish meeting inclusion criteria.
│   │         Confidence: Medium.
│   │
│   └── Yes — same people excluded
│       ├── Are they affected by decisions?
│       │   │
│       │   ├── No — no impact
│       │   │   └── OUTCOME: Strategic exclusion — medium risk.
│       │   │         Recommendation: Ethical Response Protocol applies.
│       │   │         Confidence: High.
│       │   │
│       │   └── Yes — decisions affect them
│       │       └── OUTCOME: Strategic exclusion — high risk.
│       │             Recommendation: Ethical Response Protocol applies — name pattern.
│       │             Confidence: High.
│       │
├── 7–12 exclusions ───────────────────────────────────────────────
│   What is the consistency pattern?
│   │
│   ├── Different people each time
│   │   └── OUTCOME: Process failure — no clear criteria.
│   │         Recommendation: Demand clear meeting criteria and documentation.
│   │         Confidence: Medium.
│   │
│   └── Same people/Groups excluded
│       └── OUTCOME: Systemic exclusion — critical risk.
│             Recommendation: Ethical Response Protocol applies immediately.
│             Escalate pattern visibility.
│             Confidence: High.
│
└── ≥ 13 exclusions ───────────────────────────────────────────────
    OUTCOME: Systemic exclusion — organizational crisis.
    Recommendation: Escalate to appropriate leadership level.
    Ethical Response Protocol applies — document pattern, request inclusion, propose structural fix.
    Confidence: High.
```

---

## Output

Produce the following artifacts in order.

### 1. Meeting Exclusion Risk Summary (3–5 sentences)

State: overall risk level, exclusion frequency, primary pattern, impact on decisions, and one immediate ethical action. Include confidence level.

> **Example**: "Meeting exclusion risk is Yellow (45). Six exclusion incidents in the last 3 months with inconsistent justification. The same three stakeholders are consistently excluded from roadmap discussions. Two decisions were made that directly impacted their work without their input. Immediate action: Request clear meeting inclusion criteria and ask that affected stakeholders be included in future roadmap meetings. Confidence: Medium (76%)."

### 2. Exclusion Scorecard

| Signal | Value | Threshold | Status |
|---|---|---|---|
| Exclusion frequency (3 months) | {{count}} | 0–2=Green, 3–6=Yellow, 7+=Red | {{G/Y/R}} |
| Stakeholder consistency | {{pattern}} | Varies=Green, Repeated=Yellow, Systematic=Red | {{G/Y/R}} |
| Decision impact rate | {{%}} | <20%=Green, 20–50%=Yellow, >50%=Red | {{G/Y/R}} |
| Justification clarity | {{%}} | ≥80%=Green, 50–79%=Yellow, <50%=Red | {{G/Y/R}} |
| **Risk Score** | **{{0–100}}** | **≤30=Green, 31–60=Yellow, >60=Red** | **{{G/Y/R}}** |

### 3. Exclusion Log

| Date | Meeting | Topic | Attendees | Excluded | Impact Level | Classification |
|---|---|---|---|---|---|---|
| {{YYYY-MM-DD}} | {{meeting}} | {{topic}} | {{attendees}} | {{excluded}} | {{Direct/Indirect/None}} | {{Operational/Strategic/Systemic}} |

### 4. Stakeholder Impact Matrix

| Stakeholder | Exclusions | Decisions Affecting Them | Influence Level | Recommended Action |
|---|---|---|---|---|
| {{Name/Group}} | {{count}} | {{count}} | {{Formal/Informal}} | {{Action}} |

### 5. Ethical Response Protocol

Apply these recommendations when exclusions are strategic or systemic:

1. **Name the pattern, not the person** — "I've observed a pattern of selective meeting attendance affecting key stakeholders" rather than "X excludes Y"
2. **Recommend transparency** — Request that meeting criteria and attendee lists be shared openly
3. **Recommend dialogue** — Suggest a conversation about meeting inclusion with affected parties
4. **Recommend stakeholder alignment** — Propose that all affected stakeholders be included in future relevant meetings

**Prohibited responses** (never recommend or engage in):
- Accepting "too many people" as justification without alternatives
- Allowing exclusion of dissenting voices to go unaddressed
- Working around exclusion through informal back-channels
- Escalating without first addressing pattern visibility

### 6. Risk Mitigation Recommendations

- **This week**: {{1 immediate action — e.g., request inclusion in next relevant meeting}}
- **This quarter**: {{1 systemic change — e.g., propose meeting inclusion policy}}
- **Ongoing**: {{Monitoring approach}}

---

## Examples

### Example A — Healthy Meeting Inclusion

**Inputs**
- Exclusion frequency: 1 in last 3 months
- Reason: New team member learning onboarding (temporary exclusion)
- Impact: No decisions affecting excluded party
- Post-meeting: Excluded party briefed informally
- Consistency: Different people excluded each time

**Output Summary**
> Meeting exclusion risk is Green (12). One exclusion incident for onboarding ramp-up. No decision impact, clear rationale, and post-meeting communication. Inclusion patterns are ad-hoc, not systematic. No ethical response protocol needed. Confidence: High (90%).

**Risk Score**: 12 (Green)

---

### Example B — At-Risk Meeting Exclusion

**Inputs**
- Exclusion frequency: 8 in last 3 months
- Consistency: Same engineering manager excluded from 7 of 8 product roadmap meetings
- Impact: 5 decisions made that directly changed their roadmap priorities
- Justification: "Product leadership preferred to keep meetings small"
- Influence: Excluded manager has strong technical expertise but is not "decision maker" in org chart

**Output Summary**
> Meeting exclusion risk is Red (72). Eight exclusion incidents with systematic pattern. One engineering manager excluded from roadmap meetings despite their work being directly affected. Justification is vague and consistently applied. Effect: 5 roadmap decisions made without technical input. Ethical Response Protocol applies — name the pattern of systematic exclusion, recommend transparent meeting criteria, initiate dialogue with product leadership. Confidence: High (85%).

**Risk Score**: 72 (Red)

**Recommendations**
- *This week*: Request explicit inclusion criteria for roadmap meetings
- *This quarter*: Propose that all stakeholders whose work may be affected by roadmap decisions be included
- *Systemic*: Establish a "meeting inclusion check" as part of decision-making process

---

## Confidence Score

The confidence score reflects how much to trust this assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs with dates and specifics | +10% |
| Decision impact data corroborates exclusion | +5% |
| Multiple data sources confirm pattern | +5% |
| Stakeholder mapping data available | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| Missing meeting attendance data | −15% each |
| No decision impact analysis | −10% |
| Assessment based on single incident | −15% |
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
| **Justification acceptance** | Accepting "right people" rationale without verification | Exclusion log has vague reasons but no pushback | Verify impact on excluded stakeholders independently |
| **Impact blindness** | Not tracking decisions made in excluded meetings | Missing decisions from meeting log | Cross-reference meeting topics with project outcomes |
| **Pattern blindness** | Focusing on individual incidents, missing systemic pattern | Same stakeholder excluded repeatedly but logged as "different people" | Aggregate by stakeholder identity, not incident type |
| **Informal backup** | Relying on informal communication to "make up for" exclusion | "They told me later" used to justify exclusion | Informal is not equivalent — document the exclusion |
| **Influence oversight** | Missing informal influence in exclusion analysis | Stakeholder not on org chart but has real influence | Map formal and informal influence for complete picture |

---

## References

- `docs/principles.md` — Principle 3: *Default to Transparency*; Principle 8: *Think in Systems*
- `political-signals/README.md` — Module overview and Ethical Response Protocol
- `skills/delivery/review-sprint.md` — Template for structure and confidence scoring
- `skills/leadership-health/meeting_quality.md` — Related: meeting quality and effectiveness
- `skills/leadership-health/stakeholder_alignment.md` — Related: stakeholder relationship health

---

## Related Skills

| Skill | Relationship |
|---|---|
| `political-signals/decision_reversals.md` | Targeted reversals often follow exclusion patterns |
| `political-signals/escalation_patterns.md` | Bypass escalation often follows exclusion |
| `political-signals/ownership_ambiguity.md` | Unclear ownership creates meeting confusion |
| `political-signals/incentive_misalignment.md` — Exclusion can signal incentive misalignment |
| `political-signals/political-signals.md` | This dimension feeds into the holistic risk score |
| `confidence-engine/executive_confidence.md` | Meeting exclusion undermines confidence in inclusion |