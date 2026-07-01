# Skill: Executive Meeting

**Domain**: Meeting Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Before every executive meeting; post-meeting within 24 hours

---

## Purpose

Prepare for and execute meetings with executives — VP, C-suite, or board-level stakeholders — so that engineering's position is communicated clearly, the ask is made explicitly, and the EM leaves with a decision or next step rather than a follow-up request to "schedule more time."

**What the EM does automatically**: In executive meetings, the EM:
1. Prepares a BLUF (Bottom Line Up Front) framing for every agenda item — executives read the bottom line first whether you intend them to or not
2. Translates engineering constraints, risks, and tradeoffs into business language before entering the room
3. Knows the specific ask before the meeting starts — and makes it explicitly, not implicitly
4. Prepares for the three most likely executive redirections and has responses ready
5. Follows up within 24 hours with a written summary of what was decided and who owns what

**Ethical principle**: Executives have high information density and low patience for setup. An EM who walks into an executive meeting without a clear ask wastes both parties' time and signals that they are not ready for the organizational level they are trying to influence. Respecting an executive's time means arriving with your recommendation already formed — not with a problem statement waiting for them to solve.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The specific ask** | What decision, resource, or alignment does the EM need from this executive? |
| **Current state summary** | What the executive already knows vs. what requires context-setting |
| **Options and recommendation** | The 2–3 options considered; the EM's recommendation and the reasoning |

### Optional
| Input | Description |
|---|---|
| **Executive's known priorities** | What this executive cares about most; how they define success |
| **Organizational context** | Political dynamics, recent decisions, or history that affects how the message lands |
| **Data supporting the recommendation** | Metrics, benchmarks, or risk data that makes the recommendation credible |

---

## Analysis

### Step 1 — Prepare the BLUF (Bottom Line Up Front)

```
The BLUF is the first thing said and the first thing written in the pre-read.
Executives process top-down. If the bottom line is buried in slide 8, they will ask
"what's the point?" before slide 4. Give it to them first.

BLUF STRUCTURE (4 sentences maximum):

Sentence 1 — SITUATION: "We are [situation]. As of [date], [current state in business terms]."
Sentence 2 — COMPLICATION: "The issue is [specific problem, risk, or decision needed]."
Sentence 3 — RECOMMENDATION: "I recommend [specific action]."
Sentence 4 — ASK: "I need [specific decision / resource / alignment] from you by [date]."

BLUF examples:

Example 1 (asking for a decision):
  "Our checkout service is currently handling 8K transactions per hour at 94% capacity.
  A forecasted 40% traffic increase in Q4 would exceed our current infrastructure limits and
  risks a degraded customer experience during peak sales.
  I recommend a $120K infrastructure investment in Q3 to scale ahead of the spike.
  I need your approval on the budget increase by [date] to begin procurement this quarter."

Example 2 (surfacing a risk):
  "The mobile team's dependency on our authentication API creates a shipping risk for their Q3 launch.
  We have two unresolved design issues that need a joint architecture decision by [date].
  My recommendation is a 2-hour joint session with both tech leads to resolve and document.
  I'm asking you to align with [mobile VP] that this gets priority time this week."

Example 3 (requesting a resource):
  "We are at 110% engineer utilization; two senior engineers are covering on-call for three services.
  Sustained overload at this level creates a 3–4 month burnout risk in the team.
  I recommend a contract engineering hire to cover the support load through Q4.
  I need approval to engage recruiting for a 6-month contract at [rate]."

BLUF language rules:
  — No jargon without immediate translation: "P99 latency of 800ms" → "users experience a nearly
    1-second delay on 1% of requests — the slowest 1% of our responses"
  — No hedging: "It might be worth considering" → "I recommend"
  — No passive voice on the ask: "It would be helpful if..." → "I need [X] from you"
  — Business impact first: "This will improve our deployment frequency" → "This reduces the risk
    of a customer-visible outage by 60% and enables the product team to ship 2 weeks faster"
```

