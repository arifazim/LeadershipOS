# Skill: Impact Tracker

**Domain**: Career / Promotion
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Weekly (log entries) + Monthly (review and quantify) + Quarterly (package for evidence audit)

---

## Purpose

Capture, quantify, and organize engineering impact continuously — so that every significant contribution is recorded with outcomes, scope, and audience at the time it happens, building the evidence portfolio that makes promotion packets credible rather than reconstructed.

**What the EM does automatically**: For every significant work event, the EM:
1. Captures the event with context, outcome, and scope
2. Quantifies the business impact (not just the activity)
3. Tags the evidence type (maps to promotion-evidence.md requirements)
4. Identifies who observed or was affected (visibility dimension)
5. Flags when a particularly strong impact event should be escalated to manager visibility

Impact that isn't tracked doesn't exist to a calibration committee. The engineer who ships the most isn't promoted — the engineer whose impact is most visible, quantified, and attributable is. Tracking is not self-promotion. It is evidence discipline.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Events to log** | Projects completed, decisions made, people helped, problems solved |
| **Outcome data** | Measurable change that resulted from the work |
| **Scope** | How many people / systems / teams were affected |

### Optional
| Input | Description |
|---|---|
| **Metrics data** | Performance numbers, delivery data, cost or time savings |
| **Feedback received** | Quotes from peers, managers, cross-functional partners |
| **Stakeholder names** | Who benefited from or observed this impact |

---

## Analysis

### Step 1 — Impact Entry Format

Every impact entry should be logged in this format:

```
IMPACT LOG ENTRY

Date: {{date}}
Initiative / Event: {{name or brief description}}
Category: {{Technical | Delivery | People | Process | Strategic | Cross-functional}}
Evidence type: {{maps to promotion-evidence.md requirements}}

WHAT I DID:
  {{1–2 sentences: action taken, decision made, or problem solved}}

OUTCOME / RESULT:
  {{Quantified: $X, N%, N people, N hours, N days}}
  {{If not yet quantifiable: describe the change and when data will be available}}

SCOPE:
  {{Self | Team | Multi-team | Org | Company}}

WHO OBSERVED / BENEFITED:
  {{Names or roles — these become the evidence audience for the promotion packet}}

QUOTE OR FEEDBACK (if received):
  "{{verbatim if possible}}" — {{source}}

PROMOTION RELEVANCE:
  Target level gap this addresses: {{dimension from promotion-readiness.md}}
  Evidence strength: {{Strong | Adequate | Weak — explain if not Strong}}
```

### Step 2 — Impact Categories and Quantification Methods

| Category | What to track | How to quantify |
|---|---|---|
| **Technical** | Architecture decisions, system improvements, tech debt reduction | Performance % improvement, incidents prevented, deployment time reduced, lines of tech debt removed |
| **Delivery** | Features shipped, projects unblocked, timeline recovered | Time to market, sprint commitment met %, scope delivered vs. planned |
| **People** | Mentoring, hiring, onboarding, conflict resolution | Engineers developed (named), time-to-productivity for new hires, promotions influenced |
| **Process** | Processes introduced, waste eliminated, quality improved | Time saved per cycle, defect rate change, cycle time reduction |
| **Strategic** | Strategy influenced, investment justified, roadmap shaped | Decisions adopted by leadership, investment approved, OKR coverage provided |
| **Cross-functional** | Unblocked another team, resolved cross-team conflict, built partnership | Teams unblocked, delivery accelerated for other teams, alignment achieved |

### Step 3 — Impact Quantification Escalation

Not everything can be quantified immediately. Use this escalation ladder:

```
Tier 1 — Exact metric (best):
  "Reduced deployment time from 45 minutes to 8 minutes (-82%)"
  "Mentored {{name}} who was promoted 3 months later"

Tier 2 — Estimated metric (good):
  "Saved approximately 10 engineering-hours per sprint (~$2,000/sprint at fully loaded rates)"
  "Eliminated the need for manual QA step that was consuming ~0.5 days/sprint per engineer"

Tier 3 — Described outcome (acceptable):
  "Resolved 3-week cross-team deadlock that was blocking the enterprise launch"
  "Defined the onboarding process now used by all new hires on the team"

Tier 4 — Activity only (insufficient for promotion):
  "Led the migration project"
  "Mentored junior engineers"
  
  → Tier 4 entries must be upgraded before being used as promotion evidence.
    Ask: "And therefore, what changed?"
```

### Step 4 — Monthly Impact Review

At the end of each month, review all entries and:

```
1. Upgrade Tier 4 entries: Find the outcome for any activity-only entries
2. Check coverage: Which evidence types had entries this month? Which had none?
3. Flag strong entries: Any entry scoring 8+/10 on the evidence quality rubric should be
   surfaced to the manager at the next 1:1 ("I want to make sure you know about X")
4. Calculate monthly impact score:
   
   Monthly impact score = (Number of Tier 1+2 entries × 3) + (Tier 3 entries × 1)
   Target: ≥ 6 points/month for a promotion-track pace

   Below 3 points: Not generating promotion-level evidence
   3–5 points: Adequate evidence pace
   ≥ 6 points: Strong promotion evidence trajectory
```

---

## Decision Tree

```
What does the impact tracker reveal?

├── MONTHLY SCORE CONSISTENTLY BELOW 3 (thin evidence trail)
│   └── Two possible causes:
│       A) Not doing promotion-level work → scope problem
│          → Invoke: skills/career/promotion/career-roadmap.md for project selection
│       B) Doing the work but not capturing it → discipline problem
│          Recommendation: Weekly 15-minute logging session; treat as non-negotiable
│       Frame: "You're generating {{N}} impact points/month.
│       Promotion-track pace is 6+. The gap is {{A: scope | B: tracking discipline}}."

├── STRONG ENTRIES NOT SURFACED TO MANAGER
│   └── Evidence exists in the tracker but manager doesn't know about it
│       This creates a visibility gap — calibration committees rely on manager advocacy
│       Action: At next 1:1, share one strong entry: "I wanted to make sure you knew about X"
│       → Invoke: skills/career/promotion/visibility-score.md

├── EVIDENCE TYPE GAPS (some categories consistently empty)
│   └── Cross-reference with promotion-evidence.md required types
│       If a required evidence type has no entries in 3+ months:
│         This is a structural gap — no amount of other work compensates
│       → Invoke: skills/career/promotion/promotion-gaps.md for targeted remediation

├── ALL ENTRIES ARE TIER 4 (activity only)
│   └── Systematic upgrade needed — go back through last 90 days
│       For each entry: "{{Activity}} — what changed as a result?"
│       If you can't answer: the impact was not visible enough
│         → This is a scope signal, not a tracking signal

└── EVIDENCE TRAIL IS STRONG AND CURRENT
    └── Run quarterly evidence audit to check coverage
        Package best entries for promotion packet
        → Invoke: skills/career/promotion/promotion-evidence.md for audit
```

---

## Output

### Impact Log Dashboard

