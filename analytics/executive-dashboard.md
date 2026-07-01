# Dashboard: Executive Dashboard

**Domain**: Leadership Analytics
**Owner**: `subagents/engineering-manager.md`
**Audience**: VP / C-suite / Board — and the EM preparing to present to them
**Cadence**: Monthly refresh + On-demand before executive reviews

---

## Purpose

Give executives a single, accurate answer to the question: *"Can I trust this team to deliver?"* — and give the EM a clear view of where that trust is strong, where it is fragile, and what to address before the next review.

This dashboard aggregates six scores into two composite views: what the executive sees, and what the EM needs to fix before the next meeting.

**Primary questions this dashboard answers:**
- How confident can leadership be in this team's delivery commitments?
- Where are the highest-risk signals an executive would act on if they saw them?
- What is the gap between what the team is reporting and what the underlying data shows?

---

## Inputs

| Source | Metric Fed |
|---|---|
| `confidence-engine/` (6 dimensions) | Executive Confidence Score |
| DORA metrics (deployment frequency, lead time, CFR, MTTR) | Delivery Confidence |
| `features/delivery.feature` + sprint data | Sprint Predictability |
| Incident history + customer signal | Customer Impact Score |
| `leadership-health/master-leadership-health.md` | Organizational Health (headline) |
| `political-signals/political-signals.md` | Risk Signal Index |

---

## Analysis

### Metric 1 — Executive Confidence Score (0–100)

```
Source: confidence-engine/ — 6 dimensions, each 0–10

DIMENSION SCORES:
  Prediction Confidence (0–10): Accuracy of delivery commitments over last 3 months
    10: >90% of commitments delivered on time
    7: 75–89% delivered on time
    4: 60–74% delivered on time
    1: <60% delivered on time

  Data Quality (0–10): Reliability and completeness of the metrics being reported
    10: All metrics sourced from automated systems; no manual collection; no gaps
    7: Most metrics automated; some manual; minor gaps
    4: Significant manual collection; known gaps in data; interpretations required
    1: Metrics reconstructed from memory or anecdote; not reliable

  Risk Confidence (0–10): Ratio of known-and-managed risks to total risk surface
    10: All significant risks identified, documented, and with mitigation plans
    7: Most risks known; 1–2 may be emerging without full mitigation
    4: Several unknown risks; reactive posture
    1: Risk surface largely unknown; team is surprised by events regularly

  Delivery Confidence (0–10): DORA composite → see Metric 2; carry score here
    (Delivery confidence score / 10, scaled)

  Roadmap Confidence (0–10): How accurately the roadmap reflects actual capacity and direction
    10: Roadmap updated this month; capacity-planned; stakeholder-aligned
    7: Roadmap is 1–2 months stale; minor drift from plan
    4: Roadmap is significantly outdated; material gap between plan and current work
    1: No roadmap; team is operating reactively

  Architecture Confidence (0–10): Technical health of the system
    10: ADR coverage >80%; tech debt < 20% of sprint capacity; no critical security gaps
    7: ADR coverage 60–79%; tech debt 20–30% of capacity
    4: ADR coverage <60%; tech debt consuming >30% of capacity; known gaps
    1: No ADRs; tech debt crisis; significant unresolved security or compliance issues

EXECUTIVE CONFIDENCE SCORE = (Sum of 6 dimensions / 60) × 100

THRESHOLDS:
  80–100: HIGH — Executive can trust the team's reporting; presentation from a position of confidence
  60–79: MEDIUM — Specific gaps; name them proactively before the executive asks
  40–59: LOW — Significant trust gaps; address before any executive review; prepare mitigations
  <40: CRITICAL — Do not present to executive without a recovery plan
```

### Metric 2 — Delivery Confidence (0–100)

```
Source: DORA metrics + Sprint commitment data

DORA COMPONENT SCORES (0–25 each):

Deployment Frequency:
  Elite (multiple/day): 25 | High (daily/weekly): 20 | Medium (monthly): 12 | Low (>monthly): 5

Lead Time for Changes:
  Elite (<1 hour): 25 | High (<1 day): 20 | Medium (<1 week): 12 | Low (>1 week): 5

Change Failure Rate:
  Elite (0–5%): 25 | High (6–10%): 20 | Medium (11–15%): 12 | Low (>15%): 5

Mean Time to Recovery:
  Elite (<1 hour): 25 | High (<1 day): 20 | Medium (<1 week): 12 | Low (>1 week): 5

DELIVERY CONFIDENCE SCORE = Sum of 4 DORA components (0–100)

SPRINT PREDICTABILITY (supplementary, not in composite):
  Sprint commitment rate = Features delivered / Features committed (last 3 sprints avg)
  Elite: >90% | High: 80–90% | Medium: 65–79% | Low: <65%
  Include in executive narrative: "We committed to X and delivered Y."

EXECUTIVE INTERPRETATION BY BAND:
  80–100: Elite/High DORA — strong evidence of technical delivery capability
  60–79: High/Medium mix — delivery is reliable; specific bottlenecks exist
  40–59: Medium range — delivery is predictable but slow; improvement investment needed
  <40: Low/Medium — delivery confidence is weak; executive will probe this
```

