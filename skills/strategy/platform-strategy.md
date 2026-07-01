# Skill: Platform Strategy

**Domain**: Strategy
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Annual (strategy definition) + Quarterly (investment review) + On-demand (architecture decision, build vs. buy)

---

## Purpose

Define and manage the engineering platform strategy — the shared infrastructure, tooling, and capabilities that multiply product team velocity — and produce data-driven predictions across five dimensions: delivery confidence, resource shortage, hiring needs, platform investment ROI, and strategic risk.

**What the EM does automatically**: For platform strategy, the EM produces five categories of predictions without being asked:

1. **Delivery confidence**: Given current platform health and team capacity, what is the probability of hitting roadmap commitments?
2. **Resource shortage**: When will the team run out of capacity to support both platform and product work?
3. **Hiring needs**: What roles and skills are needed, and by when, to execute the platform strategy?
4. **Platform investment ROI**: What is the measurable return on platform work already done or planned?
5. **Strategic risk**: Where does platform fragility create business-level risk?

Platform is the highest-leverage investment in an engineering organization. Every dollar spent on platform earns its return across every product team. Every dollar deferred compounds into delivery friction, maintenance load, and recruitment difficulty.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Platform inventory** | All shared systems, tools, and capabilities the platform team owns |
| **Platform adoption metrics** | Which product teams use which platform capabilities, and how heavily |
| **Platform incident history** | Platform outages, degradations, and their downstream product impact |
| **Current maintenance load** | % of platform team capacity consumed by keep-lights-on |

### Optional
| Input | Description |
|---|---|
| **Product team velocity trends** | Is product team delivery accelerating or decelerating over time? |
| **Developer experience signals** | Build times, CI reliability, deployment frequency, DORA metrics |
| **Technical debt severity** | Known fragility in platform systems |
| **Competitor platform capabilities** | What platform investments competitors are making |

---

## Analysis

### Step 1 — Assess Platform Health

Score each platform capability across three dimensions:

```
Platform capability health score (per capability, 0–100):

Reliability (40 pts):
  SLA met consistently (>99.9% uptime): 40 pts
  SLA met most of the time (99–99.9%): 30 pts
  Occasional failures affecting teams: 20 pts
  Frequent failures; teams work around it: 0 pts

Adoption (30 pts):
  Used by >80% of eligible teams: 30 pts
  Used by 50–80% of teams: 20 pts
  Used by 20–50% of teams (fragmented): 10 pts
  Minority adoption (<20%): 0 pts

Developer experience (30 pts):
  Self-service; documented; fast feedback: 30 pts
  Mostly self-service; some friction: 20 pts
  Requires platform team involvement: 10 pts
  Requires manual coordination: 0 pts

Score interpretation:
  80–100: Healthy — maintain and extend
  60–79:  Yellow — reliability or adoption improvement needed
  40–59:  Red — significant investment required; product teams are paying a tax
  <40:    Critical — platform is a delivery liability; immediate remediation
```

### Step 2 — Generate Five Predictions

#### Prediction 1: Delivery Confidence

```
Delivery confidence score = Base confidence × Platform reliability factor × Capacity factor

Base confidence: Derived from roadmap health score (skills/product/roadmap-health.md)
  Roadmap score 85–100: Base 0.85
  Roadmap score 70–84:  Base 0.70
  Roadmap score 50–69:  Base 0.55
  Roadmap score <50:    Base 0.40

Platform reliability factor: Average platform capability health / 100
  Example: Three platforms averaging 72/100 → factor = 0.72

Capacity factor: 1 − MAX(0, load ratio − 0.85) × 2
  Load ratio 0.85: factor = 1.0 (no penalty)
  Load ratio 1.0:  factor = 0.70 (30% penalty)
  Load ratio 1.1:  factor = 0.50 (50% penalty)

Delivery confidence = Base × Platform factor × Capacity factor
Example: 0.70 × 0.72 × 0.85 = 43% → Caution: significant delivery risk

Confidence thresholds:
  >80%: High confidence — proceed as planned
  65–80%: Medium — monitor; minor replanning may be needed
  50–64%: Low — significant risk; mitigation required
  <50%: Alert — plan has material probability of material miss
```

#### Prediction 2: Resource Shortage

