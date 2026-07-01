# Skill: Executive Priorities

**Domain**: Organizational
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (recalibrate) + On-demand (board cycle, strategy shift, leadership change)

---

## Purpose

Understand what executives actually care about — not just what they publicly state — so that engineering investment, communication, and escalation are calibrated to real organizational priorities rather than to last quarter's talking points.

**What the EM does automatically**: When assessing executive priorities, the EM:
1. Distinguishes stated priorities from revealed priorities (where attention and budget actually go)
2. Maps which engineering decisions connect to each executive's top concerns
3. Identifies when engineering work is invisible to executive attention — and when that's a risk
4. Detects when executive priorities have shifted but engineering hasn't reoriented
5. Recommends transparent, business-framed communication calibrated to what each executive is actually solving

**Ethical principle**: Understanding executive priorities is used to communicate engineering value in terms that matter and to align engineering investment with organizational goals — not to tell executives what they want to hear, not to gain favor by gaming their attention, and not to suppress legitimate technical concerns because they're inconvenient. If the executive's revealed priority creates risk, the EM names that risk directly.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Stated priorities** | OKRs, strategy memos, all-hands presentations, public commitments |
| **Observed behavior** | Where executive time, attention, and budget actually go |
| **Recent decisions** | What got approved, delayed, and cancelled in the last two quarters |

### Optional
| Input | Description |
|---|---|
| **Board-level context** | What pressures the board is creating (growth, profitability, risk) |
| **Market context** | Competitive moves, customer demands, regulatory changes shaping executive concern |
| **Leadership team dynamics** | Which executive relationships are strongest; who has the most influence on the CEO |

---

## Analysis

### Step 1 — Revealed vs. Stated Priority Gap

```
Stated priority: What the executive says matters
  Sources: OKR documents, all-hands presentations, strategy memos

Revealed priority: What actually gets time, attention, and budget
  Sources: Which meetings the executive cancels vs. attends
           Which emails they respond to quickly
           Which budget requests get approved vs. deferred
           What topics they ask about in 1:1s
           Which decisions they choose to make personally

Gap detection:
  Stated: "Quality is a top priority."
  Revealed: Zero investment in QA tooling; no engineering budget approved for reliability.
  Gap: Quality is stated but not funded — treat it as a medium priority, not a top priority.

Why this matters:
  An engineering proposal framed against a stated priority that isn't actually funded
  or attended to will stall. Frame against the revealed priority to move.
```

### Step 2 — Map Engineering's Visibility Against Executive Priorities

```
For each executive who influences engineering decisions:

Executive: {{name}}
Stated top priorities: {{list from OKRs or recent communication}}
Revealed top priorities (from observed behavior): {{list}}
Gap: {{areas where stated ≠ revealed}}

Engineering work connecting to their revealed priorities:
  Direct connection: {{engineering initiative}} → {{executive concern}}
  Indirect connection: {{engineering initiative}} → {{what it enables}} → {{executive concern}}
  No visible connection: {{engineering work that executive would not recognize as relevant}}

Implication:
  Work with no visible connection to executive priorities is at risk of being cut,
  deprioritized, or questioned. This is not always wrong — some engineering work
  is foundational and doesn't need executive visibility. But foundational work should
  be communicated in terms of what it protects, not just what it is.
```

### Step 3 — Assess the Five Signals in Executive Context

```
Signal 1 — Frequent decision reversals
  Executive context: An executive priority shifted and engineering wasn't notified
  Pattern: Initiative was approved; priority changed; initiative quietly cancelled or stalled
  Response: Build a 90-day check-in into any multi-quarter commitment to verify
  priorities haven't shifted; don't assume approved = permanent

Signal 2 — Exclusion from key meetings
  Executive context: Engineering is absent from executive meetings where product
  and technology direction is being set
  Pattern: Decisions arrive from executive level as directives with no engineering input
  Response: Request a regular touchpoint with the relevant executive or their delegate
  Frame: "I want to make sure engineering input is available when technical feasibility
  and timing are being discussed at your level."

Signal 3 — Ownership ambiguity
  Executive context: Two executives have competing priorities that create conflicting
  direction for engineering
  Pattern: EM receives direction from two sources that cannot both be satisfied
  Response: Escalate the conflict explicitly — not as a complaint, but as a clarity request:
  "I'm receiving conflicting priorities from {{A}} and {{B}}. I need one direction."

Signal 4 — Escalation patterns
  Executive context: Engineering escalations to executives aren't getting traction
  Pattern: Issues escalated to executive level, acknowledged but not resolved
  Response: Reframe the escalation in business terms; the current framing may not
  connect to what the executive is actually trying to solve

Signal 5 — Misaligned incentives
  Executive context: Executive's personal success metric creates a structural conflict with engineering
  Pattern: Executive rewards speed above all; engineering needs to slow down for quality
  Response: Name the tension with data: "The current incentive toward speed is creating
  a quality debt that will affect {{business outcome}}. Here's the data."
```

### Step 4 — Build the Executive Priority Map

```
For each relevant executive, produce:
  Top 3 revealed priorities: What they are actually solving right now
  Engineering's alignment to those priorities: High / Medium / Low / None
  Communication reframe needed: How to translate current engineering work into their terms
  Risk if unaligned: What happens to engineering investment if this executive
  doesn't understand engineering's contribution to their priority

Example translation:
  Engineering priority: "Migrate to microservices for better scalability"
  Executive priority (revealed): "We need to ship to enterprise customers 3× faster"
  
  Wrong frame (engineering language):
  "We're migrating to microservices to improve system scalability."
  
  Right frame (executive language):
  "The current architecture limits how fast we can ship separate features to different
  enterprise customers. The migration gives us independent deployment per customer segment,
  which enables the 3× faster delivery timeline you've set as a target."
```

