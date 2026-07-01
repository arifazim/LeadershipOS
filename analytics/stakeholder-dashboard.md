# Dashboard: Stakeholder Dashboard

**Domain**: Leadership Analytics
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM + cross-functional partners + skip-level
**Cadence**: Monthly refresh; immediate update after significant cross-functional events

---

## Purpose

Map the state of every significant stakeholder relationship — its trust level, alignment quality, influence direction, and risk signals — so the EM can build and repair the cross-functional partnerships that determine whether engineering is a trusted organizational partner or a delivery bottleneck that others route around.

**Primary questions this dashboard answers:**
- Which stakeholder relationships are strong enough to sustain disagreement?
- Where is cross-functional trust being eroded, and why?
- Is engineering's influence growing, stagnant, or declining across the organization?

---

## Inputs

| Source | Metric Fed |
|---|---|
| `skills/conflict/stakeholder-resolution.md` | Relationship health and conflict signals |
| `skills/meetings/executive-meeting.md` | Executive relationship quality |
| `skills/meetings/decision-log.md` | Decision stickiness across functions |
| `political-signals/political-signals.md` | Misalignment and exclusion signals |
| `skills/mentoring/technical-leadership.md` (Dimension 2) | Cross-functional influence score |
| `analytics/organization-dashboard.md` | Cross-functional alignment score (shared metric) |

---

## Analysis

### Metric 1 — Cross-Functional Alignment Score (0–100)

```
Source: Shared with organization-dashboard.md; detailed breakdown here

5 ALIGNMENT FACTORS (0–20 each):

Factor 1 — Stakeholder Relationship Quality (0–20)
  Rate each key cross-functional partner on 4 dimensions:

  Trust dimensions (each 0–5):
    Reliability: "Does engineering deliver what they committed to?"
    Transparency: "Does engineering share bad news proactively?"
    Competence: "Does the stakeholder believe engineering is capable?"
    Good faith: "Does engineering advocate for their own team at the expense of broader outcomes?"

  Trust score per partner = sum of 4 dimensions / 20 × 20
  Partners to rate: Product / Design / Data / Finance / Legal / Sales / Customer Success / Executive

  Relationship health bands:
    16–20: Strong — can sustain disagreement; long-term investment justified
    12–15: Adequate — working relationship; specific trust dimension needs attention
    8–11: Strained — active friction; repair investment needed this quarter
    0–7: Broken — engineering is being routed around; escalation or relationship reset needed

Factor 2 — Decision Stickiness (0–20)
  % of cross-functional decisions not relitigated within 30 days
  Stickiness signals alignment: when decisions hold, stakeholders trust the process
  >90%: 20 | 75–89%: 15 | 60–74%: 10 | <60%: 5

  Low stickiness root causes:
    Decision made without right people in the room → attendee design failure
    Decision made without adequate documentation → decision log failure
    Stakeholder didn't actually agree; expressed agreement to avoid conflict → alignment theater

Factor 3 — Blocker Resolution Velocity (0–20)
  Average days to resolve cross-team blockers from identification to resolution
  <3 days: 20 | 3–7 days: 15 | 7–14 days: 10 | >14 days: 5

  Long velocity: signals either unclear escalation paths or insufficient stakeholder partnership
  Track: which cross-functional relationship produces the most blockers?

Factor 4 — Influence Events (0–20)
  Engineering decisions, recommendations, or constraints that changed a cross-functional decision
  4+ per quarter: 20 | 2–3: 15 | 1: 10 | 0: 5

  Influence without authority = trust-based. If engineering can't change non-engineering decisions
  by raising technical constraints in business language: influence is absent regardless of reputation.

Factor 5 — Escalation Frequency (0–20)
  Inverse: fewer escalations = better pre-escalation alignment
  Zero unexpected escalations: 20 | 1–2 managed: 15 | 3–4: 10 | 5+: 5

CROSS-FUNCTIONAL ALIGNMENT SCORE = Sum of 5 factors (0–100)
```

### Metric 2 — Leadership Influence Score (0–100)

