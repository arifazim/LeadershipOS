# Skill: Roadmap Presentation

**Domain**: Presentation
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (planning cycles) + on-demand (new stakeholders, reorg, strategy shifts)

---

## Purpose

Present the engineering roadmap to any audience — from the engineering team to the board — adapting depth, framing, and confidence signaling to what each audience needs to do their job.

The roadmap is the most frequently misrepresented engineering artifact. EMs tend to present the plan they wish they had instead of the plan they actually have. Executives end up confused when reality diverges. Teams end up frustrated when goalposts move without explanation.

**The roadmap presentation has one job**: Build shared understanding of what engineering is building, why, in what order, and with what confidence — so that everyone in the room is working from the same picture.

**The 15-minute VP standard:**
> "I have 15 minutes with the VP. What are the three slides that matter most?"
>
> For a roadmap presentation:
> - **Slide 1**: Now — what we're delivering this quarter (committed, high confidence)
> - **Slide 2**: Next — what we're targeting next quarter (planned, named risks)
> - **Slide 3**: Later — the 6–12 month direction (strategic, acknowledged uncertainty)
>
> The confidence signal is explicit on every horizon. Nothing is implied to be certain.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current quarter commitments** | What is locked — specific deliverables, owners, dates |
| **Next quarter targets** | What is planned — with named risks or dependencies |
| **6–12 month direction** | Strategic themes or capabilities — with acknowledged uncertainty |
| **Audience** | Who is receiving this roadmap presentation |
| **Company strategy connection** | How the roadmap ties to the company's current priorities |

### Optional
| Input | Description |
|---|---|
| **What was planned but slipped** | Prior period misses that affect current roadmap credibility |
| **Dependencies** | Other teams or external factors the roadmap depends on |
| **Resource constraints** | Headcount or budget limitations shaping the roadmap |
| **What's NOT on the roadmap** | Explicitly named items that were deprioritized and why |

---

## Analysis

### Step 1 — Apply the Now / Next / Later Framework

Every roadmap presentation organizes around three time horizons:

| Horizon | Time window | Confidence | Content type |
|---|---|---|---|
| **Now** | Current quarter | High (>85%) | Specific deliverables, owners, launch dates |
| **Next** | Next quarter | Medium (60–85%) | Planned work with named risks and dependencies |
| **Later** | 6–12 months | Low (40–60%) | Strategic themes and directional bets |

**Rule**: Never present Later-horizon work with Now-horizon confidence. This is the most common roadmap presentation failure — treating "we think we'll do this someday" as "we're doing this in Q3."

### Step 2 — Calibrate Depth by Audience

| Audience | Now | Next | Later | Format |
|---|---|---|---|---|
| **Engineering team** | Sprint-level detail | Epic-level | Themes + rationale | Full technical breakdown |
| **VP / Director** | Deliverable + business outcome | Business outcome + risk | Strategic direction | Business outcome focus |
| **C-Suite** | 2–3 key deliverables | 1–2 key bets | 1 strategic direction | Headline only |
| **Board** | Delivery rate + key capabilities | Top bet + key risk | Company strategy alignment | 1–2 sentences per horizon |

### Step 3 — Explicitly Name What's NOT on the Roadmap

The most underused slide in every roadmap presentation is the "What we're not doing" slide. It:
- Demonstrates that the roadmap is prioritized, not just a wish list
- Prevents scope creep from stakeholders who assume their request is "coming soon"
- Shows the trade-offs that were made — building trust with executives who know trade-offs exist

Format:
```
We considered and deprioritized:
• {{Item}} — reason: {{business rationale for deferral}}
• {{Item}} — reason: {{rationale}}

These will be revisited in {{Q or condition that would change the priority}}.
```

### Step 4 — Show Confidence Explicitly

Use visual confidence signals on every roadmap item:

| Signal | Meaning |
|---|---|
| ✅ Committed | High confidence. Scope locked. Team assigned. |
| 🎯 Target | Medium confidence. Planned. Named risks. |
| 🔮 Exploring | Low confidence. Direction only. Subject to change. |
| ⚠️ At risk | Previously committed. Now has a blocker or risk. |

If the roadmap has no confidence signals, every item looks equally certain — which is never true.

---

## Decision Tree

