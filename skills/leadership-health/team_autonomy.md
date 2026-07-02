# Skill: Team Autonomy

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or after team changes

---

## Purpose

Measure the degree to which the team makes its own technical and process decisions. Autonomy is the outcome of clear decision rights, capable team members, and a leader who resists the urge to override.

This skill answers three questions:
1. Does the team make technical and process decisions independently, or does the EM control them?
2. Is autonomy well-calibrated — does the team own decisions it is capable of owning, and escalate decisions it should not make alone?
3. Where are the autonomy gaps, and what is causing them?

**Invoke this skill when**: After a team restructuring, when team frustration about EM control is reported, or before a promotion conversation.

**Do not invoke this skill for**: Measuring ownership in execution (use `ownership_index.md`), measuring delegation (use `delegation_score.md`), or individual capability assessment (use `skills/people/assess-capability.md` (planned — not yet built)).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Team decision log | Team or EM tracking | Last 20 technical or process decisions: owner, type, outcome |
| Process change requests | Team forum / EM tracking | Last 10 process changes: who proposed, who approved, who implemented |
| EM override frequency | EM tracking | Count of times EM overrode a team decision in the last quarter |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Technical decision ownership | Architecture docs / decision log | % of technical decisions made by the team |
| Process ownership | Team documentation | % of process changes proposed and implemented by the team |
| Escalation appropriateness | Incident log / EM tracking | % of escalations that were appropriate given decision scope |
| Team sentiment on autonomy | 1:1s, surveys | Themes from team about decision-making freedom |
| EM control signals | Meeting notes, 1:1s | Instances where EM directed technical or process decisions without team input |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Technical Decision Ownership
Review the team decision log for technical decisions:
- **Technical decision ownership rate** = `(Technical decisions made by team members ÷ Total technical decisions) × 100`

| Technical Decision Ownership Rate | Interpretation |
|---|---|
| ≥ 85% | High. Team owns technical decisions. |
| 70–84% | Acceptable. Team owns most technical decisions; EM owns high-stakes ones. |
| 55–69% | At Risk. EM is controlling technical decisions the team could own. |
| < 55% | Critical. EM is the primary technical decision-maker. |

### Step 2 — Process Ownership Assessment
Review process change requests:
- **Process ownership rate** = `(Process changes proposed and implemented by the team ÷ Total process changes) × 100`

| Process Ownership Rate | Interpretation |
|---|---|
| ≥ 80% | High. Team owns its processes. |
| 65–79% | Acceptable. Team proposes most changes; EM approves some. |
| 50–64% | At Risk. EM controls process changes. |
| < 50% | Critical. EM dictates team processes. |

### Step 3 — EM Override Analysis
Review override frequency:
- **Override rate** = `(EM overrides of team decisions ÷ Total team decisions) × 100`

| Override Rate | Interpretation |
|---|---|
| < 5% | High. EM trusts team decisions. |
| 5–15% | Acceptable. Occasional overrides for high-stakes decisions. |
| 15–30% | At Risk. EM is second-guessing team decisions. |
| > 30% | Critical. EM is undermining team autonomy. |

### Step 4 — Escalation Appropriateness
Review escalation patterns:
- **Appropriate escalation rate** = `(Escalations that were appropriate given decision scope ÷ Total escalations) × 100`

| Appropriate Escalation Rate | Interpretation |
|---|---|
| ≥ 90% | High. Team knows when to escalate. |
| 75–89% | Acceptable. Some learning needed on escalation boundaries. |
| 60–74% | At Risk. Team is unsure when to escalate. |
| < 60% | Critical. Team either escalates everything or escalates nothing. |

### Step 5 — Autonomy Calibration Check
For each decision type, assess whether autonomy is well-calibrated:
- **Under-autonomy**: Team is capable but EM retains control. (Stifles growth, creates bottlenecks)
- **Over-autonomy**: Team is not capable but EM has delegated. (Creates risk, erodes trust)
- **Well-calibrated**: Team capability matches decision scope.

Calculate:
- **Autonomy calibration** = `(Well-calibrated decisions ÷ Total decisions) × 100`

| Autonomy Calibration | Interpretation |
|---|---|
| ≥ 80% | High. Autonomy is well-matched to capability. |
| 65–79% | Acceptable. Minor calibration gaps. |
| 50–64% | At Risk. Significant under- or over-autonomy exists. |
| < 50% | Critical. Autonomy is severely miscalibrated. |

### Step 6 — Synthesize Autonomy Signal
Combine technical decision ownership, process ownership, override rate, escalation appropriateness, and autonomy calibration into an overall autonomy assessment. Weight: Technical decision ownership (30%), Process ownership (25%), Override rate (20%), Escalation appropriateness (15%), Autonomy calibration (10%).

---

## Decision Tree

