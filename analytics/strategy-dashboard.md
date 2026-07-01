# Dashboard: Strategy Dashboard

**Domain**: Leadership Analytics
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM + executives + product leadership
**Cadence**: Monthly refresh; quarterly strategic review alignment

---

## Purpose

Give the EM and leadership a clear view of whether engineering is executing against the strategy — not just delivering features, but generating customer impact, building organizational capability, and investing in the innovations that create future competitive advantage. Surface when execution has drifted from strategy before the gap becomes a credibility problem.

**Primary questions this dashboard answers:**
- Is the team delivering what matters, or what is easy?
- Are we investing appropriately in innovation relative to maintenance?
- What is the measurable impact of engineering's work on customers and the business?

---

## Inputs

| Source | Metric Fed |
|---|---|
| Sprint data + roadmap | Delivery Confidence |
| Customer incident history + feature outcomes | Customer Impact Score |
| Capacity allocation data | Innovation Score |
| `skills/meetings/decision-log.md` + architecture health | Roadmap Confidence |
| DORA metrics | Technical delivery component |
| `confidence-engine/` | Architectural Confidence component |

---

## Analysis

### Metric 1 — Delivery Confidence (0–100)

```
Source: DORA metrics + sprint commitment + roadmap execution rate

DORA COMPOSITE (0–80):
  Same scoring as executive-dashboard.md — each DORA metric 0–20

ROADMAP EXECUTION RATE (0–20):
  % of quarterly roadmap commitments delivered vs. committed
  >90%: 20 | 75–89%: 15 | 60–74%: 10 | <60%: 5

DELIVERY CONFIDENCE = DORA Composite (0–80) + Roadmap Execution (0–20)

THRESHOLDS:
  80–100: Elite — engineering delivery is a competitive advantage
  60–79: High — reliable delivery; specific process improvements available
  40–59: Medium — delivery is unpredictable; investment in process and tooling required
  <40: Low — delivery confidence is a business risk; structural intervention needed

DELIVERY TREND (3-quarter history):
  Q-2: {{score}} | Q-1: {{score}} | Current: {{score}}
  Trend: {{Improving / Stable / Declining}}
  Declining delivery confidence is more concerning than absolute score — signals compounding friction

PREDICTABILITY GAP:
  If DORA is high but roadmap execution is low: the team can deploy quickly but can't commit accurately
  Root cause: Estimation quality; scope creep; dependency management
  If roadmap execution is high but DORA is low: can commit accurately but deploys slowly
  Root cause: CI/CD maturity; review process; infrastructure investment
```

### Metric 2 — Customer Impact Score (0–100)

```
Source: Feature delivery + quality signal + outcome data

Shared with executive-dashboard.md; additional strategic framing here.

5 FACTORS (0–20 each):

Factor 1 — Strategic Feature Delivery Rate (0–20)
  % of features on the strategic roadmap (not all features — specifically strategic ones) delivered
  >90%: 20 | 75–89%: 15 | 60–74%: 10 | <60%: 5

  Strategic features = those explicitly connected to a company OKR or strategic priority
  Tactical features (bug fixes, maintenance, minor improvements) excluded from this metric

Factor 2 — Quality at Delivery (0–20)
  Inverse of defects introduced per strategic release
  0 P1 defects, <3 P2 defects per release: 20 | 1 P1 or 3–5 P2s: 15 | 2 P1s or 6–10 P2s: 10 | >2 P1s: 5

Factor 3 — Customer Outcome Realization (0–20)
  % of shipped strategic features with positive customer outcome signal within 60 days
  (Usage rate / retention impact / support ticket deflection / revenue attribution)
  >70%: 20 | 50–69%: 15 | 30–49%: 10 | <30%: 5

Factor 4 — Time to Customer Value (0–20)
  Cycle time from feature commit to customer-facing delivery
  <2 weeks: 20 | 2–4 weeks: 15 | 4–8 weeks: 10 | >8 weeks: 5

Factor 5 — Customer Trust Reliability (0–20)
  Customer-perceived uptime and service quality
  >99.9% uptime, <1 P1/month: 20 | 99.5–99.9%, 1 P1/month: 15 | 99.0–99.5%, 2–3 P1s: 10 | <99%: 5

CUSTOMER IMPACT SCORE = Sum of 5 factors (0–100)

STRATEGIC ALIGNMENT CHECK:
  Are the highest-impact deliveries on the strategic roadmap?
  Or is the team delivering what's in the backlog rather than what the strategy requires?
  Alignment gap: high delivery rate, low strategic feature %, low customer outcome realization
  Signal: team is busy, not impactful; activity ≠ strategic output
```

