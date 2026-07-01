# Skill: Meeting Preparation

**Domain**: Presentation
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Before any significant stakeholder meeting

---

## Purpose

Prepare completely for a specific meeting — covering the deck, the room dynamics, the hardest questions, the ask, and the follow-through — so the EM walks in with confidence and walks out with an outcome.

Preparation is the variable that separates EMs who use meetings well from those who don't. The executive who is often in meetings where "nothing got decided" is usually the least prepared person in the room.

**The 15-minute VP standard:**
> "I have 15 minutes with the VP. What are the three slides that matter most?"
>
> But meeting preparation goes further than the slides. You also need:
> - The one sentence you'll say if you have only 60 seconds
> - The one question you're most afraid of, with the answer ready
> - The decision or outcome you'll leave without if the meeting ends without it
>
> Preparation is complete when you can answer all three without hesitation.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Meeting type** | What kind of meeting is this? (1:1 / status / decision / escalation / QBR) |
| **Audience** | Who is attending? What is their level, function, and current priority? |
| **Your goal** | What outcome must come from this meeting for it to have been worth it? |
| **Time available** | Total minutes |
| **Your deck or materials** | What you're presenting or discussing |

### Optional
| Input | Description |
|---|---|
| **Prior meeting notes** | What was discussed last time? What did you commit to? |
| **Known concerns** | What has this audience pushed back on before? |
| **Allies in the room** | Who can support your position if challenged? |
| **What they've been told** | Has anyone briefed them on this topic already? |

---

## Analysis

### Step 1 — Classify the Meeting

| Meeting type | Your role | What success looks like |
|---|---|---|
| **Status / update** | Informing | They understand the current state and have what they need to act |
| **Decision** | Seeking approval | A decision is made or a clear next step to the decision is named |
| **Escalation** | Surfacing a risk | They have the information, agree on the severity, and know what you need |
| **Planning / alignment** | Co-creating | Shared understanding and a committed direction |
| **Relationship / 1:1** | Building trust | They feel heard; you leave with useful context or feedback |

### Step 2 — Apply the Time Constraint

```
Meeting time  | Core material         | Time for Q&A  | Backup only
15 minutes    | 3 slides + 1 ask      | 5 minutes     | 2 appendix slides
30 minutes    | 7 slides + discussion | 10 minutes    | 4 appendix slides
60 minutes    | 12 slides + workshop  | 20 minutes    | Full appendix
```

**Rule**: Never fill 100% of time with slides. Executive meetings almost always run shorter than scheduled. Know your minimum viable story — the version that fits in half the time.

### Step 3 — Prepare the Hard Questions

For every meeting, identify the three questions you most hope they don't ask — then prepare the answer.

Why the questions you hope they don't ask? Because those are the questions they're most likely to ask. Executives are paid to probe. If you're not ready for the uncomfortable question, you'll lose credibility in the moment you can least afford it.

**Hard question format:**
1. Write the question verbatim
2. Write a two-sentence answer
3. Practice the answer out loud — not in your head

### Step 4 — Confirm the Ask

**The ask test**: If the meeting ended right now and you got nothing, what is the minimum you need before you leave?

That is your ask. It should be:
- One thing (not three)
- Specific (not directional)
- Time-bound (with a deadline)
- Actionable (they can say yes or no right now)

If you can't name this before the meeting, you don't have an ask.

---

## Decision Tree

