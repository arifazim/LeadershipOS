# Leadership Memory: Executive

**Domain**: Leadership Memory → Executive
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (private; informs executive communication strategy)
**Cadence**: Record after every significant executive interaction; review quarterly

---

## Purpose

Executive relationships are high-stakes and low-frequency. There is rarely enough interaction to learn a VP's preferences intuitively — and the cost of a misread is a failed proposal, lost trust, or strategic exclusion. Capturing what has worked, what has failed, and how specific executives make decisions gives the EM a durable edge in every future interaction.

**Questions this domain answers:**
- "How did the VP respond to similar proposals before?"
- "What framing gets traction with this executive?"
- "What concerns does this executive raise when skeptical?"
- "When has this executive been most receptive?"
- "What does this executive interpret as trust vs. distrust?"

---

## Domain-Specific Entry Fields

In addition to the universal schema fields (`memory/schema.md`), executive entries include:

```
Executive:          {{name / role — prefer role for transferability}}
Meeting format:     {{1:1 / group briefing / hallway / async / skip-level / board}}
Executive's apparent priority this quarter: {{what they seem focused on}}
Their response type: {{Receptive / Skeptical / Neutral / Deferred / Redirected}}
What landed:        {{specific framing, argument, or structure that got traction}}
What didn't land:   {{specific approach that triggered skepticism or deflection}}
Questions they asked: {{verbatim or close paraphrase — questions reveal mental model}}
Follow-up they requested: {{what they asked for next; signals what they value}}
```

---

## What to Record

Create an entry after any of the following:

- A proposal was accepted, rejected, or deferred by an executive
- An executive asked a question that was unexpected or revealing
- An executive's reaction was different from what was anticipated
- A communication format (BLUF, narrative, data-first) visibly worked or failed
- An executive expressed a concern, fear, or priority shift that hadn't been stated before
- Trust appeared to increase or decrease based on how something was handled
- The executive brought up a past event positively or negatively

Do not record: routine status updates that produced no signal. Record the signal, not the meeting.

---

## Pattern Detection

After three or more entries about the same executive, look for:

**Communication preference**: Does this executive prefer data before narrative, or narrative before data? Do they want the ask in the first sentence or the last?

**Skepticism triggers**: What causes this executive to push back, defer, or ask for more? Uncertainty? Cost? Speed? Dependency on other teams?

**Trust signals**: What has caused trust to increase? Delivering on a specific commitment? Surfacing a problem before they asked? Framing a risk in terms they care about?

**Receptivity conditions**: When is this executive most open to new proposals? End of quarter when planning is fresh? After a positive team outcome? Never when in firefighting mode?

**Pattern of "why wasn't I told sooner?"**: What types of information does this executive expect to receive proactively? Missing this pattern is a recurring trust-eroding mistake.

---

## Query Patterns

```
Q: "How has [executive] responded to [situation type] before?"
→ Filter by: person:[tag] + situation:[tag]; sort by date descending

Q: "What framing works with [executive]?"
→ Filter by: person:[tag] + pattern:framing-effect + outcome:positive
→ Retrieve: What landed fields

Q: "What does [executive] consistently ask about?"
→ Filter by: person:[tag]; aggregate: Questions they asked fields

Q: "When has [executive] been most skeptical?"
→ Filter by: person:[tag] + outcome:negative or outcome:deferred
→ Retrieve: Context + What didn't land fields

Q: "What trust-building moments have there been with [executive]?"
→ Filter by: person:[tag] + pattern:trust-building + outcome:positive
```

---

## Entry Log

```
EXECUTIVE MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example entry — replace with real entries]

ID: EXE-2026-07-01-001
Date: 2026-07-01
Domain: executive
Actors: VP Engineering (skip-level)
Context: Proposed adding a reliability SLO framework to the platform team roadmap. VP had
  expressed concern about delivery velocity in the prior quarter review. Trust level: adequate —
  no active friction but limited accumulated credibility.
What happened: Led with business impact framing (customer retention correlation with uptime
  data) before introducing the technical approach. VP asked two questions: timeline and
  dedicated headcount. Did not ask about implementation complexity.
Outcome: Proposal accepted. VP mentioned it positively in the next leadership sync.
  Framework is now on the Q3 roadmap.
Lesson: This VP responds to business impact before technical detail. Opening with architecture
  or complexity triggers cost-benefit skepticism. Lead with the customer or revenue angle, then
  answer the "how" only when asked. The two questions (timeline + headcount) reveal what they
  actually need to evaluate — scope and cost, not design.
Confidence: Emerging
Executive: VP Engineering
Meeting format: 1:1 briefing
Executive's apparent priority this quarter: Delivery velocity; reducing slip rate
Their response type: Receptive
What landed: Customer retention framing; specific timeline commitment
What didn't land: N/A — not tested this session
Questions they asked: "What's the timeline?" "Do you need dedicated headcount for this?"
Follow-up they requested: Written summary to share with the CTO
Tags: person:vp-engineering, situation:proposal-reception, pattern:framing-effect, outcome:positive
Related entries: —
```

---

## Pattern Summary (per executive)

```
EXECUTIVE PATTERN PROFILE: {{Executive role/name}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Communication preference:   {{data-first / narrative-first / unknown}}
Most effective framing:     {{customer / revenue / risk / speed / team}}
Skepticism triggers:        {{list}}
Receptivity conditions:     {{when most open to proposals}}
Trust drivers:              {{what has built trust}}
Trust risks:                {{what has eroded trust}}
Questions they reliably ask:{{list — these reveal their evaluation framework}}
Proactive disclosure threshold: {{what they expect to be told without asking}}
Established patterns:       {{list with entry IDs}}
Refuted assumptions:        {{what you thought was true but turned out not to be}}
Last updated:               {{date}}
```

---

## Recall Output Format

```
EXECUTIVE RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Executive: {{role/name}}
Entries reviewed: {{N}} entries, {{date range}}

PATTERN ({{Established / Emerging / Single}}):
  {{Summary of what the entries reveal about this executive's behavior}}

WHAT WORKED:
  {{Specific framing or approach with entry ID and date}}

WHAT DIDN'T WORK:
  {{Specific approach that failed, with entry ID and date}}

RECOMMENDATION FOR UPCOMING INTERACTION:
  {{Specific advice on framing, sequencing, and what to anticipate}}

CONFIDENCE: {{High / Medium / Low}}
  Basis: {{N confirmed observations; most recent: date}}

CAVEATS:
  {{What may have changed; how long since last confirming entry}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Impression-only** | EM relies on memory of how the VP "seems to like" things without evidence | Require specific behavioral entries — what was said, what landed, what was asked |
| **Single-interaction conclusions** | One good meeting becomes a "pattern" | Confidence must be Emerging (2–3 observations) before acting on a preference assumption |
| **Role conflation** | Pattern attributed to VP Engineering; new VP inherits the pattern incorrectly | Entries are person-specific; revalidate patterns when a new person takes a role |
| **Recency bias** | Only recent interactions recorded; historical patterns lost | Review all entries before high-stakes executive interactions; older patterns may still hold |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `skills/meetings/executive-meeting.md` — Preparation skill using this memory domain
- `confidence-engine/` — Executive confidence signals that may inform context fields