### Metric 3 — Innovation Score (0–100)

```
Measures whether the team is investing in capabilities that create future value,
not just maintaining the present.

5 INNOVATION FACTORS (0–20 each):

Factor 1 — New Capability Ratio (0–20)
  % of engineering capacity allocated to genuinely new capabilities
  (vs. feature maintenance, bug fixing, tech debt, and keep-lights-on)

  Capacity allocation target (healthy mix):
    New capabilities: 30–40%
    Incremental improvement: 20–30%
    Technical investment (debt, infrastructure, tooling): 20–25%
    Keep-lights-on (on-call, bug fixing, support): 10–20%

  Score:
    New capability 30–40%: 20 | 20–29%: 15 | 10–19%: 10 | <10%: 5
    Above 40%: assess quality of new capabilities before rewarding — volume without quality is waste

Factor 2 — Technical Investment Rate (0–20)
  % of capacity allocated to technical improvements that increase future velocity
  (CI/CD, observability, tooling, platform improvements, test coverage)
  15–25%: 20 | 10–14%: 15 | 5–9%: 10 | <5%: 5
  <5%: technical debt is accumulating faster than it's being addressed; future velocity is declining

Factor 3 — Architecture Quality Index (0–20)
  ADR coverage + tech debt trend + dependency hygiene

  ADR coverage (% of significant systems with current ADR): 0–8
    >80%: 8 | 60–79%: 6 | 40–59%: 4 | <40%: 2

  Tech debt trend (is tech debt growing, stable, or shrinking?): 0–6
    Shrinking: 6 | Stable: 4 | Slowly growing: 2 | Rapidly growing: 0

  Dependency hygiene (critical dependencies updated within 12 months?): 0–6
    >90% current: 6 | 70–89%: 4 | 50–69%: 2 | <50%: 0

Factor 4 — Experimentation Rate (0–20)
  Structured experiments (A/B tests, proof-of-concepts, technical spikes) completed per quarter
  4+ with documented outcomes: 20 | 2–3: 15 | 1: 10 | 0: 5

  Experimentation without documented outcomes does not count — learning requires capture

Factor 5 — Innovation Outcome (0–20)
  New capabilities that produced measurable business value in the last 12 months
  3+ capabilities with attributed outcome (revenue / retention / cost reduction / competitive): 20
  1–2 with attributed outcome: 15 | Delivered but outcome not measured: 10 | None: 5

INNOVATION SCORE = Sum of 5 factors (0–100)

THRESHOLDS:
  80–100: Innovation-forward — engineering creating future competitive advantage
  60–79: Balanced — incremental investment; specific innovation gaps
  40–59: Maintenance-heavy — team is executing the present; future velocity is declining
  <40: Technical stagnation — team is in keep-lights-on mode; strategic capability is eroding

INNOVATION EROSION SIGNAL:
  If innovation score declines for 2+ consecutive quarters: escalate to leadership
  "We are spending [X%] of capacity on maintenance. In 12 months, this will [specific consequence]."
  This is a resource allocation conversation, not a team performance conversation.
```

### Metric 4 — Roadmap Confidence (0–100)

```
Measures how trustworthy the roadmap is as a planning artifact.

4 CONFIDENCE FACTORS (0–25 each):

Factor 1 — Currency (0–25)
  Is the roadmap up to date and reflecting current priorities?
  Updated this month, capacity-planned: 25 | 1–2 months stale: 18 | 3+ months stale: 10 | No roadmap: 0

Factor 2 — Capacity Realism (0–25)
  Is the roadmap achievable at current capacity?
  Planned to 80% of capacity (buffer for unplanned work): 25
  Planned to 100% (no buffer): 18
  Planned to >100% (over-committed): 8
  Not capacity-planned: 0

Factor 3 — Stakeholder Alignment (0–25)
  Do key cross-functional stakeholders agree with the roadmap priorities?
  All key stakeholders aligned: 25 | Most aligned; 1–2 minor disagreements: 18 |
  Significant misalignment on 1+ items: 10 | Roadmap not shared with stakeholders: 0

Factor 4 — Strategic Connectivity (0–25)
  % of roadmap items explicitly connected to a company OKR or strategic initiative
  >80%: 25 | 60–79%: 18 | 40–59%: 10 | <40%: 5
  Low strategic connectivity = team is executing a backlog, not a strategy

ROADMAP CONFIDENCE = Sum of 4 factors (0–100)

THRESHOLDS:
  80–100: High — roadmap is a trusted artifact; planning on it is low-risk
  60–79: Adequate — some gaps; revisit currency and alignment quarterly
  40–59: Low — roadmap drift is occurring; re-planning needed before next quarter
  <40: Unreliable — do not commit to roadmap to executive until confidence is restored
```