```
What kind of meeting is this?

├── STATUS UPDATE
│   └── Prep focus: 3 numbers + status signal + risk (even if low) + ask ("no action needed")
│       Practice: "We are [Green/Yellow/Red]. The one thing to know is [X]. No action needed."
│       Failure mode: Turning a status meeting into a decision meeting without warning.
│       → Invoke: skills/presentation/executive-slide-review.md to validate materials

├── DECISION REQUEST
│   └── Prep focus: Recommendation ready + alternatives prepared + decision window named
│       Practice: "I recommend [X] because [Y]. The decision needs to be made by [date]."
│       Room dynamics: Lead with the recommendation. Do NOT present options first and
│         then ask them to choose. That's outsourcing your judgment.
│       → Invoke: skills/executive/executive-decision-framework.md to structure the ask

├── ESCALATION
│   └── Prep focus: Risk framed in business terms + options with costs + recommendation
│       Practice: "There is a risk. Here is the business impact. Here is what I recommend."
│       Critical: Lead with the risk. Do not bury it after good news.
│       → Invoke: skills/executive/executive-risk-report.md to build the risk framing

├── PLANNING / ALIGNMENT
│   └── Prep focus: Know your boundaries (what you can commit to vs. what needs their input)
│       Practice: "Here is what engineering can deliver. Here are the dependencies on your side."
│       Failure mode: Committing to things in the meeting that you haven't validated with the team.
│       → Invoke: skills/presentation/storyline-generator.md for the narrative structure

└── RELATIONSHIP / 1:1
    └── Prep focus: One problem with a proposed solution + one win + one risk they should know
        Practice: Know your three things before you walk in. Do not improvise.
        → Invoke: skills/executive/vp-one-on-one.md for the full 1:1 prep framework
```

---

## Output

### Meeting Prep Card

```
MEETING PREP — {{Meeting name}} — {{Date}}
Meeting type: {{Status / Decision / Escalation / Planning / 1:1}}
Audience: {{names / roles}} | Time: {{N}} min

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MY GOAL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
What I need to come out of this meeting: {{one sentence — specific}}
If I get nothing else: {{the minimum acceptable outcome}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MY OPENING LINE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
If I have 60 seconds: "{{Verbatim. Core message + ask.}}"
If they ask "what do you need?" before I start: "{{Specific answer — ready}}"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
THREE NUMBERS I KNOW WITHOUT LOOKING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{metric}} = {{value}}
2. {{metric}} = {{value}}
3. {{metric}} = {{value}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
HARD QUESTIONS AND ANSWERS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q1: {{Hardest question}}
A1: {{Two-sentence answer — practiced out loud}}

Q2: {{Second hardest}}
A2: {{Two-sentence answer}}

Q3: {{Third hardest}}
A3: {{Two-sentence answer}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
THE ASK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Verbatim: "{{Exact language. One ask. Specific.}}"
Decision needed by: {{date}}
If yes: {{what happens immediately after}}
If no: {{what you need to understand}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRIOR COMMITMENTS TO FOLLOW UP ON
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• {{What was committed last time}} — Status: {{Done / In progress / Flagging}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
IF TIME IS CUT IN HALF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
I jump immediately to: {{the one slide that must be seen}} + the ask
I skip: {{everything else — it's in the appendix}}

POST-MEETING (complete within 24 hours):
□ Send written recap: decision / actions / owners / deadlines
□ Follow up on any open questions from Q&A
□ Update prior commitments log
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Goal and minimum outcome named | Base: 65% |
| Three numbers known without notes | +10% |
| Three hard questions prepared with answers | +10% |
| Ask is verbatim and specific | +10% |
| Time-compressed version prepared | +5% |
| No goal named | −25% |
| No hard questions prepared | −15% |
| Ask is "get their thoughts" | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Deck prepared, not answers** | Can navigate slides but can't answer "so what?" | Know the three numbers. Know the recommendation. The slides are backup. |
| **No minimum outcome** | Meeting ends with no decision and no next step | Name the minimum before walking in. Leave with it. |
| **Skipping hard questions** | Surprised by a question you should have anticipated | Write the three questions you hope they don't ask. Prepare them first. |
| **No prior follow-through** | Prior commitments not addressed | Open with last meeting's commitments. Every time. |
| **No time-compressed plan** | Meeting shortened; scramble to find the right slide | Know the one slide that must be seen. Have it ready to jump to. |

---

## References

- `skills/executive/executive-presence.md` — In-room behavior and challenge handling
- `skills/presentation/executive-slide-review.md` — Deck review before the meeting
- `skills/executive/vp-one-on-one.md` — 1:1 specific preparation

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/presentation/presentation-coach.md` | Upstream: determines the strategy for the meeting |
| `skills/presentation/executive-slide-review.md` | Reviews the materials being brought to the meeting |
| `skills/executive/executive-presence.md` | In-room behavior after preparation is complete |
| `skills/executive/vp-one-on-one.md` | Specialized prep for the VP 1:1 meeting type |
