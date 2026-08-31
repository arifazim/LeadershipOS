# Skill: Political Risk

**Domain**: Organizational
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (risk register review) + On-demand (initiative launch, reorg, leadership change, escalation)

---

## Purpose

Identify organizational political risks to engineering initiatives and team health — the structural, relational, and reputational risks that don't appear on a technical risk register but determine whether engineering can operate effectively and whether its work will survive the organizational environment it operates in.

**What the EM does automatically**: When assessing political risk, the EM:
1. Identifies risks that stem from organizational dynamics rather than technical challenges
2. Distinguishes risks the EM can address transparently from those requiring escalation
3. Assesses the probability and impact of each political risk
4. Recommends direct, ethical responses — not political maneuvering
5. Flags when a political risk requires leadership visibility before it becomes a crisis

**Ethical principle**: Political risk management means protecting engineering's ability to do good work through transparent, honest engagement — not through positioning, alliance-building for advantage, or manipulation of perception. Every response recommended in this skill relies exclusively on direct communication, structural clarity, and honest escalation. If a political risk can only be addressed through deception or manipulation, the correct response is to name it to leadership and accept the outcome.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Organizational context** | Current leadership, structure, known tensions |
| **Engineering initiatives at risk** | What is the team building that could be affected by organizational dynamics |
| **Five signal observations** | Reversals, exclusions, ownership ambiguity, escalation patterns, misaligned incentives |

### Optional
| Input | Description |
|---|---|
| **Prior outputs** | Results from stakeholder-analysis, influence-map, conflict-prediction, alignment-health |
| **Recent organizational changes** | Reorgs, leadership transitions, budget changes, strategy pivots |
| **Engineering's reputation signals** | How engineering is perceived by partner functions and leadership |

---

## Analysis

### Step 1 — Political Risk Taxonomy

Political risk comes from seven structural sources:

```
Risk 1 — Influence deficit
  Definition: Engineering's perspective is not represented in decisions that affect the team
  Symptom: Decisions arrive as directives; engineering input is sought after options are chosen
  Five signal connection: Exclusion from key meetings
  Impact: Engineering builds what was decided without engineering's input → waste and rework

Risk 2 — Reputation risk
  Definition: Engineering is perceived negatively by partner functions or leadership
  Symptom: Engineering blamed for delivery issues owned jointly with product or design;
           "engineering is the bottleneck" narrative
  Five signal connection: Escalation patterns (if escalations are framed against engineering)
  Impact: Budget cuts, reduced headcount, loss of ownership over strategic initiatives

Risk 3 — Sponsorship vacuum
  Definition: No one at a senior level is actively advocating for engineering's interests
  Symptom: Engineering investment requests denied without discussion;
           team initiatives quietly deprioritized
  Five signal connection: None directly — it's an absence, not a signal
  Impact: Engineering becomes a cost center narrative; investment dries up

Risk 4 — Accountability ambiguity
  Definition: When things go wrong, it's unclear whether engineering or a partner function is responsible
  Symptom: Ownership disputes after incidents; engineering absorbs blame for cross-functional failures
  Five signal connection: Ownership ambiguity
  Impact: Engineering reputation damaged by failures it didn't fully own; recurring

Risk 5 — Priority volatility
  Definition: Engineering's commitments are at risk of being reversed by priority changes above
  Symptom: Approved roadmap items cancelled mid-quarter; "we need to pivot" from leadership
  Five signal connection: Frequent decision reversals
  Impact: Team loses trust in planning; morale degrades; velocity drops

Risk 6 — Incentive conflict (structural)
  Definition: Engineering's success metrics are in structural tension with partner functions' metrics
  Symptom: Repeated conflict on the same category of decisions; one team always wins, one always loses
  Five signal connection: Misaligned incentives
  Impact: Chronic underperformance in whatever metric engineering is sacrificing for the other team

Risk 7 — Organizational isolation
  Definition: Engineering operates without strong relationships across functions
  Symptom: Engineering learns about decisions late; cross-functional partners don't seek engineering input
  Five signal connection: Combination of exclusion + escalation patterns
  Impact: Engineering's work is deprioritized; strategic decisions made without considering feasibility
```

### Step 2 — Score Each Political Risk

Use the shared probability scale, formula, and severity bands from `docs/glossary.md` → Risk Scoring: Probability × Impact. This skill's domain-specific Impact levels:

```
Impact on engineering effectiveness:
  1 = Minor friction; manageable
  2 = Delivery impact; requires EM time to manage
  3 = Significant: budget, headcount, or strategic initiative at risk
  4 = Major: team effectiveness compromised; trust damaged at org level
  5 = Existential: engineering's organizational position threatened
```

### Step 3 — Map to Ethical Responses Only

For each risk, identify the appropriate transparent response:

```
Response principles (all must be consistent with these):
  ✓ Direct: Engage the parties involved, not around them
  ✓ Honest: Name the risk as observed, not as diagnosed from inference
  ✓ Structural: Address the system condition, not the individual
  ✓ Transparent: Put the risk in writing; don't carry it silently
  ✓ Escalation-ready: If the response requires authority the EM doesn't have, escalate with the analysis

Responses that are NOT acceptable:
  ✗ Building alliances to overpower opposition
  ✗ Selectively sharing information to shape perception
  ✗ Making decisions without consulting parties who should be consulted
  ✗ Framing situations to make others look bad
  ✗ Using information asymmetry as an advantage

For each risk type, the ethical response:
  Influence deficit → Request structural inclusion; ask for role in pre-decision conversations
  Reputation risk → Surface the narrative to your manager; propose corrective data; be direct about misperception
  Sponsorship vacuum → Build authentic relationships through transparency and value delivery;
                        ask for sponsorship directly when appropriate
  Accountability ambiguity → Document ownership before incidents; agree on RACI for shared outcomes
  Priority volatility → Make the cost of reversal visible before decisions are made;
                         track and report reversal costs in business terms
  Incentive conflict → Name it to shared leadership; propose structural realignment; do not absorb
  Organizational isolation → Invest in authentic relationship-building through shared work
```

### Step 4 — Detect the Five Signals as Political Risk Triggers

The five signals are defined canonically in `skills/organizational/political-intelligence.md` — this step maps each to the political-risk types from Step 1:

```
Signal 1 — Frequent decision reversals
  Political risk triggered: Priority volatility (Risk 5)
  Early indicator: First reversal is a warning; second reversal is a pattern
  Ethical response: "Reversals have a cost. After the last two, here's the impact:
  {{person-weeks lost, momentum broken}}. I want to surface this cost to inform
  how we make decisions going forward, not to assign blame."

Signal 2 — Exclusion from key meetings
  Political risk triggered: Influence deficit (Risk 1) and Organizational isolation (Risk 7)
  Early indicator: Engineering learns of decisions after they're made
  Ethical response: Request inclusion transparently: "I've noticed engineering isn't
  in the room when {{decision type}} is made. Earlier inclusion improves decision quality.
  Can we discuss how to structure this?"

Signal 3 — Ownership ambiguity
  Political risk triggered: Accountability ambiguity (Risk 4)
  Early indicator: Two parties each believe they own the same outcome
  Ethical response: Convene all parties, name the ambiguity directly, document resolution

Signal 4 — Escalation patterns
  Political risk triggered: Reputation risk (Risk 2) if escalations are framed against engineering
  Early indicator: Escalations by others that frame engineering as the cause
  Ethical response: Engage directly with the escalating party; understand their concern;
  provide accurate information; do not wait for leadership to surface the narrative

Signal 5 — Misaligned incentives
  Political risk triggered: Incentive conflict (Risk 6), potentially also Influence deficit
  Early indicator: Consistent friction on same class of decision
  Ethical response: Name the structural conflict to shared leadership with data:
  "We have a structural incentive conflict. Here are three instances. Here's what I recommend."
```

---

## Decision Tree

```
What does the political risk assessment reveal?

├── REPUTATION RISK (engineering blamed for joint failure)
│   └── Address early — reputation narratives are difficult to reverse once established
│       Do NOT: Defend defensively; this confirms the narrative
│       Do: Provide accurate data; name shared ownership; propose joint retrospective
│       Frame: "I want to make sure we have an accurate picture of what happened.
│       Here's the data on ownership and contribution: {{specific data}}.
│       I'd like us to do a joint retrospective to understand the full picture."
│       Escalate to manager if narrative persists after direct engagement

├── SPONSORSHIP VACUUM (no senior advocate for engineering)
│   └── This is the most invisible and most consequential political risk
│       Ethical path: Build genuine relationships through consistent value delivery
│       Practical: Share one concrete engineering impact story with a senior leader monthly
│       Ask directly when appropriate: "Would you be willing to speak to
│       engineering's contribution to {{outcome}} when it comes up at your level?"
│       → Invoke: skills/career/promotion/executive-feedback.md (same relationship-building logic)

├── PRIORITY VOLATILITY (commitments reversed mid-execution)
│   └── Make the cost visible, not the grievance
│       After each reversal: Document the cost in business terms
│       Frame to leadership: "I want to keep you informed of the cost of this change:
│       {{N}} person-weeks redirected, {{initiative}} delayed by {{N}} weeks.
│       I'm not asking you to reconsider — I want leadership to have this information."
│       Track: If reversals continue, present the aggregate cost quarterly

├── CRITICAL POLITICAL RISK BEYOND EM AUTHORITY
│   └── Escalate with the analysis — not the complaint
│       Prepare: Risk name, probability, impact, evidence, recommended response
│       Frame to manager: "I've identified a political risk to engineering's effectiveness:
│       {{risk}}, with expected impact of {{business impact}}.
│       I've tried {{transparent action taken}}. It's beyond my authority to resolve.
│       Here is what I recommend you consider."
│       Do NOT: Carry critical political risks silently

└── POLITICAL RISK IS LOW AND MONITOR
    └── Review quarterly; refresh after any leadership change or reorg
        Track signal observations as early indicators
        If any signal appears twice: move to active monitoring
```