---

## Decision Tree

```
What does the Strategy Dashboard reveal?

├── DELIVERY CONFIDENCE <60
│   └── Identify the lowest DORA dimension + roadmap execution gap
│       DORA bottleneck → specific process or tooling investment
│       Roadmap execution low → estimation quality / scope creep / dependency management
│       Present the gap to executive with a specific recovery plan and timeline

├── CUSTOMER IMPACT SCORE <60
│   └── Identify the lowest factor:
│       Strategic delivery low → are we shipping the right things?
│       Outcome realization low → are features working? Product-engineering alignment needed
│       Quality low → defect prevention investment; quality metrics by team
│       Reliability low → on-call structure; SRE investment; architecture review

├── INNOVATION SCORE <60
│   └── Investigate capacity allocation:
│       New capability <20% of capacity → team is in maintenance mode; strategic risk
│       Technical investment <10% → tech debt accelerating; future velocity declining
│       Experimentation rate 0 → no learning system; organization is not adapting
│       Present to leadership: "We are spending [X%] on maintenance. In [N] months: [consequence]."

├── INNOVATION DECLINING FOR 2+ QUARTERS
│   └── Escalate — do not wait for 3rd quarter
│       Root cause: increasing operational burden? Growing tech debt? Resource constraints?
│       Executive conversation: "Our innovation capacity has declined from [%] to [%].
│       Without intervention, [specific future consequence]."
│       Resource ask: additional capacity / contractor support / tech debt sprint

├── ROADMAP CONFIDENCE <60
│   └── Identify which factor is lowest:
│       Currency: update the roadmap before any executive or planning conversation
│       Capacity realism: remove commitments until roadmap is at 80% capacity or below
│       Stakeholder misalignment: alignment meeting before next sprint planning
│       Strategic connectivity: connect each roadmap item to a specific company OKR

├── DELIVERY HIGH, INNOVATION LOW (common failure pattern)
│   └── This is the "running to stand still" signal:
│       Team is delivering consistently but not creating future capability
│       Roadmap is clearing the backlog without building organizational advantage
│       Strategic conversation: "We are execution-strong but not innovation-forward.
│       Here's what needs to change in the next quarter's capacity allocation."

└── ALL SCORES >75
    → Quarterly: Is the innovation investment producing outcomes, or just activity?
    → Trend analysis: Is delivery confidence improving, stable, or declining?
    → Forward risk: What is the one strategic risk that current execution doesn't address?
```

---

## Output

### Strategy Dashboard Scorecard

