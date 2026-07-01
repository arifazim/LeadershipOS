# Skill: Team Alignment

**Domain**: Conflict Resolution
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand (when procedural or within-team conflict surfaces) + After reorgs, sprint failures, or significant scope changes

---

## Purpose

Restore shared understanding and working agreement within a team experiencing procedural, priority, or norm-based conflict — where the friction is about *how* work gets done rather than *who* is doing it. Team alignment sessions differ from mediation: they address group-level disagreement, not a bilateral conflict between two individuals.

**What the EM does automatically**: When within-team friction is detected, the EM:
1. Distinguishes team-level friction from individual conflict that happens to involve the whole team
2. Designs a structured alignment session that surfaces disagreement safely before proposing resolution
3. Produces shared working agreements, not imposed rules
4. Identifies the structural or process gap generating the friction
5. Produces: Root cause, conversation strategy, risks, desired outcome, and follow-up actions

**Ethical principle**: A team alignment session is not a reset meeting where the EM delivers the answer. If the EM already knows what the answer is and is using the session to gain buy-in, it is an announcement with extra steps — not alignment. Genuine alignment emerges from the team's own understanding of the problem. The EM's job is to design the session, not to write the outcome in advance.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Friction description** | What specific disagreements or patterns of friction are occurring |
| **Team composition** | Who is in the team; whether the conflict is within a sub-group or the full team |
| **Recent trigger** | What event or decision accelerated the friction |

### Optional
| Input | Description |
|---|---|
| **Prior alignment attempts** | Retrospectives or team meetings where this was surfaced but not resolved |
| **Process documentation** | Whether working agreements, on-call rotations, PR norms, or sprint rituals are documented |
| **Conflict diagnosis output** | Type, root cause, and severity from `skills/conflict/conflict-diagnosis.md` |

---

## Analysis

### Step 1 — Classify the Team Friction Type

```
Friction Type 1 — Norm conflict
  Definition: Team members have different implicit expectations about how work should be done
  Signal: "I assumed we always did X" vs. "No one told me we were supposed to do X"
  Examples: Code review depth, PR turnaround time, on-call response expectations,
            how incidents are escalated, how scope changes are communicated
  Resolution: Make the implicit explicit; write down the norm; agree on it as a team
  
Friction Type 2 — Priority conflict
  Definition: Team members disagree about what to work on or in what order
  Signal: "Why are we working on X when Y is more important?"
  Examples: Tech debt vs. feature work, sprint scope vs. incoming escalations,
            individual growth projects vs. team delivery commitments
  Resolution: Transparent prioritization framework; decision authority clarified;
              EM names criteria for priority decisions
  
Friction Type 3 — Role/Ownership conflict
  Definition: It's unclear who is responsible for a given type of work
  Signal: Work falls through the cracks; two people claim ownership and conflict when they overlap
  Examples: Who owns post-incident follow-up, who reviews design documents, who is on point for
            cross-team integration decisions
  Resolution: RACI for shared ownership areas; EM arbitrates where needed
  → Invoke: skills/organizational/decision-network.md for formal clarity

Friction Type 4 — Velocity/quality tradeoff conflict
  Definition: Team members disagree about acceptable tradeoffs between speed and quality
  Signal: Arguments about "cutting corners" vs. "not shipping anything"
  Examples: Merge without tests under deadline, skip code review to unblock,
            deploy without proper monitoring in place
  Resolution: Agreed-upon quality gates per scenario type; team agrees on the minimum bar
              by situation, not per-engineer preference

Friction Type 5 — Communication/process conflict
  Definition: Team disagrees about how decisions are made, shared, or documented
  Signal: "I didn't know we decided that" / "Why wasn't I consulted?"
  Examples: Decision logging, async vs. synchronous communication,
            meeting structure and who must attend
  Resolution: Communication protocol agreed upon and written down
```

### Step 2 — Design the Alignment Session

