# Skill: Executive Presence

**Domain**: Executive
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Before executive meetings and presentations

---

## Purpose

Prepare an engineering manager to show up in executive settings with confidence, clarity, and credibility. This skill covers preparation, in-room behavior, handling challenge, and follow-through.

Executive presence is not personality. It is preparation made visible. An unprepared manager with good instincts will underperform a prepared one every time.

**What executives notice** (in order of impact):
1. Whether you have a point of view — not "here are the options" but "here is what I recommend and why"
2. Whether you own your numbers — if you cannot answer a question about your own data, credibility drops
3. Whether you handle challenge well — pushback is a test, not an attack
4. Whether you waste time — overlong intros, unnecessary context, rambling answers

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Meeting context** | What is this meeting about? What is on the agenda? |
| **Audience** | Who will be in the room? What are their priorities this quarter? |
| **Your role** | Are you presenting, updating, seeking a decision, or advising? |
| **Your ask or goal** | What outcome do you need from this meeting? |

### Optional
| Input | Description |
|---|---|
| **Prior interactions** | What has this executive said or decided in related past meetings? |
| **Known concerns** | What has this executive pushed back on before? |
| **Allies in the room** | Who can support your position if challenged? |

---

## Analysis

### Pre-Meeting Preparation (do this the day before, not the hour before)

**1. Know your three numbers.**
Pick three metrics that are directly relevant to this meeting. Know them without looking. If an executive asks "how many customers are affected?" and you have to check, you've lost the room.

**2. Write your recommendation before the meeting.**
Not "here are the considerations." A recommendation: "I recommend we do X because Y, and the risk of not doing it is Z."

**3. Predict the three hardest questions.**
For each one, write a two-sentence answer. Practice saying it out loud.

**4. Know your ask precisely.**
"I need a decision on X by Friday" is an ask. "I wanted to get your thoughts" is not.

**5. Prepare the one-sentence version of your main point.**
If you can say it in one sentence, you can say it in any format — interrupted, time-compressed, or challenged mid-thought.

### In-Meeting Behavior

**Lead with your point, not your context.**
Wrong: "So we've been working on this for about three months, and what happened was..."
Right: "Here's my recommendation. [Recommendation.] Here's why. [Three sentences.]"

**Own the room while you have it.**
Answer questions directly. "I don't know" is acceptable. "I think, maybe, it depends" is not.

**Handle challenge without collapsing or defending.**
When challenged: pause, acknowledge the concern, then respond.
Formula: "That's a fair concern. [Restate their concern in one sentence.] Here's how I'd address it: [response]."
Never: "Well, what I was trying to say was..."

**Read the room for time pressure.**
If an executive checks their phone or clock, compress. Jump to your ask. Do not finish the slides.

**Redirect tangents back to your ask.**
"That's worth discussing — can I get to my recommendation first and then we can go deeper on that?"

### Post-Meeting Follow-Through

Within 24 hours:
- Send a written recap: decision made, actions agreed, owner, due date
- If no decision was made, confirm what is needed to make the decision
- If you were challenged on something you couldn't answer in the room, answer it in the follow-up

---

## Decision Tree

```
What kind of executive interaction is this?

├── STATUS UPDATE (you're informing, not asking)
│   └── Prepare: 3 metrics, 1 risk, 1 ask (even if just "no action needed")
│       In room: lead with status signal (Green/Yellow/Red), then summary, then data
│       Time: < 5 minutes unless questions arise

├── DECISION REQUEST (you need a yes/no or a choice)
│   └── Prepare: recommendation, 2 alternatives, cost of inaction, your ask
│       In room: lead with recommendation, then justify, then invite questions
│       Success: you leave with a decision or a named next step to get one

├── ESCALATION (something has gone wrong)
│   └── Prepare: what happened (factual), impact, current status, plan
│       In room: lead with the current state, not the history
│       Never: apologize without a plan. Never: explain without owning.

├── INVESTMENT PITCH (you want resources)
│   └── See: skills/executive/investment-proposal.md
│       In room: lead with the business problem, not the engineering solution

└── RELATIONSHIP MEETING (1:1 with your VP manager)
    └── See: skills/executive/vp-one-on-one.md
        In room: bring 1 problem with a proposed solution, 1 win, 1 risk they should know about
```

---

## Output

### Pre-Meeting Checklist

```
PRE-MEETING PREP — {{Meeting name}} — {{Date}}

My role in this meeting: [Presenting / Updating / Seeking decision / Advising]
My primary ask: [Specific ask — one sentence]
My one-sentence main point: [If I had 10 seconds, this is what I'd say]

MY THREE NUMBERS:
1. {{metric}} = {{value}}
2. {{metric}} = {{value}}
3. {{metric}} = {{value}}

MY RECOMMENDATION: [One sentence]

THREE HARD QUESTIONS AND MY ANSWERS:
Q1: {{likely question}}
A1: {{two-sentence answer}}

Q2: {{likely question}}
A2: {{two-sentence answer}}

Q3: {{likely question}}
A3: {{two-sentence answer}}

KNOWN CONCERNS FROM THIS AUDIENCE: {{what have they pushed back on before?}}
TIME AVAILABLE: {{minutes}} — if compressed to half, I lead with: {{one-sentence point + ask}}
```

### Post-Meeting Recap (send within 24 hours)

```
Hi {{name}},

Following up from today's {{meeting name}}:

DECISION: {{what was decided, or "No decision made — see next steps"}}

ACTIONS:
- {{action}} — {{owner}} — {{by date}}
- {{action}} — {{owner}} — {{by date}}

OPEN ITEMS: {{anything that needs a follow-up meeting or more information}}

Let me know if I've captured anything incorrectly.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Recommendation is written and clear | Base: 65% |
| Three numbers are known without looking | +15% |
| Three hard questions prepared with answers | +10% |
| One-sentence main point is crisp | +10% |
| Ask is specific and named | +5% |
| No recommendation — only options | −20% |
| Numbers are approximate or unverified | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **No point of view** | "Here are the options for you to consider" | Write the recommendation before the meeting. Always. |
| **Can't answer your own numbers** | Checking notes for basic metrics | Prepare 3 numbers the day before. Know them cold. |
| **Defensive response to challenge** | "Well, what I meant was..." | Pause. Acknowledge. Respond. Practice this out loud. |
| **Overlong opening** | 3 minutes of context before the point | First sentence is the point. Always. |
| **No follow-through** | Meeting ends, no recap sent | Send recap within 24 hours. Every time. |
| **Missing ask** | Meeting ends, no clear next step | Prepare the ask before you walk in the room. |

---

## References

- `skills/executive/executive-communication.md` — Communication foundations
- `docs/engineering-playbook.md` → Executive Communication, Managing Up sections
- `CLAUDE.md` → "Produce executive summaries before details"; "Never make recommendations without evidence"

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/vp-one-on-one.md` | Applies presence skills to recurring VP 1:1 format |
| `skills/executive/executive-storytelling.md` | The narrative structure used in executive presentations |
| `skills/executive/investment-proposal.md` | The in-room version of an investment pitch |
| `skills/executive/executive-decision-framework.md` | How to structure the recommendation and get a decision |
