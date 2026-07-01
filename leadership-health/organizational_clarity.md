# Skill: Organizational Clarity

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or after role changes

---

## Purpose

Measure team and individual understanding of role, goals, and decision rights. Ambiguity in these three areas is the root cause of duplicated work, incorrect escalations, and disengagement.

This skill answers three questions:
1. Does every team member know what they own, what they are accountable for, and what decisions they can make?
2. Is ambiguity visible in day-to-day behavior — repeated questions, incorrect escalations, role confusion in incidents?
3. Where are the clarity gaps, and what is causing them?

**Invoke this skill when**: A new person joins the team, roles have changed, after an incident where confusion about authority was evident, or before a planning cycle.

**Do not invoke this skill for**: Individual role definition (use `skills/people/define-role.md`), team structure changes (use `skills/organization/design-team.md`), or sprint planning (use `skills/delivery/plan-sprint.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Role clarity survey | EM-conducted survey or 1:1 questions | % of team members who can name their 3 core accountabilities |
| Decision log | EM or team decision log | Last 20 decisions with owner, date, and outcome |
| RACI updates | Team documentation | Date of last RACI update; current RACI completeness |
| Escalation patterns | Incident log / EM tracking | Last 10 escalations: were they appropriate or premature? |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Repeated question log | Standup / Slack / 1:1 notes | Count of questions about authority or scope in the last 30 days |
| Role confusion incidents | Incident post-mortems | Instances where unclear roles caused delays or errors |
| Goal communication review | Team all-hands / planning docs | How clearly team goals were communicated in the last planning cycle |
| Decision rights documentation | Team wiki / handbook | Existence and freshness of documented decision rights |
| Onboarding completeness | New hire records | Days to role clarity for recent new hires |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Role Clarity Assessment
Survey the team: "What are your three core accountabilities this quarter?" Compare responses to the documented role definitions.

- **Clarity rate** = `(Team members with correct accountabilities ÷ Total team members) × 100`

| Clarity Rate | Interpretation |
|---|---|
| ≥ 90% | High. Role definitions are clear and communicated. |
| 75–89% | Acceptable. Minor gaps that can be addressed in 1:1s. |
| 60–74% | At Risk. Role confusion is visible in day-to-day behavior. |
| < 60% | Critical. Team does not know what they own. |

### Step 2 — Decision Rights Audit
Review the decision log and escalation patterns:

- **Decision ownership rate** = `(Decisions made by the correct owner ÷ Total decisions) × 100`
- **Appropriate escalation rate** = `(Escalations that were appropriate given the decision's scope ÷ Total escalations) × 100`

| Decision Ownership Rate | Interpretation |
|---|---|
| ≥ 85% | High. Decisions are made at the right level. |
| 70–84% | Acceptable. Occasional over-escalation or under-escalation. |
| 55–69% | At Risk. Decision rights are not understood or enforced. |
| < 55% | Critical. EM is bottlenecking decisions or team is escalating inappropriately. |

| Appropriate Escalation Rate | Interpretation |
|---|---|
| ≥ 90% | High. Team knows when to escalate. |
| 75–89% | Acceptable. Some learning needed on escalation boundaries. |
| 60–74% | At Risk. Team is unsure when to escalate. |
| < 60% | Critical. Escalation patterns are dys — either too frequent or too rare. |

### Step 3 — Goal Communication Review
Review how team goals were communicated in the last planning cycle:
- Were goals stated in terms of outcomes (what changes) or outputs (what we build)?
- Were goals specific enough to determine if they were achieved?
- Did every team member articulate the same goal when asked?

| Goal Communication Quality | Interpretation |
|---|---|
| Outcomes stated, specific, consistently understood | High |
| Outputs stated or vague outcomes, mostly understood | Acceptable |
| Goals stated but interpretation varies across team | At Risk |
| Goals not communicated or not understood | Critical |

### Step 4 — RACI Freshness
Check the RACI documentation:
- When was it last updated?
- Is it referenced by the team in decision-making?
- Does it cover the current team structure?

| RACI Status | Interpretation |
|---|---|
| Updated this quarter, actively referenced | High |
| Updated this quarter, not actively referenced | Acceptable |
| Updated > 3 months ago | At Risk |
| Does not exist or > 6 months old | Critical |

### Step 5 — Synthesize Clarity Signal
Combine the five signals into an overall organizational clarity assessment. Weight: Role clarity (30%), Decision rights (30%), Goal communication (25%), RACI freshness (15%).

---

## Decision Tree

Use this tree to determine the clarity classification and primary recommendation.

```
What is the role clarity rate?
│
├── ≥ 90% ────────────────────────────────────────────────
│   What is the decision ownership rate?
│   │
│   ├── ≥ 85% ───────────────────────────────────────────
│   │   What is the goal communication quality?
│   │   │
│   │   ├── High
│   │   │   └── OUTCOME: Organizational clarity is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Review RACI annually or after role changes.
│   │   │
│   │   └── Acceptable or lower
│   │       └── OUTCOME: Clarity is functional with goal communication gap.
│   │             Recommendation: Improve goal communication in next
│   │             planning cycle. State outcomes, not outputs.
│   │
│   └── < 85% ──────────────────────────────────────────
│       └── OUTCOME: Clarity is functional with decision rights gap.
│             Recommendation: Review decision log.
│             Are decisions being overridden by EM?
│             Clarify decision rights in team forum.
│
├── 75–89% ───────────────────────────────────────────────
│   What is the appropriate escalation rate?
│   │
│   ├── ≥ 90%
│   │   └── OUTCOME: Clarity is functional with minor role ambiguity.
│   │             Recommendation: Address gaps in 1:1s.
│   │             Update RACI if not current.
│   │
│   └── < 90%
│       └── OUTCOME: Clarity is at risk.
│             Recommendation: Run a team clarity session.
│             Map roles, decision rights, and goals on a shared board.
│
└── < 75% ─────────────────────────────────────────────────
    What is the primary clarity failure?
    │
    ├── ROLES NOT UNDERSTOOD
    │   └── OUTCOME: Clarity is broken at the role level.
    │         Recommendation: Publish role definitions.
    │         Review in team forum. Assign accountability owners.
    │
    ├── DECISION RIGHTS UNCLEAR
    │   └── OUTCOME: Clarity is broken at the decision level.
    │         Recommendation: Publish a decision rights matrix.
    │         Train team on when to decide vs. escalate.
    │
    ├── GOALS NOT COMMUNICATED
    │   └── OUTCOME: Clarity is broken at the goal level.
    │         Recommendation: Restate team goals in next all-hands.
    │         Use outcome framing. Confirm understanding in writing.
    │
    └── MULTIPLE FAILURES
        └── OUTCOME: Clarity is critically low.
              Recommendation: Full clarity reset required.
              Publish role definitions, decision rights, and goals
              in a single document. Review in team forum.
              Do not proceed with planning until clarity is restored.
```

---

## Output

Produce the following artifacts in order.

### 1. Clarity Summary (3–5 sentences)

State: overall clarity signal (strong / functional / at risk / broken), primary clarity gap, and one immediate action. Include confidence level.

> **Example**: "Organizational clarity is functional with a decision rights gap. Role clarity is at 85% — most team members know their accountabilities. However, decision ownership is at 68%: 7 of 20 decisions in the last quarter were made by the EM or escalated prematurely. Goal communication is strong. The primary gap is decision rights — the team does not know what they can decide independently. Immediate action: EM to publish a decision rights matrix and review it in the next team forum. Confidence: High (86%)."

### 2. Clarity Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Role clarity rate | {{%}} | ≥ 90% = Green, 75–89% = Yellow, < 75% = Red | {{G/Y/R}} |
| Decision ownership rate | {{%}} | ≥ 85% = Green, 70–84% = Yellow, < 70% = Red | {{G/Y/R}} |
| Appropriate escalation rate | {{%}} | ≥ 90% = Green, 75–89% = Yellow, < 60% = Red | {{G/Y/R}} |
| Goal communication quality | {{quality}} | High = Green, Acceptable = Yellow, At Risk/Critical = Red | {{G/Y/R}} |
| RACI freshness | {{status}} | Updated/active = Green, Updated/inactive = Yellow, > 3 months = Red | {{G/Y/R}} |

### 3. Root Cause (if clarity is At Risk or Broken)

- **Primary cause**: {{Role ambiguity / Decision rights unclear / Goal communication failure / Multiple failures}}
- **Evidence**: {{2–3 specific observations from decision log, escalations, or surveys}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 4. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to clarity practice}}
- **Documentation** (if applicable): {{Specific document to create or update}}

---

## Examples

### Example A — Strong Clarity

**Inputs**
- Role clarity survey: 94% — 15 of 16 team members correctly named their 3 core accountabilities
- Decision log: 22 decisions — 20 were made by the correct owner (91% ownership rate); 2 were EM overrides with explanation
- RACI updates: Updated 2 months ago; referenced in 3 of the last 4 project charters
- Escalation patterns: 8 escalations in last quarter — 7 were appropriate (88% rate); 1 was premature and corrected in next 1:1
- Repeated questions: 2 questions about scope in the last 30 days — both were from a new hire

**Output Summary**
> Organizational clarity is strong. Role clarity is at 94%, decision ownership is at 91%, and appropriate escalation rate is 88%. Goal communication was assessed as High in the last planning cycle. The RACI was updated 2 months ago and is actively referenced. The two repeated scope questions came from a new hire who is still onboarding — this is expected. Confidence: High (93%).

---

### Example B — Clarity Broken

**Inputs**
- Role clarity survey: 56% — 9 of 16 team members could not correctly name their core accountabilities
- Decision log: 18 decisions — 10 were made by the correct owner (56% ownership rate); 5 were EM decisions that should have been owned by the team; 3 were escalated to EM that should have been team decisions
- RACI updates: No RACI exists for the current team structure
- Escalation patterns: 15 escalations in last quarter — 6 were appropriate (40% rate); 9 were premature escalations to EM
- Repeated questions: 12 questions about authority or scope in the last 30 days — from 6 different team members
- Role confusion incidents: 2 incidents in post-mortems where unclear roles caused delays

**Output Summary**
> Organizational clarity is broken. Role clarity is at 56%, decision ownership is at 56%, and appropriate escalation rate is 40%. No RACI exists for the current team. Two incidents in post-mortems directly attributed delays to role confusion. The primary cause is a team restructuring 5 months ago after which role definitions, decision rights, and RACI were never updated. Confidence: High (87%).

**Recommendations**
- *This week*: EM to schedule a team clarity session to review roles, decision rights, and goals.
- *This quarter*: Publish a complete RACI for the current team structure. Reference it in all project charters.
- *Documentation*: Create a one-page "How We Decide" document that maps decision types to owners.

---

## Confidence Score

The confidence score reflects how much to trust this clarity assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any clarity assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Decision log is tool-tracked (not self-reported) | +5% |
| Multiple data sources corroborate the signal | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Role clarity survey is self-administered only (no external verification) | −10% |
| No decision log exists | −10% |
| RACI does not exist | −10% |
| Team size is < 5 (small teams may have implicit clarity) | −5% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in team communication |
| 70–89% | Medium | Use output; flag gaps to team in next forum |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for team communication; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Implicit clarity assumption** | Small team or long-tenured team assumes "everyone knows" | No documented decision rights but low escalation rates | Document explicitly — implicit clarity breaks when team changes |
| **RACI theater** | RACI exists but is not referenced or updated | RACI is outdated or not mentioned in project charters | Update RACI or retire it — a document no one uses is worse than no document |
| **Decision log under-reporting** | EM tracks decisions in memory or scattered notes | Decision ownership rate is high but team reports confusion | Require structured decision log before scoring |
| **Survey social desirability** | Team members report high clarity to be supportive | Survey results are uniformly high but escalation and question patterns show confusion | Cross-reference survey with behavioral data (escalations, questions) |
| **Role rigidity** | Role definitions are so specific they prevent adaptation | Role clarity is high but team cannot respond to new opportunities | Balance clarity with flexibility — define accountabilities, not tasks |
| **Escalation culture mismatch** | Team escalates everything or escalates nothing | Appropriate escalation rate is at an extreme | Calibrate escalation boundaries explicitly with the team |

---

## References

- `docs/principles.md` — Principle 3: *Default to Transparency*; Principle 6: *Decisions at the Right Level*
- `docs/engineering-playbook.md` → *Organizational Design*, *Role Clarity*, *Decision Rights*, *Running Effective Meetings*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `skills/organization/design-team.md` — Team structure and role definition methodology
- `skills/strategy/align-priorities.md` — Goal alignment and communication
- RACI methodology — *Responsible, Accountable, Consulted, Informed* framework for decision rights mapping

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/organization/design-team.md` | Team structure and role definition |
| `skills/strategy/align-priorities.md` | Goal alignment and communication |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `delegation_score.md` | Closely related — unclear decision rights directly limits delegation |
| `team_autonomy.md` | Closely related — autonomy requires clear boundaries |
| `decision_quality.md` | Decision rights clarity affects decision ownership and quality |
| `execution_clarity.md` | Closely related — unclear goals affect both clarity and execution |
| `communication_effectiveness.md` | Communication quality affects goal comprehension |