```
STRATEGY DASHBOARD — {{Team/Org}} — {{Date}}

COMPOSITE SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Delivery Confidence:   {{0–100}} | {{Elite / High / Medium / Low}}
Customer Impact Score: {{0–100}} | {{Strong / Adequate / Concern / Crisis}}
Innovation Score:      {{0–100}} | {{Innovation-forward / Balanced / Maintenance-heavy / Stagnant}}
Roadmap Confidence:    {{0–100}} | {{High / Adequate / Low / Unreliable}}

DELIVERY CONFIDENCE (DORA + Roadmap)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Deployment Frequency: {{value}} → {{0–20}} pts
Lead Time:           {{value}} → {{0–20}} pts
Change Failure Rate: {{%}} → {{0–20}} pts
MTTR:               {{value}} → {{0–20}} pts
Roadmap Execution:   {{%}} → {{0–20}} pts
3-Quarter Trend: {{Q-2 score}} → {{Q-1 score}} → {{current}} | {{Improving/Stable/Declining}}

CUSTOMER IMPACT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Strategic feature delivery: {{%}} | Score: {{0–20}}
Quality at delivery: {{P1s/release}} | Score: {{0–20}}
Outcome realization: {{%}} | Score: {{0–20}}
Time to customer value: {{weeks avg}} | Score: {{0–20}}
Reliability: {{%}} uptime | Score: {{0–20}}

INNOVATION BREAKDOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Capacity Allocation:
  New capabilities: {{%}} (target: 30–40%)
  Incremental improvement: {{%}} (target: 20–30%)
  Technical investment: {{%}} (target: 20–25%)
  Keep-lights-on: {{%}} (target: 10–20%)

New capability ratio: {{0–20}} | Technical investment rate: {{0–20}}
Architecture quality: {{0–20}} | Experimentation rate: {{0–20}} | Innovation outcome: {{0–20}}

3-Quarter Innovation Trend: {{Q-2}} → {{Q-1}} → {{current}} | {{FLAG if declining}}

ROADMAP HEALTH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Last updated: {{date}} ({{N}} weeks ago) | Currency score: {{0–25}}
Capacity utilization: {{%}} | Realism score: {{0–25}}
Stakeholder alignment: {{Full/Partial/Misaligned}} | Alignment score: {{0–25}}
OKR connectivity: {{%}} of items | Strategic score: {{0–25}}

STRATEGY NARRATIVE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
HEADLINE: "Engineering is operating at [delivery level] delivery with [innovation level] innovation investment."
GAP: "The primary strategic gap is {{lowest score area}}. Root cause: {{specific}}."
RISK: "If not addressed, in [N] quarters: {{specific consequence}}."
ASK: "To close the gap, the team needs: {{resource / priority change / investment}}."

TALKING POINTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
For executive audience:
  Delivery: "{{Team}} delivered {{%}} of strategic commitments this quarter at {{DORA band}} performance."
  Customer: "{{N}} strategic features shipped; {{%}} showing positive outcome signals."
  Innovation: "{{%}} of capacity invested in new capabilities; tech debt trend is {{shrinking/stable/growing}}."
  Risk: "The primary risk to next quarter's delivery is {{specific}}. Mitigation: {{plan}}."

FOLLOW-UP ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Action for lowest score}} — Owner: {{Name}} — By: {{date}}
{{Roadmap update if currency <current}} — Owner: {{EM}} — By: {{date}}
{{Innovation capacity reallocation if score <60}} — Conversation with: {{stakeholder}} — By: {{date}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| DORA metrics sourced from automated tooling | Base: 65% |
| Customer outcome realization measured with actual outcome data | +15% |
| Innovation capacity allocation tracked systematically | +10% |
| Roadmap confidence assessed against capacity and stakeholder input | +10% |
| DORA metrics manually reconstructed or estimated | −25% |
| Customer impact scored without outcome data | −20% |
| Innovation score based on capacity estimates not tracked actuals | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Activity-for-impact substitution** | High feature count; low outcome realization; delivery looks strong in reports | Measure outcomes (did the feature work?) not outputs (did we ship the feature?). |
| **Innovation erosion** | Innovation score declining for 2+ quarters; team in keep-lights-on mode | Escalate to leadership before 3rd quarter. Present the compound effect of current allocation. |
| **Roadmap drift** | Roadmap exists but is 3+ months stale; team executing from backlog | Monthly roadmap refresh as a standing EM practice; currency is a confidence pre-requisite. |
| **Delivery without strategy** | High delivery confidence, low strategic connectivity | Connect every roadmap item to a company OKR. If you can't: it may not be the right item. |

---

## References

- `confidence-engine/` — Delivery and architecture confidence components
- `analytics/executive-dashboard.md` — Delivery confidence and customer impact shared
- `skills/meetings/decision-log.md` — Roadmap decisions captured here
- `skills/meetings/architecture-review.md` — Architecture quality inputs

## Related Skills

| Skill | Relationship |
|---|---|
| `analytics/executive-dashboard.md` | Delivery confidence and customer impact scores shared between dashboards |
| `confidence-engine/` | Architecture and roadmap confidence dimensions sourced from confidence-engine |
| `skills/meetings/architecture-review.md` | Architecture quality data source for innovation score |
| `analytics/organization-dashboard.md` | Org health context for delivery capacity interpretation |
