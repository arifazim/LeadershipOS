# Skill: Retrospective

**Domain**: Meeting Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Sprint retrospective (biweekly) + Quarterly team retrospective + Ad hoc after significant events

---

## Purpose

Facilitate retrospectives that produce specific, owner-assigned changes to how the team works — not a venting session, not a praise ritual, and not a list of action items that are never reviewed. The retrospective earns its time only when the team's next sprint or quarter is concretely different because of it.

**What the EM does automatically**: In retrospectives, the EM:
1. Selects the format based on the team's maturity, the emotional context, and what the team needs to surface this cycle
2. Creates genuine psychological safety before the session — not by declaring it, but by modeling vulnerability and demonstrating that raising real problems produces real change
3. Facilitates the retrospective to produce 3–5 specific action items with named owners and due dates
4. Audits the prior retrospective's action items before adding new ones — a team that generates actions faster than it completes them is building retrospective debt
5. Runs a "retrospective retrospective" quarterly: is this process actually changing anything?

**Ethical principle**: A retrospective that produces the same complaints and the same action items every sprint is not a retrospective — it is a recurring complaint session with administrative overhead. The team's tolerance for retrospectives that produce no change is finite; once exhausted, they will participate in body only. The EM who runs retrospectives without measuring whether they produce change has substituted the ritual for the outcome.

*Note: This skill covers sprint, team, and quarterly retrospectives. Post-incident blameless retrospectives are covered in `skills/conflict/blameless-retrospectives.md`.*

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Prior retrospective's action items** | Status of what was committed to last cycle — must be reviewed before new actions are added |
| **Sprint or period being reviewed** | The specific work period; its goals and outcomes |
| **Team's current state** | Energy level, recent events (launches, incidents, changes), and known tensions |

### Optional
| Input | Description |
|---|---|
| **Sprint metrics** | Velocity, cycle time, defect rate, deployment frequency for the period |
| **Engagement signals** | From `skills/people/engagement.md` — topics the EM has noticed but the team hasn't raised |
| **Known tensions** | From 1:1s — topics team members have raised privately that haven't surfaced in the group |

---

## Analysis

### Step 1 — Audit Prior Retrospective Actions Before the Session

```
Opening a retrospective without reviewing prior action items sends a clear signal:
the actions from last session don't matter. The team will stop generating them.

PRE-SESSION AUDIT (EM completes 24 hours before the retro)

For each action item from the prior retrospective:
  COMPLETE: Acknowledge at the opening. "We said we'd [action]. [Name] did [outcome]. Thank you."
  IN PROGRESS: "Still in progress — [Name] is working on [action]. On track."
  BLOCKED: "This was blocked by [specific reason]. Here's how we're addressing it."
  NOT STARTED: "We didn't start [action]. I want to understand why before we add new ones today."
  CANCELLED: "We agreed to cancel [action] because [specific reason]. That was the right call."

Action item audit signals:
  Most items complete: healthy accountability; team can take on more
  Most items not started: team is generating more actions than capacity allows; reduce new items
  Same items recurring: the action items are wrong — the intervention isn't addressing the root cause
  No prior actions (first retro): establish the read-back practice from the start

The "not started" conversation:
  "We committed to [action] and didn't start it. Three possibilities: we didn't have capacity,
  the action wasn't specific enough to act on, or we didn't actually believe it was the right thing.
  Which is it?"
  Do not move on without this conversation. Adding new items without understanding why prior items
  were dropped creates a false sense of progress.

ACTION ITEM DEBT:
  If the team has more than 5 open action items across the last 2 retrospectives:
  This sprint: add no new action items; focus on completing existing ones
  Alternatively: triage the existing list; cancel items that are no longer relevant; proceed
  with at most 3 new items
```

### Step 2 — Select the Retrospective Format

