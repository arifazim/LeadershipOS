# Skill: Storyline Generator

**Domain**: Presentation
**Owner**: `subagents/executive-summary.md`
**Cadence**: Before building any presentation deck

---

## Purpose

Generate the narrative structure of a presentation before any slides are built — producing a one-paragraph story, a slide-by-slide beat sheet, and the one-sentence core message that every slide must serve.

**The most common presentation mistake**: building slides, then finding the story. The result is a deck full of information that has no direction. Executives experience it as "a lot of data without a point."

**The right sequence**: Story first. Slides second. Data fills the story — not the other way around.

**The 15-minute discipline:**
> "I have 15 minutes with the VP. What are the three slides that matter most?"
>
> The storyline for 15 minutes is: **Tension → Resolution → Ask**
> - "Here is something that needs your attention." (Tension)
> - "Here is what I'm doing about it / what we've accomplished." (Resolution)
> - "Here is what I need from you." (Ask)
>
> Every word in the deck exists to support one of those three beats. If it doesn't, cut it.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Topic** | What is this presentation about? |
| **Goal** | What must the audience think, feel, or decide after the presentation? |
| **Audience** | Who are they, what do they already know, what do they care about? |
| **Key facts** | The 3–5 most important facts or data points you need to include |
| **Your ask** | What specific outcome do you need from this meeting? |

### Optional
| Input | Description |
|---|---|
| **Time available** | Constrains how many beats the story can have |
| **Prior context** | What has this audience already heard on this topic? |
| **Objections to anticipate** | Where will they push back? |
| **Tone** | Urgent / Confident / Reassuring / Transparent |

---

## Analysis

### Step 1 — Choose the Narrative Pattern

Every effective presentation follows one of five narrative patterns:

| Pattern | Structure | Best for |
|---|---|---|
| **Situation → Complication → Resolution** | Here's where we are. Here's what changed. Here's what we're doing. | Status updates, incident comms, QBRs |
| **Problem → Solution → Evidence → Ask** | Here's the challenge. Here's my answer. Here's why it works. Here's what I need. | Investment proposals, decision requests |
| **Vision → Gap → Path → Ask** | Here's where we're going. Here's where we are. Here's how we get there. Here's what we need. | Roadmap, annual planning, strategic direction |
| **Win → Meaning → What's Next** | Here's what we accomplished. Here's why it matters. Here's what comes next. | Milestone comms, QBR wins, board updates |
| **Risk → Impact → Options → Recommendation** | Here's the threat. Here's the cost. Here are the choices. Here's what I recommend. | Risk escalation, reliability decisions |

### Step 2 — Write the One-Sentence Core Message

Before writing any beats or slides, write the core message:

> "If the audience remembers one sentence after this presentation, what is it?"

Format: **[Action/outcome] by [when/how] because [why it matters to them].**

Examples:
- "Engineering is on track for Q3 but the authentication service is the one risk worth watching."
- "We delivered 94% of our Q2 plan and need 2 additional engineers to maintain that pace in H2."
- "The reliability investment is paying back: P1 frequency down 70% in 60 days."

If you can't write this sentence before building the deck, you don't yet know what the presentation is for.

### Step 3 — Generate the Beat Sheet

A beat is a single unit of the story — one idea, one slide. Name each beat before creating the slide.

**Beat naming rules:**
- Four words or fewer
- States the message, not the topic: "Delivery is on track" not "Delivery Update"
- The audience can understand the message from the beat name alone

### Step 4 — Test the Story Spine

Read the beat names in sequence. The story should flow as a coherent argument. If a beat doesn't connect to the previous or next one, it's in the wrong place or belongs in the appendix.

```
Story spine test:
"[Beat 1]. And therefore [Beat 2]. And therefore [Beat 3]. And that's why [Ask]."

If any beat breaks the "and therefore" chain, it's either out of order or doesn't belong.
```

---

## Decision Tree

```
What narrative pattern fits the goal?

├── GOAL: INFORM (executive needs to know something)
│   └── Pattern: Situation → Complication → Resolution
│       Beat 1: Status signal (where we are)
│       Beat 2: The one thing that changed or matters most
│       Beat 3: What we're doing about it / what comes next
│       Beat 4: Ask (or "no action needed — sharing for awareness")
│       Tone: Confident. Lead with the signal, not the backstory.

├── GOAL: SEEK APPROVAL (executive needs to decide something)
│   └── Pattern: Problem → Solution → Evidence → Ask
│       Beat 1: The problem (in business terms — cost, risk, or customer impact)
│       Beat 2: My recommendation (lead with the answer)
│       Beat 3: Why it works (evidence, trade-offs acknowledged)
│       Beat 4: Ask (specific, with decision deadline)
│       Tone: Decisive. Recommendation first. Evidence second.

├── GOAL: ESCALATE (something has gone wrong or is about to)
│   └── Pattern: Risk → Impact → Options → Recommendation
│       Beat 1: What is at risk (lead with the risk — do not bury)
│       Beat 2: Business impact if risk materializes
│       Beat 3: Options available (2–3 options, status quo included)
│       Beat 4: Recommendation + ask
│       Tone: Transparent, action-oriented. Do not minimize.

├── GOAL: ALIGN (executive needs to share a direction)
│   └── Pattern: Vision → Gap → Path → Ask
│       Beat 1: The destination (where engineering is headed and why)
│       Beat 2: The gap between now and there
│       Beat 3: How we close the gap (sequenced, resourced)
│       Beat 4: What alignment you need from them
│       Tone: Strategic. Connect everything to company goals.

└── GOAL: CELEBRATE (executive should recognize a win)
    └── Pattern: Win → Meaning → What's Next
        Beat 1: The win (specific, measurable)
        Beat 2: Why it matters (business outcome, not engineering achievement)
        Beat 3: What's next (momentum, not complacency)
        No explicit ask — or a light forward-looking one.
        Tone: Proud, not boastful. Let the outcome speak.
```