```
Resource shortage forecast = When does planned work exceed projected capacity?

Inputs:
  Current capacity (from skills/strategy/capacity-planning.md)
  Platform maintenance load trend (quarter-over-quarter change)
  Planned platform investment (person-weeks per quarter)

Calculation:
  If maintenance load is growing N% per quarter:
    Quarters until maintenance load exceeds 40% threshold = (40 − current load) ÷ N
    At 40% maintenance load: effective delivery capacity drops below sustainable threshold

Shortage signal thresholds:
  Quarters to shortage > 4: No immediate action needed
  Quarters to shortage 2–4: Begin hiring process now (4–6 month lead time)
  Quarters to shortage 1–2: Immediate action — hire or reduce scope
  Quarters to shortage < 1: Crisis — defer work now; hiring cannot solve this quarter

Output: "At current maintenance load growth of {{N}}%/quarter, resource shortage
         occurs in Q{{N}} ({{N}} months). Hiring pipeline must open by {{date}}
         for engineers to be productive before the shortage materializes."
```

#### Prediction 3: Hiring Needs

```
Hiring need prediction = Skill gaps + Capacity gaps, with timing

For each identified gap:
  Role type: What skills does the gap require?
  Seniority: What level resolves the gap most efficiently?
  Timing: When must the hire be producing at full capacity?
  Lead time: Posting (2w) + Interview (4–8w) + Notice (4w) + Ramp (12–24w) = 22–38 weeks

Hiring need calculation:
  Capacity gap in Q{{N}} = {{N}} person-weeks
  Full-capacity contribution of one senior engineer = 4.5 person-weeks/quarter
  Engineers needed = Gap ÷ 4.5, rounded up
  Must post by: Q{{N}} start − 38 weeks (conservative) or − 22 weeks (optimistic)

Skill gap identification:
  If platform roadmap requires capabilities no current team member has:
    → Specific role recommendation: "Platform engineer with Kubernetes and observability experience"
    → Seniority: Senior+ (platform work has high leverage; junior engineers need mentoring overhead)

Output: "To meet Q{{N+2}} platform commitments, we need {{N}} engineer(s) with
         {{skill profile}}. Must post by {{date}} for on-time capacity."
```

#### Prediction 4: Platform Investment ROI

```
Platform investment ROI = Velocity gain value ÷ Platform investment cost

Velocity gain value: What product team time does this platform investment reclaim?

Example metrics to track:
  Build time reduction: 30 min → 10 min build time × 50 daily builds × $75/hr loaded cost
    = 50 × (20/60) × $75 = $1,250/day = $312,500/year
  Deployment automation: 4 hrs manual → 20 min × 2 deployments/week × 3 engineers
    = 3 × (220/60) × $75 × 52 weeks = $135,000/year recovered
  Incident reduction: Platform reliability improvement reducing 2 P1s/month
    = 2 × $15,000 avg P1 cost = $360,000/year

ROI formula:
  Annual value = Σ (time recovered × loaded cost) + (incident reduction × avg cost)
  Investment cost = Platform team person-weeks × loaded cost per week
  ROI ratio = Annual value ÷ Investment cost
  Payback period = Investment cost ÷ Monthly value

Output: "Platform investment of ${{X}} ({{N}} person-weeks) is generating
         ${{X}}/year in recovered product team capacity.
         ROI: {{N}}× | Payback: {{N}} months"
```

#### Prediction 5: Strategic Risk

```
Platform strategic risk = Probability × Impact of platform failure on company goals

Risk vectors:
  Scalability cliff: At what load does the current platform fail?
    If expected growth will hit scalability limit within 12 months: Critical risk
  Vendor dependency: Which platform capabilities depend on a single vendor with no fallback?
    Any single-vendor critical dependency: High risk
  Security/compliance fragility: What platform capabilities are below current security standard?
    Any customer data pathway with unresolved security debt: Critical risk
  Talent dependency: How many engineers know how to operate and evolve this platform?
    Bus factor ≤ 2 for the entire platform: High risk
  Technology obsolescence: Is the platform built on technology approaching end-of-life?
    Any critical platform dependency with EoL <24 months: Medium-High risk

Strategic risk score per vector: Probability × Impact (same scale as risk-planning.md)

Output: "Platform has {{N}} High/Critical strategic risks.
         Top risk: {{description}} — Expected impact: ${{X}} or {{N}}-quarter delivery disruption.
         Mitigation: {{plan}} — Cost: {{N}} person-weeks — Deadline: {{date}}"
```

### Step 3 — Build the Platform Roadmap

```
Platform roadmap priorities (in order):
  1. Critical health items (score < 40): Must address — platform is a delivery liability
  2. Strategic risk mitigations: Must address before risk materializes
  3. High-ROI improvements: Address when critical items are stable
  4. Developer experience improvements: Compound velocity; accelerate after above

Capacity allocation guideline for platform investment:
  If platform is a dedicated team: 60–70% foundation; 30–40% new capability
  If embedded in product team: 20% of team capacity is maximum sustainable
  (Below 10%: platform degrades faster than investment restores it)
```

