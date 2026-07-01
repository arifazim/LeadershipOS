# Skill: Promotion Evidence

**Domain**: Career / Promotion
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Continuous (log as events happen) + Monthly (review completeness) + Quarterly (gap check)

---

## Purpose

Define what evidence is required for each level transition, audit current evidence against those requirements, and answer "What evidence am I missing?" with the specificity needed to collect it before the review cycle — not scramble for it during.

**What the EM does automatically**: When auditing promotion evidence, the EM:
1. Maps the required evidence types for the target level transition
2. Audits current evidence against each required type
3. Calculates evidence completeness: what is present, what is partial, what is missing
4. Identifies the highest-leverage evidence gaps (those most likely to determine promotion outcome)
5. Generates a 90-day evidence collection plan for missing categories

The single most common reason promotions fail is not performance — it's documentation. The work happened. The evidence doesn't exist. Promotion is a business case, not a performance review. Business cases require evidence.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current and target level** | Determines the evidence requirements |
| **Work completed in last 12 months** | Projects, decisions, mentoring, cross-functional work |
| **Outcomes achieved** | Business, technical, and organizational outcomes from that work |

### Optional
| Input | Description |
|---|---|
| **Company promotion rubric** | Published criteria to supplement this framework |
| **Prior promotion packets** | Successful examples from peers at the same transition |
| **Manager feedback themes** | What your manager consistently observes about your work |

---

## Analysis

### Step 1 — Evidence Requirements by Level Transition

#### L3 → L4 (Engineer → Senior Engineer)
| Evidence type | Minimum count | Quality bar |
|---|---|---|
| Features owned end-to-end | 2+ features | Owned from design to production; no major hand-holding |
| Technical decisions made | 3+ documented decisions | With rationale and tradeoffs; accepted by team |
| Code quality signals | Review history | Reviewers cite this person as raising quality bar |
| Mentoring junior engineers | 1–2 instances | Named junior, specific guidance, measurable outcome |
| Cross-team collaboration | 1+ instances | Worked with another team; delivered shared outcome |

#### L4 → L5 (Senior → Staff Engineer)
| Evidence type | Minimum count | Quality bar |
|---|---|---|
| Initiatives scoped and delivered | 2+ multi-sprint initiatives | You defined the problem, not just solved it |
| Architectural decisions | 2+ with documented impact | ADR or equivalent; org-wide or system-wide |
| Engineers made more effective | 3+ named engineers | Specific way you improved their work output |
| Cross-team technical leadership | 2+ instances | Led technical direction across teams; drove alignment |
| Ambiguous problem resolved | 1+ significant | Problem was undefined; you defined it AND solved it |
| Technical strategy influence | 1+ instance | Shaped team or org technical direction |

#### L5 → L6 (Staff → Principal Engineer)
| Evidence type | Minimum count | Quality bar |
|---|---|---|
| Company-scope technical impact | 1+ | Decision or system affecting multiple org/products |
| Engineering organization shaped | Demonstrated | Changed how engineers work, not just what they built |
| Externally visible contribution | Optional | Publication, talk, open source, standards body |
| Junior/mid/senior mentored | 5+ | Named individuals; career trajectory influenced |
| Technical strategy authored | 1+ | Multi-year technical direction; leadership-adopted |

#### M1 → M2 (EM → Senior EM / Director)
| Evidence type | Minimum count | Quality bar |
|---|---|---|
| Teams built and delivered | 2+ quarters | Team health metrics; delivery against plan |
| Managers or tech leads developed | 1+ | Named person; measurable career growth |
| Cross-org delivery led | 1+ | Drove delivery across teams you don't own |
| Organizational problem solved | 1+ | Process, structure, or system that your org now depends on |
| Executive-level presentation | 2+ | Presented to VP+ level; clear business framing |
| Budget or headcount owned | Demonstrated | Made investment decisions with business justification |

#### M2 → M3 (Director → VP / Sr Director)
| Evidence type | Minimum count | Quality bar |
|---|---|---|
| Organizational transformation | 1+ | Restructured, reoriented, or rebuilt a multi-team org |
| Business outcome ownership | Demonstrated | Owned an OKR or P&L-adjacent outcome at org level |
| Strategic narrative built | 1+ | Multi-year engineering strategy aligned to company bets |
| C-suite relationship | Demonstrated | Trusted advisor at CEO/CPO/CTO level on engineering matters |
| Succession developed | 1+ | Someone promoted into M1 or M2 because of your development |

### Step 2 — Evidence Quality Rubric

Not all evidence is equal. Score each piece of evidence on four quality dimensions:

```
Evidence quality score (0–10 per piece):

Specificity (3 pts):
  Named initiative, named people, named outcome: 3 pts
  Named initiative, outcome described: 2 pts
  Vague ("led a project"): 0–1 pts

Impact (3 pts):
  Quantified business outcome ($X, N%, N people): 3 pts
  Described outcome (shipped, improved, resolved): 2 pts
  Activity described but no outcome: 0–1 pts

Scope alignment (2 pts):
  Evidence demonstrates target level scope: 2 pts
  Evidence demonstrates current level scope: 1 pt
  Evidence demonstrates below current level scope: 0 pts

Recency and pattern (2 pts):
  Multiple examples over 12 months: 2 pts
  Single recent example: 1 pt
  Single older example (>12 months): 0 pts

Strong evidence: 8–10 pts
Adequate evidence: 5–7 pts
Weak evidence: 0–4 pts (does not support promotion case)
```

### Step 3 — Audit Evidence Completeness