Use this tree to determine the autonomy classification and primary recommendation.

```
What is the technical decision ownership rate?
│
├── ≥ 85% ────────────────────────────────────────────────
│   What is the process ownership rate?
│   │
│   ├── ≥ 80% ───────────────────────────────────────────
│   │   What is the override rate?
│   │   │
│   │   ├── < 10%
│   │   │   └── OUTCOME: Team autonomy is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Consider expanding the team's technical decision scope.
│   │   │
│   │   └── ≥ 10%
│   │       └── OUTCOME: Autonomy is strong but EM overrides.
│   │             Recommendation: Define non-overridable decisions.
│   │             If a decision is delegated, let it stand.
│   │
│   └── 65–79% ─────────────────────────────────────────
│       └── OUTCOME: Autonomy is functional with process control gap.
│             Recommendation: Identify process changes the team proposed
│             that EM did not approve. Approve them unless there is
│             a specific risk. Process autonomy builds engagement.
│
├── 70–84% ───────────────────────────────────────────────
│   What is the autonomy calibration?
│   │
│   ├── ≥ 80%
│   │   └── OUTCOME: Autonomy is functional and well-calibrated.
│   │             Recommendation: Expand autonomy gradually.
│   │             Identify 2–3 decision types the team could own next quarter.
│   │
│   └── < 80%
│       └── OUTCOME: Autonomy is at risk due to miscalibration.
│             Recommendation: Identify under-autonomy and over-autonomy.
│             Delegate where the team is capable; retain where risk is high.
│
└── < 70% ─────────────────────────────────────────────────
    What is the primary autonomy failure?
    │
    ├── TECHNICAL CONTROL
    │   └── OUTCOME: Autonomy is broken — EM controls technical decisions.
    │         Recommendation: Identify the technical decision types EM is making
    │         that the team could own. Delegate one type this quarter.
    │
    ├── PROCESS CONTROL
    │   └── OUTCOME: Autonomy is broken — EM controls team processes.
    │         Recommendation: Let the team define its own processes.
    │         EM sets guardrails, not processes.
    │
    ├── OVERRIDE CULTURE
    │   └── OUTCOME: Autonomy is broken — team decisions do not stick.
    │         Recommendation: Define the conditions under which EM will override.
    │         Publicly commit to not overriding without explicit rationale.
    │
    └── MULTIPLE FAILURES
        └── OUTCOME: Autonomy is critically low.
              Recommendation: Full autonomy reset required.
              Publish decision rights for technical and process decisions.
              Train team on decision-making framework.
              Do not increase team scope until autonomy stabilizes.
```

---

## Output

Produce the following artifacts in order.

### 1. Autonomy Summary (3–5 sentences)

State: overall autonomy signal (strong / functional / at risk / broken), primary strength, primary gap, and one immediate action. Include confidence level.

> **Example**: "Team autonomy is functional with a process control gap. Technical decision ownership is 82% — the team makes most technical decisions. Process ownership is 58% — EM approves or initiates most process changes. Override rate is 8%, and escalation appropriateness is 85%. The primary gap is process control: EM is not letting the team own its working processes. Immediate action: EM to approve the team's next process change proposal without modification unless there is a specific risk. Confidence: High (87%)."

### 2. Autonomy Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Technical decision ownership | {{%}} | ≥ 85% = Green, 70–84% = Yellow, < 55% = Red | {{G/Y/R}} |
| Process ownership rate | {{%}} | ≥ 80% = Green, 65–79% = Yellow, < 50% = Red | {{G/Y/R}} |
| Override rate | {{%}} | < 10% = Green, 10–15% = Yellow, > 30% = Red | {{G/Y/R}} |
| Appropriate escalation rate | {{%}} | ≥ 90% = Green, 75–89% = Yellow, < 60% = Red | {{G/Y/R}} |
| Autonomy calibration | {{%}} | ≥ 80% = Green, 65–79% = Yellow, < 50% = Red | {{G/Y/R}} |

### 3. Decision Ownership Map

| Decision Type | Current Owner | Capability | Calibration Status | Notes |
|---|---|---|---|---|
| {{Type 1}} | {{Owner}} | {{High/Med/Low}} | {{Well-calibrated / Under / Over}} | {{Context}} |

### 4. Root Cause (if autonomy is At Risk or Broken)

- **Primary cause**: {{Technical control / Process control / Override culture / Multiple failures}}
- **Evidence**: {{2–3 specific observations from decision log or team sentiment}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to autonomy practice}}
- **Decision rights** (if applicable): {{Specific decision types to delegate or retain}}

---

## Examples

### Example A — Strong Autonomy

