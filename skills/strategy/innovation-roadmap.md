# Skill: Innovation Roadmap

**Domain**: Strategy
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (pipeline review) + Annual (portfolio construction) + On-demand (new technology signal)

---

## Purpose

Build and manage a structured innovation pipeline — from early exploration to validated bets — so that the engineering organization develops strategic capabilities ahead of market demand rather than reacting to it after competitors have moved.

**What the EM does automatically**: For the innovation portfolio, the EM:
1. Maintains a staged pipeline of technology bets at different maturity levels
2. Applies time-boxed experiments to validate or kill bets before significant investment
3. Connects innovation bets to 2–3 year strategic capability requirements
4. Surfaces innovation investments at risk of being crowded out by tactical work
5. Produces a graduation rate: what fraction of bets mature into roadmap items

An engineering team that does only execution work will be technically capable of building what was defined 18 months ago. The innovation roadmap is the mechanism for building what will be needed 18 months from now.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current innovation bets** | All active exploratory work, however informal |
| **Company 3-year strategy** | Where the business needs to be in 3 years |
| **Technology signals** | Emerging technologies, competitor capabilities, customer requests that don't fit current product |
| **Available R&D capacity** | Engineering time allocated to exploratory work |

### Optional
| Input | Description |
|---|---|
| **Market research** | Customer and analyst signals on emerging needs |
| **Prior experiment results** | Validated and killed bets from previous cycles |
| **Patent or standards activity** | Early signals from industry forums, standards bodies |
| **Adjacent technology bets** | Investments in adjacent domains that could apply |

---

## Analysis

### Step 1 — Stage the Innovation Pipeline

Every innovation bet exists at one of four maturity stages. Stage determines the investment level and governance:

| Stage | Name | Definition | Max investment | Decision gate |
|---|---|---|---|---|
| **Stage 0** | Explore | Hypothesis only; no engineering work | 0 person-weeks | Include in pipeline? |
| **Stage 1** | Spike | Time-boxed research to validate technical feasibility | 1–2 person-weeks | Kill / Advance to Stage 2 |
| **Stage 2** | Prototype | Working proof-of-concept; validates user value | 2–6 person-weeks | Kill / Advance to Stage 3 |
| **Stage 3** | Pilot | Limited production deployment; validates business value | 4–12 person-weeks | Kill / Graduate to roadmap |
| **Graduated** | Roadmap | Validated bet; moves to strategic roadmap | Full investment | Standard planning |

**Stage gate rule**: No bet advances without a named outcome from its current stage. "We learned X" or "We validated Y" — not "we need more time."

### Step 2 — Apply the Time-Box Discipline

```
Innovation bets that expand without stage gates become hidden strategic investments.
Every bet must have:
  - Named hypothesis: "We believe {{technology}} will enable {{capability}} for {{customer segment}}"
  - Stage-appropriate time box: enforced, not advisory
  - Kill criteria: under what conditions do we stop? (Stated before the experiment begins)
  - Success criteria: what outcome advances the bet to the next stage?

Time-box discipline prevents two failure modes:
  Too little: Bet killed before meaningful signal
  Too much: Bet continued past signal; momentum replaces evidence
```

### Step 3 — Connect Bets to Strategic Capability Gaps

```
For each innovation bet, trace to a 2–3 year strategic capability requirement:

Innovation bet → Capability it builds → Strategic gap it closes → Company bet it enables

Example:
  Bet: LLM-assisted code review (Stage 2)
  Capability: AI-augmented development workflow
  Gap: Developer productivity; inability to scale output without proportional headcount
  Company bet: "Double shipping velocity without doubling headcount by 2027"

If a bet cannot be traced to a company bet or capability gap: kill it or park it.
Innovation for its own sake is a hobby, not a strategy.
```

### Step 4 — Calculate the Innovation Portfolio Health

```
Portfolio health metrics:
  Pipeline depth: How many bets at each stage?
  Graduation rate: (Bets graduated to roadmap) ÷ (Total bets entered pipeline) — target 20–30%
    Too high (>50%): Insufficient rigor; advancing bets without validation
    Too low (<10%): Over-selecting; killing good bets too early or not enough bets in pipeline
  Time to graduation: Average quarters from Stage 0 to Graduated
    Target: 2–4 quarters from Spike to Graduated
  R&D investment as % of total engineering: Target 5–10%
  Kill ratio: % of bets killed at each stage — healthy to have high kill rate at Stage 1
```

---

## Decision Tree