```
IMPACT TRACKER SUMMARY — {{Name}} — {{Quarter}} — {{date}}

QUARTERLY SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total entries: {{N}}
Tier 1 (exact metric): {{N}} entries
Tier 2 (estimated metric): {{N}} entries
Tier 3 (described outcome): {{N}} entries
Tier 4 (activity only — needs upgrade): {{N}} entries

Monthly impact score: {{Month 1: N}} | {{Month 2: N}} | {{Month 3: N}}
Trend: {{Accelerating 🟢 | Stable 🟡 | Declining 🔴}}

COVERAGE BY EVIDENCE TYPE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Technical:        {{N}} entries | Strongest: {{entry name}}
Delivery:         {{N}} entries | Strongest: {{entry name}}
People:           {{N}} entries | Strongest: {{entry name}}
Process:          {{N}} entries | Strongest: {{entry name}}
Strategic:        {{N}} entries | Strongest: {{entry name}}
Cross-functional: {{N}} entries | Strongest: {{entry name}}

⚠️ Missing this quarter: {{categories with 0 entries}}

TOP 5 PROMOTION PACKET ENTRIES (quarterly best)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Initiative}} — {{Outcome}} — Score: {{N}}/10 — Scope: {{level}} — Audience: {{names}}
2. {{Initiative}} — {{Outcome}} — Score: {{N}}/10 ...
3. ...

ENTRIES NEEDING MANAGER VISIBILITY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
→ {{Entry}} — Suggested 1:1 framing: "I wanted to make sure you knew about {{X}}..."

ENTRIES NEEDING UPGRADE (Tier 4)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
→ {{Entry}} — Ask: "What changed as a result of this work?"
```

---

## Example Entries

```
STRONG ENTRY (Tier 1 — 9/10 quality):
Date: July 15, 2025
Initiative: Payment API latency remediation
Category: Technical
Evidence type: Architectural decision with documented impact

WHAT I DID: Identified root cause of P95 latency regression in payment API,
proposed and implemented connection pool optimization.

OUTCOME: P95 latency reduced from 2,100ms to 340ms (-84%). Zero additional
infrastructure cost. Estimated $45K/year in prevented churn based on checkout
abandonment correlation.

SCOPE: Company — payment API serves all product lines
WHO OBSERVED: Sarah (CTO), Raj (VP Product), payment team of 6 engineers
QUOTE: "This was the most impactful technical fix we've had in Q2" — Raj (VP Product)
PROMOTION RELEVANCE: Ambiguity handling + Technical/Domain leadership gap

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

WEAK ENTRY UPGRADED (Tier 4 → Tier 2):
Before: "Mentored Alex on system design"
After:  "Ran weekly system design sessions with Alex (L3→L4 transition) over 8 weeks.
         Alex passed their L4 system design interview and was promoted in July 2025.
         Est. 3-month acceleration vs. unguided timeline."
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Entries logged continuously (not reconstructed) | Base: 65% |
| Outcomes quantified (Tier 1 or 2) | +15% |
| Evidence types mapped to promotion requirements | +10% |
| Observer/audience documented per entry | +10% |
| Monthly review discipline maintained | +5% |
| Entries all Tier 4 (activity only) | −30% |
| Reconstructed at review time (not continuous) | −20% |
| No audience/observer documented | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Activity logging** | Entries describe what was done, not what changed | Every entry needs "And therefore, what changed?" before it qualifies as evidence. |
| **Reconstruction at review time** | Packet assembled from memory at review cycle | Log weekly. Context and outcome details degrade within days. Reconstruction loses 40–60%. |
| **No audience documentation** | Strong impact happened; no one listed who saw it | Name observers at logging time. Calibration relies on advocates who remember specific things. |
| **Scope inflation** | "Cross-org impact" for work that affected one team | Scope must match evidence. Overstating scope destroys credibility with calibration reviewers. |
| **Thin evidence in critical types** | 20 delivery entries; 0 people development entries | Track coverage by type. Every required evidence type needs monthly entries. |

---

## References

- `skills/career/promotion/promotion-evidence.md` — Evidence type requirements the tracker feeds
- `skills/career/promotion/visibility-score.md` — Surfacing tracked evidence to the right audience
- `skills/career/promotion/promotion-gaps.md` — Gap analysis uses tracker data to identify thin areas

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/career/promotion/promotion-evidence.md` | Tracker generates; evidence skill audits |
| `skills/career/promotion/visibility-score.md` | Strong tracker entries must be visible to decision-makers |
| `skills/career/promotion/promotion-gaps.md` | Tracker coverage map feeds gap analysis |
| `skills/career/promotion/career-roadmap.md` | Low monthly score triggers project selection review |