**Inputs**
- Team decision log: 20 decisions — 18 technical decisions made by the team (90% technical ownership rate)
- Process changes: 10 changes — 9 proposed and implemented by the team (90% process ownership rate)
- EM override frequency: 1 override in the last quarter (5% rate) — EM overrode a database schema choice due to a compliance constraint not visible to the team at decision time
- Escalation appropriateness: 12 escalations — 11 were appropriate (92% rate)
- Autonomy calibration: 19 of 20 decisions were well-calibrated (95% rate)

**Output Summary**
> Team autonomy is strong. Technical decision ownership is 90%, process ownership is 90%, override rate is 5%, and escalation appropriateness is 92%. Autonomy calibration is 95% — decisions are made at the right level with appropriate capability. The one override was appropriate (compliance constraint). The team is empowered and making good decisions. Confidence: High (94%).

---

### Example B — Autonomy Broken

**Inputs**
- Team decision log: 18 decisions — 6 technical decisions made by the team (33% technical ownership rate); EM made 12
- Process changes: 8 changes — 1 proposed by the team (13% process ownership rate); EM proposed 7
- EM override frequency: 8 overrides in the last quarter (44% rate of team decisions)
- Escalation appropriateness: 15 escalations — 5 were appropriate (33% rate); 10 were premature
- Autonomy calibration: 6 of 18 decisions were well-calibrated (33% rate)

**Output Summary**
> Team autonomy is broken. Technical decision ownership is 33% — EM controls technical decisions. Process ownership is 13% — EM dictates processes. Override rate is 44%, and escalation appropriateness is 33% — the team does not know when to escalate or decide. Autonomy calibration is 33% — most decisions are either over-autonomous (team not capable) or under-autonomous (team capable but EM retains control). The primary cause is EM control: the EM is making decisions the team should own and overriding decisions the team makes. Confidence: High (88%).

**Recommendations**
- *This week*: EM to identify the 3 technical decision types that are most frequently made by EM and delegate them to the team this week.
- *This quarter*: Publish a decision rights matrix that maps technical and process decisions to owners. EM retains only architecture direction and security decisions.
- *Systemic*: Practice "decide and announce" — when the team makes a decision, EM publicly supports it even if EM would have decided differently.

---

## Confidence Score

The confidence score reflects how much to trust this autonomy assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any autonomy assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Team decision log includes both technical and process decisions | +5% |
| Team sentiment data is available | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Team decision log is incomplete or self-reported only | −10% |
| No process change data exists | −10% |
| Override data is not tracked | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in delegation and autonomy planning |
| 70–89% | Medium | Use output; flag gaps to team |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for team communication; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Decision type ambiguity** | "Technical decision" is not defined | Ownership rates vary depending on what counts as technical | Define technical decision types explicitly in the assessment |
| **Process change under-reporting** | Team makes informal process changes that are not logged | Process ownership rate is low but team reports frequent changes | Include informal process changes in the count |
| **Override under-reporting** | EM does not track overrides or considers them "guidance" not overrides | Override rate is low but team reports frequent EM intervention | Define override explicitly: any EM decision that replaces a team decision |
| **Calibration assumption** | EM assumes capability matches decision scope without evidence | Autonomy calibration is high but team reports frequent confusion | Measure capability and decision scope independently; do not assume alignment |
| **Autonomy as abdication** | EM equates autonomy with absence of involvement | Team makes decisions but lacks context or support | Autonomy requires context and guardrails, not absence of leadership |
| **Sentiment bias** | Team reports autonomy positively because they fear EM reaction | Autonomy sentiment is high but behavioral data shows low ownership | Use behavioral data (decision log, escalations) as primary signal |

---

## References

- `docs/principles.md` — Principle 6: *Decisions at the Right Level*; Principle 7: *Grow the Team*
- `docs/engineering-playbook.md` → *Team Empowerment*, *Technical Leadership*, *Process Ownership*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `delegation_score.md` — Closely related — delegation is a prerequisite for autonomy
- `ownership_index.md` — Closely related — ownership behaviors are the outcome of autonomy
- `organizational_clarity.md` — Decision rights clarity enables autonomy
- `coaching_score.md` — Coaching develops capability for autonomous decision-making
- Pink — *Drive* (2009): Autonomy as a core motivator ( autonomy, mastery, purpose )

---

## Related Skills

| Skill | Relationship |
|---|---|
| `delegation_score.md` | Closely related — delegation is a prerequisite for autonomy |
| `ownership_index.md` | Closely related — ownership behaviors are the outcome of autonomy |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `organizational_clarity.md` | Decision rights clarity enables autonomy |
| `coaching_score.md` | Coaching develops capability for autonomous decision-making |
| `decision_quality.md` | Autonomy affects who makes decisions and how well |
| `skills/people/assess-capability.md` (planned — not yet built) | Capability assessment (input to autonomy calibration) |
| `skills/strategy/align-priorities.md` (planned — not yet built) | Priority alignment affects autonomy scope |