```
Source: skills/mentoring/technical-leadership.md (Dimension 2) + sponsorship activity

The Leadership Influence Score measures how far engineering's perspective reaches
beyond its own team boundary.

5 INFLUENCE DIMENSIONS (0–20 each):

Dimension 1 — Technical Authority (0–20)
  Are engineering technical constraints respected and acted on by non-engineering stakeholders?
  Always acted on with minimal negotiation: 20 | Usually: 15 | Sometimes: 10 | Rarely: 5

Dimension 2 — Strategic Inclusion (0–20)
  Is engineering included in strategic planning before decisions are made (not just asked to implement)?
  Included in all relevant planning: 20 | Included in most: 15 | Included rarely: 10 | Excluded: 5
  Exclusion signal: Engineering learns of decisions through implementation requests

Dimension 3 — Thought Leadership (0–20)
  Has engineering produced ideas, proposals, or frameworks that other functions adopted?
  3+ adopted this quarter: 20 | 1–2: 15 | Proposed but not adopted: 10 | Not proposing: 5

Dimension 4 — Network Reach (0–20)
  How many senior cross-functional relationships does the EM + senior engineers maintain?
  Strong relationships with 5+ senior cross-functional partners: 20 | 3–4: 15 | 1–2: 10 | 0: 5

Dimension 5 — Reputation Signal (0–20)
  What does the organization say about engineering when engineering is not in the room?
  Consistent positive attribution: 20 | Generally positive; some concerns: 15 | Mixed: 10 | Negative: 5
  Source: Skip-level input; cross-functional partner feedback; executive commentary

LEADERSHIP INFLUENCE SCORE = Sum of 5 dimensions (0–100)

THRESHOLDS:
  80–100: High influence — engineering is a sought-after organizational partner
  60–79: Building — influence present in some domains; expanding
  40–59: Limited — engineering executes requests; limited co-creation or upstream influence
  <40: Low — engineering is perceived as a cost center or a bottleneck; trust deficit
```

### Metric 3 — Stakeholder Health Map (per-partner view)

```
For each key cross-functional partner, score on 4 dimensions:

PARTNER HEALTH SCORECARD:
  Partner: {{Name/Team}}
  Trust score: {{0–20}} | Band: {{Strong / Adequate / Strained / Broken}}
  Last significant interaction: {{date}} | Outcome: {{positive / neutral / negative}}
  Active conflict: {{Y/N}} | Resolution path: {{if Y: specific approach}}
  Influence events (last quarter): {{N decisions changed by engineering input}}
  Alignment on current priorities: {{Full / Partial / Misaligned}}

  EM position in this relationship:
    Party: EM is an advocate for engineering's interests — not neutral
    Facilitator: EM is mediating between parties — neutral required
    Bystander: EM is naming impact without direct stake
    (from skills/conflict/stakeholder-resolution.md)

  Next investment:
    Relationship building: {{when, what format, what goal}}
    Issue to resolve: {{specific tension or misalignment to address}}
    Influence opportunity: {{upcoming decision where engineering input matters}}

RELATIONSHIP RISK FLAGS:
  FLAG 1 — Strained with a critical dependency partner
    "The team that we most depend on has a trust score below 12."
    Intervention: Dedicated relationship repair; NOT more meetings — quality investment
    Priority: Resolve before the next project that requires their cooperation

  FLAG 2 — Engineering excluded from strategic planning
    "I learned of [decision] after it was made. I was not in the room."
    Intervention: Direct conversation with the decision-maker about engineering's role upstream
    Root cause: Either low trust (they don't think engineering input is valuable) or
    process failure (no one thought to include engineering)

  FLAG 3 — No cross-functional influence events in last quarter
    "Engineering hasn't changed any decision outside engineering in 90 days."
    Interpretation: Either engineering isn't proposing (passive); or proposals aren't
    landing (low influence/trust)
    Intervention: Active agenda-setting; bring recommendations, not just responses
```

### Metric 4 — Meeting and Decision Quality (cross-functional)

