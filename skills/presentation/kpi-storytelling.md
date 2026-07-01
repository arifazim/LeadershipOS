# Skill: KPI Storytelling

**Domain**: Presentation
**Owner**: `subagents/executive-summary.md`
**Cadence**: Any time metrics are presented to a non-technical audience

---

## Purpose

Transform raw KPI data into a narrative that executives can act on — turning numbers into a story with a beginning (what we expected), a middle (what actually happened), and an end (what it means and what we're doing about it).

Numbers without narrative are noise. An executive who receives a dashboard of 14 KPIs with no interpretation is not better informed — they're more anxious. The EM's job is not to present data. It is to interpret it, contextualize it, and tell the audience what it means.

**The "so what" test:** For every KPI, ask: "And therefore...?" If the answer is blank, the KPI is not ready to present.

**The 15-minute VP constraint:**
> "I have 15 minutes with the VP. What are the three slides that matter most?"
>
> In a 15-minute metrics conversation, you present **three KPIs maximum**:
> 1. The one that shows overall health (delivery or reliability signal)
> 2. The one that is at risk or declining (the risk signal)
> 3. The one that proves momentum (the win signal)
>
> Every other KPI is backup — show it only if asked.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The KPIs** | The raw metrics with current values |
| **Targets or baselines** | What the expected value is — can't tell a story without a reference point |
| **Time period** | The window being reported on |
| **Audience** | Who is receiving this — determines which KPIs matter most |

### Optional
| Input | Description |
|---|---|
| **Prior period values** | Last week / quarter / year — enables trend narrative |
| **Industry benchmarks** | Accelerate performance bands, industry medians |
| **Root cause** | Why the KPI is where it is |
| **Actions in progress** | What is being done to improve a declining KPI |

---

## Analysis

### Step 1 — Select the Right KPIs for the Audience

**The most important selection rule**: Fewer KPIs always tell a clearer story than more. Every KPI added dilutes the most important one.

| Audience | Max KPIs | Primary KPIs | Secondary (show if asked) |
|---|---|---|---|
| **Board** | 2–3 | Delivery rate, reliability, team size | Cost, incident count |
| **VP / C-Suite** | 4–5 | DORA snapshot, team health, roadmap signal | Hiring pipeline, tech debt trajectory |
| **Director / EM** | 6–8 | Full DORA, SPACE signals, sprint data | All sub-metrics |
| **Engineering team** | Unlimited | Full operational detail | — |

### Step 2 — Apply the "So What" Frame

For every KPI in the narrative:

```
Format: [KPI name] is [value] — [context vs. target or prior period] — and therefore [implication].

Example:
"Deployment frequency is 4 per week — up from 1.5 per week last quarter —
and therefore we can respond to customer feedback 3× faster than we could in H1."

NOT:
"Deployment frequency: 4/week (target: 3/week)"
```

The second version reports. The first version tells a story.

### Step 3 — Signal Color Coding

Before narrative, determine the traffic light for each KPI:

| Signal | Criteria | Narrative opening |
|---|---|---|
| 🟢 **Green** | Within 5% of target or better | "Performing as expected — no action needed." |
| 🟡 **Yellow** | 5–20% below target | "Below target — we're actively managing it. Here's what's happening." |
| 🔴 **Red** | >20% below target or trending wrong | "This is the one metric that needs your attention." |

**Rule**: Never present more than one Red KPI without a mitigation plan. Two Red KPIs without plans is a credibility problem, not a data problem.

### Step 4 — Build the KPI Story Arc

Every KPI narrative has three parts:

```
1. ANCHOR: What we expected / what the target was
2. ACTUALITY: What actually happened — with the number
3. IMPLICATION: What it means and what we're doing about it

Example:
ANCHOR: "We targeted 90% sprint completion this quarter."
ACTUALITY: "We delivered 81% — a 9-point miss — driven by a 4-hour authentication outage in Week 6 consuming 29% of sprint capacity."
IMPLICATION: "The root cause is fixed. Projected Q4 completion returns to 92%. No further action needed from you."
```

---

## Decision Tree

```
What is the overall KPI story for this period?

├── ALL METRICS GREEN
│   └── Story: Brief confirmation + one win highlight + forward look
│       "Engineering performance is healthy across all metrics this period.
│        The standout: [specific KPI] reached [value] — [business implication].
│        We're on track for [next milestone]."
│       Length: 3 sentences. Do not elaborate. Green means nothing needs attention.

├── MIXED METRICS (some Green, some Yellow)
│   └── Story: Lead with overall signal (Yellow) + name the yellow + mitigation + Green wins
│       "Overall status is Yellow — one metric is below target and being actively managed.
│        [Yellow KPI]: [value] vs. [target] — [root cause] — [mitigation in progress].
│        All other metrics are Green. [Highlight one Green win]."
│       Length: 4–6 sentences. Keep focus on the Yellow item.

├── ONE METRIC RED
│   └── Story: Lead with the Red + impact + options + ask
│       Never bury the Red metric after the Green ones. Lead with it.
│       "The [KPI] is Red this period — [value] vs. [target] — [business impact].
│        Here is what's driving it: [root cause]. Here is what we're doing: [mitigation].
│        Here is what I need from you: [specific ask or 'no action needed']."
│       → Invoke: skills/executive/executive-risk-report.md if exec action is needed

└── TREND REVERSAL (was good, now declining)
    └── Story: Name the reversal explicitly — do not hide in averages
        "This metric has been Green for 3 quarters. It turned Yellow this quarter.
         Here is what changed: [specific cause]. Here is my read: [early signal vs. structural].
         Here is what I'm watching: [leading indicator]. I'll flag it the moment I know more."
        Tone: Transparent. The reversal noticed and named is better than the reversal hidden.
```

---

## Output

### KPI Narrative Template

```
KPI NARRATIVE — {{Period}} — {{Team / Product}}
Audience: {{level}} | Time: {{N}} min available for metrics

OVERALL SIGNAL: {{Green 🟢 | Yellow 🟡 | Red 🔴}}
ONE SENTENCE: "{{If they read only this, what should they know?}}"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRIMARY KPI: {{Name}} | {{Value}} | {{🟢/🟡/🔴}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Anchor: "We targeted {{target}}."
Actuality: "We delivered {{value}} — {{vs. target}} — because {{root cause}}."
Implication: "{{And therefore — what it means and what we're doing}}."
Visualization: {{Bar chart with target line | Line chart showing trend | Traffic light}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RISK KPI: {{Name}} | {{Value}} | {{🟡/🔴}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Anchor: "{{target}}"
Actuality: "{{value}} — {{vs. target / prior period}}"
Implication: "{{what we're doing — specific}}"
Ask: {{Specific ask — or "No action needed, flagging for awareness"}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WIN KPI: {{Name}} | {{Value}} | 🟢
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"{{Value}} on {{KPI name}} — {{business meaning in one sentence}}."

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BACKUP KPIs (show only if asked)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• {{KPI}}: {{value}} | {{🟢/🟡/🔴}} — {{one-sentence so what}}
• {{KPI}}: {{value}} | {{signal}} — {{one-sentence so what}}
```

---

## Example

```
KPI NARRATIVE — Q3 Sprint 42 — Platform Engineering
Audience: VP Engineering | 15 min available

OVERALL SIGNAL: 🟡 Yellow
ONE SENTENCE: "Delivery is strong but reliability had a bump — it's fixed and we're back on track."

PRIMARY KPI: Sprint Completion | 94% | 🟢
Anchor: "We targeted 90% sprint completion."
Actuality: "We delivered 94% — 4 points above target — with 38 of 40 story points completed."
Implication: "Engineering is operating at high efficiency. No change needed."
Visualization: Bar chart — 94% actual vs. 90% target line, green bar.

RISK KPI: Change Failure Rate | 8% | 🟡
Anchor: "Target is <3%."
Actuality: "8% this sprint — up from 2% last sprint. Three rollbacks, all from one service."
Implication: "Root cause identified: missing integration test coverage on the payments service.
  Added in Sprint 43. Expect <3% to return next sprint."
Ask: "No action needed — flagging so you're not surprised if you see the number before Sprint 43 closes."

WIN KPI: Deployment Frequency | 5/week | 🟢
"5 deployments per week — up from 1.5/week in Q2. We're now shipping 3× faster than H1."

BACKUP KPIs (show only if asked):
• MTTR: 1.8 hrs avg | 🟢 — well within our 4-hour target
• Team health: Green | 🟢 — no burnout signals in 1:1s this sprint
• PR cycle time: 1.4 days | 🟢 — engineers unblocked; no review bottleneck
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| KPI count is within audience limit | Base: 65% |
| Each KPI has anchor + actuality + implication | +15% |
| Overall signal clearly stated | +10% |
| Risk KPI has mitigation named | +10% |
| "So what" is present for every primary KPI | +10% |
| More KPIs than audience limit | −15% |
| KPI presented without "and therefore" | −10% per KPI |
| Red KPI with no mitigation | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Data dump** | All 14 KPIs presented without narrative | Select 3 for the room. Make the rest appendix. |
| **Missing "so what"** | "Deployment frequency: 4/week" — full stop | Every KPI needs "and therefore [implication]." |
| **Hidden Red** | Red metric buried in a table after the Green ones | Lead with the Red. Executives notice the hide. |
| **No anchor** | "94% completion" — but no target context | Always show the target. Without it, 94% has no meaning. |
| **Trend without direction label** | Line chart going up — but is up good or bad? | Label every trend direction with a conclusion. "Improving" or "Declining" with a note. |

---

## References

- `skills/presentation/visualization-recommendations.md` — Which chart to use for each KPI type
- `skills/executive/executive-status-report.md` — Written KPI narrative format
- `docs/engineering-playbook.md` → DORA Metrics section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/presentation/visualization-recommendations.md` | Visual format for each KPI story |
| `skills/executive/executive-status-report.md` | Written version of the KPI narrative |
| `skills/executive/executive-risk-report.md` | When a Red KPI requires standalone risk escalation |
| `skills/presentation/board-deck.md` | Board-level KPI selection (even stricter) |
