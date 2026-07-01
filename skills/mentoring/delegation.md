# Skill: Delegation

**Domain**: Mentoring Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Delegation assignment at work design + Monthly delegation maturity assessment + Quarterly audit

---

## Purpose

Design delegation as a deliberate mentoring tool — not as workload distribution — so that every delegated piece of work grows the engineer's decision-making maturity, scope ownership, and independence, rather than simply reducing the EM's task list.

**What the EM does automatically**: In delegation as a mentoring practice, the EM:
1. Assesses delegation readiness (skill × will × context) before assigning, to prevent both under-delegation and failure-set delegation
2. Matches delegation level to the engineer's current maturity — one level above where they are, not two
3. Debriefs delegation outcomes as learning events, not status checks
4. Tracks delegation maturity per engineer per domain — not as a global assessment
5. Audits for delegation failures in both directions: holding capable people small, and setting up underprepared engineers to fail

**Ethical principle**: Delegation without support is not growth — it is exposure. Assigning ownership without the context, authority, and access needed to succeed is not a mentoring investment; it is a trap that damages confidence and teaches engineers that ownership is not safe to accept. The EM who over-delegates to look like a great developer carries no less accountability than the one who under-delegates and stunts growth. Both are failure modes.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Work to be delegated** | The specific task, outcome, or domain being considered for delegation |
| **Engineer's skill level** | Their demonstrated competence in the relevant domain — from `skills/mentoring/growth-tracking.md` |
| **Engineer's current delegation maturity level** | In this domain specifically — from prior delegation history |

### Optional
| Input | Description |
|---|---|
| **Will signal** | Evidence of the engineer's motivation and desire to take ownership in this area |
| **Context access** | Whether the engineer has or can be given the context needed to succeed |
| **Stakeholder relationships** | Whether key stakeholders will work with this engineer at the level the delegation requires |

---

## Analysis

### Step 1 — Apply the Delegation Maturity Model

```
Delegation maturity is domain-specific, not global.
The same engineer may be at Level 4 in backend systems and Level 2 in stakeholder communication.
Assess per domain — never transfer maturity ratings across domains.

DELEGATION MATURITY MODEL (5 Levels)

Level 1 — TASK WORKER
  Scope: Specific, scoped tasks with explicit instructions
  Decision authority: None — follows instructions exactly
  Communication: Reports completion and blockers
  EM role: Define the task completely; review before proceeding
  Appropriate for: New-to-role; first time doing this type of work; high-stakes unfamiliar domain
  Delegation language: "Do exactly this. Report when done. Flag if anything is unclear."
  Risk of staying here: Engineer never develops judgment; EM becomes a bottleneck for all decisions

Level 2 — INFORMED EXECUTOR
  Scope: Known categories of work; handles familiar patterns independently
  Decision authority: Executes known approaches; escalates novel situations
  Communication: Reports completion; surfaces blockers proactively
  EM role: Define outcomes, not steps; available for escalation
  Appropriate for: Solid experience in the domain; can identify what's standard vs. novel
  Delegation language: "Handle [type of work]. Tell me when done. If you hit something new, flag it."
  Risk of staying here: Engineer develops execution muscle but not judgment; can't grow scope

Level 3 — AUTONOMOUS EXECUTOR
  Scope: Full ownership of defined work; handles ambiguity within scope
  Decision authority: Makes decisions within scope; identifies and resolves blockers independently
  Communication: Proactively updates; flags only decisions that require authority above their level
  EM role: Aligned on goals; available; not in the decision path
  Appropriate for: Demonstrated good judgment in this domain; history of clean escalation
  Delegation language: "Own [outcome]. You decide how. Let me know how it goes; flag if you need authority."
  This is the target for most senior ICs in their primary domain

Level 4 — OUTCOME OWNER
  Scope: Defines the approach; accountable for the result
  Decision authority: Makes all decisions except those requiring explicit EM authority
  Communication: Drives the narrative; updates stakeholders independently; EM informed, not consulted
  EM role: Aligned on goals and constraints; available for support; removed from daily decisions
  Appropriate for: Consistently demonstrated at Level 3; has earned stakeholder trust
  Delegation language: "Own [objective]. Here are the constraints and who you need to align with. I trust your approach."
  The transition from L3 to L4 in their primary domain is a signal of promotion readiness

Level 5 — DOMAIN OWNER
  Scope: Sets direction for the domain; mentors others; represents engineering in cross-functional forums
  Decision authority: Owns the domain strategy; escalates only what requires explicit executive authority
  Communication: Drives organizational alignment; is the voice of the domain to leadership
  EM role: Strategic alignment; organizational sponsorship; removes systemic blockers
  Appropriate for: Operates at Staff or Principal level; domain represents significant org investment
  Delegation language: "This domain is yours. Here's the organizational context and my expectations for
                        where it should be in 12 months. What do you need from me?"
```