```
Source: skills/meetings/decision-log.md + skills/meetings/meeting-planner.md

CROSS-FUNCTIONAL MEETING EFFECTIVENESS:
  % of cross-functional meetings with a stated purpose and required outcome: {{%}}
  % of cross-functional meetings that produced a decision or clear alignment: {{%}}
  Average attendance per cross-functional meeting (target: 3–7): {{N}}
  % of cross-functional meetings that could have been async: {{%}}

  High % of unnecessary meetings with cross-functional partners → signals relationship issues
  or unclear role boundaries (meetings used to maintain relationships, not produce outcomes)

DECISION STICKINESS BY PARTNER:
  Partner    | Decisions Made (last quarter) | Relitigated | Stickiness %
  Product    | {{N}}                         | {{N}}       | {{%}}
  Design     | {{N}}                         | {{N}}       | {{%}}
  Leadership | {{N}}                         | {{N}}       | {{%}}

  Low stickiness with a specific partner → relationship or process issue; investigate

CONFLICT HISTORY:
  Active cross-functional conflicts: {{N}} | In resolution: {{N}} | Chronic (3+ months): {{N}}
  skills/conflict/stakeholder-resolution.md — chronic conflicts are relationship failures
```

---

## Decision Tree

```
What does the Stakeholder Dashboard reveal?

├── CROSS-FUNCTIONAL ALIGNMENT SCORE <60
│   └── Identify which factor is lowest:
│       Relationship quality low → per-partner health map; repair priority
│       Decision stickiness low → decision log + DACI clarity; who makes what
│       Influence events = 0 → engineering is reactive; move upstream
│       Escalation frequency high → proactive alignment; surface issues before they escalate

├── PARTNER TRUST SCORE <8 (STRAINED OR BROKEN)
│   └── Relationship repair is urgent — strained partnerships create organizational friction
│       Two-step approach:
│       1. Diagnose: Which trust dimension is lowest? (Reliability / Transparency / Competence / Good faith)
│       2. Repair the specific dimension: Reliability → under-commit and over-deliver for one quarter
│         Transparency → proactive bad news; don't wait for them to ask
│         Competence → one visible win in their domain; let them see engineering quality
│         Good faith → explicitly demonstrate cross-functional orientation in next meeting

├── LEADERSHIP INFLUENCE SCORE <60
│   └── Identify the lowest dimension:
│       Technical authority not respected → translate constraints to business language first
│       Strategic exclusion → direct conversation: "I want to be part of [planning forum]. Who do I talk to?"
│       No thought leadership → assign engineering lead to produce one cross-functional recommendation per quarter
│       Network reach low → deliberate relationship investment; 3 new senior cross-functional relationships per quarter
│       Reputation unknown → skip-level feedback request; cross-functional partner interviews quarterly

├── ENGINEERING EXCLUDED FROM STRATEGIC PLANNING
│   └── Exclusion is both a relationship signal and an organizational risk
│       Is exclusion intentional or oversight? Ask directly: "I wasn't in [forum]. Was that intentional?"
│       If oversight: request inclusion for future sessions; demonstrate value quickly
│       If intentional: trust deficit; repair work required before inclusion is offered
│       Do not bypass: inclusion earned by demonstrating business partnership, not demanded

├── NO CROSS-FUNCTIONAL INFLUENCE EVENTS IN 90 DAYS
│   └── Engineering is in execution mode; not in co-creation mode
│       Proactive recommendation this week: identify one upcoming non-engineering decision
│         where engineering constraints matter; prepare a brief; present it
│       Target: one cross-functional influence attempt per month; measure what sticks

└── ALL STAKEHOLDER RELATIONSHIPS HEALTHY
    → Monthly review: relationships degrade silently when not maintained
    → Quarterly: senior relationship check — has anything changed in their priorities?
    → Annual: does the stakeholder map reflect the actual decision-makers? Org change is constant.
```

---

## Output

### Stakeholder Dashboard Scorecard