### Step 2 — Translate Engineering Into Business Language

```
The translation is the EM's primary preparation work. It is not possible to improvise it
in the meeting. Every technical concept that will be discussed must be translated before entering.

TRANSLATION FRAMEWORK

Technical → Business translation patterns:

Latency / Performance:
  "P99 latency of 1.2 seconds" →
  "1 in 100 users waits more than 1 second. At our current volume, that's 500 users per hour
  experiencing a slow experience. Research shows this increases cart abandonment by 7%."

Technical debt:
  "The service has significant tech debt" →
  "The current architecture requires 3× more engineering effort per feature than a comparable
  system. That's costing us 30% of two engineers' time every sprint — approximately $X per quarter."

Reliability / Uptime:
  "We had 99.2% uptime last quarter" →
  "We had approximately 17 hours of degraded service last quarter. Based on our transaction volume
  during that period, estimated revenue impact was $X."

Security risk:
  "The service has unpatched CVE-2025-XXXX" →
  "We have a known vulnerability that, if exploited, could expose customer PCI data. Regulatory
  risk: potential [fine range]. Remediation takes 2 weeks. We need to prioritize it."

Team capacity:
  "We're fully utilized" →
  "The team is currently at 110% planned capacity. We're borrowing time from maintenance and
  technical improvements to deliver the roadmap. This is sustainable for 4–6 weeks before
  quality signals typically start declining."

Roadmap tradeoff:
  "We can't do X and Y in Q3" →
  "To ship X by [date], we need to defer Y by one quarter. The cost of deferral is [business impact].
  Which is the higher priority given our Q3 commitments?"

Translation test:
  Read your talking points out loud as if to a VP who has never worked in engineering.
  Where they would ask "what does that mean?" — translate it before the meeting, not during.
```

### Step 3 — Prepare for Redirections

```
Executive meetings rarely go as planned. The executive redirects based on their current
concerns, organizational context, and the question you didn't anticipate.

Prepare responses to the three most common executive redirections:

REDIRECTION TYPE 1 — "Why does this require my involvement?"
  They are asking whether this is the right level for this decision.
  Response: "It involves [budget / cross-team authority / organizational alignment] that I don't
  have decision authority over. Specifically, [Name]'s team needs to [action] and that requires
  your alignment to proceed."
  If you can't answer this clearly: the meeting is at the wrong level. Redirect downward.

REDIRECTION TYPE 2 — "What are the other options?"
  They want to see that you've considered alternatives and are not bringing one option pretending
  it's the only one.
  Response: Prepared; specific; honest about the tradeoffs.
  "The three options we considered are [A], [B], and [C]. [A] is my recommendation because [specific reason].
  [B] would cost less but risks [specific downside]. [C] is not viable because [specific constraint]."
  If you have no alternatives: this signals incomplete preparation. Always prepare at least two.

REDIRECTION TYPE 3 — "Can this wait?"
  They are assessing urgency. They may be testing whether you're over-escalating.
  Response: Be honest about the cost of delay.
  "This can wait [N weeks] without consequence. After [N weeks], [specific cost]: we lose [option /
  time / money / team capacity]. The decision doesn't need to happen today, but it needs to happen
  by [date] for [reason]."
  If the cost of delay is low: consider whether this is the right forum.

REDIRECTION TYPE 4 — "Why didn't I know about this sooner?"
  They feel surprised; surprise reduces trust.
  Response: Acknowledge; do not be defensive.
  "You're right — I should have surfaced this [N weeks] earlier. The reason it escalated to you
  now is [specific event or threshold]. I'll ensure earlier visibility next time."
  Then: move forward. Do not spend meeting time on post-mortems when there is an active decision needed.

Preparation for an unknown redirection:
  "That's a good question I hadn't considered. Can I follow up on that by [specific date]?
  What would be most useful for me to bring back?"
  Admitting an unknown is stronger than improvising an answer that is wrong.

RISKS TO SURFACE VS. RISKS TO MANAGE INTERNALLY
  Surface: Risks that require executive authority, budget, cross-team escalation, or decision
  Manage internally: Risks within the EM's scope, authority, and budget
  Common mistake: Surfacing risks that the executive expects the EM to solve alone
  "What do you need from me?" from the executive = they expect the EM to own this
  Test: "Is the action needed from me, or from someone at a higher level?" → if the former: internal
```

