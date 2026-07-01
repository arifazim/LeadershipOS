# Skill: Delegation Score

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or after team changes

---

## Purpose

Measure how well the engineering manager distributes ownership and decision-making. Delegation is the bridge between a manager's capacity and a team's potential — poor delegation creates EM bottlenecks; excellent delegation creates team velocity.

This skill answers three questions:
1. Is the EM distributing decision-making authority, or retaining it centrally?
2. Does the team have the capability and context to own their decisions?
3. Where are the delegation gaps, and what is causing them?

**Invoke this skill when**: Team velocity is constrained, EM reports being overloaded, after a team restructuring, or before a promotion conversation.

**Do not invoke this skill for**: Measuring team autonomy in execution (use `team_autonomy.md`), individual capability assessment (use `skills/people/assess-capability.md`), or workload management (use `skills/delivery/manage-capacity.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Delegation log | EM tracking | Last 20 decisions or tasks: owner, type, outcome |
| Decision ownership matrix | Team documentation | Current mapping of decision types to owners |
| Team capability assessment | EM judgment or skills framework | Capability rating for each team member (1–5) |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Decision throughput | Decision log | Count of decisions made per week by team vs. EM |
| EM bottleneck identification | Incident log / EM tracking | Instances where the EM was the blocker or delay cause |
| Team empowerment survey | EM-conducted survey or 1:1 questions | % of team members who feel they can make decisions in their area |
| Override frequency | EM tracking | Count of times EM overrode a team decision in the last quarter |
| Delegation reversal rate | Decision log | Count of decisions that were reversed by EM within 2 weeks |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Decision Distribution Audit
Review the delegation log for the last 20 decisions:
- **Team decision rate** = `(Decisions made by team members ÷ Total decisions) × 100`

| Team Decision Rate | Interpretation |
|---|---|
| ≥ 80% | High. EM is delegating effectively. |
| 65–79% | Acceptable. EM retains some decisions that may be delegable. |
| 50–64% | At Risk. EM is bottlenecking decisions. |
| < 50% | Critical. EM is the primary decision-maker for most decisions. |

### Step 2 — Capability Alignment
Compare the decision ownership matrix to the team capability assessment:
- For each decision type currently owned by the EM: does the team have the capability (rating ≥ 3) to own it?
- For each decision type owned by the team: is the team's capability sufficient for the decision's impact?

Calculate:
- **Delegation readiness** = `(Decision types where team capability ≥ required capability ÷ Total decision types) × 100`

| Delegation Readiness | Interpretation |
|---|---|
| ≥ 85% | High. Team is capable of owning its assigned decisions. |
| 70–84% | Acceptable. Minor capability gaps that can be addressed through coaching. |
| 55–69% | At Risk. Team is assigned decisions it cannot own — this is dangerous delegation. |
| < 55% | Critical. Team is not ready for its current decision load. |

### Step 3 — Override and Reversal Analysis
Review override and reversal patterns:
- **Override rate** = `(EM overrides of team decisions ÷ Total team decisions) × 100`
- **Reversal rate** = `(Decisions reversed by EM within 2 weeks ÷ Total team decisions) × 100`

| Override Rate | Interpretation |
|---|---|
| < 5% | High. EM trusts team decisions. |
| 5–15% | Acceptable. Occasional overrides are appropriate for high-stakes decisions. |
| 15–30% | At Risk. EM is second-guessing team decisions. |
| > 30% | Critical. EM is undermining team ownership. |

| Reversal Rate | Interpretation |
|---|---|
| < 5% | High. Team decisions are durable. |
| 5–10% | Acceptable. Some reversals are learning opportunities. |
| 10–20% | At Risk. Team decisions are frequently overturned. |
| > 20% | Critical. Team has no confidence that their decisions will stick. |

### Step 4 — Bottleneck Identification
Review incident and delay data for EM bottlenecks:
- How many times in the last quarter was the EM cited as the blocker or delay cause?
- How long did the team wait for EM decisions on average?

| EM Bottleneck Frequency | Interpretation |
|---|---|
| 0–1 times | High. EM is not creating bottlenecks. |
| 2–3 times | Acceptable. Occasional EM decisions are necessary. |
| 4–6 times | At Risk. EM is regularly blocking team progress. |
| > 6 times | Critical. EM is the primary throughput constraint. |

### Step 5 — Synthesize Delegation Signal
Combine decision distribution, capability alignment, override rate, reversal rate, and bottleneck frequency into an overall delegation assessment. Weight: Decision distribution (30%), Capability alignment (25%), Override rate (20%), Reversal rate (15%), Bottleneck frequency (10%).

---

## Decision Tree

Use this tree to determine the delegation classification and primary recommendation.

```
What is the team decision rate?
│
├── ≥ 80% ────────────────────────────────────────────────
│   What is the override rate?
│   │
│   ├── < 10% ───────────────────────────────────────────
│   │   What is the reversal rate?
│   │   │
│   │   ├── < 10%
│   │   │   └── OUTCOME: Delegation is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Consider expanding decision types to team.
│   │   │
│   │   └── ≥ 10%
│   │       └── OUTCOME: Delegation is strong but decisions are not durable.
│   │             Recommendation: Investigate reversal causes.
│   │             Are reversals due to incomplete information at decision time,
│   │             or EM changing mind after the fact?
│   │
│   └── ≥ 10% ──────────────────────────────────────────
│       └── OUTCOME: Delegation is functional but EM is second-guessing.
│             Recommendation: Define "non-delegable" decisions explicitly.
│             If a decision is delegable, let it stand even if imperfect.
│
├── 65–79% ───────────────────────────────────────────────
│   What is the delegation readiness?
│   │
│   ├── ≥ 85%
│   │   └── OUTCOME: Delegation is functional with capacity gap.
│   │             Recommendation: Identify the decision types EM is retaining
│   │             that the team could own. Delegate one type this quarter.
│   │
│   └── < 85%
│       └── OUTCOME: Delegation is at risk.
│             Recommendation: Do not delegate more until capability gaps
│             are addressed. Focus on coaching for the team members
│             who are not yet ready for their assigned decisions.
│
└── < 65% ─────────────────────────────────────────────────
    What is the primary delegation failure?
    │
    ├── EM IS BOTTLENECK
    │   └── OUTCOME: Delegation is broken — EM is the constraint.
    │         Recommendation: Audit every decision EM makes this week.
    │         For each: "Could the team own this?" If yes, delegate.
    │         If no, document why and build capability.
    │
    ├── DANGEROUS DELEGATION
    │   └── OUTCOME: Delegation is broken — team is overloaded.
    │         Recommendation: Reduce decision scope for the team.
    │         Retain high-stakes decisions until capability is proven.
    │
    ├── REVERSAL CULTURE
    │   └── OUTCOME: Delegation is broken — team does not trust decisions to stick.
    │         Recommendation: Publicly commit to not reversing team decisions
    │         within 2 weeks unless new information emerges.
    │         Name the reversal and explain why.
    │
    └── MULTIPLE FAILURES
        └── OUTCOME: Delegation is critically low.
              Recommendation: Full delegation reset required.
              Publish decision ownership matrix.
              Define non-delegable decisions.
              Train team on decision-making framework.
              Do not increase team scope until delegation stabilizes.
```

---

## Output

Produce the following artifacts in order.

### 1. Delegation Summary (3–5 sentences)

State: overall delegation signal (strong / functional / at risk / broken), team decision rate, primary gap, and one immediate action. Include confidence level.

> **Example**: "Delegation is functional with an override gap. Team decision rate is 72% — the team owns most decisions but EM overrides 18% of them. Delegation readiness is 88% — the team is capable. The primary gap is EM override frequency: when the team makes a decision EM disagrees with, EM overrides rather than coaching through the outcome. Immediate action: EM to define the 5 decision types that are non-delegable and share them with the team. All other decisions will stand. Confidence: High (87%)."

### 2. Delegation Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Team decision rate | {{%}} | ≥ 80% = Green, 65–79% = Yellow, < 65% = Red | {{G/Y/R}} |
| Delegation readiness | {{%}} | ≥ 85% = Green, 70–84% = Yellow, < 55% = Red | {{G/Y/R}} |
| Override rate | {{%}} | < 10% = Green, 10–15% = Yellow, > 30% = Red | {{G/Y/R}} |
| Reversal rate | {{%}} | < 10% = Green, 10–15% = Yellow, > 20% = Red | {{G/Y/R}} |
| EM bottleneck frequency | {{count}} | 0–1 = Green, 2–3 = Yellow, > 6 = Red | {{G/Y/R}} |

### 3. Decision Ownership Map

| Decision Type | Current Owner | Capability Required | Capability Available | Delegation Status |
|---|---|---|---|---|
| {{Type 1}} | {{Owner}} | {{Level}} | {{Level}} | {{Delegated / Retained / Over-delegated}} |

### 4. Root Cause (if delegation is At Risk or Broken)

- **Primary cause**: {{EM bottleneck / Dangerous delegation / Reversal culture / Multiple failures}}
- **Evidence**: {{2–3 specific observations from delegation log or incident data}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to delegation practice}}
- **Documentation** (if applicable): {{Specific document to create or update}}

---

## Examples

### Example A — Strong Delegation

**Inputs**
- Delegation log: 22 decisions — 19 made by team members (86% team decision rate)
- Decision ownership matrix: 12 decision types mapped; 10 delegated to team, 2 retained by EM (architecture direction, hiring decisions)
- Team capability assessment: 14 of 16 team members rated 3+ on their assigned decision types
- Override frequency: 1 override in the last quarter (5% rate) — EM overrode a database schema decision due to a known compliance constraint not visible to the team
- Reversal rate: 0 reversals in the last quarter
- EM bottleneck frequency: 1 instance where the team waited 2 days for a hiring decision

**Output Summary**
> Delegation is strong. Team decision rate is 86%, delegation readiness is 88%, override rate is 5%, and reversal rate is 0%. EM is not bottlenecking decisions — only 1 instance of delay in the last quarter. The one override was appropriate (compliance constraint). The team is empowered and decisions are durable. Confidence: High (93%).

---

### Example B — Delegation Broken

**Inputs**
- Delegation log: 20 decisions — 8 made by team members (40% team decision rate); 12 made by EM
- Decision ownership matrix: Does not exist — decisions are made ad-hoc
- Team capability assessment: 10 of 16 team members rated 2 or below on decision types they are currently making
- Override frequency: 7 overrides in the last quarter (35% rate of team decisions)
- Reversal rate: 4 reversals in the last quarter (20% rate of team decisions)
- EM bottleneck frequency: 9 instances where the team waited for EM decisions

**Output Summary**
> Delegation is broken. Team decision rate is 40% — EM is the primary decision-maker. No decision ownership matrix exists. Delegation readiness is 42% — 6 of 10 decision types are assigned to team members who are not capable of owning them. Override rate is 35%, and reversal rate is 20% — team decisions are frequently overturned. EM is the bottleneck in 9 instances. The primary cause is a combination of EM bottleneck and reversal culture. Confidence: High (86%).

**Recommendations**
- *This week*: EM to list every decision made in the last week and identify which could have been delegated.
- *This quarter*: Create a decision ownership matrix. Retain only architecture direction and hiring decisions. Delegate everything else.
- *Documentation*: Create a "Decision Framework" one-pager that defines escalation criteria, decision types, and reversal policy.

---

## Confidence Score

The confidence score reflects how much to trust this delegation assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any delegation assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Delegation log is tool-tracked (not self-reported) | +5% |
| Team capability assessment is based on demonstrated performance | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Delegation log is self-reported only | −10% |
| No decision ownership matrix exists | −10% |
| Team capability assessment is based on EM intuition only | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in delegation planning |
| 70–89% | Medium | Use output; flag gaps to team |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for team communication; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Delegation log under-reporting** | EM only logs "important" decisions | Log is thin but team reports EM makes most decisions | Require log of all decisions above a defined scope threshold |
| **Capability inflation** | EM overestimates team readiness | Delegation readiness is high but override rate is also high | Use override and reversal rates as primary capability signals |
| **False delegation** | EM assigns tasks but retains decision authority | Team "owns" work but must get EM approval for all decisions | Measure decision ownership, not task assignment |
| **Bottleneck invisibility** | EM does not track their own delay instances | Team reports waiting for EM but EM log shows no delays | Use team-reported wait times as primary bottleneck data |
| **Capability rigidity** | EM uses capability assessment to justify retaining decisions | Capability ratings are consistently low but team is not given growth opportunities | Capability is developed through delegation, not assessed in isolation |
| **Delegation as offloading** | EM delegates work without context or support | Team decisions are frequent but quality is poor | Delegation requires context, not just task transfer |

---

## References

- `docs/principles.md` — Principle 6: *Decisions at the Right Level*
- `docs/engineering-playbook.md` → *Managing Teams*, *Decision Rights*, *Coaching and Development*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `skills/people/assess-capability.md` — Team capability assessment methodology
- `skills/people/develop-career.md` — Coaching for capability development
- Maxwell — *The 21 Irrefutable Laws of Leadership* (2007): Law of Empowerment — only secure leaders give power to others
- Blanchard — *The One Minute Manager Meets the Monkey* (1989): Managing responsibility and avoiding bottlenecking

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/assess-capability.md` | Team capability assessment (input to this dimension) |
| `skills/people/develop-career.md` | Coaching for capability development |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `team_autonomy.md` | Closely related — delegation is a prerequisite for autonomy |
| `decision_quality.md` | Closely related — delegation affects who makes decisions and how well |
| `organizational_clarity.md` | Decision rights clarity is a prerequisite for delegation |
| `ownership_index.md` | Delegation affects team ownership behaviors |
| `coaching_score.md` | Coaching supports capability development for delegation |