### Step 2 — Assess Delegation Readiness

```
Delegation readiness is a three-factor assessment. All three factors must be present
for successful delegation at the next maturity level.

FACTOR 1 — SKILL (1–5)
  Does the engineer have sufficient competence to handle the work at the intended delegation level?
  Score from skills/mentoring/growth-tracking.md for the relevant skill domain.
  Rule: Skill must be ≥3 to delegate at Level 3 or above. Skill 2 → delegate at Level 2 with close support.

FACTOR 2 — WILL (1–5)
  Does the engineer want to own this? Are they motivated by this type of work?
  1: Resistant; this is not where they want to invest energy
  3: Neutral; will execute if assigned but not intrinsically motivated
  5: Actively wants ownership; sees this as a growth opportunity
  Rule: Will must be ≥3 to delegate above Level 2. Delegating to a will=1 engineer is assigning burdens.
  Check: "Have you asked them if they want this?" is a required step before Level 3+ delegation.

FACTOR 3 — CONTEXT (1–5)
  Does the engineer have or can they be given the information, relationships, and authority
  needed to succeed at the intended delegation level?
  Context includes:
    — History: why decisions were made this way
    — Stakeholder relationships: who they need to influence
    — Authority: can they actually make the decisions the delegation requires?
    — Access: do they have the data, tools, and forums needed?
  Rule: Context must be ≥3 for Level 3 delegation. Without context, engineers fail at tasks
  they have both skill and will for — because they couldn't navigate the system.

Delegation readiness score = Skill + Will + Context (3–15)
  12–15: Ready for current level + 1
  9–11: Ready for current level; build toward next
  6–8: Ready for current level with support; not ready for level+1 yet
  3–5: Not ready for this delegation; identify lowest blocking factor and address it

The EM's job before Level 3+ delegation:
  — Have the explicit conversation: "I want to give you [ownership]. Are you interested?"
  — Transfer the context: 30–60 minute knowledge transfer session, not just a handoff document
  — Introduce to stakeholders: "This is [name]. They own [work] now. I trust their judgment."
  — Grant authority: Ensure they can actually make the decisions their role requires
```

### Step 3 — Run the Delegation Debrief (Not a Status Check)

```
The delegation debrief is where the mentoring value is extracted.
Without a debrief, delegation is task assignment. With it, delegation is growth.

Delegation debrief structure (30–45 minutes after significant delegated work):

PART 1 — WHAT HAPPENED (10 min)
  "Walk me through what you decided, and why."
  EM listens without interrupting. The goal is to understand the person's reasoning —
  not to evaluate whether the decision was the same one the EM would have made.

PART 2 — THE DECISION POINTS (10 min)
  Identify 2–3 specific moments where the person had to choose.
  "When [situation], what were your options? What made you choose [X]?"
  EM surfaces the decision logic — sometimes the engineer made the right call for the wrong reason,
  or the wrong call with good reasoning that can be built on.

PART 3 — WHAT THEY LEARNED (10 min)
  "What would you do differently?"
  "What didn't you know going in that you know now?"
  "What would help you handle this type of situation better next time?"
  The most productive debrief is when the engineer surfaces the learning themselves.
  The EM's job is to ask; the engineer's job is to reflect.

PART 4 — WHAT THE EM OBSERVED (10 min)
  Share one specific strength: "The way you handled [situation] showed [quality].
  Specifically: [what they did] produced [outcome]."
  Share one specific development point: "I noticed [decision]. What I would have done differently
  is [approach]. The reason is [principle]. Does that change how you think about it?"
  
  Rules for EM observation:
  — Strength first, always
  — One development point per debrief — not a list
  — Offer the alternative, then ask if it changes their thinking — don't just correct

PART 5 — NEXT LEVEL READINESS (5 min)
  "Based on how you handled [work], I think you're ready to take on [next level] of this.
  Here's what that would look like. Are you interested?"
  If not ready: "Here's what I'd want to see in the next delegation before I'd give you more scope."
  Explicit and specific — not "keep doing what you're doing."
```