### Step 4 — Run the Meeting and Capture the Output

```
MEETING EXECUTION

TIME DISCIPLINE
  Assume you have 50% of the scheduled time. Executives are frequently called away or arrive late.
  BLUF must be delivered in the first 3 minutes — regardless of interruptions.
  The ask must be made before the meeting is half over.
  "I know we have [time remaining]. I want to make sure I get to the ask."

LISTENING FOR EXECUTIVE SIGNALS
  When the executive asks a specific question → they want a direct answer; don't extend the context
  When the executive interrupts → follow the interruption; don't finish the original sentence
  When the executive goes quiet → they are processing; don't fill the silence
  When the executive says "let me think about it" → ask: "Is there information I can get you
  that would help you decide? By when should I follow up?"

DECISIONS IN THE ROOM
  If the executive makes a decision in the meeting:
  Confirm it explicitly: "So the decision is [specific statement]. I'll record that. Is that correct?"
  Do not assume a "yes" that wasn't explicitly stated.

  If the executive defers the decision:
  Confirm the timeline: "When should I expect to hear back? I'll follow up by [date] if I haven't."
  Do not leave without a date or a trigger.

POST-MEETING (within 24 hours)

Send to the executive and relevant attendees:
  "Following our meeting on [date], I wanted to confirm the following:"
  DECISION: [What was decided, if anything]
  ACTION ITEMS: [Owner — action — date; for every commitment made in the meeting]
  OPEN QUESTION: [If anything is pending their response — when to expect it; when to follow up]
  "Please let me know if I've captured anything incorrectly."

Length: 3–5 sentences; one bulleted list; no prose narrative
Purpose: Written confirmation prevents "I didn't agree to that" in 3 weeks
```

---

## Decision Tree

```
What does the executive meeting preparation reveal?

├── NO CLEAR ASK IDENTIFIED
│   └── Do not schedule the meeting
│       An executive meeting with no clear ask is an update — send an async document instead
│       Define: "What decision, resource, or alignment do I need from this person?"
│       If the answer is "none": the meeting is informational; async is better

├── BLUF NOT PREPARED (or longer than 4 sentences)
│   └── Write it before finalizing the agenda
│       Test: can you deliver the BLUF in under 60 seconds without notes?
│       If not: it is not a BLUF; it is still setup

├── ENGINEERING CONCEPTS NOT TRANSLATED TO BUSINESS LANGUAGE
│   └── Do the translation work before the meeting
│       Read talking points as if you're a VP who has never worked in engineering
│       Every concept that requires explanation in the room was translation work that belonged before

├── NO ALTERNATIVES PREPARED
│   └── Prepare at least two alternatives before entering
│       "I considered only one option" signals incomplete analysis
│       Even if the recommendation is obvious: prepare an honest characterization of the alternative

├── PRE-READ NOT SENT 48H BEFORE
│   └── Send it with apology for the delay; do not skip it
│       Executives who read pre-reads arrive with questions, not gaps
│       Executives who don't receive pre-reads spend meeting time on context that should have been async

├── EXECUTIVE REDIRECTS (unexpected question or concern)
│   └── If prepared: deliver the prepared response
│       If unprepared: "That's a good question. Can I follow up by [date]?"
│       Never improvise a factual answer that might be wrong

└── MEETING CONCLUDES WITHOUT A DECISION OR CLEAR NEXT STEP
    └── Before leaving: "I want to make sure I leave with clarity on next steps.
        Is the decision [X], or should I plan to follow up by [date]?"
        Do not accept ambiguity at close. A soft "we'll see" is not an outcome.
        Post-meeting: send written summary within 24 hours regardless of whether a decision was made.
```