---

## Decision Tree

```
What do the five predictions reveal?

├── DELIVERY CONFIDENCE < 65%
│   └── This is a leadership conversation before a planning conversation
│       Surface: "Our predicted delivery confidence for Q{{N}} is {{N}}%.
│       Primary drivers: {{platform health / capacity load / roadmap overcommitment}}.
│       Recommend: {{specific action}} before committing to stakeholders."
│       → Invoke: skills/product/roadmap-health.md for full health check
│       → Invoke: skills/strategy/risk-planning.md for risk mitigation options

├── RESOURCE SHORTAGE < 2 QUARTERS AWAY
│   └── Hiring cannot solve this quarter — scope reduction is the only lever
│       Immediate: Defer lowest-value platform and product work
│       Parallel: Open hiring reqs for next-quarter capacity recovery
│       → Invoke: skills/executive/headcount-justification.md to formalize ask
│       → Invoke: skills/strategy/capacity-planning.md for reforecast

├── PLATFORM ROI < 2× (underperforming)
│   └── Investigate: Is the investment misallocated? Is value being measured?
│       Common causes: Platform built features no one uses; reliability still low; adoption gap
│       Recommendation: Adoption-first strategy — ship nothing new until adoption of existing > 70%
│       → Invoke: skills/product/value-vs-cost.md for investment reallocation analysis

├── STRATEGIC RISK: SCALABILITY CLIFF WITHIN 12 MONTHS
│   └── This is a Critical risk that overrides current roadmap priorities
│       Frame: "At current growth rate, {{platform component}} exceeds capacity in {{N}} months.
│       Recovery requires {{N}} person-weeks of work.
│       If we do not start by {{date}}, we cannot finish before the cliff."
│       → Invoke: skills/strategy/risk-planning.md
│       → Invoke: skills/executive/investment-proposal.md to fund the remediation

└── ALL FIVE PREDICTIONS HEALTHY
    └── Publish the prediction report quarterly
        Share with product and leadership as a forward-looking health signal
        Protect platform investment allocation in next planning cycle
```

---

## Output

### Platform Strategy Report with Predictions

```
PLATFORM STRATEGY REPORT — {{Quarter}} — {{Team}} — {{date}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
FIVE PREDICTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 DELIVERY CONFIDENCE
Predicted Q{{N}} delivery confidence: {{N}}%  | {{🟢 >80% | 🟡 65–80% | 🟠 50–64% | 🔴 <50%}}
Drivers:
  Platform reliability factor: {{N}} ({{avg platform health}} / 100)
  Capacity load factor: {{N}} (load ratio: {{N}})
  Roadmap base confidence: {{N}} (roadmap score: {{N}}/100)
Recommendation: {{specific action or "proceed as planned"}}

⚡ RESOURCE SHORTAGE FORECAST
Current maintenance load: {{N}}% | Trend: {{+N%/quarter}}
Projected shortage: Q{{N}} ({{N}} months from now)  | {{🟢/>4Q | 🟡/2–4Q | 🔴/<2Q}}
Action required by: {{date}} to avoid shortage
Recommendation: {{"Begin hiring now" | "Monitor" | "Immediate scope reduction"}}

👥 HIRING NEEDS
Roles needed: {{N}} engineer(s) — {{skill profile}}
Required seniority: {{Senior / Mid / Mix}}
Must post by: {{date}} (for Q{{N}} capacity)
Fully loaded cost: ${{X}}/year per hire
Recommendation: {{specific hiring action with urgency}}

💰 PLATFORM INVESTMENT ROI
Platform investment (trailing 4Q): {{N}} person-weeks = ${{X}}
Value generated:
  Build time savings:     ${{X}}/year ({{N}} min/build × {{N}} builds/day × loaded cost)
  Deployment automation:  ${{X}}/year
  Incident reduction:     ${{X}}/year ({{N}} incidents avoided × ${{X}} avg cost)
Total annual value: ${{X}}
ROI: {{N}}× | Payback: {{N}} months | Signal: {{🟢/>3× | 🟡/1–3× | 🔴/<1×}}

⚠️ STRATEGIC RISK
Top platform risks:
  1. {{Risk}} — Probability: {{N}} | Impact: {{N}} | Score: {{N}} | Severity: {{L/M/H/C}}
     Mitigation: {{plan}} | Cost: {{N}}w | Deadline: {{date}}
  2. {{Risk}} — Probability: {{N}} | Impact: {{N}} | Score: {{N}} | Severity: {{L/M/H/C}}
     Mitigation: {{plan}} | Cost: {{N}}w | Deadline: {{date}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PLATFORM HEALTH SCORECARD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Capability        | Reliability | Adoption | Dev Exp | Total | Status
{{capability}}    | {{N}}/40   | {{N}}/30 | {{N}}/30| {{N}} | {{🟢/🟡🔴}}
{{capability}}    | {{N}}/40   | {{N}}/30 | {{N}}/30| {{N}} | {{🟢/🟡/🔴}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PLATFORM ROADMAP (next 2 quarters)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Priority | Initiative               | Weeks | Category     | Rationale
1        | {{initiative}}           | {{N}} | Critical fix | {{health score or risk}}
2        | {{initiative}}           | {{N}} | Risk mitigation | {{risk reference}}
3        | {{initiative}}           | {{N}} | High-ROI     | {{value estimate}}

FLAGS
⚠️ {{Any prediction threshold breach}}
🔴 {{Scalability cliff, shortage emergency, or Critical risk}}
```