---

## Output

### Political Risk Register

```
POLITICAL RISK REGISTER — {{Team}} — {{date}}

RISK SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Risks identified: {{N}} | Critical: {{N}} | High: {{N}} | Medium: {{N}} | Low: {{N}}

RISK REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Risk                  | Type     | Prob | Impact | Score | Level    | Signal Source     | Ethical Response
{{risk name}}         | Influence| 0.50 | 4      | 2.0   | Medium   | Exclusion pattern | Request inclusion in {{meeting}}
{{risk name}}         | Reputation| 0.30 | 4     | 1.2   | Medium   | Escalation pattern| Joint retrospective + accurate data
{{risk name}}         | Sponsorship| 0.70| 3     | 2.1   | Medium   | None (absence)    | Build senior relationship; share impact monthly
{{risk name}}         | Accountability| 0.40| 5  | 2.0   | Medium   | Ownership ambiguity| RACI documentation for shared outcomes

FIVE SIGNAL OBSERVATIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision reversals (last 90 days): {{N}} | Cost: {{person-weeks, if tracked}}
Exclusions identified: {{N}} | Risk type triggered: {{type}}
Ownership ambiguities: {{N}} | Status: {{Resolved/Active}}
Escalation patterns: {{N}} | Framing: {{Against engineering? Y/N}}
Incentive conflicts: {{N}} | Structural fix: {{Proposed/In progress/Not yet escalated}}

PRIORITY ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Highest-risk action}} — Ethical response: {{specific transparent action}} by {{date}}
2. {{Second action}} — {{specific action}}
3. {{Escalation required}} — Escalate to: {{manager/VP}} by {{date}} with {{specific framing}}

ETHICAL GUARDRAILS CONFIRMED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
All recommended responses are:
  ✓ Direct engagement (not around the parties)
  ✓ Honest representation of the situation
  ✓ Structural focus (not personalizing)
  ✓ Transparent to relevant parties
  ✓ Escalation-ready if beyond EM authority
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All seven risk types assessed | Base: 65% |
| Expected risk calculated with probability × impact | +15% |
| Five signals mapped to risk types | +10% |
| Ethical responses confirmed (no manipulation) | +10% |
| Escalation plan included for Critical risks | +5% |
| Only interpersonal risks assessed (structural ignored) | −20% |
| Responses include manipulation or positioning | −50% (disqualifying) |
| No escalation plan for Critical risk | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Carrying risk silently** | EM identifies Critical political risk; says nothing; manages alone | Critical risks require leadership visibility. Silence protects no one and degrades trust when the risk materializes. |
| **Responding to reputation risk defensively** | "That's not fair; here's why you're wrong" | Defensiveness confirms narratives. Data and joint accountability conversations correct them. |
| **Political response to political risk** | Using alliances, information asymmetry, or framing to "win" | Every response must be something the EM would be comfortable stating transparently to all parties. |
| **Ignoring absence signals** | Sponsorship vacuum not noticed because it's an absence, not an event | Scan for what's missing, not just what's happening. Absence of advocacy is a risk even when no one is blocking you. |
| **Treating political risk as permanent** | Risk identified; accepted as unchangeable feature of the org | Most political risks are structural and can be addressed. Name them, propose structural solutions, escalate if needed. |

---

## References

This skill is the integration layer for all organizational dynamics skills:
- `skills/organizational/stakeholder-analysis.md` — Stakeholder signals feed risk identification
- `skills/organizational/influence-map.md` — Influence gaps create Influence deficit and Isolation risks
- `skills/organizational/decision-network.md` — Ownership ambiguity creates Accountability risk
- `skills/organizational/conflict-prediction.md` — Predicted conflicts become political risks
- `skills/organizational/executive-priorities.md` — Priority mismatch creates volatility and influence risks
- `skills/organizational/change-resistance.md` — Unmanaged resistance creates reputation risk
- `skills/organizational/alignment-health.md` — Low alignment health is the leading indicator of political risk
- `docs/glossary.md` — Shared probability/impact/severity scoring rubric
- `skills/organizational/political-intelligence.md` — Canonical definitions of the five organizational signals

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/organizational/alignment-health.md` | Low alignment score predicts political risk accumulation |
| `skills/organizational/conflict-prediction.md` | Predicted conflicts become political risks if unaddressed |
| `skills/organizational/influence-map.md` | Influence deficit is a direct political risk type |
| `skills/strategy/risk-planning.md` | Political risks belong in the strategic risk register |
