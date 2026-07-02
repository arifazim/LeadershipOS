# Skill: Ownership Index

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly

---

## Purpose

Measure how much the team takes initiative versus requiring direction. Ownership is the difference between a team that executes a plan and a team that creates the plan.

This skill answers three questions:
1. Does the team solve problems before they become EM issues?
2. Does the team proactively communicate risks and opportunities, or wait to be asked?
3. Does the team manage its own dependencies, or rely on the EM to unblock?

**Invoke this skill when**: Team velocity is constrained by EM involvement, after incidents where the team waited for direction, or before a promotion conversation.

**Do not invoke this skill for**: Measuring delegation (use `delegation_score.md`), measuring autonomy in technical decisions (use `team_autonomy.md`), or measuring individual initiative (use `skills/people/assess-capability.md` (planned — not yet built)).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Incident response logs | Incident post-mortems, on-call logs | Last 10 incidents: who detected, who escalated, who resolved |
| Project initiation data | Project management tool | Last 10 projects: who initiated, who planned, who executed |
| Escalation patterns | EM log | Last 20 escalations: who escalated, what type, resolution time |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Proactive communication log | Slack / email | Instances where team raised risks or opportunities without EM prompting |
| Dependency management data | Project charters | Who identified and resolved cross-team dependencies |
| Self-directed problem solving instances | Incident log | Count of incidents resolved without EM involvement |
| Initiative proposals | Team forum / planning docs | Count of improvement ideas or project proposals from team members |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Incident Response Ownership
Review the last 10 incidents:
- **Self-resolution rate** = `(Incidents resolved without EM involvement ÷ Total incidents) × 100`

| Self-Resolution Rate | Interpretation |
|---|---|
| ≥ 80% | High. Team handles incidents independently. |
| 60–79% | Acceptable. Team resolves most incidents; EM is involved in complex cases. |
| 40–59% | At Risk. Team waits for EM to resolve incidents. |
| < 40% | Critical. Team does not take ownership of incident response. |

### Step 2 — Project Initiation Ownership
Review the last 10 projects:
- **Team-initiated rate** = `(Projects initiated by team members ÷ Total projects) × 100`

| Team-Initiated Rate | Interpretation |
|---|---|
| ≥ 60% | High. Team initiates projects proactively. |
| 40–59% | Acceptable. Team initiates some projects; EM initiates the rest. |
| 25–39% | At Risk. Team rarely initiates projects. |
| < 25% | Critical. Team is entirely reactive — EM must initiate all work. |

### Step 3 — Proactive Communication Assessment
Review proactive communication patterns:
- **Proactive communication rate** = `(Communications initiated by team without EM prompting ÷ Total relevant communications) × 100`

| Proactive Communication Rate | Interpretation |
|---|---|
| ≥ 70% | High. Team communicates proactively. |
| 50–69% | Acceptable. Team communicates when prompted; occasional proactive updates. |
| 30–49% | At Risk. Team communicates primarily when asked. |
| < 30% | Critical. Team does not communicate unless directed. |

### Step 4 — Dependency Management Assessment
Review how the team manages dependencies:
- **Team-resolved dependency rate** = `(Dependencies resolved by team without EM intervention ÷ Total dependencies) × 100`

| Team-Resolved Dependency Rate | Interpretation |
|---|---|
| ≥ 75% | High. Team manages its own dependencies. |
| 55–74% | Acceptable. Team resolves most dependencies; EM intervenes in complex cases. |
| 35–54% | At Risk. Team waits for EM to resolve dependencies. |
| < 35% | Critical. EM is the primary dependency resolver. |

### Step 5 — Synthesize Ownership Signal
Combine self-resolution, project initiation, proactive communication, and dependency management into an overall ownership assessment. Weight: Self-resolution (30%), Project initiation (25%), Proactive communication (25%), Dependency management (20%).

---

## Decision Tree

Use this tree to determine the ownership classification and primary recommendation.