```
Alignment session structure (60–90 minutes):

Pre-session (2–3 days before):
  Send a 2–3 question survey to gather honest input before the room:
  "What's working well about how we work together?"
  "What's one thing about how we work that creates friction for you?"
  "What's one working agreement you wish we had?"
  Aggregate responses; look for patterns; bring the pattern — not the person — to the session

Phase 1 — Surface the Problem Together (15–20 min)
  EM presents the aggregated friction themes: "Here's what came up in the survey.
  I'm not attributing these to anyone — these are the themes."
  Ask the team: "Does this match your experience? What am I missing?"
  Purpose: Build a shared diagnosis of the problem before proposing solutions.
  Trap to avoid: EM presenting their own diagnosis as the team's diagnosis

Phase 2 — Understand Why It Exists (10–15 min)
  Ask: "Why do you think we have this friction?"
  "Was there a time when this worked better? What was different then?"
  "What's the structural reason this keeps coming up?"
  Purpose: Move from symptom to root cause. Teams that skip this produce agreements
  that don't address the actual issue.

Phase 3 — Generate Options (15–20 min)
  "What could we try to address this? Let's generate options before we evaluate."
  No evaluation in this phase — evaluation shuts down generation
  Write every option down
  After generation: "Which of these have the best chance of actually working?"
  Ask the team to select 1–2 options to trial; not the EM

Phase 4 — Write the Agreement (10–15 min)
  Draft the working agreement in the session, not afterward
  Agreement format: "When {{situation}}, we will {{behavior}} because {{reason}}"
  Every agreement must be specific enough to know when it's being violated
  Every agreement must have an owner or shared ownership named

Phase 5 — Trial Period + Retrospective (10 min)
  "Let's try this for {{4 weeks}} and then assess: is it working?"
  Name the retrospective date before leaving the session
  Name what "working" looks like: What signal will tell us this agreement succeeded?
  
  Without a trial period and retrospective: working agreements become forgotten documents
```

### Step 3 — Detect Whether This Is a Team Problem or a People Problem

```
Critical distinction before designing a team session:

Team problem indicators:
  ✓ Multiple people experience the same friction independently
  ✓ The friction occurs across different pairs, not just between two specific people
  ✓ New team members encounter the same friction without prior relationships
  ✓ The friction correlates with specific process boundaries or handoff points

People problem (individual conflict within team setting) indicators:
  ✗ Friction only occurs between specific individuals
  ✗ Same individuals in conflict repeatedly, others not involved
  ✗ Other team members describe the same pair as "the problem"
  ✗ The friction disappears when one person is absent

If indicators point to a people problem:
  → Do NOT run a team alignment session — it will dilute a bilateral conflict
     and create awkward dynamics for the rest of the team
  → Invoke: skills/conflict/difficult-conversations.md and skills/conflict/mediation.md instead

If both are present (bilateral conflict generating team-level friction):
  → Address the bilateral conflict privately first
  → Then run a team alignment session for the process gaps that the conflict exposed
```

### Step 4 — Follow-Up and Agreement Maintenance

```
Working agreements must be maintained, not just created:

Immediately after session:
  Send written summary of all agreements within 24 hours
  Agreements visible in team documentation (not just meeting notes)
  
Ongoing:
  Reference agreements when friction recurs: "We agreed that {{agreement}}.
  What got in the way of following it?"
  Do not assume violation is intentional — often it's forgotten or the situation was ambiguous

Trial retrospective (4 weeks):
  "Did this agreement address the friction?"
  If yes: Keep it; add it to the team norms permanently
  If partially: Refine the agreement based on what was learned
  If no: What did we learn? Either the root cause was different or the agreement missed it

When an agreement fails:
  Investigate before declaring it a will problem
  Most agreement failures are either: wrong root cause, too vague, or no visible enforcement
  Fix the agreement before attributing it to bad intent
```

---

## Decision Tree

```
What does the team friction assessment reveal?

├── FRICTION TYPE 1 (NORMS) — IMPLICIT EXPECTATIONS
│   └── Run alignment session focused on making the implicit explicit
│       Survey first: "What do you expect in each of these situations?"
│       Session output: Written norm for each contested situation
│       Most norms are obvious in retrospect — the session is about discovery, not debate

├── FRICTION TYPE 2 (PRIORITIES) — COMPETING VALUES
│   └── The EM must clarify decision authority before facilitating
│       "Who makes priority decisions when the team disagrees?"
│       If unclear: EM names it (EM decides; or named DRI decides; or team decides by X criteria)
│       Session: Produce a priority framework, not a priority list
│       Priority lists become stale; frameworks are durable

├── FRICTION TYPE 3 (OWNERSHIP) — AMBIGUOUS ACCOUNTABILITY
│   └── → Invoke: skills/organizational/decision-network.md before alignment session
│       Alignment session cannot resolve ownership ambiguity — DACI must come first
│       Once ownership is clear: alignment session addresses how that ownership is exercised

├── FRICTION TYPE 4 (QUALITY TRADEOFFS) — VALUES TENSION
│   └── Most engineering teams have implicit quality tiers; make them explicit
│       Ask: "What is the minimum bar for {{commit | PR | deploy | on-call response}}?"
│       Session: Team writes quality gates per situation type
│       EM names the non-negotiable floor: "Below this, I will not accept the tradeoff."
│       Above the floor: team decides case by case

├── PEOPLE PROBLEM DETECTED (BILATERAL, NOT TEAM-WIDE)
│   └── Do not dilute a bilateral conflict with a team session
│       Address the interpersonal conflict first
│       → Invoke: skills/conflict/mediation.md
│       Then: team session if process gaps remain

└── STRUCTURAL ROOT CAUSE (BEYOND TEAM AUTHORITY TO FIX)
    └── The team cannot align around a structure they don't control
        Surface the structural issue to the EM's manager or cross-functional leader
        Frame: "The team's friction is caused by {{structural condition}}.
        This is beyond what a working agreement can fix. Here's what I recommend."
        → Invoke: skills/organizational/decision-network.md or conflict-diagnosis.md escalation path
```