---

## Output

### Storyline Document

```
STORYLINE — {{Presentation title}}
Audience: {{names / roles}} | Time: {{N}} min | Goal: {{goal}}

CORE MESSAGE (one sentence):
{{If they remember nothing else, they remember this.}}

NARRATIVE PATTERN: {{Situation→Complication→Resolution | Problem→Solution→Evidence→Ask | etc.}}

TONE: {{Urgent / Confident / Reassuring / Transparent}}

BEAT SHEET:
Beat 1 — {{Message in 4 words max}}
  Supports: {{How this beat serves the core message}}
  Key fact: {{The one data point or fact this beat needs}}
  Risk: {{What could go wrong if this beat lands poorly}}

Beat 2 — {{Message}}
  Supports: {{connection to core message}}
  Key fact: {{fact}}

Beat 3 — {{Message}}
  Supports: {{connection}}
  Key fact: {{fact}}

Beat N — The Ask
  The ask (verbatim): "{{Exact language you will use to make the ask}}"
  Decision needed by: {{date}}
  If they say yes: {{what happens next}}
  If they say no: {{what you need to understand / what you'll do}}

STORY SPINE TEST:
"[Beat 1]. And therefore [Beat 2]. And therefore [Beat 3]. And that's why [Ask]."

ANTICIPATED OBJECTIONS:
{{Objection}} → {{Your response in two sentences}}
{{Objection}} → {{Your response}}

APPENDIX BEATS (don't present — show if asked):
{{Beat}} — triggered by: {{what question unlocks this}}
```

---

## Example

```
STORYLINE — Q3 Reliability Investment
Audience: VP Engineering | Time: 15 min | Goal: Seek approval for reliability sprint

CORE MESSAGE:
"The auth service is our top risk. One sprint now prevents a P1 incident that
 would cost more than the sprint and delay Q3 by 2 weeks."

NARRATIVE PATTERN: Problem → Solution → Evidence → Ask

TONE: Transparent, decisive

BEAT SHEET:
Beat 1 — "Auth service is at risk"
  Supports: Names the problem the recommendation solves
  Key fact: 2 P2 incidents in 30 days; root cause unaddressed
  Risk: May feel alarming — frame as early signal, not crisis

Beat 2 — "One sprint fixes it"
  Supports: Gives them the answer before the justification
  Key fact: 85% risk reduction with 1 sprint; Q3 milestone delayed 2 weeks
  Risk: They may push back on the delay — have the math ready

Beat 3 — "Cost of not acting"
  Supports: Makes inaction look more expensive than action
  Key fact: One P1 = $120K impact. Sprint cost = $80K equivalent engineering time.
  Risk: Don't dwell on worst case — make the math, move to recommendation

Beat 4 — The Ask
  Verbatim: "I'm asking you to approve a reliability sprint starting July 7.
             This delays Feature X by 2 weeks. The math says it's worth it.
             I need a yes or no by end of day Thursday — Sprint 43 planning is Friday."
  Decision by: Thursday July 3
  If yes: Sprint 43 restores auth service reliability by July 21
  If no: Continue monitoring, accept the risk — I'll report weekly

STORY SPINE TEST:
"Auth is at risk. And therefore one sprint fixes it. And therefore doing nothing
 costs more. And that's why I need approval by Thursday."
✓ The chain holds.

ANTICIPATED OBJECTIONS:
"Can't we just monitor it?" → "Monitoring doesn't reduce the probability. The root cause is
  architectural. Every week we delay is another week at elevated P1 risk."
"What about the Feature X delay?" → "2-week delay on Feature X vs. potential 2-week outage
  response + 3-week milestone slip. The sprint is the cheaper path."

APPENDIX BEATS:
Technical root cause detail — triggered by: "What's the actual issue?"
Feature X business impact detail — triggered by: "Tell me more about the Feature X delay"
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Core message written in one sentence | Base: 65% |
| Narrative pattern matches goal | +10% |
| Story spine test passes | +10% |
| Each beat has a named key fact | +10% |
| Ask is verbatim and specific | +10% |
| No core message | −25% |
| Beat sheet exists but story spine breaks | −15% |
| Ask is "get their thoughts" | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Topic instead of message** | Beat names describe subjects, not messages | Rewrite: "Q3 Update" → "Q3 is on track" / "Reliability" → "Auth service is the risk" |
| **Broken story spine** | Beats don't connect with "and therefore" | Reorder or cut beats until the chain holds |
| **No core message** | Can't state the point in one sentence | Do not build the deck until you can. The deck won't have a point. |
| **Objections not anticipated** | Executive raises something you hadn't considered | Prepare objections the day before. Practice the response out loud. |
| **Wrong narrative pattern** | Escalation framed as "inform" | Lead with the risk, not the context. Pattern mismatch kills credibility. |

---

## References

- `skills/executive/executive-storytelling.md` — Narrative frameworks for executive communication
- `skills/presentation/presentation-coach.md` — Upstream skill: determines what kind of story to tell
- `skills/presentation/executive-slide-review.md` — Downstream: validates slides built from this storyline

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/presentation/presentation-coach.md` | Coach determines the strategy; this skill generates the structure |
| `skills/presentation/executive-slide-review.md` | Reviews the deck built from this storyline |
| `skills/executive/executive-storytelling.md` | Narrative theory underlying this skill |
| `skills/presentation/kpi-storytelling.md` | When key facts in the beat sheet are KPI-based |
