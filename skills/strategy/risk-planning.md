# Skill: Risk Planning

**Domain**: Strategy
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Annual (risk register construction) + Quarterly (review and update) + On-demand (new risk signal, strategy change)

---

## Purpose

Identify, classify, and quantify strategic risks to engineering delivery and business outcomes — then build mitigation plans that reduce the probability or impact of each risk before it materializes, so that the organization is prepared rather than surprised.

**What the EM does automatically**: When assessing strategic risk, the EM:
1. Builds a risk register spanning delivery, organizational, technical, market, and dependency risk types
2. Scores each risk by probability × impact to produce expected loss
3. Detects risk concentrations (too many high-severity risks without mitigation)
4. Connects risks to roadmap items (a risk that threatens a Must-item is a blocker)
5. Flags when mitigation plans are missing or insufficient relative to risk severity

The best risk management practice is boring: the risks that materialize are almost always the ones that were identified and not mitigated, not the ones that were truly unforeseeable.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current roadmap or annual plan** | What the organization has committed to deliver |
| **Team and organizational context** | Size, structure, key-person dependencies, tenure |
| **Prior incident or miss history** | What has gone wrong in the last 12 months |
| **Known dependencies** | External, cross-team, vendor, and regulatory dependencies |

### Optional
| Input | Description |
|---|---|
| **Industry risk signals** | Market changes, competitor moves, regulatory trends |
| **Technical debt register** | Known system fragility that creates delivery risk |
| **Hiring pipeline health** | Open roles and time-to-fill as capacity risk signal |
| **Customer concentration data** | If small number of customers represent large ARR share |

---

## Analysis

### Step 1 — Build the Risk Register

Identify risks across six categories. Run all six — partial risk registers create false confidence:

| Risk Category | Examples |
|---|---|
| **Delivery risk** | Capacity shortage, underestimated complexity, dependency slip, scope creep |
| **Organizational risk** | Key-person departure, team restructuring, leadership change, culture degradation |
| **Technical risk** | System fragility, tech debt, security vulnerability, scalability constraint |
| **Market risk** | Competitor move, customer need shift, regulation change, pricing pressure |
| **Strategic risk** | OKR misalignment, investment in wrong capabilities, innovation gap, M&A disruption |
| **Dependency risk** | Vendor failure, third-party API change, cross-team delivery miss |

### Step 2 — Score Each Risk

Use the shared probability scale, formula, and severity bands from `docs/glossary.md` → Risk Scoring: Probability × Impact. This skill's domain-specific Impact levels:

```
Impact (on delivery or business outcome, portfolio level):
  1 = Negligible — minor inconvenience, no delivery impact
  2 = Minor — small delay or rework; manageable
  3 = Moderate — significant delay (>1 sprint) or ARR impact ($10K-$100K)
  4 = Major — quarter-level miss or ARR impact ($100K-$500K)
  5 = Critical — year-level miss, existential business impact, or >$500K ARR
```

### Step 3 — Connect Risks to Roadmap Items

```
For each risk with severity > 1.0:
  Which roadmap items does it threaten?
  If it threatens a Must item: risk severity escalates one level
  If it threatens multiple Must items: treat as Critical regardless of score

Risk-roadmap connection:
  Risk: {{risk name}} → Threatens: {{roadmap item}} | Item priority: {{Must/Should/Could}}
  If Must item threatened by High/Critical risk → Mitigation is non-negotiable
```

### Step 4 — Evaluate Mitigation Effectiveness

```
For each mitigation plan, assess:
  Probability reduction: How much does this mitigation reduce likelihood?
  Impact reduction: How much does this mitigation reduce severity if it occurs?
  Cost of mitigation: Person-weeks or budget required

Residual risk = Original risk × (1 − mitigation effectiveness)

Mitigation ROI = (Expected loss reduction) ÷ (Mitigation cost)
  If mitigation ROI < 1: Mitigation costs more than the risk — consider accepting the risk
  If mitigation ROI > 1: Mitigation is economically justified
```

---

## Decision Tree