```
Format selection is based on: team maturity, the emotional state of the team,
and what type of signal the EM needs to surface this cycle.

FORMAT 1 — START / STOP / CONTINUE
  Best for: Teams new to retrospectives; sprint retrospectives when a direct structure helps
  Structure:
    START: What should we begin doing that we aren't doing now?
    STOP: What should we stop doing that is wasting time or causing harm?
    CONTINUE: What is working well that we should protect?
  Time: 60 minutes
  Facilitation: Silent generation (5 min) → post (5 min) → group (20 min) → actions (25 min) → close (5 min)
  Advantage: Simple; clear categories; easy to generate actions from STOP items
  Risk: CONTINUE becomes a praise section that takes too long; START/STOP get most of the value

FORMAT 2 — 4Ls (Liked / Learned / Lacked / Longed For)
  Best for: Sprint retrospectives that feel repetitive; teams that need a different angle on the same work
  Structure:
    LIKED: What went well?
    LEARNED: What did we discover or understand better?
    LACKED: What was missing that we needed?
    LONGED FOR: What would have made this period significantly better if we'd had it?
  Time: 60 minutes
  Facilitation: Same as Start/Stop/Continue
  Advantage: LONGED FOR surfaces aspirational improvements that other formats miss
  Risk: LIKED and LEARNED overlap; moderate the distinction

FORMAT 3 — FLAP (Future / Lessons / Accomplishments / Problems)
  Best for: Quarterly team retrospectives; longer-horizon reflection
  Structure:
    FUTURE: What opportunities or challenges do we see ahead?
    LESSONS: What did we learn this quarter that changes how we work?
    ACCOMPLISHMENTS: What are we proud of from this quarter?
    PROBLEMS: What problems persisted this quarter that we haven't solved?
  Time: 90 minutes
  Advantage: Accomplishments creates genuine recognition before critique; Future forces forward focus
  Risk: Longer format loses energy if facilitation is weak; action items from PROBLEMS must be specific

FORMAT 4 — SAILBOAT (Wind / Anchors / Rocks / Sun)
  Best for: Teams with morale issues; when the team needs a visual metaphor to discuss what's holding them back
  Structure:
    WIND: What's pushing us forward? (strengths and momentum)
    ANCHORS: What's slowing us down? (blockers and friction)
    ROCKS: What risks are ahead? (things we might hit)
    SUN: What's our goal? (what are we sailing toward?)
  Time: 60–75 minutes
  Advantage: Visually engaging; distinguishes current problems (anchors) from future risks (rocks)
  Risk: Metaphor engagement varies by team; some engineers find it less compelling than direct formats

FORMAT 5 — LEAN COFFEE (Team-Generated Agenda)
  Best for: Teams with high psychological safety; when the EM doesn't want to constrain the agenda
  Structure:
    Individual topic generation: 5 minutes; each person writes topics they want to discuss
    Dot voting: each person allocates 3 votes to topics; top topics discussed first
    Time-boxed discussions: 5 minutes per topic; extend by vote if needed; capture action items as you go
  Time: 60 minutes
  Advantage: Team owns the agenda entirely; highest engagement for self-directed teams
  Risk: Without facilitation, topics become vent sessions; EM must ensure action items at each topic close

FORMAT SELECTION GUIDE:
  New team or first retro: Start/Stop/Continue
  Sprint retro, team is repeating itself: 4Ls or Sailboat (change the angle)
  Quarterly retro: FLAP
  Team has morale issues: Sailboat (name the anchors explicitly)
  Team has high safety and owns their process: Lean Coffee
  Last retro produced no change: any format + explicit action item audit at opening
```

### Step 3 — Facilitate the Session

