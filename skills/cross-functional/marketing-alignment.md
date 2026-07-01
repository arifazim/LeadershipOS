# Skill: Marketing Alignment

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Launch-based + Monthly (roadmap signal)

---

## Purpose

Align engineering delivery timelines with marketing campaign and launch plans — ensuring that engineering doesn't ship into silence and marketing doesn't promise dates engineering can't meet.

The engineering-marketing misalignment is one of the most common sources of launch-day failure. Marketing builds campaigns around a date. Engineering delays. Marketing either launches without the product or cancels campaigns at the last minute. Both outcomes damage the company.

**The alignment model**: Marketing should never learn about a date change from someone other than engineering. Engineering should never learn about a campaign commitment from someone other than marketing. The EM owns the bridge between these teams.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of marketing launches with engineering confirmation ≥4 weeks before | >90% | <80% = Yellow |
| **Decision latency** | Days from engineering date change to marketing notification | ≤1 business day | >2 days = Yellow; >5 days = Red |
| **Cross-team blockers** | Marketing campaigns blocked by engineering delivery uncertainty | 0 | >1 active = Yellow |
| **Dependency aging** | Confirmed launches with unresolved engineering risks outstanding >7 days | 0 | >1 aging = Yellow |
| **Collaboration health** | Shared launch calendar; date changes communicated proactively; no surprise launches | Green | Surprise dates = Yellow |
| **Stakeholder satisfaction** | Marketing's confidence that engineering delivery is predictable | Green | Quarterly 1:1 |

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Engineering delivery dates** | Confirmed and at-risk delivery dates for customer-facing features |
| **Marketing launch calendar** | Campaigns, events, announcements tied to product launches |
| **Date change signals** | Any engineering dates that are moving or at risk |

### Optional
| Input | Description |
|---|---|
| **Product launch partners** | PR, analyst relations, events tied to the same launch |
| **Feature flags** | Whether launches can be decoupled from code deployment |
| **Soft launches** | Internal or limited releases that marketing should not publicize |

---

## Analysis

### Step 1 — Build the Joint Launch Calendar

The most important artifact in engineering-marketing alignment is a shared launch calendar that both teams update and review.

**Launch status classifications for marketing:**

| Status | Engineering confidence | Marketing action |
|---|---|---|
| ✅ Confirmed | >90% — all risks mitigated | Full campaign launch — proceed |
| 🟡 Probable | 70–90% — minor risks remain | Soft planning — no paid media |
| 🔴 At risk | <70% — meaningful delay possible | Do not commit; hold campaign |
| ⚠️ Date changed | Date moved — confirmed new date | Notify marketing immediately |

**Rule**: Engineering must update the shared launch calendar as soon as a date changes — not after the sprint review, not after the next PM meeting. Same day.

### Step 2 — Decouple Deployment from Launch

One of the highest-leverage engineering practices for marketing alignment: deploy features before marketing announces them, using feature flags.

```
Deployment ≠ Launch

Deploy: Feature is in production, off by default (feature flag)
Launch: Marketing enables the flag (or engineering enables on marketing's signal)

Benefits:
  - Engineering date pressure moves to "deploy" (controllable)
  - Marketing launch date is fully decoupled from code risk
  - Rollback is possible after launch without a "fix" deployment
```

If your team isn't using feature flags for customer-facing launches, this is the highest-ROI practice to introduce.

### Step 3 — Manage Date Changes

When a delivery date changes:
1. Notify marketing EM/lead within 24 hours
2. Provide: new estimated date, reason (business terms, no engineering jargon), confidence level
3. Identify: which campaigns or commitments are affected
4. Propose: options (delay launch, partial launch, soft launch)

**Date change notification template:**
```
Hi [Marketing lead],

The [feature] delivery is moving from [original date] to [new date].
Reason: [business-language explanation]
Confidence in new date: [High/Medium/Low]
Affected campaigns: [what marketing had planned for this date]
Options: [delay launch / partial launch with X / soft launch to segment Y]

I recommend [option]. Let me know if you want to discuss.
```

---

## Decision Tree