```
What audience is receiving this roadmap presentation?

├── ENGINEERING TEAM
│   └── Frame: Full Now/Next/Later with technical depth
│       Add: Why decisions were made — team deserves context, not just direction
│       Add: What they're not working on and why — prevents "why aren't we doing X?"
│       Time: 45–60 min; this is a dialogue, not a monologue
│       Tone: Transparent. The team knows when the roadmap is aspirational vs. real.
│             Match their reality.

├── VP / DIRECTOR
│   └── Frame: Now/Next/Later with business outcome framing
│       Add: Confidence signals on every item
│       Add: Top risk to current quarter (always)
│       Remove: Sprint-level detail, technical implementation
│       Time: 20–30 min
│       Tone: Confident about Now. Honest about uncertainty in Later.
│       → Invoke: skills/presentation/executive-slide-review.md before presenting

├── C-SUITE (CEO / CTO)
│   └── Frame: Compressed — 3 slides max
│       Slide 1: Now — "This quarter we're delivering [X] and [Y] — both on track"
│       Slide 2: Next — "Q3 target is [bet] — confidence Medium — key risk is [Z]"
│       Slide 3: Later — "H2 direction is [theme] — tied to [company bet]"
│       Time: 15 min
│       → Invoke: skills/presentation/presentation-coach.md for 15-minute prep

└── BOARD
    └── Frame: 1 paragraph in the board deck — not a standalone roadmap
        Content: What engineering is building toward in next 2 quarters and why
        Connect: Every item to a company strategic bet
        Add: One risk to the plan + confidence signal
        → Invoke: skills/presentation/board-deck.md for board-level formatting
```

---

## Output Template

```
ROADMAP PRESENTATION — {{Team / Product}} — {{Quarter}}
Audience: {{level}} | Time: {{N}} minutes
Prepared by: {{EM name}} | Date: {{date}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
NOW — {{Current Quarter}} [High Confidence]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ {{Deliverable}} — {{business outcome}} — {{owner}} — by {{date}}
✅ {{Deliverable}} — {{business outcome}} — {{owner}} — by {{date}}
⚠️ {{Deliverable}} — AT RISK — {{reason}} — mitigation: {{plan}}

Confidence in full quarter delivery: {{High | Medium}} — {{one sentence rationale}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
NEXT — {{Next Quarter}} [Medium Confidence]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 {{Deliverable}} — {{business outcome}} — dependency: {{named dependency}}
🎯 {{Deliverable}} — {{business outcome}} — risk: {{named risk}}

Confidence: Medium — {{what would move this to High or Low}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
LATER — {{6–12 Month Direction}} [Direction Only]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔮 {{Theme}} — {{why this matters strategically}}
🔮 {{Theme}} — {{why this matters strategically}}

Note: Later-horizon items are directional. Scope, timing, and sequencing
will be determined as we approach. They are not commitments.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WHAT WE'RE NOT DOING (and why)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• {{Item}} — deprioritized because {{business rationale}}
• {{Item}} — deprioritized because {{rationale}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TOP RISK TO THIS PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{One risk — in business terms — with likelihood and mitigation}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ASK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Specific ask — or "No decisions needed. Sharing for alignment."}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Now/Next/Later framework applied | Base: 65% |
| Confidence signals present on every item | +10% |
| "What we're not doing" section present | +10% |
| Later-horizon clearly marked as directional | +10% |
| Top risk named | +5% |
| All items presented with equal confidence | −20% |
| No "what we're not doing" context | −10% |
| Later-horizon items framed as commitments | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Equal confidence on all items** | Everything looks committed | Apply ✅/🎯/🔮 signals. Confidence differentiates a real plan from a wish list. |
| **No deprioritized items** | Roadmap looks like everything is included | Every roadmap is a set of choices. Name what was not chosen and why. |
| **Later items as commitments** | "We'll ship X in Q4" for something in the 9-month horizon | "We're exploring X for H2" — explicit uncertainty on direction items. |
| **Strategy-roadmap disconnect** | Roadmap items have no connection to company priorities | Every Now and Next item should tie to a company bet or stated goal. |
| **No risk** | Clean roadmap with no risks named | Name the top risk to the current quarter. Audiences know risks exist. |

---

## References

- `skills/executive/annual-planning.md` — Annual plan that generates the roadmap
- `skills/product/update-roadmap.md` — Product partner skill for roadmap updates
- `docs/engineering-playbook.md` → Roadmaps section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/annual-planning.md` | Annual plan is the source of the Later horizon |
| `skills/product/align-stakeholders.md` | Alignment needed before roadmap is presented publicly |
| `skills/presentation/executive-slide-review.md` | Review the roadmap deck before VP or executive presenting |
| `skills/presentation/board-deck.md` | Board-level version of the roadmap (compressed) |