---

## Output

### Executive Meeting Brief

```
EXECUTIVE MEETING BRIEF — {{Executive Name}} — {{Date}} — {{Duration}}

BLUF (4 sentences max)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SITUATION: {{Current state in business terms}}
COMPLICATION: {{The specific problem, risk, or decision needed}}
RECOMMENDATION: {{What the EM recommends}}
ASK: {{Specific request from this executive, by specific date}}

AGENDA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Opening — 2 min: BLUF delivery; confirm time available
Item 1 — {{topic}} | DECISION | {{N}} min: [talking points + options + recommendation]
Item 2 — {{topic}} | DISCUSSION | {{N}} min: [talking points]
Close — 3 min: Confirm decision; confirm actions; confirm follow-up date

TALKING POINTS (translated to business language)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Item 1:
  Context: {{1 paragraph, business terms, no jargon}}
  Options: A: {{description + business consequence}} | B: {{description + consequence}}
  Recommendation: {{Option}} because {{1–2 specific business reasons}}
  Ask: {{Specific question to the executive}}

RISKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Meeting risk 1: {{Redirection type likely — with prepared response}}
Meeting risk 2: {{Information gap — what might be asked that requires follow-up}}
Organizational risk: {{Political or contextual factor that might affect reception}}

DECISIONS NEEDED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision 1: {{Specific yes/no or option A/B question}} — Authority: {{this executive}}
Decision 2 (if applicable): {{...}}

FOLLOW-UP ACTIONS (post-meeting, send within 24h)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Decision confirmed}}: {{statement of what was decided}}
{{Owner}} will {{action}} by {{date}}
Open item: {{Pending executive response}} — Follow up by {{date}} if no response
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| BLUF prepared and deliverable in 60 seconds | Base: 60% |
| The ask is specific and stated explicitly | +15% |
| Engineering concepts translated to business language | +15% |
| At least 2 alternatives prepared with tradeoffs | +10% |
| Post-meeting written summary sent within 24 hours | +5% |
| Pre-read sent 48h before | +5% |
| No BLUF; meeting opens with context | −30% |
| No specific ask; meeting is an update | −25% |
| Technical language not translated; executive must ask for clarification | −20% |
| No follow-up within 24 hours; decisions exist only in memory | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **No clear ask** | Meeting ends with "this was helpful, let's schedule a follow-up" | Define the ask before scheduling. No ask = no meeting. |
| **Buried lead** | BLUF appears at the end of a 10-minute context presentation | BLUF is the first sentence. Context is the pre-read. |
| **Untranslated jargon** | Executive asks "what does that mean?" during the recommendation | Translation is preparation work. Test every technical term out loud with a non-engineer before entering. |
| **No alternatives** | EM presents one option; executive asks "what else did you consider?"; EM is unprepared | Always prepare 2–3 alternatives. Present them honestly. |
| **No post-meeting summary** | Decision exists only in the executive's memory; EM follows up on "what we discussed" with different recollections | Send written summary within 24 hours. No exceptions. |

---

## References

- `skills/meetings/meeting-planner.md` — Executive meeting must pass necessity test; always send pre-read
- `skills/meetings/agenda-builder.md` — Agenda structure for executive meetings (BLUF + items + close)
- `skills/meetings/decision-log.md` — Decisions made in executive meetings are Type 1; full capture required
- `skills/meetings/action-items.md` — Post-meeting summary action items logged and tracked

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/meetings/decision-log.md` | Executive decisions are always Type 1; capture within 24 hours |
| `skills/meetings/action-items.md` | Post-meeting follow-through tracked here; completion signals EM reliability to exec |
| `skills/conflict/stakeholder-resolution.md` | If executive meeting involves escalated conflict; neutrality and preparation overlap |