```
What is the state of the engineering-marketing alignment?

├── DATE IS MOVING (delivery slipping)
│   └── Immediate: Notify marketing within 24 hours — before anyone else
│       Never: Let marketing find out from the PM, the CEO, or the release notes
│       Provide: New date + confidence + options
│       If delay is significant (>2 weeks): Joint call with marketing and PM to align

├── MARKETING HAS COMMITTED TO A DATE ENGINEERING HASN'T CONFIRMED
│   └── Immediate: Raise with PM — this is a joint priority misalignment
│       Do NOT: Simply accept the date without verifying engineering capacity
│       Frame: "I heard [date] is in the campaign. I need to confirm engineering
│               confidence before that date becomes public."
│       If engineering cannot meet the date: Surface immediately to PM and VP

├── CAMPAIGN IS LOCKED, ENGINEERING IS AT RISK
│   └── Options: Accelerate (overtime, scope reduction, extra resources)
│               Partial launch (ship what's ready; defer rest)
│               Soft launch (launch to segment; protect campaign success rate)
│               Postpone (campaign moves — communicate early enough to limit cost)
│       The EM's job: Give marketing real options. Don't just say "we're trying."

├── FEATURE FLAGS NOT IN USE
│   └── Investment case: Decoupled deploy/launch removes most engineering-marketing tension
│       Present to PM and VP as a reliability + agility investment
│       → Invoke: skills/executive/investment-proposal.md if sprint capacity needed

└── ALIGNMENT IS HEALTHY
    └── Maintain: Monthly joint review of launch calendar
        Invest: Invite marketing to sprint reviews when features they care about ship
        Recognize: When engineering enables a successful launch, attribute it clearly
```

---

## Output

### Launch Alignment Report

```
LAUNCH ALIGNMENT — {{Month/Quarter}}

METRICS
Alignment score:      {{N}}% launches confirmed ≥4 weeks prior | {{🟢/🟡/🔴}}
Decision latency:     {{N}} days avg engineering → marketing date change notification | {{🟢/🟡/🔴}}
Cross-team blockers:  {{N}} campaigns blocked by delivery uncertainty | {{🟢/🟡/🔴}}
Collaboration health: {{Green | Yellow | Red}}
Stakeholder satisfaction: {{Marketing's last signal + date}}

JOINT LAUNCH CALENDAR
Launch          | Eng date  | Status       | Campaign status         | Risk
{{Feature}}     | {{date}}  | ✅ Confirmed | Full campaign — proceed | None
{{Feature}}     | {{date}}  | 🟡 Probable  | Soft plan — no paid media| {{risk}}
{{Feature}}     | {{date}}  | 🔴 At risk   | Hold campaign           | {{risk}}

DATE CHANGES THIS PERIOD
• {{Feature}}: {{old date}} → {{new date}} — notified marketing {{N}} days later
  (target: ≤1 business day) | {{🟢/🟡/🔴}}

FEATURE FLAG STATUS
Features deployed, not yet launched: {{list}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Joint launch calendar maintained | Base: 65% |
| Date changes communicated within 24 hours | +15% |
| Launch status classifications applied | +10% |
| Feature flags used to decouple deploy/launch | +10% |
| Stakeholder satisfaction updated quarterly | +5% |
| Marketing learned of date change from someone else | −25% |
| No joint launch calendar | −20% |
| At-risk launches without marketing notification | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Late notification** | Marketing learns of date change in the sprint review email | Date changes = same-day notification to marketing. Non-negotiable. |
| **No shared calendar** | Engineering and marketing manage separate launch timelines | Build one shared source of truth. Both teams update it. |
| **No feature flag strategy** | Every deploy = live launch | Introduce feature flags. Decouples code risk from launch risk. |
| **Accepting unconfirmed dates** | Marketing commits to a date; engineering discovers it later | Engineering must confirm every customer-facing date. No passive acceptance. |
| **Binary launch options** | "Ship on time or delay" | Always present soft launch and partial launch options. |

---

## References

- `skills/cross-functional/dependency-management.md` — Canonical metric definitions
- `skills/cross-functional/sales-alignment.md` — Sales alignment is often co-managed with marketing for launches
- `docs/engineering-playbook.md` → Managing Across section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/sales-alignment.md` | Sales and marketing launches are often coordinated |
| `skills/cross-functional/dependency-management.md` | Launch dependencies tracked here |
| `skills/executive/executive-status-report.md` | Launch date changes surface in the status report |
| `skills/cross-functional/product-partnership.md` | Product is the primary alignment partner for launch dates |