### Metric 3 — Customer Impact Score (0–100)

```
Source: Delivery data + incident history + customer signal

5 FACTORS (0–20 each):

Factor 1 — Feature Delivery Rate (0–20)
  Customer-facing features shipped vs. committed in the quarter
  >90% delivered: 20 | 75–89%: 15 | 60–74%: 10 | <60%: 5

Factor 2 — Quality Signal (0–20)
  Inverse of customer-reported incidents and bugs per release
  <1 P1 incident per month, <5 bugs per release: 20
  1–2 P1s per month, 5–10 bugs: 15
  3–4 P1s per month, 10–20 bugs: 10
  >4 P1s per month, >20 bugs: 5

Factor 3 — Time to Market (0–20)
  Cycle time for customer-requested features (commit to production)
  <2 weeks: 20 | 2–4 weeks: 15 | 4–8 weeks: 10 | >8 weeks: 5

Factor 4 — Outcome Realization (0–20)
  Percentage of shipped features with a positive customer signal (usage, NPS delta, support deflection)
  >70% of features show positive signal: 20 | 50–69%: 15 | 30–49%: 10 | <30%: 5
  If signal data unavailable: score 10 (neutral; flag for improvement)

Factor 5 — Reliability (Customer-Perceived Uptime) (0–20)
  >99.9% uptime: 20 | 99.5–99.9%: 15 | 99.0–99.5%: 10 | <99.0%: 5

CUSTOMER IMPACT SCORE = Sum of 5 factors (0–100)

THRESHOLDS:
  80–100: Strong customer delivery — explicit evidence available for executive presentation
  60–79: Adequate — improving; specific gap dimensions to name
  40–59: Concern — customer trust is at risk; recovery plan needed
  <40: Crisis — customer impact is negative; executive must know immediately
```

### Metric 4 — Risk Signal Index (0–100, higher = lower risk)

```
Source: political-signals/ + known blockers + open incidents

5 RISK SIGNALS (0–20 each, scored as ABSENCE of risk):

Signal 1 — Decision Stability (0–20)
  Frequency of reversed decisions in the last 90 days
  Zero reversals: 20 | 1–2 low-impact: 15 | 1–2 high-impact: 10 | Frequent/systemic: 5

Signal 2 — Organizational Blockers (0–20)
  Count of unresolved organizational blockers (dependency, approval, escalation)
  Zero blockers: 20 | 1–2 with plans: 15 | 3–4 with partial plans: 10 | 5+ unmanaged: 5

Signal 3 — Incentive Alignment (0–20)
  Are team incentives aligned with organizational goals?
  Fully aligned; no misaligned incentives detected: 20
  Minor misalignment; manageable: 15
  Significant misalignment; behavior distorted: 10
  Severe misalignment; active conflict: 5

Signal 4 — Key Person Risk (0–20)
  Single points of failure in knowledge, relationships, or delivery
  Zero critical single points: 20 | 1 with documented mitigation: 15 | 1–2 without mitigation: 10
  3+ critical single points: 5

Signal 5 — Escalation Pattern (0–20)
  Frequency of escalations reaching the executive's attention in the last quarter
  Zero unexpected escalations: 20 | 1 managed: 15 | 2–3: 10 | 4+: 5

RISK SIGNAL INDEX = Sum of 5 signals (0–100)
<60: Proactively surface the specific risks to the executive; do not wait to be asked
```

---

## Decision Tree

```
What does the Executive Dashboard reveal?

├── EXECUTIVE CONFIDENCE SCORE <60
│   └── Do not enter executive review without a plan
│       Identify which of the 6 dimensions is lowest
│       For each dimension below 5: prepare a specific recovery narrative and timeline
│       "Here is the gap I see. Here is what I'm doing about it. Here is when it will close."

├── DELIVERY CONFIDENCE <60 (DORA composite)
│   └── Identify the lowest DORA dimension
│       Lead time bottleneck → CI/CD investment; review process; PR review SLA
│       Change failure rate high → quality gate investment; test coverage; rollback automation
│       MTTR long → observability investment; on-call process; runbook quality
│       Prepare: executive will ask; have the specific cause and plan ready

├── CUSTOMER IMPACT SCORE <60
│   └── Executive will ask about customer trust and delivery reliability
│       If quality signal is low → incident reduction plan; quality metrics by team
│       If outcome realization is low → product-engineering alignment; success metric definition
│       If reliability is low → SLA investment; on-call structure review
│       Do not present customer impact without a narrative for the gap

├── RISK SIGNAL INDEX <60
│   └── Surface risks proactively — before the executive discovers them
│       "I want to flag [risk]. Here is what it means. Here is what I'm doing about it."
│       Executives who discover risks they weren't told about lose trust faster than executives
│       who hear about risks early and see a management plan

├── GAP BETWEEN REPORTED AND UNDERLYING METRICS
│   └── If metrics are manually collected or reconstructed: flag data quality before presenting
│       "Our confidence in [metric] is [medium/low] because [reason]."
│       Presenting uncertain data as fact destroys executive trust when reality diverges
│       Invest in metric automation before the next review

└── ALL SCORES >75
    → Prepare the executive brief from a position of strength
    → Lead with the confidence score; support with specific DORA and customer data
    → Identify one forward-looking risk even when present is strong — executives trust managers who see ahead
```

