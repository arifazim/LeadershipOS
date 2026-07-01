# Leadership Memory: Career

**Domain**: Leadership Memory → Career
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (informs career conversations, growth investment, retention decisions)
**Cadence**: Record after every significant career conversation; review quarterly

---

## Purpose

Career aspirations are not static. What an engineer said they wanted eighteen months ago may have changed entirely — and if the EM is still acting on the old version, their career investment is targeting the wrong goal. Conversely, what an engineer responds to in coaching, what types of opportunities excite them, and what patterns precede their best work are learnable with deliberate observation. This domain captures both: the evolution of aspiration over time and the observed patterns of what produces growth, engagement, and momentum for each person.

**Questions this domain answers:**
- "What did [engineer] say their career goal was six months ago versus now?"
- "What types of growth opportunities has [engineer] responded to most strongly?"
- "Which career conversations have actually produced action versus acknowledgment?"
- "What demotivates [engineer]? What re-energizes them?"
- "Is [engineer]'s stated aspiration still aligned with what they seem to want?"

---

## Domain-Specific Entry Fields

```
Engineer:             {{first name}}
Conversation type:    {{aspiration-mapping / growth-plan / check-in / feedback / promotion-readiness}}
Stated goal (1-year): {{what they described as their 1-year target at this date}}
Stated goal (3-year): {{what they described as their 3-year target at this date}}
Track:                {{IC growth / Management / Specialist / Pivot}}
What energizes them:  {{what they described as motivating; what was observable in their engagement}}
What drains them:     {{what they described as draining; observable disengagement signals}}
Conversation outcome: {{Produced action / Acknowledged only / Deflected / Unclear}}
Action committed:     {{specific commitment made by either party, if any}}
Aspiration drift:     {{Same / Shifted / Unclear — compared to prior entry for this person}}
```

---

## What to Record

Create an entry after any of the following:

- A substantive career conversation (aspiration, track, growth plan, promotion readiness)
- An engineer expresses a new interest or explicitly deprioritizes a prior goal
- A growth opportunity is offered and accepted or declined — the response reveals motivation
- An engineer's engagement noticeably shifts (positively or negatively)
- A career conversation produces a specific commitment that can be followed up
- An aspiration expressed in a career conversation contradicts prior entries

---

## Pattern Detection

After three or more entries for the same engineer, look for:

**Aspiration stability**: Is this person's stated goal consistent or shifting? Frequent shifts may indicate exploration, boredom, or responsiveness to external signals (someone offered them a path they hadn't considered).

**Response to opportunity types**: Do they light up for technical scope expansion? Mentoring others? Cross-functional projects? Visible initiatives? Different engineers respond to different growth levers.

**Career conversation outcome pattern**: Do their conversations consistently produce action, or do they consistently produce acknowledgment without follow-through? If the latter, the conversation design needs to change.

**Motivation drift signal**: Is what energizes them changing? Engineers who were once energized by technical depth but now talk about people and process are often moving toward a management track whether or not they've named it.

**Ceiling proximity signal**: Are they close to the natural limit of what this team and role can offer their aspiration? If yes, the EM needs to either create a path or have an honest ceiling conversation.

---

## Query Patterns

```
Q: "What has [engineer] described as their goal over the last 12 months?"
→ Filter by: person:[name]; sort by date; retrieve Stated goal fields

Q: "What types of opportunities has [engineer] responded to?"
→ Filter by: person:[name] + outcome:positive
→ Retrieve: What energizes them + Action committed fields

Q: "Which career conversations actually produced action?"
→ Filter by: person:[name] + Conversation outcome: Produced action
→ Identify pattern in what those conversations had in common

Q: "Has [engineer]'s aspiration shifted?"
→ Filter by: person:[name]; compare Stated goal across dates; check Aspiration drift field

Q: "What demotivates [engineer]?"
→ Filter by: person:[name]; retrieve What drains them field across all entries
```

---

## Entry Log