```
FACILITATION STRUCTURE (applies to all formats; adjust section names per format)

OPEN (5 minutes)
  Prime directive: "Regardless of what we discover today, we understand and truly believe that
  everyone did the best job they could, given what they knew at the time, their skills and abilities,
  the resources available, and the situation at hand."
  Prior action items: acknowledge completions; name non-starts and investigate
  "Today's goal: leave with 3–5 specific actions that will make next sprint different."

GENERATE (5–10 minutes, silent)
  Each person writes their items individually, silently
  Why silent: prevents anchoring; ensures all voices are represented, not just the loudest
  Tool: sticky notes (in-person), virtual board (Miro/FigJam/Retrium), or shared doc
  EM writes too — models participation; demonstrates they are part of the team's challenges

GROUP (5–10 minutes)
  Items posted; similar items grouped into themes
  EM or facilitator names the themes: "I see a cluster around [theme]. Correct?"
  Do not interpret items; let authors speak for themselves

DISCUSS (25–30 minutes)
  Priority items discussed first (by dot vote, or EM judgment if no vote)
  For each theme: "What's the specific problem underneath this? What would different look like?"
  EM's job: surface root causes, not surface-level fixes
  "We keep saying [symptom]. What's underneath it? What would have to change for this not to happen?"
  Time discipline: 7–8 minutes per theme; parking lot for overflow

GENERATE ACTIONS (15 minutes)
  For each discussion theme: "What's the one specific thing we commit to changing?"
  Quality test for each action item:
    Named owner (not "we" or "the team")
    Specific enough that two observers agree on whether it was done
    A date by which the change will be visible
    Connected to the root cause, not just the symptom
  Strong action: "{{Name}} will set up a shared deployment checklist in Confluence by {{date}}.
                   We'll use it from Sprint N+1 onward."
  Weak action: "We'll communicate better about deployments."

CLOSE (5 minutes)
  Read back all action items: owner / action / date
  "Anything we didn't get to that someone still wants to raise?" (park; schedule)
  "Next retrospective is {{date}}. We'll open by reviewing these action items."

PSYCHOLOGICAL SAFETY FACILITATION:
  Model vulnerability first: "I want to share something I think I got wrong this sprint: [specific]."
  Name quiet contributors: "I'd like to hear from [Name] — what's your experience been?"
  Do not defend when criticism is raised: receive it; ask clarifying questions; do not explain
  "I'm going to resist the urge to explain that — what you're describing is real. What would help?"
```

### Step 4 — Detect What the Team Won't Say in the Group

```
The most important retrospective feedback often doesn't surface in the group session.
Teams self-censor when the topic involves someone in the room (including the EM),
when they don't believe the retrospective produces change, or when they've been
burned by raising something vulnerable.

SIGNALS THAT THE REAL PROBLEMS AREN'T SURFACING

Signal 1 — Same issues raised in 1:1s but not in the retro
  What it means: Group safety is insufficient for this topic
  EM action: Consider anonymous input pre-retro (survey tool; specific questions)
  Frame: "Before the retro, I want to gather some input anonymously. Here's the form."
  Use the anonymous input to seed the discussion without identifying sources.

Signal 2 — Retro generates only process-level improvements; no people or relationship items
  What it means: Team does not feel safe naming interpersonal dynamics
  EM action: Consider bilateral conversations; skills/conflict/difficult-conversations.md
  Frame in retro: "Are there any relationship or communication patterns that are affecting the team?
  These can be shared anonymously through the form before our next session."

Signal 3 — Items raised are immediately dismissed or minimized by other team members
  What it means: Psychological safety is low; the person who raised it won't raise it again
  EM action: "I want to make sure we give that a full hearing. [Person], can you say more?"
  After: Address the minimization directly in the session: "I noticed that observation was
  quickly moved past. I don't want us to move on without understanding it."

Signal 4 — EM's actions or decisions are never raised as a problem
  What it means: Team does not feel safe giving the EM feedback in the group setting
  EM action: Explicitly invite it: "I want to make sure we're including feedback about how
  I'm managing this team. What could I do differently?"
  If still nothing: individual conversations; feedback from trusted team member; self-assessment

RETROSPECTIVE RETROSPECTIVE (quarterly):
  "Is this retrospective process actually changing how we work?"
  Evidence: Are action item completion rates above 80%? Are the same issues recurring?
  Is the team's sentiment about the retro positive, neutral, or dread?
  If the retro isn't working: change the format, the cadence, or who facilitates
  Consider: external facilitator for a quarter; removes the EM from the power dynamic
```