---

## Output

### Executive Dashboard Scorecard

```
EXECUTIVE DASHBOARD — {{Team/Org}} — {{Date}}

COMPOSITE VIEW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Executive Confidence Score:  {{0–100}} | {{HIGH / MEDIUM / LOW / CRITICAL}}
Delivery Confidence:         {{0–100}} | {{Elite / High / Medium / Low}}
Customer Impact Score:       {{0–100}} | {{Strong / Adequate / Concern / Crisis}}
Risk Signal Index:           {{0–100}} | {{Low risk / Moderate / Elevated / High risk}}

EXECUTIVE CONFIDENCE BREAKDOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Prediction Confidence:   {{0–10}} | Evidence: {{% commitments delivered}}
Data Quality:            {{0–10}} | Source: {{automated / manual / reconstructed}}
Risk Confidence:         {{0–10}} | Known risks: {{N}} | Mitigated: {{N}}
Delivery Confidence:     {{0–10}} | (from DORA composite below)
Roadmap Confidence:      {{0–10}} | Last updated: {{date}}
Architecture Confidence: {{0–10}} | ADR coverage: {{%}} | Tech debt: {{%}} of capacity

DELIVERY CONFIDENCE (DORA)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Deployment Frequency: {{value}} → {{Elite/High/Medium/Low}} ({{25/20/12/5}} pts)
Lead Time:           {{value}} → {{Elite/High/Medium/Low}} ({{25/20/12/5}} pts)
Change Failure Rate: {{value%}} → {{Elite/High/Medium/Low}} ({{25/20/12/5}} pts)
MTTR:               {{value}} → {{Elite/High/Medium/Low}} ({{25/20/12/5}} pts)
Sprint Commitment Rate: {{%}} (last 3 sprints avg) — supplementary

CUSTOMER IMPACT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Feature Delivery Rate: {{%}} → {{20/15/10/5}} pts
Quality Signal:       {{P1s/month, bugs/release}} → {{20/15/10/5}} pts
Time to Market:       {{weeks avg}} → {{20/15/10/5}} pts
Outcome Realization:  {{%}} → {{20/15/10/5}} pts
Reliability (Uptime): {{%}} → {{20/15/10/5}} pts

RISK SIGNALS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision Stability:   {{20/15/10/5}} | {{context}}
Org Blockers:         {{20/15/10/5}} | {{N open, N with plans}}
Incentive Alignment:  {{20/15/10/5}} | {{context}}
Key Person Risk:      {{20/15/10/5}} | {{N critical dependencies}}
Escalation Pattern:   {{20/15/10/5}} | {{N unexpected in last quarter}}

EXECUTIVE NARRATIVE DRAFT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
HEADLINE: "{{Team}} is operating at [HIGH/MEDIUM/LOW] confidence. {{One sentence on primary strength.}}"
GAP: "The area requiring the most attention is {{lowest dimension}}. {{What's being done about it.}}"
FORWARD: "In the next quarter, the primary risk is {{risk}}. Here's the plan: {{plan}}."
ASK (if any): "I need {{decision/resource/alignment}} by {{date}} to {{specific outcome}}."
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All metrics sourced from automated, real-time data | Base: 70% |
| Executive confidence score computed monthly | +10% |
| DORA metrics tracked with historical trend | +10% |
| Risk signals reviewed and updated before each executive meeting | +10% |
| Metrics reconstructed from memory or manually collected | −30% |
| Score presented to executive without gap narrative | −20% |
| Risk signals not surfaced proactively | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Vanity metrics** | Dashboard shows metrics that look good but don't reflect delivery reality | Every metric must be falsifiable: would the executive agree this is accurate? |
| **Stale dashboard** | Dashboard updated only before executive reviews; data is 6–8 weeks old | Monthly refresh cadence; automated where possible. |
| **Gap suppression** | Scores below 60 hidden or framed positively without addressing them | Executives trust managers who name their gaps. Surface them with a plan. |
| **Prediction/reality divergence** | Prediction confidence is high; actual delivery doesn't match | The gap is a data quality problem. Fix the metric source before the next review. |

---

## References

- `confidence-engine/` — Executive Confidence Score source dimensions
- `political-signals/political-signals.md` — Risk Signal Index
- `skills/meetings/executive-meeting.md` — Dashboard feeds the executive meeting BLUF
- `analytics/strategy-dashboard.md` — Delivery confidence feeds strategy dashboard

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/meetings/executive-meeting.md` | Executive dashboard is the pre-meeting preparation artifact |
| `confidence-engine/` | Six confidence dimensions sourced directly |
| `analytics/strategy-dashboard.md` | Delivery confidence shared between executive and strategy dashboards |
| `analytics/organization-dashboard.md` | Organizational health feeds the executive confidence headline |
