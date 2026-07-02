# Skill: Product Risk

**Domain**: Product
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Sprint planning + Quarterly roadmap + On-demand (new feature, scope change, competitive signal)

---

## Purpose

Identify, classify, and quantify risks to product outcomes — not just technical risks, but adoption risk, market risk, dependency risk, and competitive risk — so that roadmap decisions account for the full probability-weighted cost of what could go wrong.

**What the EM does automatically**: For every significant roadmap item, the EM surfaces product risk proactively:
1. Classifies risk type (market, adoption, technical, competitive, dependency, compliance)
2. Estimates probability and business impact
3. Calculates expected loss (probability × impact)
4. Recommends mitigation or priority change based on risk profile
5. Flags when a high-risk item has no mitigation plan — which is a roadmap health failure

Technical risk is visible to engineers. Product risk is often invisible until after the feature ships. The EM who names product risk before launch earns trust. The EM who discovers it after launch explains it.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Feature or initiative** | What is being evaluated for risk |
| **Target customer segment** | Who the feature is built for |
| **Launch timeline** | When the feature is expected to ship |
| **Assumed value** | What business outcome is this feature expected to produce? |

### Optional
| Input | Description |
|---|---|
| **User research data** | Qualitative or quantitative signal on customer need |
| **Competitive landscape** | Are competitors building or have built this? |
| **Adoption history** | How have similar features performed post-launch? |
| **Technical dependencies** | Third-party, platform, or cross-team dependencies |
| **Compliance requirements** | Regulatory or legal constraints affecting the feature |

---

## Analysis

### Step 1 — Classify the Risk Types

Every feature carries a risk portfolio. Run all six risk types:

| Risk Type | Definition | Trigger Signal |
|---|---|---|
| **Adoption risk** | Feature ships but customers don't use it | Low research confidence, no beta users, unclear use case |
| **Market risk** | Customer need disappears or shifts before or after launch | Fast-moving market, assumption-based need, long build time |
| **Technical risk** | Feature is harder to build than estimated | New tech, legacy integration, unclear architecture |
| **Competitive risk** | Competitor ships first, making the feature table stakes or irrelevant | Competitor roadmap signals, long build timeline |
| **Dependency risk** | Third-party or cross-team dependency delays or blocks delivery | External API, partner team, vendor SLA |
| **Compliance risk** | Feature triggers legal, security, or regulatory review that wasn't planned | PII, new jurisdiction, financial data, healthcare data |

### Step 2 — Score Each Risk

Use the shared probability scale, formula, and severity bands from `docs/glossary.md` → Risk Scoring: Probability × Impact. This skill's domain-specific Impact levels:

```
Impact (feature/initiative level):
  1 = Minor inconvenience
  2 = Delay or scope reduction
  3 = Significant value loss
  4 = Feature fails to deliver value
  5 = Strategic damage or major ARR impact
```

### Step 3 — Auto-Detect High-Risk Patterns

The EM flags these patterns automatically without being asked:

| Pattern | Signal | Recommended Action |
|---|---|---|
| **Build-then-validate** | Feature has no user research and no beta plan | Flag: "Adoption risk is unmitigated. Add a validation gate before full build." |
| **Long build, fast market** | Feature takes >12 weeks in a market with active competitor investment | Flag: "Competitive risk: {{competitor}} is active in this space. Consider MVP scope to accelerate." |
| **Dependency cliff** | Single external dependency with no fallback and no SLA | Flag: "Dependency on {{X}} is a single point of failure. What is the fallback if {{X}} misses?" |
| **Compliance blindspot** | Feature involves PII or new jurisdiction but no legal review is scheduled | Flag: "Compliance risk: trigger legal review before engineering begins." |
| **Assumption-heavy value** | Business case rests on 2+ unvalidated assumptions | Flag: "Value estimate has {{N}} unvalidated assumptions. Risk-adjust estimate before committing." |
| **High risk, no mitigation** | Risk score >2.5, mitigation plan field is empty | Flag: "High/Critical risk with no mitigation plan. This is a roadmap health failure." |

### Step 4 — Calculate Risk-Adjusted Value