```
STAKEHOLDER DASHBOARD — {{EM Name}} — {{Date}}

COMPOSITE SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Cross-Functional Alignment Score: {{0–100}} | {{High / Adequate / Low / Misaligned}}
Leadership Influence Score:       {{0–100}} | {{High / Building / Limited / Low}}

STAKEHOLDER HEALTH MAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Partner         | Trust (0–20) | Health     | Active Conflict | Last Interaction | Next Investment
Product PM      | {{score}}    | {{Strong/Adequate/Strained/Broken}} | {{Y/N}} | {{date}} | {{action}}
Design Lead     | {{score}}    | {{...}}    | {{Y/N}}         | {{date}}         | {{action}}
Data/Analytics  | {{score}}    | {{...}}    | {{Y/N}}         | {{date}}         | {{action}}
VP/Executive    | {{score}}    | {{...}}    | {{Y/N}}         | {{date}}         | {{action}}
Finance         | {{score}}    | {{...}}    | {{Y/N}}         | {{date}}         | {{action}}
[Other key partners]

RELATIONSHIP RISK FLAGS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Strained critical dependency: {{Y/N}} | Partner: {{name}} | Repair action: {{specific}}
Strategic exclusion detected: {{Y/N}} | Forum: {{name}} | Response: {{specific}}
No influence events (90 days): {{Y/N}} | Next attempt: {{action by date}}

ALIGNMENT DETAIL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision stickiness (all partners): {{%}} | Worst partner: {{name}} ({{%}})
Blocker resolution velocity: {{N days avg}} | Slowest: {{partner}} ({{N days}})
Influence events this quarter: {{N}} | Partners influenced: {{list}}
Escalation count this quarter: {{N}} | Managed: {{N}} | Unexpected: {{N}}

LEADERSHIP INFLUENCE BREAKDOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Technical authority: {{0–20}} | Strategic inclusion: {{0–20}}
Thought leadership: {{0–20}} | Network reach: {{0–20}} | Reputation: {{0–20}}
Weakest dimension: {{name}} → {{specific investment action}}

TALKING POINTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
For {{partner at strained trust}}:
  Context: {{what's the specific trust dimension that's low}}
  Approach: {{repair strategy in business language}}
  Timeframe: {{when to assess whether trust has improved}}

RISKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Risk 1: {{Partner at broken trust}} — engineering being routed around on {{project/domain}}
Risk 2: {{Strategic exclusion}} — decisions affecting engineering being made without input
Risk 3: {{Influence declining}} — trend over last 3 quarters: {{trend direction}}

DECISIONS NEEDED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Active conflict requiring resolution}} — EM position: {{Party/Facilitator/Bystander}}
Decision needed: {{specific resolution}}

FOLLOW-UP ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Name}} relationship repair: {{specific action}} by {{date}}
Influence opportunity: {{upcoming decision}} — prepare brief by {{date}}
Strategic inclusion ask: {{specific forum}} — conversation with {{person}} by {{date}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Stakeholder trust scores sourced from actual interactions, not assumptions | Base: 65% |
| Influence events tracked with specific decisions changed | +15% |
| Cross-functional partner input gathered quarterly | +10% |
| Relationship health validated with skip-level or peer feedback | +10% |
| Stakeholder map never updated; based on stale impressions | −30% |
| No influence events tracked; assumed influence without evidence | −20% |
| Conflict signals ignored or not addressed for 3+ months | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Stale stakeholder map** | EM operates on relationships from 12 months ago; org has changed; relationships have shifted | Quarterly review of every key partner relationship against current signals. |
| **Influence assumed** | EM believes engineering is influential because relationships feel warm | Measure influence events: did engineering change a decision? Not sentiment — outcomes. |
| **Reactive to conflict** | Stakeholder conflict addressed only when it escalates to engineering's leadership | Monthly relationship health scan; repair strained relationships before they break. |
| **Strategic exclusion accepted** | Engineering learns of decisions after they're made; treats it as normal | Exclusion is a trust signal. Address it directly; demonstrate business partnership to earn inclusion. |

---

## References

- `skills/conflict/stakeholder-resolution.md` — Relationship repair and conflict resolution
- `skills/meetings/executive-meeting.md` — Executive relationship quality and influence
- `political-signals/political-signals.md` — Exclusion and misalignment signals
- `analytics/organization-dashboard.md` — Cross-functional alignment shared metric

## Related Skills

| Skill | Relationship |
|---|---|
| `analytics/organization-dashboard.md` | Cross-functional alignment score shared; org dashboard provides team-level context |
| `skills/conflict/stakeholder-resolution.md` | Strained/broken relationships trigger stakeholder resolution skill |
| `skills/meetings/executive-meeting.md` | Executive relationship health feeds stakeholder dashboard |
| `political-signals/political-signals.md` | Exclusion and escalation signals feed this dashboard |
