# Skill: Presentation Coach

**Domain**: Presentation
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Before any executive or stakeholder presentation

---

## Purpose

Diagnose a presentation context and produce the exact preparation strategy — what slides to build, what narrative to lead with, what the audience actually needs, and which three slides matter most in a time-compressed scenario.

Most engineers approach presentations the wrong way: they build all the slides they know, then trim. The right way is to start from what the audience needs to decide or believe, then build only the slides that move them there.

**The 15-minute VP rule:**
> "I have 15 minutes with the VP. What are the three slides that matter most?"
>
> Answer: **Status, Risk, Ask.** In that order. Everything else is backup material.
>
> - **Slide 1 — Status**: Where are we? (Green/Yellow/Red + one headline fact)
> - **Slide 2 — Risk**: What's the one thing they need to know that could go wrong?
> - **Slide 3 — Ask**: What do you need from them, specifically?
>
> If you have 15 more minutes: context, detail, Q&A. If you have 5 fewer minutes: keep Slide 3 only.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Audience** | Who is in the room — level, function, what they care about |
| **Time available** | Total minutes. This determines how many slides you can defend. |
| **Your goal** | Inform / Seek approval / Escalate risk / Align on direction |
| **Core message** | If you could send one sentence before the meeting, what would it say? |

### Optional
| Input | Description |
|---|---|
| **Existing deck** | Slides already built — review for gap and excess |
| **Prior meeting history** | What this audience has already heard on this topic |
| **Known concerns** | What will they push back on? |
| **Decision deadline** | Does a decision need to come out of this meeting? |

---

## Analysis

### Step 1 — Calculate Slide Budget

```
Time available (minutes) ÷ 3 = maximum number of slides you can cover with depth

15 min → 5 slides maximum (3 core + 2 backup)
30 min → 10 slides maximum (5 core + 5 backup)
60 min → 15 slides maximum (8 core + 7 appendix)

Rule: Never use your full slide budget. Leave 30% of time for questions.
```

### Step 2 — Identify the Presentation Type

| Goal | Primary slide sequence | Starting slide |
|---|---|---|
| **Inform** | Context → Status → Risks → Next steps | Status (what's happening) |
| **Seek approval** | Problem → Options → Recommendation → Ask | Recommendation (lead with the answer) |
| **Escalate risk** | Risk → Impact → Mitigation → Ask | Risk (never bury the lead) |
| **Align on direction** | Why → Options → Recommendation → Alignment ask | Why (shared problem first) |
| **Celebrate / update** | Win → What it means → What's next | Win (give the good news early) |

### Step 3 — Apply the Audience Lens

| Audience | What they care about | What to cut | What to add |
|---|---|---|---|
| **VP Engineering** | Delivery, risk, team health | Technical architecture | Business impact, team signal |
| **VP Product** | Customer outcomes, roadmap alignment | Infrastructure | Feature capability, timeline |
| **CTO** | Technical strategy, organizational scalability | Sprint-level detail | Architecture direction, build vs. buy |
| **CEO / Board** | Business outcome, investment efficiency | All engineering | Revenue, risk, competitive position |
| **Engineering team** | Technical depth, context, how decisions were made | Executive framing | Architecture, rationale, trade-offs |

### Step 4 — Produce the Slide List

Name every slide before building any of them. If you cannot name the slide in four words, you don't know what it's for.

---

## Decision Tree

```
What is the time constraint?

├── ≤ 15 MINUTES
│   └── Three slides: Status + Risk + Ask
│       Every other slide is backup (labeled "Appendix" — do not present unless asked)
│       Open with: your one-sentence core message
│       Close with: your ask, restated
│       → Invoke: skills/presentation/executive-slide-review.md to validate before presenting

├── 15–30 MINUTES
│   └── Five to seven slides: Story arc + data + recommendation + ask + 2 backups
│       Open with: summary slide (the whole story in 30 seconds)
│       → Invoke: skills/presentation/storyline-generator.md to build the arc first

├── 30–60 MINUTES
│   └── Full deck: problem / options / recommendation / evidence / risks / ask / appendix
│       → Invoke: skills/presentation/meeting-preparation.md for full session prep

└── > 60 MINUTES (workshop / working session)
    └── Not a presentation — a facilitated session
        Slides are reference material, not the vehicle
        Prepare: discussion questions, decision surfaces, working docs
        Presentation coach is the wrong skill for this format
```

---

## Output

### Presentation Brief

```
PRESENTATION BRIEF — {{Title}} — {{Date}}
Audience: {{names / roles}}
Time: {{N}} minutes | Goal: {{Inform / Approve / Escalate / Align}}
Core message (one sentence): {{if they read nothing else, this is what they know}}

SLIDE BUDGET: {{N}} core slides + {{N}} backup slides

CORE SLIDES (present these):
1. {{Slide title — 4 words max}} — Purpose: {{what this slide must accomplish}}
2. {{Slide title}} — Purpose: {{what this slide must accomplish}}
3. {{Slide title}} — Purpose: {{what this slide must accomplish}}
[+ more if budget allows]

BACKUP SLIDES (only if asked):
B1. {{Slide title}} — Available if: {{what question triggers this}}
B2. {{Slide title}} — Available if: {{what question triggers this}}

MY THREE NUMBERS (know without looking):
1. {{metric}} = {{value}}
2. {{metric}} = {{value}}
3. {{metric}} = {{value}}

MY ASK: {{specific, time-bound}}
HARDEST QUESTION I EXPECT: {{question}}
MY ANSWER: {{two sentences}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Core message can be stated in one sentence | Base: 65% |
| Slide count is within budget for time available | +10% |
| Each slide has a named purpose | +10% |
| Three numbers known without looking | +10% |
| Ask is specific | +5% |
| No core message identified | −25% |
| More slides than time budget allows | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Too many slides** | 20 slides for a 20-minute meeting | Divide time by 3. That is your slide count. Cut the rest to appendix. |
| **No core message** | Can't state the point in one sentence | Write the one-sentence version before opening any slide tool. |
| **Wrong sequence** | Status buried after 8 context slides | Lead with what they need to know — not how you got there. |
| **All detail, no story** | Every slide is a data table | → Invoke: skills/presentation/storyline-generator.md |
| **Prepared slides, not answers** | Can navigate the deck but not answer "so what?" | Know your numbers. Know your recommendation. The slides are backup. |

---

## References

- `skills/executive/executive-communication.md` — Translation rules for exec audiences
- `skills/executive/executive-presence.md` — In-room behavior during presentation

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/presentation/executive-slide-review.md` | Validate the deck before presenting to executives |
| `skills/presentation/storyline-generator.md` | Build the narrative before the slides |
| `skills/presentation/meeting-preparation.md` | Full prep for the meeting, not just the deck |
| `skills/presentation/board-deck.md` | When the audience is the board |
