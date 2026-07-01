# Skill: Investment Proposal

**Domain**: Executive
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand (headcount, tooling, infrastructure, major initiatives)

---

## Purpose

Build and present a compelling investment case for engineering resources — headcount, infrastructure, tooling, or initiative funding — in terms that executives will approve.

Engineers see investment proposals as technical justifications. Executives see them as resource allocation decisions. The same proposal written two different ways gets two different outcomes.

**The executive evaluation lens**: Is this the highest-value use of budget compared to alternatives? What happens if we don't fund it? Who is accountable for the outcome? When will we know if it worked?

**Rule**: Every investment proposal must answer the question "what does the business get for this money?" before explaining what engineering gets. If the business case isn't compelling in paragraph one, the technical case doesn't matter.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The ask** | What specifically you need (N engineers, $X budget, N months of runway) |
| **The business problem** | What business outcome is blocked without this investment |
| **The cost** | Fully loaded cost estimate (salary + benefits + tooling + overhead) |
| **The return** | Measurable business outcome expected from the investment |
| **The timeline** | When the investment pays back, when you'll know it worked |

### Optional
| Input | Description |
|---|---|
| **What you've already tried** | Alternatives ruled out, approaches that didn't work |
| **Risk of not investing** | What happens if this is not funded |
| **Precedent** | Similar investments made in this org or industry |
| **Alternatives considered** | Options with lower cost or faster return |
| **Team readiness** | Why now — why the team is positioned to execute on this |

---

## Analysis

### Step 1 — Identify the Investment Type

| Type | Executive frame | Key question to answer |
|---|---|---|
| **Headcount** | We can't deliver X without Y more people | What does Y people enable that we can't do today? |
| **Infrastructure** | We're paying reliability tax that costs more than the fix | What is the current cost of the status quo? |
| **Tooling** | Manual work is slowing engineers down | How much engineering time does this reclaim? |
| **Initiative / Project** | We need dedicated capacity to unlock a business outcome | What business result is gated on this? |
| **Reliability / Tech Debt** | Accumulated risk that now has a price tag | What is the probability and cost of the bad outcome? |

### Step 2 — Quantify the Business Case

For every proposal, answer:
- **Cost of investing**: Full loaded cost, over what period
- **Cost of NOT investing**: What business outcome is delayed, degraded, or lost
- **Expected return**: Revenue enabled, cost saved, risk reduced, time recovered
- **Payback period**: When does the return exceed the cost?

**Translation table:**

| Engineering framing | Executive framing |
|---|---|
| "We need to refactor the auth service" | "The authentication service is at increasing risk of outage. One P1 incident costs $X. The fix costs $Y." |
| "We need a senior DevOps engineer" | "Release cycle is currently N weeks. With this hire, we target N days — enabling faster response to market." |
| "We need to pay down tech debt" | "Engineering velocity has declined 15% over 6 months due to accumulated complexity. This initiative recovers that capacity — equivalent to 1.5 additional engineers." |

### Step 3 — Build the Options Table

Executives prefer options to single asks. Present at minimum two:
- **Option A**: Full ask — maximum return, maximum cost
- **Option B**: Reduced ask — partial return, lower cost, slower timeline
- **Option C** (if applicable): Status quo — name the cost of doing nothing

Never let "do nothing" be the invisible option. Name it explicitly with its cost.

### Step 4 — Name the Decision Window

When does the executive need to decide? What closes if they wait?
- A hire that takes 3 months to onboard means the decision window is 3 months before the need
- An infrastructure investment that requires a maintenance window means the window is tied to the release calendar
- A team capacity issue compounds: waiting costs more than deciding

---

## Decision Tree

```
What is the primary driver of the investment need?

├── DELIVERY ACCELERATION (move faster, ship more)
│   └── Frame: Current pace → target pace → gap → investment → business outcome
│       Key number: revenue or customer opportunity per week of delay
│       Risk: Do not oversell acceleration. Executives who've seen headcount
│             proposals know that adding engineers doesn't always add velocity.

├── RISK REDUCTION (prevent a bad outcome)
│   └── Frame: Probability of bad outcome × cost of bad outcome → investment cost
│       This math almost always makes the investment look cheap.
│       → Also invoke: skills/executive/executive-risk-report.md to quantify the risk
│       Key: Name a specific bad outcome. "System instability" is not a risk.
│            "$120K SLA breach + 2-week engineer incident response" is a risk.

├── TECHNICAL CAPABILITY (we cannot build X without Y)
│   └── Frame: Business outcome X → capability gap → investment to close gap
│       Key question: What is the value of X to the business?
│       Failure mode: Proposing capability investment without naming the business X.

├── EFFICIENCY RECOVERY (engineering is slower than it should be)
│   └── Frame: Current output → expected output → gap → cause → investment → recovery
│       Key number: engineering time reclaimed × loaded cost of engineer hour
│       Be honest: efficiency investments take longer to pay back than they look.

└── STRATEGIC INVESTMENT (positioning for future capability)
    └── Frame: This is harder — the return is less certain
        Require: Named business hypothesis ("we believe X will be worth Y if...")
        Name the experiment: How will you know if the hypothesis is true?
        Timeline: When will you have signal to validate or abandon?
```

---

## Output Template