```
What is the self-resolution rate?
│
├── ≥ 80% ────────────────────────────────────────────────
│   What is the team-initiated rate?
│   │
│   ├── ≥ 60% ───────────────────────────────────────────
│   │   What is the proactive communication rate?
│   │   │
│   │   ├── ≥ 70%
│   │   │   └── OUTCOME: Ownership is strong.
│   │   │         Recommendation: Sustain.
│   │   │         The team is self-directed and proactive.
│   │   │
│   │   └── < 70%
│   │       └── OUTCOME: Ownership is strong but communication is reactive.
│   │             Recommendation: Encourage proactive communication.
│   │             Reward team members who raise risks early.
│   │
│   └── 40–59% ─────────────────────────────────────────
│       └── OUTCOME: Ownership is functional with initiative gap.
│             Recommendation: Create space for team-initiated projects.
│             Reserve 10–15% of capacity for team-driven work.
│
├── 60–79% ───────────────────────────────────────────────
│   What is the dependency management rate?
│   │
│   ├── ≥ 75%
│   │   └── OUTCOME: Ownership is functional with initiative gap.
│   │             Recommendation: Team resolves incidents and dependencies
│   │             but does not initiate work. Create a "20% time" or
│   │             innovation practice to encourage initiative.
│   │
│   └── < 75%
│       └── OUTCOME: Ownership is at risk.
│             Recommendation: Team is reactive in execution and dependency
│             management. Review delegation — are decision rights unclear?
│
└── < 60% ─────────────────────────────────────────────────
    What is the primary ownership failure?
    │
    ├── INCIDENT DEPENDENCE
    │   └── OUTCOME: Ownership is broken — team waits for EM in incidents.
    │         Recommendation: Define incident response roles.
    │         Assign an incident lead for each on-call rotation.
    │         EM should be informed, not involved, in routine incidents.
    │
    ├── PROJECT REACTIVITY
    │   └── OUTCOME: Ownership is broken — team does not initiate work.
    │         Recommendation: EM to stop initiating all projects.
    │         Ask the team: "What should we work on next?"
    │         Let the team propose and plan.
    │
    ├── COMMUNICATION REACTIVITY
    │   └── OUTCOME: Ownership is broken — team communicates only when asked.
    │         Recommendation: Set expectations for proactive communication.
    │         Reward early risk communication. Do not punish bad news.
    │
    └── DEPENDENCY DEPENDENCE
        └── OUTCOME: Ownership is broken — team cannot resolve dependencies.
              Recommendation: Map current dependencies.
              Assign dependency owners. Train team on cross-team communication.
              Do not let EM be the primary resolver.
```

---

## Output

Produce the following artifacts in order.

### 1. Ownership Summary (3–5 sentences)

State: overall ownership signal (strong / functional / at risk / broken), primary strength, primary gap, and one immediate action. Include confidence level.

> **Example**: "Ownership is functional with an initiative gap. Self-resolution rate is 78% — team handles most incidents independently. Proactive communication is at 65%, and dependency management is at 72%. The primary gap is project initiation: only 30% of projects were initiated by the team. The team executes well when given work but does not propose new work. Immediate action: EM to ask each team member to propose one project or improvement idea before next planning cycle. Confidence: High (84%)."

### 2. Ownership Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Self-resolution rate | {{%}} | ≥ 80% = Green, 60–79% = Yellow, < 40% = Red | {{G/Y/R}} |
| Team-initiated rate | {{%}} | ≥ 60% = Green, 40–59% = Yellow, < 25% = Red | {{G/Y/R}} |
| Proactive communication rate | {{%}} | ≥ 70% = Green, 50–69% = Yellow, < 30% = Red | {{G/Y/R}} |
| Team-resolved dependency rate | {{%}} | ≥ 75% = Green, 55–74% = Yellow, < 35% = Red | {{G/Y/R}} |

### 3. Incident and Project Review

| Type | Count | Team-Owned | EM-Owned | Notes |
|---|---|---|---|---|
| Incidents | {{count}} | {{count}} | {{count}} | {{Pattern}} |
| Projects | {{count}} | {{count}} | {{count}} | {{Pattern}} |

### 4. Root Cause (if ownership is At Risk or Broken)

- **Primary cause**: {{Incident dependence / Project reactivity / Communication reactivity / Dependency dependence / Multiple failures}}
- **Evidence**: {{2–3 specific observations from logs}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to ownership practice}}
- **For the team** (if applicable): {{Specific invitation or expectation to set with the team}}

---

## Examples

### Example A — Strong Ownership

**Inputs**
- Incident response: 10 incidents — 9 resolved by the team without EM involvement (90% self-resolution rate)
- Project initiation: 10 projects — 7 initiated by team members (70% rate)
- Proactive communication: Team raised 14 risks or opportunities without prompting in the last quarter
- Dependency management: 12 dependencies — 11 resolved by the team (92% rate)
- Escalation patterns: 8 escalations — all were appropriate and resolved at the right level