```
Risk-adjusted value = Assumed value × (1 − adoption risk) × (1 − market risk)

Example:
  Feature assumed value: $50K/month
  Adoption risk probability: 0.30 (possible that feature isn't adopted)
  Market risk probability: 0.20 (possible that need shifts before launch)

  Risk-adjusted value = $50K × (1 − 0.30) × (1 − 0.20) = $28,000/month

  The risk-adjusted value feeds directly into:
    - Value/cost ratio (skills/product/value-vs-cost.md) — use risk-adjusted, not assumed value
    - RICE scoring (skills/product/rice-scoring.md) — confidence variable captures adoption risk
    - Opportunity cost (skills/product/opportunity-cost.md) — use risk-adjusted value for both sides
```

---

## Decision Tree

```
What does the risk assessment reveal?

├── CRITICAL RISK DETECTED (score >4.0)
│   └── Do NOT commit to full build
│       Recommend: Spike, prototype, or validation experiment first
│       Frame: "This feature has a Critical {{risk type}} risk (score: {{N}}).
│       Before committing {{N}} weeks of engineering, run a {{N}}-week spike to
│       validate {{assumption}}. Cost: {{N}} weeks. Expected outcome: decision data."
│       → Invoke: skills/product/value-vs-cost.md on spike cost vs. full commit risk

├── HIGH ADOPTION RISK (score 2.6–4.0, adoption type)
│   └── Require validation gate: beta users, user research, or feature flag rollout
│       Frame: "This feature has no adoption signal. Add a beta gate:
│       ship to {{N}} customers first, measure {{metric}} for {{N}} weeks, then decide
│       on full rollout."
│       → Invoke: skills/product/customer-impact.md to model adoption scenario

├── HIGH COMPETITIVE RISK (score 2.6–4.0, competitive type)
│   └── Calculate: Is MVP scope achievable before competitive window closes?
│       Frame: "Full feature = {{N}} weeks. MVP = {{N}} weeks. Competitive window: {{N}} weeks.
│       Recommend MVP first, full feature post-validation."
│       → Invoke: skills/product/feature-sizing.md to calculate MVP timeline
│       → Invoke: skills/product/moscow-prioritization.md to scope MVP

├── HIGH DEPENDENCY RISK (score 2.6–4.0, dependency type)
│   └── Name the dependency, owner, SLA, and fallback
│       Frame: "This feature depends on {{X}}, owned by {{team}}, with no confirmed SLA.
│       Until SLA is confirmed, treat this item as At Risk on the roadmap."
│       → Invoke: skills/cross-functional/dependency-management.md

├── COMPLIANCE RISK DETECTED (any probability)
│   └── Immediate: Schedule legal/security review before engineering begins
│       Do NOT start engineering on a feature with unresolved compliance risk
│       → Invoke: skills/cross-functional/legal-review.md
│       → Invoke: skills/cross-functional/security-partnership.md

└── LOW/MEDIUM RISK (score <2.5)
    └── Record risk, assign owner for monitoring
        Present to PM: "This feature has {{N}} identified risks, all Low/Medium.
        Monitor {{primary risk}} during build. No blocking action required."
        Proceed with standard planning
```

---

## Output

### Product Risk Assessment

```
PRODUCT RISK ASSESSMENT — {{Feature / Initiative}} — {{date}}

FEATURE: {{name}} | Owner: {{EM/PM}} | Target launch: {{date}} | Assumed value: ${{X}}/month

RISK REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Risk Type    | Probability | Impact | Score | Severity | Mitigation
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Adoption     | {{N}}       | {{N}}  | {{N}} | {{L/M/H/C}} | {{plan or NONE}}
Market       | {{N}}       | {{N}}  | {{N}} | {{L/M/H/C}} | {{plan or NONE}}
Technical    | {{N}}       | {{N}}  | {{N}} | {{L/M/H/C}} | {{plan or NONE}}
Competitive  | {{N}}       | {{N}}  | {{N}} | {{L/M/H/C}} | {{plan or NONE}}
Dependency   | {{N}}       | {{N}}  | {{N}} | {{L/M/H/C}} | {{plan or NONE}}
Compliance   | {{N}}       | {{N}}  | {{N}} | {{L/M/H/C}} | {{plan or NONE}}

RISK-ADJUSTED VALUE
Assumed value:       ${{X}}/month
Adoption risk adj:   ×{{N}}
Market risk adj:     ×{{N}}
Risk-adjusted value: ${{X}}/month ({{N}}% of assumed)

OVERALL RISK LEVEL: {{Low | Medium | High | Critical}}
Highest risk: {{type}} (score: {{N}}) — {{one-sentence rationale}}

FLAGS
⚠️ {{Any high/critical risk with no mitigation plan}}
⚠️ {{Compliance trigger detected}}
⚠️ {{Assumption-heavy value estimate}}
🚀 {{Low-risk item — proceed with confidence}}

RECOMMENDATION
{{Proceed / Add validation gate / Run spike first / Requires review before commit}}
Rationale: {{one sentence}}
```