---

## Decision Tree

```
What does the retrospective assessment reveal?

├── PRIOR ACTION ITEMS NOT STARTED (most items from last retro incomplete)
│   └── Do not add new action items today
│       Investigate: capacity problem / wrong action items / no accountability system?
│       Cap new items at 2; focus on root cause of the non-completion before generating more

├── SAME ISSUES RAISED EVERY RETROSPECTIVE
│   └── The action items are treating symptoms, not root causes
│       "We've raised [issue] in the last 3 retros. The actions haven't solved it. What are we missing?"
│       Apply root cause analysis: "Why does this keep happening?" → 3 levels deep
│       Generate an action item that addresses the underlying system, not the surface symptom

├── RETRO GENERATES NO REAL PROBLEMS (all positives; no friction surfaced)
│   └── Psychological safety is insufficient
│       EM shares a real problem they experienced first
│       Check: Are team members raising these issues in 1:1s instead? (Yes → safety gap)
│       Intervention: Anonymous pre-retro input; Lean Coffee format; external facilitator

├── ACTION ITEMS LACK OWNERS OR DATES
│   └── Reject the action item as stated: "Who specifically? By when specifically?"
│       Do not close the retro with anonymous or date-free items
│       Better: one strong action item than four weak ones

├── EM'S ACTIONS NOT RAISED AS A PROBLEM
│   └── Explicitly invite: "I want to make sure we're covering feedback about how I'm managing.
│       What should I do differently?"
│       If still nothing: individual conversations with most trusted team members before next retro
│       Pattern across 3 retros: consider skip-level feedback mechanism

├── TEAM MORALE IS LOW (energy, cynicism, disengagement visible)
│   └── Sailboat format: name the anchors explicitly
│       "What is weighing on us right now?" before any sprint-specific retrospection
│       skills/people/burnout.md and skills/people/engagement.md — assess before and after

├── RETROSPECTIVE RETROSPECTIVE REVEALS NO CHANGE PRODUCED
│   └── The retro is not earning its time
│       Change something: format / facilitator / cadence / scope
│       Suspend the retro for one sprint; assess whether team notices or is relieved
│       Resume with a redesign; the ritual without the value is worse than nothing

└── RETRO IS PRODUCTIVE AND PRODUCING CHANGE
    → Maintain; monthly format check-in; quarterly retrospective retrospective
    → Gradually transfer facilitation to team members; EM stepping out of the facilitator
      role is a sign of team maturity; not a sign of disengagement
```

---

## Output

### Retrospective Brief and Action Item Record