**Output Summary**
> Ownership is strong. Self-resolution rate is 90%, team-initiated rate is 70%, proactive communication is high, and dependency management is 92%. The team is self-directed in execution and proactive in communication. The one gap is that 3 of 10 projects were still initiated by EM — this is appropriate for strategic initiatives but the team should own more tactical projects. Confidence: High (93%).

---

### Example B — Ownership Broken

**Inputs**
- Incident response: 10 incidents — 3 resolved by the team without EM involvement (30% self-resolution rate); 7 required EM to respond or resolve
- Project initiation: 10 projects — 2 initiated by team members (20% rate); EM initiated 8
- Proactive communication: Team raised 3 risks without prompting in the last quarter; most communications were in response to EM questions
- Dependency management: 12 dependencies — 3 resolved by the team (25% rate); EM resolved 9
- Escalation patterns: 22 escalations — 14 were premature (team escalated before attempting resolution)

**Output Summary**
> Ownership is broken. Self-resolution rate is 30% — the team waits for EM in incidents. Team-initiated rate is 20% — EM initiates all projects. Proactive communication is low, and dependency management is 25% — EM is the primary resolver. The primary cause is a combination of incident dependence and project reactivity: the team has been given work but not the authority or expectation to own it. Confidence: High (88%).

**Recommendations**
- *This week*: EM to define incident response roles. Assign an incident lead for each on-call rotation. EM is informed, not involved, in routine incidents.
- *This quarter*: EM to stop initiating all projects. Ask the team to propose and plan their own work. Start with one team-initiated project per sprint.
- *Systemic*: Review delegation — are decision rights unclear? If the team cannot resolve dependencies, they may not have the authority to do so.

---

## Confidence Score

The confidence score reflects how much to trust this ownership assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any ownership assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Incident and project data is tool-tracked | +5% |
| Multiple data sources corroborate the signal | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Incident data is self-reported only | −10% |
| Project initiation data is incomplete | −10% |
| No escalation log exists | −10% |

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
| **Incident attribution error** | Team resolves an incident but EM takes credit in reporting | Self-resolution rate is high but team reports EM claimed the resolution | Use team member accounts as primary incident ownership signal |
| **Project definition ambiguity** | "Project" is not defined consistently | Team-initiated rate varies depending on what counts as a project | Define project as any work with a charter or defined scope |
| **Proactive communication under-reporting** | Proactive communications are informal (Slack) and not logged | Proactive rate is low but team reports frequent informal updates | Include informal channels in proactive communication count |
| **Escalation conflation** | Team escalates for information, not resolution | Escalation count is high but most are questions, not blockers | Distinguish information requests from resolution requests |
| **Dependency resolution invisibility** | Team resolves dependencies through informal channels | Dependency management rate is low but cross-team relationships are strong | Include informal resolution channels in dependency count |
| **Ownership vs. execution confusion** | Team executes well but does not own the plan | Execution metrics are strong but team does not initiate work | Measure initiation separately from execution |

---

## References

- `docs/principles.md` — Principle 6: *Decisions at the Right Level*; Principle 7: *Grow the Team*
- `docs/engineering-playbook.md` → *Incident Response*, *Project Management*, *Team Empowerment*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `delegation_score.md` — Closely related — delegation is a prerequisite for ownership
- `team_autonomy.md` — Closely related — autonomy requires ownership behaviors
- `skills/operations/postmortem.md` — Incident ownership assessment (complementary)
- `skills/strategy/align-priorities.md` (planned — not yet built) — Project initiation and planning (complementary)
- Lencioni — *The Five Dysfunctions of a Team* (2002): Accountability as a team discipline

---

## Related Skills

| Skill | Relationship |
|---|---|
| `delegation_score.md` | Closely related — delegation is a prerequisite for ownership |
| `team_autonomy.md` | Closely related — ownership behaviors enable autonomy |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `decision_quality.md` | Ownership affects who makes decisions and how well |
| `skills/operations/postmortem.md` | Incident ownership assessment |
| `skills/strategy/align-priorities.md` (planned — not yet built) | Project initiation and planning |
| `coaching_score.md` | Coaching develops ownership capabilities |
| `organizational_clarity.md` | Clarity enables ownership behaviors |
