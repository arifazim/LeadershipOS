# Skill: VP One-on-One

**Domain**: Executive
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Weekly or biweekly (matches actual 1:1 cadence with VP)

---

## Purpose

Prepare for and execute a productive 1:1 with your VP manager. Extract maximum value — for your team, your career, and the relationship — in the time available.

The VP 1:1 is the highest-leverage recurring management interaction an EM has. It is the primary channel for building trust upward, surfacing risks before they become surprises, securing resources before you desperately need them, and shaping how your work is perceived at the next level.

Most EMs underinvest in this meeting. They show up with status updates. They leave without having used the time well.

**Rule**: Never show up to a VP 1:1 with only status. Status is something you send beforehand. The 1:1 is for judgment, context, and relationship.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Your VP's current priorities** | What are they accountable for this quarter? What keeps them up at night? |
| **Your team's current state** | Delivery, team health, top risk — 3 signals |
| **One problem you're working on** | Something where their perspective, authority, or network would help |
| **One win to share** | Something the team accomplished that the VP should know about |

### Optional
| Input | Description |
|---|---|
| **Prior 1:1 notes** | What was discussed last time? What did you commit to? |
| **Org context** | Is there something happening in the broader org that affects your team? |
| **Career topic** | Is there something you want feedback on or support for? |
| **Resources needed** | Is there something you need their authority to unlock? |

---

## Analysis

### The VP's Mental Model of You
Your VP is forming a continuous assessment: can I trust this EM to run their team? Do they surface things early? Do they bring solutions or just problems? Do they understand the business?

Every 1:1 is updating that assessment. Manage it deliberately.

What builds trust with VPs:
- Surfacing risks before they become incidents
- Bringing problems with proposed solutions
- Knowing your numbers without checking
- Following through on what you said you'd do
- Connecting engineering work to business outcomes

What erodes trust with VPs:
- Surprises (the thing they heard from someone else first)
- Problems without paths forward
- Optimistic status that doesn't match reality
- Needing their opinion on decisions that are yours to make

### Prepare Three Things — No More

Too many topics in a VP 1:1 means nothing gets depth. Prepare exactly three:
1. **One risk they should know about** (or "No new risks this week")
2. **One win that reflects the team's capability**
3. **One ask — something you need their help with**

Everything else is async.

### Know Your Numbers
Before every VP 1:1: delivery status (Green/Yellow/Red), the reason behind the signal, and the one metric that best represents where the team is right now. No notes. Know it.

---

## Decision Tree

```
What does your VP most need from this 1:1 right now?

├── THEY NEED CONFIDENCE THE TEAM IS ON TRACK
│   └── Lead with: Green status + key win + what's next
│       Time: < 5 min on status. Use remaining time on strategic conversation.

├── THEY NEED TO KNOW ABOUT A RISK
│   └── Lead with: Risk + business impact + your mitigation plan + your ask (if any)
│       Do NOT bury the risk after good news. Lead with it.
│       → See: skills/executive/executive-risk-report.md for framing

├── YOU NEED SOMETHING FROM THEM
│   └── Lead with: The ask + business case in 2 sentences + what you've already tried
│       Frame the ask as: "I've hit a wall I can't get past without your help on X"
│       Do NOT make small talk first. They know you need something.

├── YOU NEED FEEDBACK ON YOUR OWN PERFORMANCE
│   └── Ask directly: "I'd like honest feedback on [specific thing]. What am I missing?"
│       Do not fish for compliments. Specific questions get specific answers.

└── ORG CONTEXT CHANGES THAT AFFECT YOUR TEAM
    └── Bring what you know and what you don't know
        "I heard [X]. I don't know if it affects my team yet, but I wanted to ask."
        Shows you're paying attention. Gives them a chance to provide context.
```

---

## Output

### Pre-Meeting Prep Card (complete before every VP 1:1)

```
VP 1:1 PREP — {{Date}}

MY VP'S CURRENT FOCUS: {{What are they accountable for right now?}}

MY THREE THINGS:
1. RISK: {{One risk they should know about — or "No new risks"}}
   Business impact: {{in their terms, not mine}}
   My mitigation: {{what I'm doing about it}}
   My ask (if any): {{specific}}

2. WIN: {{One team win worth celebrating}}
   Why it matters: {{connected to a business outcome or team capability}}

3. ASK: {{What I need from them}}
   Context: {{2 sentences}}
   What I've already tried: {{shows I'm not going to them with easy problems}}
   Decision needed by: {{date}}

MY STATUS SIGNAL: {{Green | Yellow | Red}}
KEY METRIC: {{One number I know without looking}}

PRIOR COMMITMENTS TO FOLLOW UP ON:
- {{What I said I'd do last time}} — Status: {{Done / In progress / Need to flag}}

RELATIONSHIP CHECK:
How is the relationship with my VP right now? {{Strong / Neutral / Needs attention}}
If "Needs attention" — what would I do about it?
```

### Post-Meeting Notes

```
VP 1:1 NOTES — {{Date}}

CONTEXT RECEIVED: {{New org info, priorities, or signals I should act on}}
DECISIONS MADE: {{Any decisions that came out of this conversation}}
MY COMMITMENTS: {{What I said I'd do — with deadline}}
THEIR COMMITMENTS: {{What they said they'd do — follow up if needed}}
RELATIONSHIP SIGNAL: {{How did it go? Trust building or neutral?}}
FOLLOW-UP NEEDED: {{Yes / No — what and when}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Three things prepared (risk, win, ask) | Base: 70% |
| VP's current priorities are known | +10% |
| Key metric known without checking | +10% |
| Prior commitments followed up on | +10% |
| Ask is specific and framed around their authority | +10% |
| No preparation done | −30% |
| Showing up with only status | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Status meeting** | Entire 1:1 is status update | Send status async. Use the time for the hard stuff. |
| **No ask** | You leave without having asked for anything | Prepare at least one ask every meeting — even if small |
| **Burying the risk** | Good news first, risk buried at end | Lead with the risk. They respect the honesty. |
| **Borrowed authority problems** | Bringing them decisions that are yours to make | Escalate decisions you don't have authority to make. Own the rest. |
| **No follow-through** | Last week's commitments not addressed | Open with last week's commitments. Always. |
| **Surprise in the room** | They learned something about your team from someone else | Surface everything before they hear it elsewhere. This is the most trust-damaging failure. |

---

## References

- `docs/engineering-playbook.md` → Managing Up section
- `skills/executive/executive-presence.md` — In-room behavior
- `skills/executive/executive-risk-report.md` — When risk needs more than a verbal flag

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/executive-status-report.md` | Send this async before the 1:1 so the meeting isn't wasted on status |
| `skills/executive/executive-risk-report.md` | When a risk warrants a standalone communication, not just a verbal mention |
| `skills/executive/investment-proposal.md` | When your ask involves budget or headcount |
| `skills/people/prepare-one-on-one.md` | The analog for managing down — apply the same preparation discipline |
