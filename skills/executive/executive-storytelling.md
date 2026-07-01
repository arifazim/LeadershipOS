# Skill: Executive Storytelling

**Domain**: Executive
**Owner**: `subagents/executive-summary.md`
**Cadence**: Applied before any major executive presentation or written narrative

---

## Purpose

Turn engineering work into a narrative that executives remember and repeat. Data informs. Stories persuade. A VP who remembers your story will advocate for your team in rooms you're not in.

Most engineering communication fails at the narrative level — not because the data is wrong, but because data without story is forgettable. This skill structures the story so it lands.

**The fundamental rule**: Executives don't remember the third bullet point. They remember the one sentence that connected to something they care about.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The work** | What the engineering team did or is planning to do |
| **The outcome** | What changed as a result (or will change) |
| **The audience** | Who is hearing this story and what they care about |
| **The ask or point** | What you want the audience to do or believe after hearing this |

### Optional
| Input | Description |
|---|---|
| **Metrics** | Quantified outcomes that anchor the story |
| **Before state** | What the world looked like before this work |
| **Customer impact** | A specific user or customer affected by the change |
| **Competitive context** | How this positions the company vs. alternatives |

---

## Analysis

### The Narrative Arc for Engineering Work

Every executive story has four beats:

```
1. SITUATION    — The world as it was. What problem existed?
2. COMPLICATION — Why the status quo was not acceptable. Cost of inaction.
3. RESOLUTION   — What we did and why it was the right move.
4. RESULT       — What changed. Quantified if possible. Forward-looking.
```

This is not chronological (we planned → we built → we shipped → we measured). It is meaning-first: here's why this mattered, here's what we did about it, here's what it produced.

### Step 1 — Identify the Protagonist
The protagonist of an engineering story is never the technology. It is one of:
- The customer (who can now do something they couldn't before)
- The business (which now has a capability, lower cost, or reduced risk)
- The team (who solved a hard problem — used sparingly)

### Step 2 — Name the Stakes
What would have happened if this work hadn't been done? Quantify the cost of inaction:
- "Without this, we would have lost $X per month to support costs"
- "The incident rate was on track to cause a customer churn event by Q3"
- "Our engineers were spending 15% of their time on a problem that is now automated"

If there are no stakes, the story has no tension. Without tension, there's no reason to pay attention.

### Step 3 — The One-Sentence Version
Every executive story must survive compression to one sentence. Write it first:
> "We [did X] because [problem], and now [outcome] — which means [business impact]."

If you cannot write this sentence, the story is not ready.

### Step 4 — Select Metrics That Matter
Not every metric is equal in a story. Use metrics that:
- Connect to business outcomes (revenue, cost, customers, time)
- Contrast a before and after state
- Can be understood without engineering context

Avoid: story points, PR counts, test coverage %, latency in milliseconds (unless audience is technical).

### Step 5 — Anticipate the "So What?"
After every claim, ask: *so what does that mean for the business?* Answer it before the executive asks it.

---

## Decision Tree

```
What is the primary goal of this story?

├── JUSTIFY PAST INVESTMENT
│   └── Lead with RESULT → Reference SITUATION → Credit the RESOLUTION
│       "Here's what we achieved. Here's why it was worth the investment."

├── BUILD SUPPORT FOR FUTURE INVESTMENT
│   └── Lead with SITUATION + COMPLICATION → Present RESOLUTION as the solution
│       "Here's the problem and its cost. Here's what I'm asking you to fund."

├── EXPLAIN A MISS OR SETBACK
│   └── Lead with SITUATION (honest) → COMPLICATION (what we learned) → RESOLUTION (plan)
│       Never lead with apology. Lead with the honest state. Then the plan.

├── CELEBRATE A WIN
│   └── Lead with RESULT → SITUATION (for context) → credit the team
│       Executives want to know: did the investment pay off, and can we repeat it?

└── ALIGN ON DIRECTION
    └── Lead with SITUATION → COMPLICATION (competing forces) → RESOLUTION (your recommendation)
        You're not telling a story. You're framing a choice.
```

---

## Output

### One-Sentence Version (always produce this first)
> "[Team/product] [did/achieved X] because [problem we were solving], which [result in business terms]."

### Short Version (for async — 3–5 sentences)
```
[Opening: the situation or result — one strong sentence]
[Complication: what the status quo was costing — one sentence with a number]
[Resolution: what was done — one sentence, no jargon]
[Result: what changed — one sentence with business impact]
[Forward: what this enables next — optional, one sentence]
```

### Long Version (for presentations — 3–5 slides or 300–500 words)
```
SLIDE 1 / PARAGRAPH 1 — The Problem
  [Situation + Complication. Make the stakes clear.]

SLIDE 2 / PARAGRAPH 2 — What We Did
  [Resolution. One option, clearly chosen. No "we considered X, Y, and Z" — executives want the choice, not the options.]

SLIDE 3 / PARAGRAPH 3 — What Changed
  [Result. Before → After. Quantified. Connected to business outcome.]

SLIDE 4 / PARAGRAPH 4 — What's Next (optional)
  [One forward-looking statement. What does this enable?]
```

---

## Examples

### Raw engineering update (no story)
> "We completed the migration of the legacy auth service to the new identity platform. 47 PRs merged, 12 engineers contributed, zero downtime. The new service handles 3,000 RPS vs. 800 RPS on the old system."

### Storytelling version
> "Last quarter, our authentication service was a reliability risk and a barrier to scaling. Engineers spent 15% of their time working around its limitations. We replaced it — with zero downtime — and our system can now handle 4x the user load. This removes the primary technical barrier to the growth targets in the H2 plan."

*One-sentence version*: "We replaced our most fragile system, with no downtime, and removed the main technical barrier to our H2 growth targets."

---

## Confidence Score

| Condition | Modifier |
|---|---|
| One-sentence version is clear and compelling | Base: 65% |
| Stakes are quantified (not just described) | +15% |
| Protagonist is customer or business (not technology) | +10% |
| Before and after contrast is explicit | +10% |
| Jargon audit passed | +5% |
| Stakes are vague ("it was slow", "it was risky") | −15% |
| Story is chronological rather than meaning-first | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Technology as protagonist** | Story is about the system, not the business | Ask: who benefits? Make them the protagonist |
| **Missing stakes** | No reason for the audience to care | Name the cost of inaction with a number |
| **Chronological trap** | Story starts with "first we planned, then we built..." | Start with the result or the problem |
| **Option overload** | "We considered A, B, and C..." | Lead with the choice made. Options belong in the appendix. |
| **Metric mismatch** | Metrics that require engineering context to interpret | Translate to business impact before presenting |
| **No one-sentence version** | Story cannot be compressed to one sentence | The story is not ready. Compress it first. |

---

## References

- `skills/executive/executive-communication.md` — Foundation rules (apply before this skill)
- `docs/engineering-playbook.md` → Executive Communication section
- `CLAUDE.md` → "Produce executive summaries before details"

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/executive-status-report.md` | Applies storytelling to recurring status format |
| `skills/executive/quarterly-business-review.md` | The QBR is the full narrative arc at quarter scale |
| `skills/executive/investment-proposal.md` | Investment proposals are Situation → Complication → Resolution → Ask |
| `skills/executive/board-level-summary.md` | Board summaries require the most compressed story form |