```
RETROSPECTIVE BRIEF — {{Team}} — {{Sprint/Period}} — {{Date}} — {{Duration}}

PRIOR ACTION ITEM AUDIT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Action          | Owner    | Status      | Note
{{action}}      | {{Name}} | Complete    | {{outcome}}
{{action}}      | {{Name}} | In Progress | {{update}}
{{action}}      | {{Name}} | Not Started | {{investigation: capacity / wrong action / no accountability}}
Debt level: {{Low (<3 open) / Medium (3–5 open) / High (5+ open — do not add new items)}}

FORMAT SELECTED: {{Start/Stop/Continue / 4Ls / FLAP / Sailboat / Lean Coffee}}
Rationale: {{Why this format for this sprint and team state}}

AGENDA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Open (5 min): Prime directive; prior action audit; today's goal
Generate (7 min): Silent individual item generation
Group (7 min): Post and cluster
Discuss (25 min): Top 3–4 themes; root cause questions
Actions (12 min): 3–5 specific items; owner + action + date
Close (5 min): Read-back; confirm next retro date

TALKING POINTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Open: "The goal today is 3–5 specific changes to how we work. Not discussion — changes."
Prior audit: "Last sprint we committed to [items]. [N] are done. [N] are not. Let's understand why."
EM vulnerability: "Something I think I got wrong this sprint: {{specific EM behavior or decision}}."
Root cause prompt: "We've raised [issue] before. What's underneath it? What would have to be different?"
Safety prompt: "Are there issues we haven't raised yet that are weighing on anyone?"

RISKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Risk 1: {{Same issues recurring — root cause question prepared}}
Risk 2: {{Low psychological safety — anonymous input gathered pre-retro: Y/N}}
Risk 3: {{Team morale context — burnout signal: Y/N; adjust format accordingly}}
Risk 4: {{High action item debt — cap new items at 2 this session}}

DECISIONS NEEDED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Process decisions to be made in this session: {{e.g., change sprint length / change review process / adjust ceremony}}

FOLLOW-UP ACTIONS (produced in the session)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Action 1: {{Owner}} will {{specific, observable action}} by {{date}}
Action 2: {{Owner}} will {{specific, observable action}} by {{date}}
Action 3: {{Owner}} will {{specific, observable action}} by {{date}}
[Maximum 5; minimum 3]

ACTION ITEM QUALITY CHECK (before closing)
  Each action: Named owner (Y/N) / Specific outcome (Y/N) / Due date (Y/N) / Root cause connected (Y/N)
  Reject and rewrite any item that fails two or more checks.

RETROSPECTIVE RETROSPECTIVE (quarterly)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Action item completion rate (last 3 retros): {{%}}
Recurring themes not yet resolved: {{list}}
Team sentiment toward retro: {{Positive / Neutral / Dread}}
Format producing change: {{Y / N — change: [what changes]}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Prior action items audited before adding new ones | Base: 65% |
| Format selected based on team state and context | +10% |
| Psychological safety modeled by EM vulnerability first | +10% |
| Actions produced with named owner + specific action + due date | +15% |
| Action item quality check before closing | +5% |
| Retrospective retrospective run quarterly | +5% |
| Prior actions not reviewed; new actions generated on top of incomplete ones | −30% |
| Same format every retrospective regardless of team state | −10% |
| Actions assigned to "the team" or without due dates | −30% |
| EM defends when criticism is raised; team stops raising it | −20% |
| Retro generates only positives; no friction surfaced | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Retrospective debt** | Team generates 5 action items per sprint; completes 1; backlog grows | Audit prior items first. Cap new items at 2 if debt is high. Complete before generating. |
| **Recurring complaints** | Same issues raised in every retro; action items don't address root cause | "We've raised this 3 times. What's underneath it?" Root cause question produces different actions. |
| **Praise ritual** | Retro is 50 minutes of "what went well"; 5 minutes of weak actions | Restructure: generate items across all categories simultaneously; protect time for problems. |
| **Psychological safety deficit** | Real issues surface in 1:1s but not in the group | Anonymous pre-retro input; EM models vulnerability first; external facilitator quarterly. |
| **Weak action items** | "We'll communicate better" / "The team will try to improve X" | Three-field formula: owner + specific action + date. Reject weak items in the session. |

---

## References

- `skills/meetings/meeting-planner.md` — Retrospective is a Type 5 meeting; format drives the planning
- `skills/meetings/agenda-builder.md` — Session structure follows agenda-builder with retro-specific sections
- `skills/meetings/action-items.md` — Retrospective actions are tracked in the action item system; completion reviewed at next retro
- `skills/conflict/blameless-retrospectives.md` — Post-incident retrospectives are a distinct format; covers blame-free incident analysis
- `skills/people/engagement.md` — Low engagement signals inform what needs to be surfaced in the retro

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/meetings/action-items.md` | Retrospective actions are the highest-priority items in the action tracker; completion reviewed every retro |
| `skills/conflict/blameless-retrospectives.md` | Post-incident retros are a distinct, specialized format — not interchangeable with team retros |
| `skills/people/engagement.md` | Engagement signals inform which retro topics need surfacing; burnout risk changes the format |
| `skills/people/burnout.md` | High burnout score changes retrospective design — morale focus before process focus |
