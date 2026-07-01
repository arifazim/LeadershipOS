# Skill: Succession Planning

**Domain**: Strategy
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Annual (readiness assessment) + Triggered (key departure, promotion decision, reorg)

---

## Purpose

Identify key-person dependencies, assess leadership and technical successor readiness, and build development paths that ensure no single departure — including the EM themselves — creates a recovery gap measured in quarters rather than weeks.

**What the EM does automatically**: For organizational resilience, the EM:
1. Maps delivery concentration: which people hold disproportionate knowledge or responsibility
2. Scores successor readiness for critical roles (0–100 scale, not qualitative)
3. Identifies development gaps and builds concrete remediation plans
4. Detects when the organization has become structurally dependent on individuals
5. Recommends when a departure risk is high enough to preemptively act

Organizations don't fail because their best people leave. They fail because they never prepared for it. The EM who treats succession as continuous practice avoids the crises the EM who ignores it creates.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Team roster** | All engineers, roles, seniority, tenure |
| **Delivery contribution map** | Which engineers own which systems, domains, and capabilities |
| **Organizational structure** | Reporting relationships, team dependencies, stakeholder ownership |

### Optional
| Input | Description |
|---|---|
| **Flight risk signals** | Compensation benchmarking, engagement signals, recent 1:1 themes |
| **Promotion pipeline** | Engineers being considered or targeted for advancement |
| **Prior succession gaps** | Areas where prior departures caused delivery disruption |
| **Leadership aspirations** | Engineers who have expressed interest in EM or tech lead roles |

---

## Analysis

### Step 1 — Identify Key Roles and Knowledge Holders

```
For each critical domain or system, identify:
  Primary owner: Who is primarily responsible?
  Backup owner: Who has meaningful context and could cover?
  Bus factor: How many people must leave before this breaks? (Target: ≥ 2)

Bus factor = 1 is a single point of failure. Flag immediately.
Bus factor = 2 is minimal coverage. Plan to improve.
Bus factor ≥ 3 is healthy.

Critical domains to check:
  Systems: Production systems with no documented runbook and single owner
  Relationships: Stakeholder or partner relationships held by one person
  Knowledge: Architectural decisions or context held in one person's head
  Delivery: Skills (e.g., security, ML, mobile) concentrated in one engineer
```

### Step 2 — Score Successor Readiness

For each critical role or knowledge domain, identify potential successors and score readiness:

```
Succession Readiness Score (0–100):

Technical readiness: Does the successor have the skills for the role?
  Fully capable today (no gaps): 40 pts
  Minor gaps; 1–3 month ramp: 30 pts
  Moderate gaps; 3–6 month ramp: 20 pts
  Significant gaps; >6 month ramp: 10 pts

Contextual readiness: Does the successor know the domain, systems, and relationships?
  Deep context; exposed regularly: 30 pts
  Moderate context; some exposure: 20 pts
  Limited context; minimal exposure: 10 pts
  No context; new to this area: 0 pts

Leadership readiness: Can the successor lead, communicate, and make decisions at role level?
  Demonstrated at level: 30 pts
  Developing; needs support: 20 pts
  Not yet demonstrated: 10 pts
  Not applicable (technical role): 30 pts (full credit)

Score interpretation:
  80–100: Ready now
  60–79:  Ready with support (6 months)
  40–59:  Development needed (6–12 months)
  <40:    Significant gap (>12 months or external hire needed)
```

### Step 3 — Calculate Organizational Risk

```
Key-person risk score = Probability of departure × Impact of departure

Probability of departure:
  Flight risk signals (compensation gap, disengagement, competing offers): +0.3
  Promotion trajectory stalled: +0.2
  <1 year tenure (early departure risk): +0.1
  >5 years tenure with no growth (anchored, low flight risk): −0.1

Impact of departure:
  Bus factor = 1 for a critical system: 5 (maximum impact)
  Bus factor = 2 for a critical system: 3
  Unique stakeholder relationships: +1
  Unique technical expertise: +1

Key-person risk score > 3.0: Critical — act now
Key-person risk score 2.0–3.0: High — active development plan required
Key-person risk score 1.0–2.0: Medium — monitor; improve bus factor
Key-person risk score < 1.0: Low — routine attention
```

### Step 4 — Build Development Plans for Succession Gaps

For each High/Critical key-person risk, create a concrete development plan:

| Development action | Timeline | Effect |
|---|---|---|
| Pair programming / shadowing | 4–8 weeks | Contextual readiness +10–20 pts |
| Ownership transfer (co-lead then lead) | 8–16 weeks | Technical + contextual readiness +20–30 pts |
| Stakeholder introduction and handoff | 2–4 weeks | Relationship readiness +10–20 pts |
| Runbook / architecture documentation | 2–4 weeks | Bus factor improvement; context transferable |
| Cross-team rotation | 8–12 weeks | Contextual breadth |

---

## Decision Tree