```
CAREER MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example entry — replace with real entries]

ID: CAR-2026-07-01-001
Date: 2026-07-01
Domain: career
Actors: [Engineer first name]
Context: Quarterly career conversation. Prior quarter had a significant delivery win (led
  the platform migration). Has been promoted to senior level for 14 months with no subsequent
  promotion conversation. Retention risk: Moderate.
What happened: Asked about 3-year goal. Engineer described wanting to "lead a team eventually"
  but immediately qualified it as "not sure if that's the right path for me." When asked
  about their best days at work, they described the cross-functional coordination work on the
  migration — not the technical implementation.
Outcome: No commitment made. Engineer agreed to spend one quarter in a tech lead role for
  the next initiative.
Lesson: The qualification ("not sure if that's right for me") may signal ambivalence or
  testing whether the EM will take the goal seriously. The best-day description suggests
  management-track orientation even without explicit naming. The tech lead opportunity lets
  them test the hypothesis without committing.
Confidence: Single instance
Engineer: [First name]
Conversation type: aspiration-mapping
Stated goal (1-year): Improve technical leadership; take on a tech lead role
Stated goal (3-year): Possibly lead a team; uncertain
Track: IC growth (shifting toward Management)
What energizes them: Cross-functional coordination; seeing team alignment happen
What drains them: Deep debugging work alone; work without visible organizational impact
Conversation outcome: Produced action (tech lead opportunity for next initiative)
Action committed: Engineer: try tech lead role next initiative. EM: identify the opportunity.
Aspiration drift: Shifted (prior entry showed purely IC-growth orientation)
Tags: person:[first-name], situation:career-conversation, pattern:communication-style, outcome:positive
Related entries: PRO-2026-04-15-002
```

---

## Aspiration Map (per engineer)

```
CAREER ASPIRATION MAP: {{Engineer name}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Current level:          {{role / level}}
Current track:          {{IC growth / Management / Specialist / Pivot}}
Track stability:        {{Stable / Shifting / Unclear}}

1-year goal (current):  {{stated aspiration}}
3-year goal (current):  {{stated aspiration}}
5-year goal (current):  {{stated aspiration}}

Goal evolution:
  {{date}}: {{stated goal at that time}}
  {{date}}: {{stated goal at that time — note if shifted}}

Opportunity response pattern:
  Responds to:    {{types of opportunities that energize}}
  Avoids / drains: {{types of work or roles that demotivate}}

Career conversation effectiveness:
  Conversations that produced action: {{N}} / {{total}}
  Pattern in effective conversations: {{what made them different}}

Ceiling proximity:     {{Low risk / Approaching / At ceiling}}
  If at ceiling: honest conversation needed by {{date}}

Last career conversation: {{date}}
Next career conversation: {{by date}}
```

---

## Recall Output Format

```
CAREER RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Engineer: {{name}}
Entries reviewed: {{N}} entries, {{date range}}

ASPIRATION HISTORY:
  {{date}}: {{goal}}
  {{date}}: {{goal}}
  Drift signal: {{Stable / Shifting / Significant shift}}

MOTIVATION PATTERN:
  Energized by: {{list}}
  Drained by: {{list}}
  Confidence: {{Established / Emerging}}

CAREER CONVERSATION EFFECTIVENESS:
  {{N}} out of {{total}} produced action
  What works: {{observed pattern}}

RECOMMENDATION:
  {{Specific advice for the upcoming career conversation or growth investment}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Aspiration drift ignored** | EM acts on career data from 12+ months ago; engineer's goals have shifted | Revalidate stated goal every quarter; compare to prior entry |
| **Only goals tracked, not motivation** | Career plan exists but doesn't account for what energizes the person | Record What energizes and What drains fields after every substantive conversation |
| **Productive ambiguity left unresolved** | Engineer expresses uncertainty; EM accepts it without exploring | Uncertainty is a signal, not a final answer; use follow-up questions to distinguish ambivalence from testing |
| **No follow-through tracking** | Action commitments made in career conversations; never followed up | Action committed field creates a follow-up obligation; review before next 1:1 |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `analytics/career-dashboard.md` — Career progression index informed by this log
- `skills/people/career-development.md` — Career development skill using this domain
- `skills/performance/retention-risk.md` — Career factor in retention risk model