```
For each required evidence type:
  Present and strong (8–10): ✅ Covered
  Present but weak (5–7):    ⚠️ Needs strengthening
  Absent:                    ❌ Missing — collect before review cycle

Evidence completeness score:
  % of required types covered at "Present and strong" quality

  90–100%: Packet is ready — proceed to packaging
  75–89%:  Nearly ready — strengthen weak items; collect 1–2 missing
  60–74%:  Needs 90-day collection effort
  < 60%:   Significant gaps — 6-month collection effort required
```

---

## Decision Tree

```
What does the evidence audit reveal?

├── STRONG EVIDENCE ACROSS ALL REQUIRED TYPES
│   └── Package the promotion packet
│       Ensure narrative connects evidence to level expectations
│       → Invoke: skills/career/promotion/promotion-gaps.md for final check
│       → Invoke: skills/career/promotion/visibility-score.md — evidence exists but
│          does the right audience know about it?

├── MISSING: SCOPE-LEVEL EVIDENCE (no examples at target level scope)
│   └── This is the most common gap — and the most critical
│       Current evidence shows excellent work at current level
│       What is needed: project or decision at target level scope
│       Recommendation: "The next project you take must be scoped at {{target level}}.
│       Anything smaller will not move this gap."
│       → Invoke: skills/career/promotion/career-roadmap.md for project selection
│       → Invoke: skills/career/promotion/impact-tracker.md to track it when it starts

├── MISSING: ORGANIZATIONAL LEVERAGE EVIDENCE
│   └── Evidence shows personal output but not multiplied output
│       What is needed: named engineers made more effective; process or system that scaled
│       Recommendation: "Name one engineer you are developing intentionally.
│       Document what you taught them and what changed in their output."
│       → Invoke: skills/career/promotion/leadership-growth.md

├── WEAK EVIDENCE (present but low quality — mostly activity, no outcome)
│   └── Work was done; outcomes weren't captured
│       Reconstruct: Go back through Slack, tickets, PRs, and emails
│       Extract: What changed? Who benefited? By how much?
│       → Invoke: skills/career/promotion/impact-tracker.md to prevent future loss

└── EVIDENCE OLDER THAN 12 MONTHS DOMINATES
    └── Recency requirement is at risk
        Flag: "Your strongest evidence is from {{N}} months ago.
        Recent evidence (last 6 months) is thin. Review cycles weight recency."
        Action: Identify one current project to produce new strong evidence this quarter
```

---

## Output

### Evidence Audit Report

```
EVIDENCE AUDIT — {{Name}} — {{Current Level}} → {{Target Level}} — {{date}}

OVERALL COMPLETENESS: {{N}}%  |  {{Ready ✅ | Nearly ready ⚠️ | Needs collection ❌}}

EVIDENCE REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Required Type                | Min | Have | Quality | Status | Notes
{{evidence type}}            | {{N}} | {{N}} | {{N}}/10 | ✅/⚠️/❌ | {{gap or note}}
{{evidence type}}            | {{N}} | {{N}} | {{N}}/10 | ✅/⚠️/❌ | {{gap or note}}
{{evidence type (missing)}}  | {{N}} | 0     | —        | ❌ MISSING | {{how to get it}}

TOP EVIDENCE ITEMS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Project/initiative}} — Score: {{N}}/10
   Impact: {{quantified outcome}}
   Scope: {{level it demonstrates}}
   Audience: {{who observed it}}

2. {{Project/initiative}} — Score: {{N}}/10
   ...

EVIDENCE GAPS (highest priority first)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
❌ {{Missing type}} — Why it matters: {{which dimension it addresses}}
   How to get it: {{specific action}} by {{target date}}

⚠️ {{Weak type}} — Current quality: {{N}}/10
   How to strengthen: {{specific action}}

90-DAY EVIDENCE PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Month 1: {{specific action to collect or strengthen highest-priority gap}}
Month 2: {{next action}}
Month 3: {{final action before review cycle — reaudit completeness}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Evidence audited against level-specific requirements | Base: 65% |
| Evidence quality scored (not just present/absent) | +15% |
| Gaps ranked by promotion case impact | +10% |
| 12-month evidence window assessed | +10% |
| 90-day collection plan produced | +5% |
| Audit based on self-report only | −20% |
| Evidence not mapped to level requirements | −20% |
| No quality scoring | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Activity logged, outcomes absent** | Evidence describes what was done, not what changed | Every evidence item needs an outcome: "I built X, which reduced Y by Z%." |
| **Recency gaps** | Strongest evidence is 18 months old | Promotion cases weight last 12 months. Strong old evidence doesn't compensate for thin recent evidence. |
| **Scope misalignment** | Evidence is excellent but at current level scope | Target level requires target level scope. Two excellent L4 examples don't equal one L5 example. |
| **Quantity without quality** | 20 evidence items, all at 4/10 | Ten strong items (8–10/10) outperform 30 weak ones. Quality over quantity. |
| **Collected at review time** | Evidence reconstructed at packet-building time | Evidence is logged continuously. Reconstruction loses 40–60% of the detail that mattered. |

---

## References

- `skills/career/promotion/impact-tracker.md` — Continuous evidence collection system
- `skills/career/promotion/promotion-readiness.md` — Readiness dimensions determine which evidence types matter most
- `skills/career/promotion/promotion-gaps.md` — Gap analysis synthesizes evidence gaps with readiness gaps

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/career/promotion/impact-tracker.md` | Evidence is generated by impact tracker; this skill audits completeness |
| `skills/career/promotion/promotion-readiness.md` | Readiness dimensions map to evidence types |
| `skills/career/promotion/promotion-gaps.md` | Gap skill synthesizes readiness + evidence gaps |
| `skills/career/promotion/visibility-score.md` | Evidence exists but may not be visible to the right audience |