```
What does the risk register reveal?

├── CRITICAL RISK WITH NO MITIGATION PLAN
│   └── This requires immediate action — not planning for next quarter
│       Escalate: "We have a Critical risk (score {{N}}) with no mitigation plan.
│       This threatens {{roadmap item}} and has {{N}}% probability of materializing
│       this quarter. Action required this week."
│       Assign owner, define mitigation, set timeline
│       Report to leadership within 48 hours if a Must item is threatened

├── KEY-PERSON RISK (organizational category, high probability)
│   └── Calculate: What is the delivery impact if this person leaves today?
│       Mitigation: Knowledge transfer, documentation, cross-training, succession planning
│       Frame: "{{Name}} is responsible for {{N}}% of delivery in {{area}}.
│       If they leave tomorrow, {{N}} weeks of ramp required and {{initiative}} is at risk."
│       → Invoke: skills/strategy/succession-planning.md

├── DEPENDENCY RISK (multiple High+ risks in dependency category)
│   └── Map all external dependencies with no confirmed SLA or fallback
│       Priority: dependencies gating Must roadmap items
│       → Invoke: skills/cross-functional/dependency-management.md
│       → Invoke: skills/strategy/capacity-planning.md if vendor failure = capacity impact

├── HIGH RISK CONCENTRATION (>3 High/Critical risks simultaneously)
│   └── This is a systemic signal — not an individual risk problem
│       Root cause: Organizational? Technical? Planning?
│       Recommendation: Leadership visibility required; consider plan revision
│       Frame: "We have {{N}} High/Critical risks with expected combined loss of ${{X}}.
│       This represents a risk concentration that exceeds acceptable exposure."
│       → Invoke: skills/executive/quarterly-business-review.md — surface at QBR

├── RISK REGISTER OUT OF DATE (last updated >3 months ago)
│   └── Stale risk registers create false confidence
│       Action: Refresh every risk in the register; add new risks; close resolved ones
│       Flag: "Risk register not updated since {{date}}. Risks may have changed.
│       Refresh before using for planning decisions."

└── RISK REGISTER IS CURRENT AND MANAGED
    └── Review at quarterly planning; include risk-adjusted capacity in plan
        Present top 3 risks to PM and leadership with mitigation status
        Update before any major roadmap commitment
```

---

## Output

### Strategic Risk Register

```
STRATEGIC RISK REGISTER — {{Team}} — {{Quarter}} — {{date}}

RISK SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total risks tracked: {{N}}
  Critical (4.1–5.0): {{N}} — {{N}} with mitigation plan
  High (2.6–4.0):     {{N}} — {{N}} with mitigation plan
  Medium (1.1–2.5):   {{N}}
  Low (0.1–1.0):      {{N}}

Expected loss (unmitigated): ${{X}} equivalent
Expected loss (post-mitigation): ${{X}} equivalent
Risk exposure reduction: {{N}}%

RISK REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ID | Risk                      | Cat     | Prob | Impact | Score | Severity | Threatens      | Mitigation        | Residual | Owner
R1 | {{risk description}}      | Delivery| 0.50 | 4      | 2.0   | Medium   | {{roadmap item}}| {{plan}}          | 1.0      | {{name}}
R2 | {{risk description}}      | Org     | 0.30 | 5      | 1.5   | Medium   | {{roadmap item}}| {{plan}}          | 0.8      | {{name}}
R3 | {{risk description}}      | Tech    | 0.70 | 4      | 2.8   | High     | {{roadmap item}}| ⚠️ NO PLAN        | 2.8      | UNASSIGNED

ROADMAP RISK MAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Roadmap Item        | Priority | Risks Threatening It    | Combined Score | Status
{{roadmap item}}    | Must     | R1, R3                  | {{N}}          | 🔴 Mitigation required
{{roadmap item}}    | Should   | R2                      | {{N}}          | 🟡 Monitored

TOP RISKS REQUIRING ACTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Risk}} — Score {{N}} — {{Specific action required by date}}
2. {{Risk}} — Score {{N}} — {{Specific action required by date}}
3. {{Risk}} — Score {{N}} — {{Specific action required by date}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All six risk categories assessed | Base: 65% |
| Expected loss calculated per risk | +15% |
| Risks connected to roadmap items | +10% |
| Residual risk calculated post-mitigation | +10% |
| Mitigation ROI assessed | +5% |
| Only technical risks assessed | −25% |
| No mitigation plans for High/Critical risks | −20% |
| Risk register not refreshed this quarter | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Technical risk only** | Register contains only system/architecture risks | Run all six categories. Organizational and dependency risks are more common causes of misses. |
| **No roadmap connection** | Risks documented but not linked to delivery commitments | Trace every High/Critical risk to the roadmap item it threatens. |
| **Mitigation without effectiveness estimate** | "We'll monitor it" is a mitigation plan | Assess probability and impact reduction from each mitigation. Accept risk explicitly if mitigation is too costly. |
| **Stale register** | Register reflects conditions from 6 months ago | Refresh at the start of every quarter. Risk conditions change. |
| **Risk register as documentation** | Register produced for compliance, not decision-making | Risk register is a planning tool. Every High/Critical risk needs an owner and a due date. |

---

## References

- `skills/strategy/annual-planning.md` — Annual plan should include risk-adjusted capacity buffer
- `skills/strategy/succession-planning.md` — Organizational risk mitigation for key-person dependency
- `skills/strategy/capacity-planning.md` — Delivery and organizational risk affects capacity projections
- `skills/product/product-risk.md` — Product-level risks complement strategic risk register
- `docs/glossary.md` — Shared probability/impact/severity scoring rubric

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/annual-planning.md` | Risk register informs plan confidence and buffer sizing |
| `skills/strategy/succession-planning.md` | Key-person risks mitigated through succession planning |
| `skills/strategy/capacity-planning.md` | Risk materializing often means capacity impact |
| `skills/product/product-risk.md` | Product risk at initiative level; strategic risk at portfolio level |
| `skills/executive/quarterly-business-review.md` | Risk status reported at QBR |