### Step 4 — Monitor and Score Delegation Maturity

```
Delegation maturity is tracked per engineer per domain, monthly.

Delegation maturity scoring (per domain):

  Score the engineer's current maturity level (1–5) based on:
  — What delegation level do they consistently demonstrate in this domain?
  — Have they made at least 3 decisions at the current level without requiring escalation?
  — Are they proactively communicating and updating rather than waiting to be asked?

Delegation maturity tracker:
  Engineer: {{Name}}
  Domain: {{Backend systems / Stakeholder communication / Architecture / etc.}}
  Current maturity level: {{1–5}}
  Evidence: {{3 specific instances of behavior at this level in the last 60 days}}
  Next level conditions: {{What specific behavior demonstrates readiness for Level N+1?}}

Audit triggers (quarterly):
  Under-delegation flag: Engineer at Level 3+ but EM is still making decisions in their domain
    Risk: Engineer is capable but not growing; EM is a bottleneck; high flight risk
    Fix: Identify 2–3 decisions the EM made in the last month that the engineer could have made
    Action: Transfer those decisions explicitly in the next 30 days

  Over-delegation flag: Engineer operating above their readiness level; errors or escalations frequent
    Risk: Engineer is failing at tasks they weren't prepared for; confidence damage
    Fix: Step back to current maturity level; rebuild support structure; add context
    Action: Debrief what went wrong without blame; rebuild readiness before re-delegating

  Maturity plateau: Same maturity level for 3+ months despite active coaching
    Investigate: Is the current role providing sufficient delegation opportunity?
    Fix: Design a specific stretch assignment at Level+1 with scaffolding (not exposure)
    Escalate if stuck: is this a skill gap, a will gap, or a context gap?

Over-delegation detection (the most damaging failure mode for engineers):
  Signal 1: Engineer escalates frequently for decisions within their stated scope
  Signal 2: Engineer's errors are in areas where they lacked context they should have had
  Signal 3: Engineer's confidence is visibly lower after the delegation than before
  Signal 4: "They should have been able to handle this" — but were they given what they needed?
```

---

## Decision Tree

```
What does the delegation maturity assessment reveal?

├── DELEGATION READINESS <9 (Skill + Will + Context)
│   └── Identify the lowest factor:
│       Low skill: Growth plan (skills/people/growth-plans.md) + deliberate practice at current level
│       Low will: Motivation conversation (skills/people/motivation.md) — don't force delegation
│       Low context: Context transfer session before delegation, not after
│       Do not delegate to Level+1 until all three factors ≥3

├── ENGINEER AT LEVEL 3+ BUT EM STILL IN DECISION PATH
│   └── Under-delegation audit: list decisions made by EM in last 30 days in engineer's domain
│       Transfer 2–3 decisions explicitly
│       "This is yours now. I don't need to be in this decision path anymore."
│       Monitor: Is the engineer being asked by others? Do they know they have the authority?

├── ENGINEER FAILING AT DELEGATED WORK (over-delegation)
│   └── Do not extend scope; step back to previous level
│       Identify root cause: Skill gap / Context gap / Stakeholder resistance / Authority gap
│       Debrief without blame: "What did you need that you didn't have?"
│       Rebuild missing element before re-delegating at same level

├── DEBRIEF NOT HAPPENING AFTER SIGNIFICANT DELEGATED WORK
│   └── This is the most common delegation failure — delegation without learning
│       Schedule debrief within 1 week of work completion
│       No debrief = task assignment, not mentoring investment

├── DELEGATION MATURITY PLATEAU (same level 3+ months)
│   └── Investigate: is there sufficient delegation opportunity in current role?
│       If not: design specific stretch assignment with scaffolding
│       If skill gap: address via growth plan before re-designing delegation level
│       If will gap: motivation conversation — forced delegation at will=1 is harmful

├── ENGINEER READY FOR LEVEL+1 (3 instances at current level, no escalation needed)
│   └── Explicit readiness conversation:
│       "Based on how you handled [work], you're ready for [Level+1] in this domain."
│       "Here's what that means: [specific scope change]."
│       "Are you ready for that?"
│       Don't advance silently — the engineer needs to know they've been promoted in responsibility

└── MATURITY LEVEL 4→5 TRANSITION
    └── This is a significant career transition — requires organizational change, not just task change
        Stakeholder introduction: the engineer must be visible to the calibration group
        Connect to: skills/performance/promotion-readiness.md for the formal promotion case
        Connect to: skills/mentoring/technical-leadership.md for the leadership dimension
```