---

## Output

### Team Alignment Session Plan and Record

```
TEAM ALIGNMENT — {{Team name}} — {{date}}

THE FIVE RECOMMENDATIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ROOT CAUSE:
  Friction type: {{1–5}} | Root cause: {{Norms | Priorities | Ownership | Quality | Communication}}
  Specific cause: {{1–2 sentences naming the structural or process condition generating friction}}
  "The team is experiencing friction because {{condition}} — not because of individual behavior."

CONVERSATION STRATEGY:
  Format: {{Survey + 60-min session | 90-min session | Async + async}}
  Pre-session survey sent: {{date}} | Themes identified: {{themes}}
  Session phases: Surface → Root cause → Options → Agreement → Trial
  Session facilitator: {{EM | Rotating facilitator | External}}
  Agreements to draft: {{Topics that must produce written agreements}}

RISKS:
  If not addressed: {{Delivery impact, team health signal, escalation risk}}
  If session goes poorly: {{Most likely failure mode}}
  Team-vs-people misclassification: {{Was this verified before designing a team session?}}

DESIRED OUTCOME:
  Minimum acceptable: {{1–2 written, specific working agreements}}
  Ideal: {{Team understands root cause + owns their agreements + has a trial scheduled}}
  Not achievable through alignment: {{What requires structural or EM decision above the team}}

FOLLOW-UP ACTIONS:
  Written summary: Within 24 hours of session
  Trial period: {{N weeks}} | Retrospective date: {{date}}
  Structural fix: {{If required — what needs to change above the team level}}
  Signal of success: {{Specific observable behavior that will confirm the agreement is working}}

AGREEMENTS PRODUCED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Agreement: When {{situation}}, we will {{behavior}} because {{reason}}
Owner: {{Person or shared}} | Trial period: {{start}} to {{end}} | Retrospective: {{date}}
Agreement: {{...}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Friction type classified (1–5) | Base: 65% |
| Team vs. people problem distinction confirmed | +15% |
| Pre-session survey completed | +10% |
| All five session phases designed | +10% |
| Trial period + retrospective date confirmed | +5% |
| Team session run for bilateral conflict | −25% |
| Agreements too vague to enforce | −20% |
| No trial retrospective planned | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Alignment as announcement** | EM presents the answer; session is for buy-in | Team generates the options. EM facilitates. The agreement must be owned by the team. |
| **Agreement too vague** | "We will communicate better" | Write agreements to the "I would know if we violated this" standard. |
| **No trial retrospective** | Agreement written; never revisited; becomes a forgotten document | Name the trial date before leaving the session. Put it on the calendar. |
| **Team session for bilateral conflict** | Two-person conflict is addressed in a 10-person meeting | Address bilateral conflicts privately first. Team sessions are for team-level friction. |
| **Structural problem aligned around** | Team agrees on a workaround for a structural issue they can't fix | Escalate the structural issue. Alignment on a workaround prolongs the problem. |

---

## References

- `skills/conflict/conflict-diagnosis.md` — Entry point; confirms friction type and routes procedural/team conflict here
- `skills/conflict/mediation.md` — If bilateral conflict is detected within the team, invoke this first
- `skills/organizational/decision-network.md` — Ownership/role conflicts resolved here before alignment session
- `skills/conflict/blameless-retrospectives.md` — For post-incident team alignment; shares the discovery-before-blame structure

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/conflict/conflict-diagnosis.md` | Routes here for Type 3 (Procedural) and within-team conflicts at Level 1–2 |
| `skills/conflict/mediation.md` | Used when bilateral conflict is embedded in team friction |
| `skills/organizational/alignment-health.md` | Team Alignment dimension feeds directly into the alignment health score |