---

## Example (abbreviated)

```
PLATFORM STRATEGY REPORT — Q3 2025 — Platform Engineering

📊 DELIVERY CONFIDENCE: 61% 🟠
  Platform reliability: 0.71 | Capacity load: 0.92 | Roadmap base: 0.70
  Action: Load ratio of 0.92 is eroding delivery confidence. Defer 2 non-critical items.

⚡ RESOURCE SHORTAGE: Q1 2026 (7 months) 🟡
  Maintenance growing +3%/quarter. Posting deadline: September 15, 2025.

👥 HIRING NEEDS: 1 senior platform engineer (Kubernetes, observability)
  Post by September 15 for Q1 2026 productive capacity. Cost: ~$200K/year fully loaded.

💰 PLATFORM ROI: 4.2× 🟢
  $340K invested (platform team, trailing 4Q). $1.43M value generated:
    Build time: $520K/year | Deploy automation: $310K/year | Incident reduction: $600K/year

⚠️ STRATEGIC RISK: 2 High risks
  1. Database at 70% write capacity. At current growth: ceiling Q2 2026. 
     Mitigation: Read replica + sharding (8w). Must start by Q4 Week 1.
  2. Observability vendor EOL: March 2026.
     Mitigation: Migrate to open-source stack (6w). Must start Q3 Week 7.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All five predictions calculated | Base: 65% |
| Delivery confidence uses platform reliability factor | +15% |
| Resource shortage has specific quarter forecast | +10% |
| Platform ROI calculated with named value categories | +10% |
| Strategic risk scored with mitigation and deadline | +5% |
| Only qualitative platform assessment | −30% |
| Predictions produced without capacity data | −20% |
| ROI not calculated (investment only described) | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Platform team as feature team** | Platform builds product features instead of shared capabilities | Platform investment must be measured by adoption across multiple product teams, not by features shipped. |
| **ROI not tracked** | Platform investment justified by "it will help velocity" — never measured | Calculate and publish platform ROI quarterly. Make the value visible or it will be defunded. |
| **No adoption strategy** | Platform capabilities built but not adopted | Adoption <50% means the capability isn't delivering ROI. Adoption strategy is as important as the build. |
| **Scalability ignored until crisis** | Growth hits platform ceiling, causing emergency remediation | Scalability ceiling must be forecast and addressed before it's reached. Reactive scalability is 3–10× more expensive. |
| **Platform team firefighting** | Maintenance load > 40%; no capacity for investment | Maintenance dominates because there's no investment in self-healing. Break the cycle with a reliability investment sprint. |

---

## References

- `skills/strategy/capacity-planning.md` — Resource shortage prediction requires capacity model
- `skills/strategy/risk-planning.md` — Strategic risk vectors feed platform risk register
- `skills/strategy/investment-planning.md` — Platform is the foundational investment category
- `skills/strategy/succession-planning.md` — Platform bus factor is a key succession risk
- `skills/product/roadmap-health.md` — Delivery confidence prediction requires roadmap health score

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/capacity-planning.md` | Capacity model underlies shortage prediction |
| `skills/strategy/investment-planning.md` | Platform investment is the highest-leverage foundational category |
| `skills/strategy/risk-planning.md` | Platform risks feed organizational risk register |
| `skills/strategy/succession-planning.md` | Platform bus factor is a key-person risk |
| `skills/product/roadmap-health.md` | Delivery confidence uses roadmap health as input |
| `skills/executive/investment-proposal.md` | Platform remediation proposals for leadership |
