# Skill: Execution Clarity

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or before planning cycles

---

## Purpose

Measure how clearly priorities, success criteria, and accountability are communicated. Execution clarity is the bridge between strategy and delivery — without it, even the best strategy fails in execution.

This skill answers three questions:
1. Does the team understand what they are building, why, and how success is measured?
2. Is accountability clear — does every team member know what they own and how their work contributes?
3. Where are the clarity gaps, and what is causing them?

**Invoke this skill when**: Before a planning cycle, after a delivery surprise, when team members report confusion about priorities, or before a quarterly review.

**Do not invoke this skill for**: Measuring team priority alignment (use `skills/strategy/align-priorities.md`), measuring organizational role clarity (use `organizational_clarity.md`), or measuring sprint delivery (use `skills/delivery/review-sprint.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Planning artifacts | Sprint planning docs, project charters | Last 3 planning cycles: priorities, success criteria, owners |
| Project charters | Project management tool | Last 5 project charters: scope, success criteria, stakeholders |
| Status updates | EM-written updates | Last 5 status updates: priorities, progress, blockers |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Team comprehension check | 1:1s, surveys | % of team members who can correctly restate current priorities |
| Success metric definition | Planning artifacts | % of projects with defined, measurable success criteria |
| Accountability assignment quality | Project charters | % of projects with named accountable owners |
| Scope clarity | Project charters | % of projects with clear in-scope and out-of-scope boundaries |
| Priority change frequency | Planning artifacts | Count of priority changes during execution |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Priority Communication Assessment
Review how priorities were communicated in the last 3 planning cycles:
- Were priorities stated in terms of outcomes (what changes) or outputs (what we build)?
- Were priorities specific enough to determine if they were achieved?
- Did every team member articulate the same priorities when asked?

Calculate:
- **Priority clarity rate** = `(Team members who correctly restated priorities ÷ Total team members surveyed) × 100`

| Priority Clarity Rate | Interpretation |
|---|---|
| ≥ 90% | High. Priorities are clear and consistently understood. |
| 75–89% | Acceptable. Minor gaps that can be addressed in 1:1s. |
| 60–74% | At Risk. Priorities are not consistently understood across the team. |
| < 60% | Critical. Team does not know what they are supposed to be building. |

### Step 2 — Success Criteria Assessment
Review project charters for success criteria:
- **Success criteria definition rate** = `(Projects with defined, measurable success criteria ÷ Total projects) × 100`

| Success Criteria Definition Rate | Interpretation |
|---|---|
| ≥ 85% | High. Projects have clear success criteria. |
| 70–84% | Acceptable. Most projects have success criteria; a few are vague. |
| 55–69% | At Risk. Many projects lack measurable success criteria. |
| < 55% | Critical. Projects are launched without knowing what success looks like. |

### Step 3 — Accountability Assignment Assessment
Review accountability assignments:
- **Accountability clarity rate** = `(Projects with a single named accountable owner ÷ Total projects) × 100`

| Accountability Clarity Rate | Interpretation |
|---|---|
| ≥ 90% | High. Every project has a clear owner. |
| 75–89% | Acceptable. Most projects have clear owners. |
| 60–74% | At Risk. Some projects have ambiguous ownership. |
| < 60% | Critical. Projects lack accountable owners. |

### Step 4 — Scope Clarity Assessment
Review scope definitions:
- **Scope clarity rate** = `(Projects with clear in-scope and out-of-scope boundaries ÷ Total projects) × 100`

| Scope Clarity Rate | Interpretation |
|---|---|
| ≥ 85% | High. Project boundaries are clear. |
| 70–84% | Acceptable. Most projects have clear scope. |
| 55–69% | At Risk. Scope creep is common. |
| < 55% | Critical. Scope is undefined or constantly expanding. |

### Step 5 — Priority Stability Assessment
Review priority change frequency:
- **Priority stability** = Number of times priorities changed during project execution

| Priority Changes | Interpretation |
|---|---|
| 0 changes | High. Priorities were stable. |
| 1 change | Acceptable. One adjustment is normal. |
| 2–3 changes | At Risk. Priorities shifted significantly during execution. |
| > 3 changes | Critical. Priorities were unstable; team could not execute. |

### Step 6 — Synthesize Execution Clarity Signal
Combine priority clarity, success criteria, accountability, scope clarity, and priority stability into an overall execution clarity assessment. Weight: Priority clarity (30%), Success criteria (25%), Accountability (20%), Scope clarity (15%), Priority stability (10%).

---

## Decision Tree

Use this tree to determine the execution clarity classification and primary recommendation.

```
What is the priority clarity rate?
│
├── ≥ 90% ────────────────────────────────────────────────
│   What is the success criteria definition rate?
│   │
│   ├── ≥ 85% ───────────────────────────────────────────
│   │   What is the accountability clarity rate?
│   │   │
│   │   ├── ≥ 90%
│   │   │   └── OUTCOME: Execution clarity is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Document your planning process for the team.
│   │   │
│   │   └── < 90%
│   │       └── OUTCOME: Execution clarity is strong with accountability gap.
│   │             Recommendation: Assign a single accountable owner
│   │             for every project. No project without an owner.
│   │
│   └── 70–84% ─────────────────────────────────────────
│       └── OUTCOME: Execution clarity is functional with success criteria gap.
│             Recommendation: Require measurable success criteria
│             for every project before it enters sprint planning.
│             Define "done" before starting.
│
├── 75–89% ───────────────────────────────────────────────
│   What is the primary clarity gap?
│   │
│   ├── PRIORITIES NOT UNDERSTOOD
│   │   └── OUTCOME: Execution clarity is at risk due to priority communication.
│   │             Recommendation: Restate priorities in next all-hands.
│   │             Use outcome framing. Confirm understanding in writing.
│   │
│   ├── SUCCESS CRITERIA MISSING
│   │   └── OUTCOME: Execution clarity is at risk due to missing success criteria.
│   │             Recommendation: Add success criteria to every project charter.
│   │             If you cannot measure it, do not start it.
│   │
│   └── SCOPE NOT DEFINED
│       └── OUTCOME: Execution clarity is at risk due to scope ambiguity.
│             Recommendation: Define in-scope and out-of-scope
│             for every project before planning begins.
│
└── < 75% ─────────────────────────────────────────────────
    What is the primary execution failure?
    │
    ├── PRIORITY CHAOS
    │   └── OUTCOME: Execution clarity is broken — team does not know what matters.
    │         Recommendation: Publish a single-page priority document.
    │         List the top 3 priorities for the quarter.
    │         Do not add to the list until something is removed.
    │
    ├── SUCCESS AMBIGUITY
    │   └── OUTCOME: Execution clarity is broken — team does not know when they are done.
    │         Recommendation: Define success criteria before any project starts.
    │         Use measurable outcomes. "Users can complete checkout in < 3 steps"
    │         not "checkout is better."
    │
    ├── ACCOUNTABILITY VOID
    │   └── OUTCOME: Execution clarity is broken — no one owns outcomes.
    │         Recommendation: Assign one accountable owner per project.
    │         The owner is responsible for outcome, not just execution.
    │
    └── SCOPE CREEP
        └── OUTCOME: Execution clarity is broken — scope expands during execution.
              Recommendation: Define in-scope and out-of-scope explicitly.
              Any scope change requires a change request with impact assessment.
```

---

## Output

Produce the following artifacts in order.

### 1. Execution Clarity Summary (3–5 sentences)

State: overall execution clarity signal (strong / functional / at risk / broken), primary strength, primary gap, and one immediate action. Include confidence level.

> **Example**: "Execution clarity is functional with a success criteria gap. Priority clarity is 85% — most team members can restate current priorities. Accountability clarity is 90% — most projects have named owners. Scope clarity is 78% — most projects have defined boundaries. The primary gap is success criteria: only 60% of projects have measurable success criteria. Without clear success criteria, the team cannot determine if they have achieved their goals. Immediate action: EM to add success criteria to the next 3 project charters before planning begins. Confidence: High (86%)."

### 2. Execution Clarity Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Priority clarity rate | {{%}} | ≥ 90% = Green, 75–89% = Yellow, < 60% = Red | {{G/Y/R}} |
| Success criteria definition rate | {{%}} | ≥ 85% = Green, 70–84% = Yellow, < 55% = Red | {{G/Y/R}} |
| Accountability clarity rate | {{%}} | ≥ 90% = Green, 75–89% = Yellow, < 60% = Red | {{G/Y/R}} |
| Scope clarity rate | {{%}} | ≥ 85% = Green, 70–84% = Yellow, < 55% = Red | {{G/Y/R}} |
| Priority stability | {{changes}} | 0 = Green, 1 = Yellow, 2–3 = At Risk, > 3 = Red | {{G/Y/R}} |

### 3. Project Clarity Review

| Project | Priority Clear | Success Criteria | Accountable Owner | Scope Defined | Priority Changes | Status |
|---|---|---|---|---|---|---|
| {{Project}} | {{Y/N}} | {{Y/N}} | {{Name}} | {{Y/N}} | {{Count}} | {{G/Y/R}} |

### 4. Root Cause (if execution clarity is At Risk or Broken)

- **Primary cause**: {{Priority chaos / Success ambiguity / Accountability void / Scope creep / Multiple failures}}
- **Evidence**: {{2–3 specific observations from planning artifacts or team feedback}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to execution clarity practice}}
- **Documentation** (if applicable): {{Specific document to create or update}}

---

## Examples

### Example A — Strong Execution Clarity

**Inputs**
- Planning artifacts: Last 3 planning cycles — priorities stated as outcomes, not outputs
- Priority clarity: 92% — 12 of 13 team members correctly restated current priorities
- Project charters: 8 projects — 7 have defined success criteria (88%), 7 have named owners (88%), 7 have clear scope (88%)
- Status updates: Last 5 updates — all reference priorities and progress against success criteria
- Priority changes: 0 changes during execution in the last quarter

**Output Summary**
> Execution clarity is strong. Priority clarity is 92%, success criteria definition is 88%, accountability clarity is 88%, and scope clarity is 88%. Priorities were stable with no changes during execution. The team understands what they are building, why, and how success is measured. The one project without complete clarity is an experimental initiative where success criteria were intentionally broad — this is appropriate for exploration but should be documented. Confidence: High (94%).

---

### Example B — Execution Clarity Broken

**Inputs**
- Planning artifacts: Last 3 planning cycles — priorities stated as outputs ("build X feature") not outcomes
- Priority clarity: 52% — 7 of 13 team members could not correctly restate current priorities
- Project charters: 9 projects — 4 have defined success criteria (44%), 5 have named owners (56%), 4 have clear scope (44%)
- Status updates: Last 5 updates — 2 did not reference priorities at all; 3 referenced outdated priorities
- Priority changes: 5 changes during execution in the last quarter

**Output Summary**
> Execution clarity is broken. Priority clarity is 52% — the team does not consistently understand current priorities. Success criteria definition is 44%, accountability clarity is 56%, and scope clarity is 44%. Priorities changed 5 times during execution. The primary cause is priority chaos: priorities are stated as outputs, changed frequently, and not communicated consistently. The team cannot execute when they do not know what matters or when the target keeps moving. Confidence: High (88%).

**Recommendations**
- *This week*: EM to publish a single-page priority document with the top 3 outcomes for the quarter. Send it to the entire team.
- *This quarter*: Require success criteria, accountable owner, and scope definition for every project before it enters sprint planning. No charter, no sprint.
- *Documentation*: Create a project charter template that includes: outcome statement, success criteria (measurable), accountable owner, in-scope, out-of-scope, and priority level.

---

## Confidence Score

The confidence score reflects how much to trust this execution clarity assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any execution clarity assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Planning artifacts are tool-tracked | +5% |
| Team comprehension data is available | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Planning artifacts are informal or verbal only | −10% |
| No project charters exist | −10% |
| No status updates exist | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in planning and team communication |
| 70–89% | Medium | Use output; flag gaps to team in next forum |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for planning; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Priority theater** | Priorities are published but not referenced in execution | Priority clarity is low despite published priorities | Reference priorities in every status update and planning session |
| **Success criteria theater** | Success criteria are defined but are not measurable | Success criteria exist but are vague or aspirational | Require measurable criteria: numeric, time-bound, or binary |
| **Accountability diffusion** | Multiple people are "responsible" but no one is accountable | Accountability clarity is low despite named contributors | Assign one accountable owner per project; others are contributors |
| **Scope creep normalization** | Scope changes are so frequent they are not tracked | Scope clarity is low but team reports "that's normal" | Count every scope change; high change rate is a process failure |
| **Output vs. outcome confusion** | Priorities are stated as outputs, not outcomes | Priority clarity is low despite clear task lists | State priorities as outcomes: what changes for the user or business |
| **Communication gap** | Priorities are clear in planning but not communicated to the team | Planning artifacts are clear but team comprehension is low | Communicate priorities in the same format the team consumes — not just in planning docs |

---

## References

- `docs/principles.md` — Principle 12: *Measure Outcomes*; Principle 3: *Default to Transparency*
- `docs/engineering-playbook.md` → *Planning*, *Project Management*, *Goal Setting*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
| `skills/strategy/align-priorities.md` — Internal priority alignment (complementary) |
| `stakeholder_alignment.md` — Closely related — stakeholder expectations must align with execution priorities |
| `organizational_clarity.md` — Closely related — clarity enables execution |
| `communication_effectiveness.md` — Closely related — communication quality affects priority comprehension |
| `skills/delivery/plan-sprint.md` — Sprint planning process (complementary) |
| Drucker — *The Effective Executive* (1967): Clarity of priorities as a core leadership practice |
| Rothenberg — *The New Rational Manager* (2018): Problem definition and success criteria |

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/align-priorities.md` | Internal priority alignment (complementary) |
| `stakeholder_alignment.md` | Closely related — stakeholder expectations must align with execution priorities |
| `organizational_clarity.md` | Closely related — clarity enables execution |
| `communication_effectiveness.md` | Closely related — communication quality affects priority comprehension |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `decision_quality.md` | Closely related — clear priorities enable good decisions |
| `delegation_score.md` | Closely related — clear priorities enable effective delegation |
| `skills/delivery/plan-sprint.md` | Sprint planning process (complementary) |