```
What does the innovation pipeline assessment reveal?

├── NO STAGE 0 OR STAGE 1 BETS (empty exploration pipeline)
│   └── Flag: "The innovation pipeline has no early-stage bets.
│       In 2–3 years, there will be nothing graduating to the roadmap.
│       We are executing today's strategy with no investment in tomorrow's."
│       Action: Schedule a technology horizon scan; identify 3–5 hypotheses
│       → Invoke: skills/strategy/investment-planning.md to protect R&D allocation

├── BET STUCK AT SAME STAGE FOR 2+ QUARTERS
│   └── Two possible causes:
│       A) Not enough investment (time-box too small) → Increase allocation or kill
│       B) No clear success criteria (undefined hypothesis) → Define and restart clock
│       Do NOT: Let bets linger without a gate decision
│       Frame: "{{Bet}} has been at Stage {{N}} for {{N}} quarters without a stage gate decision.
│       Decide: Kill, increase investment, or advance with current evidence."

├── R&D ALLOCATION CROWDED OUT (< 3% of engineering capacity)
│   └── Flag: "Innovation investment has dropped to {{N}}% of engineering capacity.
│       The organization is consuming its future to fund the present."
│       Frame the cost: "Eliminating R&D saves {{N}} person-weeks this quarter.
│       It costs the organization 2–3 years of capability development."
│       → Invoke: skills/strategy/investment-planning.md to rebalance portfolio

├── BET READY TO GRADUATE (Stage 3 pilot successful)
│   └── Move from innovation track to strategic roadmap
│       Assign full investment, owner, and delivery timeline
│       Document what was learned and how the bet was validated
│       → Invoke: skills/strategy/investment-planning.md to add to portfolio

└── PIPELINE IS HEALTHY (bets at multiple stages, graduation rate 20–30%)
    └── Quarterly review: advance, kill, or hold each bet
        Publish pipeline to leadership (demonstrates future capability investment)
        Protect R&D allocation in next planning cycle
```

---

## Output

### Innovation Pipeline Dashboard

```
INNOVATION ROADMAP — {{Quarter}} — {{Team}} — {{date}}

PIPELINE HEALTH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total bets in pipeline: {{N}}
R&D investment: {{N}} person-weeks ({{N}}% of engineering capacity) | Target: 5–10%
Graduation rate (trailing 4Q): {{N}}% | Target: 20–30%
Time to graduation (avg): {{N}} quarters

STAGE DISTRIBUTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Stage 0 (Explore):   {{N}} bets | {{N}}w allocated
Stage 1 (Spike):     {{N}} bets | {{N}}w allocated
Stage 2 (Prototype): {{N}} bets | {{N}}w allocated
Stage 3 (Pilot):     {{N}} bets | {{N}}w allocated
Graduated (Q{{N}}):  {{N}} bets

BET REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Bet              | Stage | Hypothesis                   | Weeks | Gate date | Status
{{bet name}}     | 1     | {{hypothesis}}               | {{N}} | {{date}}  | On track
{{bet name}}     | 2     | {{hypothesis}}               | {{N}} | {{date}}  | ⚠️ Overdue
{{bet name}}     | 3     | {{hypothesis}}               | {{N}} | {{date}}  | On track → Graduate?

STRATEGIC CAPABILITY MAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Company Bet        | Capability Required | Bets in Pipeline     | Gap Risk
{{company bet}}    | {{capability}}      | {{bet names}}        | {{Low/Med/High}}
{{company bet}}    | {{capability}}      | NONE                 | 🔴 HIGH — no bets

FLAGS
⚠️ {{Pipeline empty, bet stuck, or R&D allocation crowded out}}
🚀 {{Bet ready to graduate to roadmap}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All bets staged with time-box and kill criteria | Base: 65% |
| Bets connected to strategic capability gaps | +15% |
| Graduation rate tracked | +10% |
| R&D allocation as % of total investment monitored | +10% |
| Strategic capability map produced | +5% |
| Bets without stage gates or time-boxes | −20% |
| No connection to company strategy | −20% |
| Graduation rate not tracked | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Innovation without time-boxes** | Exploratory work expands indefinitely | Every bet has a stage gate. Time-boxes are enforced, not advisory. |
| **No kill criteria** | Bets advanced based on momentum, not evidence | Define kill criteria before the experiment. "If we don't see X by Y date, we stop." |
| **R&D crowded out** | Innovation allocation drops to zero under delivery pressure | R&D allocation is non-negotiable. Small consistent investment (5%) compounds. |
| **No strategic connection** | Bets are technically interesting but disconnected from company goals | Trace every bet to a strategic capability gap. Interesting ≠ valuable. |
| **Graduation rate not tracked** | No visibility into whether innovation is producing roadmap items | Track graduation rate quarterly. It is the most important innovation health metric. |

---

## References

- `skills/strategy/investment-planning.md` — Innovation bets are the exploratory investment category
- `skills/strategy/platform-strategy.md` — Some innovation bets mature into platform investments
- `skills/strategy/annual-planning.md` — Graduated bets enter annual plan as strategic initiatives
- `skills/strategy/risk-planning.md` — Gaps in innovation pipeline are a strategic risk

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/investment-planning.md` | R&D allocation protected in investment portfolio |
| `skills/strategy/annual-planning.md` | Graduated bets enter annual strategic plan |
| `skills/strategy/platform-strategy.md` | Innovation bets often graduate into platform investments |
| `skills/strategy/risk-planning.md` | Empty pipeline is a strategic risk |
