# Skill: Executive Risk Report

**Domain**: Executive
**Owner**: `subagents/executive-summary.md`
**Cadence**: On-demand (risk emerges) + Monthly (risk register review)

---

## Purpose

Translate technical and organizational risks into business language that executives can act on. Surface risks early enough that executives have options — not just awareness.

Executives do not fear risk. They fear surprise. A risk communicated early with a plan is a manageable situation. The same risk communicated after it materializes is a failure of management.

**The translation imperative**: Every risk that an EM understands in engineering terms must be re-expressed in:
- **Financial terms**: what is the cost exposure?
- **Customer terms**: who is affected and how?
- **Timeline terms**: what does this do to commitments?
- **Decision terms**: what does the executive need to decide?

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Risk description** | The technical or organizational risk, in any form |
| **Likelihood** | High / Medium / Low — with evidence |
| **Impact if realized** | What specifically happens — in business terms |
| **Current mitigation** | What is already being done |
| **Escalation reason** | Why this risk needs executive awareness now |

### Optional
| Input | Description |
|---|---|
| **Financial exposure** | Dollar range of the impact |
| **Customer exposure** | Number of customers / % of revenue affected |
| **Timeline impact** | Which commitments are affected and by how much |
| **Decision needed** | What the executive needs to approve or decide |
| **Window to act** | How long before the risk window closes |

---

## Analysis

### Step 1 — Classify the Risk
| Category | Description | Executive frame |
|---|---|---|
| **Delivery risk** | Milestone, scope, or timeline at risk | "We will miss [X] by [N weeks] unless..." |
| **Reliability risk** | System failure probability | "There is a [likelihood] chance of customer-facing outage affecting [N%] of users" |
| **People risk** | Attrition, burnout, key-person dependency | "If [scenario] happens, [business impact]" |
| **Compliance / security risk** | Regulatory or data exposure | "We have a potential exposure to [regulation/standard] that could result in [consequence]" |
| **Investment risk** | Budget or headcount insufficient for commitment | "Current capacity cannot deliver [X] — gap is [N] person-months" |
| **Dependency risk** | External team or vendor cannot deliver | "[Initiative] depends on [team/vendor] — currently at risk" |

### Step 2 — Quantify the Business Impact
For each risk, answer:
- **Best case if risk is avoided**: [outcome if mitigation works]
- **Most likely case if risk materializes**: [what actually happens]
- **Worst case**: [the tail risk — unlikely but possible]

### Step 3 — Identify the Decision Window
Risks have windows. Once the window closes, options narrow. Name:
- When does the executive need to decide by?
- What options close after that date?
- What is the cost of waiting one more week?

### Step 4 — Generate the Ask
Every risk report has one of three asks:
1. **Awareness only**: "No decision needed — here is what I'm managing"
2. **Resource request**: "I need [X] to mitigate this"
3. **Decision required**: "I need you to choose between [Option A] and [Option B] by [date]"

---

## Decision Tree

```
Does the risk require executive action?

├── NO — Executive awareness only
│   └── Format: Short para in status report
│       Risk + Likelihood + What I'm doing + When you'll hear about it again
│       Do not escalate a risk to a standalone report if no action is needed

├── YES — Resource needed to mitigate
│   └── Format: Full risk report + investment ask
│       → Also invoke: skills/executive/investment-proposal.md for the resource justification

├── YES — Decision required between options
│   └── Format: Full risk report with options table + recommendation + decision deadline
│       → Also invoke: skills/executive/executive-decision-framework.md

└── YES — Timeline or milestone impact
    └── Format: Risk report + milestone impact + options to recover
        Options: reduce scope / extend timeline / add resources
        State the trade-off explicitly. Recommend one.
```

---

## Output Template