---

## Example

```
PRODUCT RISK ASSESSMENT — AI-Powered Search Suggestions — July 1, 2025

FEATURE: AI Search Suggestions | Owner: Sarah L. | Target: Q3 Week 8 | Assumed value: $40K/month

RISK REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Risk Type    | Probability | Impact | Score | Severity | Mitigation
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Adoption     | 0.50        | 3      | 1.5   | Medium   | Beta with 20 enterprise users wk 6
Market       | 0.20        | 2      | 0.4   | Low      | None needed
Technical    | 0.30        | 3      | 0.9   | Low      | Spike in week 1 on LLM latency
Competitive  | 0.40        | 4      | 1.6   | Medium   | Track competitor updates monthly
Dependency   | 0.50        | 4      | 2.0   | Medium   | OpenAI SLA confirmed; fallback to keyword
Compliance   | 0.70        | 5      | 3.5   | High     | Legal review scheduled week 2

RISK-ADJUSTED VALUE
Assumed value:       $40K/month
Adoption risk adj:   ×0.70
Market risk adj:     ×0.90
Risk-adjusted value: $25,200/month (63% of assumed)

OVERALL RISK LEVEL: High
Highest risk: Compliance (score: 3.5) — feature uses customer query data to train suggestions; legal must confirm before build.

FLAGS
⚠️ Compliance: Legal review must complete before engineering begins (week 2 gate)
⚠️ Adoption: 50% probability feature isn't adopted — beta gate in week 6 is critical

RECOMMENDATION: Proceed with two gates: (1) Legal review completion before sprint 2;
(2) Beta adoption signal (>40% usage by beta group) before full rollout.
Rationale: Risk-adjusted value ($25K/month) still exceeds engineering cost at ratio 2.6 — worth building with controls.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All six risk types evaluated | Base: 65% |
| Risk-adjusted value calculated | +15% |
| Mitigation plan for all High/Critical risks | +10% |
| Validation gate or beta plan specified | +10% |
| Competitive landscape checked | +5% |
| Only technical risk evaluated | −25% |
| No mitigation plan for High/Critical risks | −20% |
| Value estimate not risk-adjusted | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Technical risk only** | Risk register has only engineering risks | Run all six risk types. Adoption and market risk cause more feature failures than technical risk. |
| **Optimistic value assumption** | Business case uses best-case value without risk adjustment | Always risk-adjust. Expected value = Assumed value × (1 − adoption risk) × (1 − market risk). |
| **Unmitigated compliance risk** | Feature with PII proceeds without legal review | Compliance risk at any probability = legal review required. Not optional. |
| **Post-launch risk discovery** | "We didn't expect customers not to use it" | Adoption risk must be assessed before build begins, not after launch. |
| **Dependency risk ignored** | Feature ships; third-party delays cause 3-week slip | Name every external dependency, confirm SLA, specify fallback. |

---

## References

- `skills/product/value-vs-cost.md` — Risk-adjusted value is the input to value/cost ratio
- `skills/product/rice-scoring.md` — Confidence variable in RICE partially captures adoption risk
- `skills/product/moscow-prioritization.md` — High-risk items may be reclassified to Should/Could
- `skills/cross-functional/legal-review.md` — Compliance risk triggers legal review
- `skills/cross-functional/security-partnership.md` — Technical/compliance risk with security dimension
- `docs/glossary.md` — Shared probability/impact/severity scoring rubric

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/value-vs-cost.md` | Risk-adjusted value feeds the value side of value/cost |
| `skills/product/rice-scoring.md` | Confidence variable in RICE captures adoption and delivery risk |
| `skills/product/roadmap-health.md` | High-risk items with no mitigation lower roadmap health score |
| `skills/product/opportunity-cost.md` | High-risk chosen items may have lower risk-adjusted OC than alternatives |
| `skills/cross-functional/legal-review.md` | Compliance risk triggers mandatory legal review |