---

## Output

### Delegation Maturity Tracker

```
DELEGATION MATURITY — {{Name}} — {{Date}}

DOMAIN MATURITY SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Domain               | Current Level | Evidence (3 instances)                         | Next level condition
{{Backend systems}}  | {{1–5}}       | {{instance 1}} / {{instance 2}} / {{instance 3}} | {{specific behavior}}
{{Stakeholder comm}} | {{1–5}}       | {{...}}                                         | {{...}}
{{Architecture}}     | {{1–5}}       | {{...}}                                         | {{...}}

DELEGATION READINESS (for next assignment)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Work to delegate: {{specific work or outcome}}
Target delegation level: {{1–5}}
Skill: {{1–5}} | Will: {{1–5}} | Context: {{1–5}} | Total: {{3–15}}
Readiness: {{Ready for L+1 / Ready for current / Build first / Not ready}}
Blocking factor if <9: {{Skill / Will / Context — specific gap}}
Context transfer planned: {{Y/N}} | Date: {{date}}

DELEGATION AUDIT (Quarterly)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Under-delegation flag: {{Y/N}} | Decisions transferred this quarter: {{N}}
Over-delegation flag: {{Y/N}} | Recovery action: {{specific}}
Maturity plateau: {{Y/N}} | Intervention: {{stretch assignment / growth plan / motivation conversation}}

DEBRIEF RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Date     | Work delegated | Level | Key decision observed | Learning surfaced | Next level signal
{{date}} | {{work}}       | {{N}} | {{decision}}          | {{learning}}      | {{Y/N}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Delegation maturity assessed per domain (not globally) | Base: 60% |
| Delegation readiness (skill × will × context) checked before Level 3+ assignments | +15% |
| Debrief conducted within 1 week of significant delegated work | +15% |
| Under-delegation and over-delegation audited quarterly | +10% |
| Maturity scores supported by 3 specific behavioral instances | +5% |
| Delegation assigned without readiness assessment | −25% |
| No debrief after delegation (task assignment, not mentoring) | −20% |
| Over-delegation without scaffolding; engineer set up to fail | −30% |
| Maturity assessed globally rather than per domain | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Delegation as dumping** | Engineer receives ownership without context, authority, or support | Delegation readiness check before assigning. Context transfer session before handoff. |
| **Debrief-free delegation** | Work is assigned and completed; no structured learning conversation happens | Schedule debrief within 1 week of completion. No debrief = task assignment, not mentoring. |
| **Under-delegation** | EM makes decisions in the engineer's domain; engineer never develops judgment | Quarterly audit: list every decision made that the engineer could have made. Transfer them. |
| **Over-delegation** | Engineer placed at Level 3 with Level 1 readiness; fails publicly; loses confidence | Step back to current maturity level; rebuild context and skill before re-delegating. |
| **Global maturity label** | "They're ready to own things" — applied across all domains | Delegation maturity is domain-specific. Assess separately. |

---

## References

- `skills/mentoring/growth-tracking.md` — Skill scores (Factor 1) sourced from growth tracking
- `skills/mentoring/mentor-plan.md` — Delegation assignments connect to mentoring goals
- `skills/mentoring/technical-leadership.md` — Level 4→5 maturity connects to technical leadership growth
- `skills/people/motivation.md` — Will assessment (Factor 2) draws from motivation profile
- `skills/performance/promotion-readiness.md` — Level 4 maturity in primary domain is a promotion readiness signal
- `skills/people/growth-plans.md` — Delegation assignments are the 70% experience component of growth plans

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/mentoring/growth-tracking.md` | Skill readiness (Factor 1) sourced from growth tracking; delegation outcomes feed skill progression |
| `skills/people/motivation.md` | Will assessment (Factor 2) draws from motivation profile |
| `skills/mentoring/technical-leadership.md` | Level 4–5 maturity growth is technical leadership development |
| `skills/performance/promotion-readiness.md` | Level 4 in primary domain is evidence for promotion readiness Scope dimension |
| `skills/people/growth-plans.md` | Delegation is the primary vehicle for the 70% experience component |