```
RISK ESCALATION — {{Risk name}} — {{Date}}
Audience: {{VP / SVP / CTO}}
Escalated by: {{EM name}}
Decision needed by: {{date}} — or "Awareness only"

RISK SUMMARY
{{2–3 sentences. Risk in business terms. No jargon.
What is at risk, who is affected, and what is the likelihood.}}

BUSINESS IMPACT IF REALIZED
• Financial: {{dollar range, or "Not quantified — estimating $X–$Y"}}
• Customer: {{N customers / N% of revenue / specific segment affected}}
• Timeline: {{which commitments are affected and by how much}}
• Confidence in this assessment: {{High | Medium | Low}}

CURRENT MITIGATION
{{What is already being done. Be specific. "We're monitoring it" is not mitigation.}}

OPTIONS
Option A: {{description}} | Cost: {{$X or N person-weeks}} | Risk reduction: {{%}} | Trade-off: {{what this costs}}
Option B: {{description}} | Cost: {{$X or N person-weeks}} | Risk reduction: {{%}} | Trade-off: {{what this costs}}

RECOMMENDATION: {{Option A or B}} — {{one sentence rationale}}

DECISION WINDOW
Options close by {{date}}. After that, only Option B remains viable.

ASK
{{Specific: approve Option A / provide $X budget / decide between A and B / no action needed}}
```

---

## Examples

### Reliability Risk to VP

```
RISK ESCALATION — Authentication Service Reliability — June 27
Decision needed by: July 5

RISK SUMMARY
Our authentication service has had 2 P2 incidents in 30 days. The root cause is
a known architectural defect we have deferred. Probability of a P1 (full outage)
is increasing. A P1 would take all users offline until resolved.

BUSINESS IMPACT IF REALIZED
• Customer: 100% of users unable to log in during outage (estimated 2–6 hours)
• Financial: Estimated $40K–$120K in SLA credits and support cost at current user volume
• Timeline: Incident response would consume a full sprint, pushing Q3 milestone 3 weeks
• Confidence: Medium — based on incident pattern, not instrumented prediction

CURRENT MITIGATION
On-call team is responsive. Post-mortems completed for both incidents. Workaround
deployed but does not address root cause.

OPTIONS
Option A: Reliability sprint (Sprint 43) — fix root cause | Cost: 1 sprint (~$80K eng cost)
  Risk reduction: 85% | Trade-off: Q3 feature work delayed 2 weeks
Option B: Continue monitoring — defer fix to Q4 | Cost: $0 now
  Risk reduction: 0% | Trade-off: Increasing probability of P1 with full business impact

RECOMMENDATION: Option A — the cost of the sprint is lower than a single P1 incident.

DECISION WINDOW
Sprint 43 planning is July 7. After that, the team is committed to feature work
and inserting a reliability sprint requires canceling a feature sprint mid-flight.

ASK
Approve a reliability sprint for Sprint 43 — protect Q3 milestone at the cost of
a 2-week feature delay. I recommend we communicate this to Product this week.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Risk is classified (delivery/reliability/people/etc.) | Base: 65% |
| Business impact is quantified | +15% |
| Decision window is named | +10% |
| Options are specific with cost and trade-off | +10% |
| Recommendation is clear | +5% |
| Impact is vague ("it could be bad") | −20% |
| No ask or decision window | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Technical risk language** | "The auth service has a race condition in the consumer" | Translate: "The authentication service is at increasing risk of failure" |
| **Risk without impact** | "This is a risk we should be aware of" | Name the business consequence with a number |
| **No options** | "We need to fix this" | Present at least two options with costs and trade-offs |
| **Late escalation** | Risk reported after it materializes | Risk escalation has a window. Surface it when options still exist. |
| **Missing decision window** | No date by which the executive must decide | Always name when options close |

---

## References

- `skills/executive/executive-communication.md` — Translation rules
- `docs/engineering-playbook.md` → Risk section
- `CLAUDE.md` → "Always identify organizational risks"; "Always estimate confidence"

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/executive-status-report.md` | Risks appear as bullets in status report; escalate to standalone when action is needed |
| `skills/executive/investment-proposal.md` | When the mitigation requires budget approval |
| `skills/executive/executive-decision-framework.md` | When the risk requires a formal decision between options |
| `skills/delivery/manage-risk.md` | The internal risk register that feeds this skill |