```
INVESTMENT PROPOSAL — {{Title}}
Submitted by: {{EM name}} | Date: {{date}}
Decision needed by: {{date}} — or "No hard deadline — flagging for planning"

THE ASK
{{One sentence: "I am requesting [N engineers / $X / N months of dedicated capacity]
to [deliver business outcome] by [date]."}}

THE BUSINESS CASE
{{2–3 sentences. What business outcome is blocked without this investment?
What does the company get for the money? Frame in revenue, cost, risk, or time.}}

Cost of investing:   ${{X}} over {{N}} months ({{N}} engineers at ${{X}} fully loaded)
Cost of NOT investing: {{Business consequence — specific}}
Expected return:     {{Measurable outcome by date}}
Payback period:      {{When return exceeds cost}}

OPTIONS
Option A (Full): {{Description}}
  Cost: ${{X}} | Timeline: {{N}} months | Expected outcome: {{specific}}
  Trade-off: {{what this asks of the organization}}

Option B (Reduced): {{Description}}
  Cost: ${{X}} | Timeline: {{N}} months | Expected outcome: {{specific}}
  Trade-off: {{what is lost vs. Option A}}

Option C (Status Quo): Do not invest
  Cost: {{ongoing cost or risk}} | Outcome: {{what degrades or fails to materialize}}

RECOMMENDATION
Option {{A or B}} — {{one sentence rationale}}

ACCOUNTABILITY
Owner: {{who is accountable for delivering the outcome}}
Success metric: {{how we'll know the investment worked}}
Review date: {{when you'll report back}}

DECISION WINDOW
{{What closes and when if decision is delayed.}}
```

---

## Example

```
INVESTMENT PROPOSAL — Senior Infrastructure Engineer
Submitted by: Arif | Date: July 1, 2025
Decision needed by: August 1, 2025 — new hire takes 3 months to start

THE ASK
I am requesting approval to hire one senior infrastructure engineer to reduce
release cycle time from 3 weeks to 3 days and reduce deployment-related
incidents by 70%.

THE BUSINESS CASE
Our current 3-week release cycle means customer-reported bugs take 21 days
minimum to reach production. Enterprise prospects have flagged this as a
concern in 3 of the last 5 sales conversations. The infrastructure to reduce
this cycle exists — it requires dedicated senior-level ownership that our
current team cannot sustain alongside product delivery.

Cost of investing:   $220K annually (fully loaded senior engineer, West Coast)
Cost of NOT investing: Estimated 2 enterprise contracts at risk; 3-week patch
                       cycle continues; 1 P1 incident per quarter average
                       costs $45K in eng response + SLA credits
Expected return:     Release cycle to 3 days by Q4; P1 incident rate reduced
                     to <1 per 2 quarters
Payback period:      8 months (2 prevented incidents + 1 enterprise contract)

OPTIONS
Option A: Hire senior infrastructure engineer
  Cost: $220K/yr | Timeline: 3 months to hire + onboard | Outcome: full cycle reduction
  Trade-off: Adds to headcount; 3-month gap before impact

Option B: Engage infrastructure consultant (6-month engagement)
  Cost: $90K | Timeline: starts immediately | Outcome: process improvement, no ownership
  Trade-off: Knowledge leaves when engagement ends; ongoing investment needed

Option C: Status quo
  Cost: $45K/quarter incident cost + pipeline risk | Outcome: no improvement

RECOMMENDATION
Option A — the ROI is clear within 8 months and the capability stays in-house.

ACCOUNTABILITY
Owner: Arif (Engineering)
Success metric: Release cycle ≤3 days by Q4 2025; P1 rate <1 per 2 quarters
Review date: QBR Q4 2025

DECISION WINDOW
Recruiting takes 8–12 weeks and onboarding takes 4 weeks. Decision by August 1
enables impact in Q4. Delay past September means no Q4 impact.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Business case quantified in business terms | Base: 65% |
| Cost of not investing is named | +10% |
| Options table includes status quo | +10% |
| Payback period is calculated | +10% |
| Decision window is named | +5% |
| Ask is framed in engineering terms only | −25% |
| No options — single ask only | −10% |
| Return is vague ("will improve efficiency") | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Engineering-only framing** | Proposal describes tech solution, not business outcome | Rewrite paragraph 1 as if describing to CFO. No tech terms. |
| **Missing status quo option** | Only two options; doing nothing is invisible | Always name status quo with its cost. |
| **Vague ROI** | "This will make us faster" | Name the specific metric and target value with a date. |
| **No decision window** | Executive can delay indefinitely | Calculate when options close. Name it. |
| **Undercounting cost** | Salary only, no overhead or management burden | Use fully loaded cost (1.3–1.5× salary for benefits + overhead). |
| **Overselling acceleration** | "This hire will double our velocity" | Be conservative. Executives are skeptical of headcount = speed claims. |

---

## References

- `skills/executive/headcount-justification.md` — Specific to people investment
- `skills/executive/engineering-budget.md` — Budget context and framing
- `skills/executive/executive-risk-report.md` — Risk quantification for the cost of not investing
- `docs/engineering-playbook.md` → Prioritization section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/headcount-justification.md` | Specialized version for headcount asks |
| `skills/executive/engineering-budget.md` | Budget context for larger investment proposals |
| `skills/executive/executive-decision-framework.md` | Framing options when the executive needs to choose |
| `skills/executive/vp-one-on-one.md` | Investment asks often surface in VP 1:1 before becoming formal proposals |