---

## Decision Tree

```
What does the executive priority analysis reveal?

├── ENGINEERING WORK INVISIBLE TO EXECUTIVE PRIORITIES
│   └── Assess: Is this by design (foundational work) or by oversight (communication gap)?
│       If by design: Ensure one-sentence executive framing exists for any budget question
│       If by oversight: Identify which executive priority it actually serves; reframe
│       Frame to executive: "{{Engineering work}} is what enables {{executive priority}}.
│       Without it, {{risk to the thing they care about}}."

├── EXECUTIVE PRIORITY SHIFTED BUT ENGINEERING HASN'T REORIENTED
│   └── This is a strategic drift risk — engineering building toward last quarter's goal
│       Immediately verify: Are current Q priorities confirmed with PM/leadership?
│       Flag: "Our current roadmap reflects {{prior priority}}. I want to confirm
│       this is still the right direction given {{new signal}}."
│       → Invoke: skills/product/okr-alignment.md to check current alignment score

├── CONFLICTING EXECUTIVE PRIORITIES (two executives pulling in different directions)
│   └── Do NOT choose sides or silently optimize for one
│       Surface the conflict directly: "I'm getting direction from {{A}} and {{B}}
│       that I can't simultaneously satisfy. Here's the tension: {{specific conflict}}.
│       I need alignment before I can make the right tradeoff."
│       Escalate to: Whichever executive can resolve it (usually their shared leader)

├── ESCALATIONS NOT GETTING TRACTION
│   └── Reframe diagnosis: Is the escalation in the right terms?
│       Test: Does the escalation connect to a revealed priority?
│       If not: Rewrite using the executive priority map
│       "This is a {{business risk}} to {{specific executive priority}}" lands differently
│       than "We have a technical problem."

└── EXECUTIVE PRIORITIES ARE UNDERSTOOD AND ENGINEERING IS ALIGNED
    └── Refresh quarterly — priorities shift with board cycles and market conditions
        Before any major engineering proposal: recheck alignment to current revealed priorities
```

---

## Output

### Executive Priority Map

```
EXECUTIVE PRIORITY MAP — {{date}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EXECUTIVE: {{name}} | Role: {{title}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Stated priorities: {{from OKRs/comms}}
Revealed priorities:
  1. {{priority}} — Evidence: {{observed behavior}}
  2. {{priority}} — Evidence: {{approved budget, attended meeting, rapid response}}
  3. {{priority}} — Evidence: {{personal follow-up, direct asks}}

Stated/Revealed gap: {{where these differ and why it matters}}

Engineering alignment to revealed priorities:
  High: {{which engineering work directly serves their concerns}}
  Medium: {{which connects indirectly}}
  None/At risk: {{which has no visible connection — needs reframing}}

Communication translations:
  Engineering: "{{technical description}}"
  → Executive frame: "{{business outcome, their language}}"

Signals detected:
  ⚠️ {{Signal type}}: {{specific observation}} — Response: {{transparent action}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRIORITY CONFLICTS (across executives)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Executive A}} priority: {{description}}
{{Executive B}} priority: {{description}}
Conflict: {{specific tension for engineering}}
Escalation path: {{shared authority who can resolve}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Revealed priorities assessed (not just stated) | Base: 65% |
| Communication translation produced per executive | +15% |
| Five signals assessed in executive context | +10% |
| Priority conflicts across executives identified | +10% |
| Ethical framing maintained (not flattery or gaming) | +5% |
| Only stated priorities used | −25% |
| No communication translation | −15% |
| Framing designed to manipulate rather than inform | −50% (disqualifying) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Stated = revealed assumption** | Engineering communicates against OKR language that isn't actually driving decisions | Track where executive attention goes, not just what they say. Behavior reveals priority. |
| **Technical framing only** | Engineering proposals in technical terms that don't connect to executive concern | Translate every engineering proposal into the business outcome it enables for the specific executive audience. |
| **Suppressing inconvenient truths** | EM avoids surfacing technical risk because it conflicts with executive narrative | Executive priority calibration is not about telling them what they want to hear. Risk must be named even when inconvenient. |
| **Priority assumed as permanent** | Current quarter's approval treated as permanent green light | Executive priorities shift with board cycles, market conditions, and leadership changes. Recheck quarterly. |
| **Conflicting priorities absorbed** | EM silently optimizes for one executive when two conflict | Name the conflict. Absorbing it produces a wrong outcome for at least one executive and protects no one. |

---

## References

- `skills/organizational/influence-map.md` — Informal influence shapes what executives actually attend to
- `skills/organizational/stakeholder-analysis.md` — Executives are a tier of the stakeholder map
- `skills/organizational/political-risk.md` — Misaligned priorities and invisible work create political risk
- `skills/executive/quarterly-business-review.md` — QBR is the most direct executive priority alignment event

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/organizational/influence-map.md` | Informal networks shape what executives prioritize |
| `skills/organizational/alignment-health.md` | Executive misalignment is a component of org alignment health |
| `skills/organizational/political-risk.md` | Engineering invisible to executive priorities is at political risk |
| `skills/product/okr-alignment.md` | Engineering-to-OKR alignment is one layer of executive priority alignment |