```
What does the succession assessment reveal?

├── BUS FACTOR = 1 ON A CRITICAL SYSTEM
│   └── Immediate action regardless of flight risk
│       This is a structural fragility, not a personnel risk
│       Action: Assign a co-owner this sprint; begin documentation + shadow sessions
│       Timeline: Bus factor ≥ 2 within 8 weeks
│       Frame: "{{System}} has a bus factor of 1. One departure or illness
│       creates a production risk. We need a second owner by {{date}}."

├── HIGH FLIGHT RISK ON KEY-PERSON (probability > 0.5)
│   └── Two-track response:
│       Track 1: Retention — address the root cause if addressable
│       Track 2: Succession — begin transfer regardless of retention outcome
│       Do NOT: Wait to see if they leave before starting succession
│       → Invoke: skills/people/prepare-one-on-one.md for retention conversation
│       → Invoke: skills/people/assess-burnout.md if disengagement is the signal

├── PROMOTION CANDIDATE (readiness score 60–79)
│   └── Create 6-month development plan targeting 80+ readiness score
│       Name the gaps explicitly: "{{Person}} is 65/100 ready for {{role}}.
│       Gaps: contextual readiness in {{domain}} (+15 pts needed) and
│       leadership readiness demonstrated in {{context}} (+10 pts needed).
│       Plan: {{specific actions}} targeting {{date}}."
│       → Invoke: skills/people/build-growth-plan.md
│       → Invoke: skills/people/build-promotion-case.md when score reaches 80+

├── EM SUCCESSION (own role)
│   └── The EM must plan for their own replacement
│       Identify 1–2 candidates for EM role (internal or external)
│       Build tech lead → EM development path for strongest candidate
│       Self-assessment: Would the team function for 3 months if I were gone tomorrow?
│         If no: address the structural dependency

└── SUCCESSION HEALTH IS ADEQUATE (all critical roles have bus factor ≥ 2)
    └── Annual review: update readiness scores, refresh flight risk assessment
        Celebrate promotions as succession successes — not departures
        Publish development plans: visibility accelerates readiness
```

---

## Output

### Succession Planning Report

```
SUCCESSION PLANNING ASSESSMENT — {{Team}} — {{date}}

ORGANIZATIONAL RESILIENCE SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Critical roles/systems assessed: {{N}}
Bus factor = 1 (single points of failure): {{N}} | {{🔴 if > 0}}
High/Critical key-person risk: {{N}} individuals
Ready-now successors: {{N}} / {{N}} critical roles

KEY-PERSON RISK REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Person       | Role/Domain      | Bus Factor | Flight Risk | Impact | Risk Score | Action
{{name}}     | {{domain}}       | 1          | 0.4         | 5      | 4.2        | 🔴 Critical — immediate
{{name}}     | {{domain}}       | 2          | 0.2         | 3      | 1.5        | 🟡 Medium — monitor
{{name}}     | {{domain}}       | 3          | 0.1         | 2      | 0.8        | 🟢 Low

SUCCESSOR READINESS MATRIX
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Role / Domain    | Incumbent   | Successor(s)         | Readiness Score | Gap        | Timeline
{{role}}         | {{name}}    | {{name}} (primary)   | 72/100          | Context −8 | 6 months
                 |             | {{name}} (secondary) | 48/100          | Technical  | 12 months
{{role}}         | {{name}}    | NONE                 | —               | No pipeline| 🔴 Hire or develop

DEVELOPMENT PLANS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Person | Target Role   | Current Score | Target Score | Actions                          | Timeline
{{name}}| {{role}}     | 72            | 85           | Shadow {{name}} on {{domain}};   | Q3
        |              |               |              | Lead {{project}} independently   |

FLAGS
⚠️ {{Bus factor = 1 instances with immediate action required}}
⚠️ {{Roles with no identified successor}}
🔴 {{High flight risk + high impact combinations}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Bus factor assessed for all critical systems | Base: 65% |
| Readiness scored numerically (not qualitative) | +15% |
| Key-person risk score calculated | +10% |
| Development plans with timelines produced | +10% |
| EM own role assessed | +5% |
| Only technical succession assessed (not stakeholder/relationship) | −15% |
| Qualitative assessment only ("strong candidate") | −20% |
| No development plans produced | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Succession = replacement only** | Plans only activate when someone announces departure | Succession is continuous development, not a response to resignation. Run assessments annually. |
| **Bus factor ignored** | Single owners of critical systems; no coverage planned | Bus factor = 1 is a production risk, not just an HR risk. Treat it as an outage risk. |
| **Qualitative readiness** | "They could probably do it" — no score, no gap analysis | Score every successor. A number surfaces gaps that "probably ready" conceals. |
| **EM excluded** | EM plans everyone's succession except their own | The EM is the highest single point of failure in many teams. Plan it. |
| **Development plans without accountability** | Plans created, not executed | Assign owner (usually the EM), tie to 1:1 agenda, review quarterly. Plans without owners don't execute. |

---

## References

- `skills/strategy/capacity-planning.md` — Key-person departure affects capacity projections
- `skills/strategy/risk-planning.md` — Key-person risk feeds the organizational risk category
- `skills/people/build-growth-plan.md` — Development plans for succession gaps
- `skills/people/build-promotion-case.md` — Readiness score feeds promotion timing
- `skills/people/prepare-one-on-one.md` — Retention conversation for high flight-risk individuals

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/risk-planning.md` | Key-person concentration is an organizational risk |
| `skills/strategy/capacity-planning.md` | Succession gap = capacity risk |
| `skills/people/build-growth-plan.md` | Development plan for succession readiness |
| `skills/people/build-promotion-case.md` | Succession readiness score informs promotion timing |
