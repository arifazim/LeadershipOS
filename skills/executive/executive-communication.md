# Skill: Executive Communication

**Domain**: Executive
**Owner**: `subagents/executive-summary.md`
**Cadence**: Applied to every upward communication

---

## Purpose

Transform any engineering situation into a communication that a VP, SVP, or C-suite executive can process, act on, and trust — in under two minutes of reading time.

This skill is the foundation for every other skill in `skills/executive/`. Before applying any other executive skill, this one sets the rules of engagement.

**Core translation table:**

| Engineering framing | Executive framing |
|---|---|
| "We have technical debt" | "Our delivery speed will decline 20% by Q3 unless we invest $X now" |
| "The build is flaky" | "Engineers are losing 4 hours/week to unreliable tooling — equivalent to 0.5 FTE" |
| "We're refactoring the auth service" | "We're reducing our incident rate and cutting the risk of a compliance exposure" |
| "Velocity dropped this sprint" | "The payment feature will be delayed 2 weeks — here is the plan to recover" |
| "We have a microservices problem" | "Our architecture is increasing the cost of every new feature — I want to fix this in Q3" |

**Invoke this skill when**: Any content needs to go to a director, VP, or C-suite audience.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Raw content** | The engineering situation, data, or recommendation to be communicated |
| **Audience level** | Director / VP / SVP / CTO / CEO / Board |
| **Communication goal** | Inform / Seek approval / Request resources / Escalate risk / Celebrate outcome |
| **Time available** | Async read (email/doc) or sync presentation (meeting) |

### Optional
| Input | Description |
|---|---|
| **Known executive priorities** | What this executive cares about most this quarter |
| **Prior context** | What they already know — avoid re-explaining |
| **Decisions needed** | What you need from them specifically |

---

## Analysis

### Step 1 — Identify the Business Impact
For every engineering fact, answer: *what does this mean for revenue, cost, customers, or timeline?*

If you cannot answer that question for a piece of content, remove it.

### Step 2 — Apply the BLUF Test
Bottom Line Up Front. The most important sentence goes first. If you find yourself saying "so in conclusion..." the structure is wrong.

### Step 3 — Jargon Audit
Read the output aloud. Every term that requires an engineering background to understand is a jargon violation. Replace it with the business consequence.

Jargon blacklist for executive communication:
`microservices, CI/CD, refactor, velocity, story points, tech debt, PR, latency, throughput, monolith, Kubernetes, SLO, canary, rollback, backlog, sprint`

These are not inherently wrong — they are wrong in executive communication because they require translation that the executive should not have to do.

### Step 4 — Predict the Questions
For every executive audience, list the three most likely questions they will ask. If the communication does not already answer them, add the answers or address them proactively.

Common executive questions by role:

| Role | Most likely questions |
|---|---|
| VP Engineering | "What's the risk to the roadmap? What do you need from me?" |
| CTO | "Is this a one-time issue or a systemic one? What's the architectural implication?" |
| CEO/COO | "Does this affect customers today? What does it cost?" |
| CFO | "What's the dollar impact? Is this in the budget?" |
| Board | "How does this compare to industry? Are we safe?" |

### Step 5 — Structure the Ask
Every executive communication ends with a clear ask, or explicitly states that no action is needed. Ambiguous endings create follow-up meetings that waste everyone's time.

---

## Decision Tree

```
What is the communication goal?

├── INFORM (no action needed)
│   └── Structure: Summary → Data → What's next (automatic)
│       Keep it short. Executives do not need to approve information.

├── SEEK APPROVAL
│   └── Structure: Recommendation → Business case → Options considered → Ask
│       Lead with what you want approved. Then justify it.

├── REQUEST RESOURCES
│   └── Structure: Problem → Cost of inaction → Investment required → ROI → Ask
│       Executives approve resources based on cost of not approving.

├── ESCALATE RISK
│   └── Structure: Risk (in business terms) → Likelihood → Impact → Mitigation → Ask
│       Never bury risk. Lead with it. They are more annoyed by surprises than bad news.

└── CELEBRATE OUTCOME
    └── Structure: What we delivered → Business impact → Credit to team → What's next
        Executives want to know: did we hit the goal, and can the team do it again?
```

---

## Output

Every executive communication must contain these elements in this order:

```
[STATUS SIGNAL: Green | Yellow | Red] (optional but recommended for recurring updates)

SUMMARY
[2–3 sentences. Business outcome first. Engineering detail last or omitted.]
[Confidence level if a prediction or estimate is included.]

[BODY — varies by goal]
[Keep under 1 page for async. Under 3 slides for sync.]

ASK (or "No action needed — sharing for awareness")
[Specific. Named. Time-bound.]
```

---

## Examples

### Before (engineering framing)
> "We had a P2 incident this week caused by a race condition in the message queue consumer. The fix required a hotfix deploy and a config change. MTTR was 3.2 hours. We've opened a ticket to refactor the consumer with proper idempotency handling."

### After (executive framing)
> "A service disruption affected 12% of users for 3.2 hours Thursday. Service was restored before business impact compounded. Root cause was a software defect — fix is deployed. A reliability improvement is scheduled for next sprint to prevent recurrence. No customer escalations received."

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Audience level and goal are known | Base: 70% |
| Business impact is quantified (not estimated) | +15% |
| Prior executive context is known | +10% |
| Jargon audit completed | +5% |
| Questions predicted and pre-answered | +5% |
| Business impact is estimated, not measured | −10% |
| Audience level unknown | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Jargon retention** | Executive asks "what does X mean?" | Re-run Step 3. Every technical term is a failure. |
| **Buried lead** | Most important fact is in paragraph 3 | Move it to sentence 1 |
| **Optionless ask** | "We need your input on what to do" | Provide a recommendation. Executives approve or redirect, they don't generate options. |
| **Missing ask** | Communication ends without a next step | Add "No action needed" or a specific ask |
| **Over-explaining** | 500 words when 100 would work | If the summary says it, the body is optional |
| **False confidence** | "We're on track" with no data | Include the metric that supports the claim |

---

## References

- `CLAUDE.md` → Executive Communication directives
- `docs/engineering-playbook.md` → Executive Communication section
- `subagents/executive-summary.md` → Output templates by audience

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/executive-status-report.md` | Applies this skill to recurring weekly status |
| `skills/executive/executive-storytelling.md` | Narrative technique layer on top of this foundation |
| `skills/executive/executive-risk-report.md` | Applies this skill specifically to risk communication |
| `skills/executive/executive-presence.md` | The in-person application of these same principles |
