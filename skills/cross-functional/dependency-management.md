# Skill: Dependency Management

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Weekly (review) + On-demand (new dependency, blocker, escalation)

---

## Purpose

Track, age, and resolve cross-team dependencies before they become blockers — maintaining the visibility and discipline that keeps multi-team delivery predictable.

Cross-team dependencies are the primary cause of milestone slippage that engineering can't directly control. An EM who manages dependencies well rarely gets surprised. An EM who doesn't track them until they're critical is always firefighting something that was visible weeks ago.

**The dependency lifecycle:**
1. **Identified** — dependency is known and logged
2. **Agreed** — receiving team has confirmed and committed to a delivery
3. **At risk** — agreed delivery is in question (blocker, deprioritization, capacity)
4. **Blocked** — dependency is unresolved and engineering work cannot proceed
5. **Resolved** — dependency is fulfilled; engineering can proceed

Dependencies should never go from Identified to Blocked without passing through Agreed and At risk. If they do, the tracking discipline has failed.

---

## Metrics

### The Six Cross-Functional Metrics (canonical definitions)

| Metric | Definition | Target | Measurement |
|---|---|---|---|
| **Alignment score** | % of engineering dependencies where the receiving team has confirmed and committed | >90% | Count of Agreed / Total tracked dependencies |
| **Decision latency** | Median days from "decision needed" to "decision made" across cross-team decisions | ≤3 business days | Tracked per decision in dependency log |
| **Cross-team blockers** | Count of dependencies in Blocked status (engineering cannot proceed) | 0 | Weekly dependency log review |
| **Dependency aging** | Days since a dependency was created without reaching Resolved status | Alert at >14 days | Per-dependency age in log |
| **Collaboration health** | Composite signal (Green/Yellow/Red) based on cadence, follow-through, escalation frequency | Green | Qualitative assessment; updated weekly |
| **Stakeholder satisfaction** | Partner team's reported satisfaction with how engineering manages dependencies | Green | Quarterly 1:1 check-in with partner EM |

**Collaboration health scoring:**

| Signal | Criteria |
|---|---|
| 🟢 Green | Cadence meetings held, commitments followed through, <2 cross-team blockers, escalations rare |
| 🟡 Yellow | Cadence meetings inconsistent, 1–2 broken commitments in period, 2–4 blockers, or 1 unresolved escalation |
| 🔴 Red | No regular cadence, commitments regularly broken, >4 blockers, repeated escalations, or relationship is strained |

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Dependency log** | Current list of all tracked inter-team dependencies |
| **Delivery commitments** | What engineering has promised to other teams and vice versa |
| **Sprint and roadmap data** | What engineering needs from other teams to ship what's planned |

### Optional
| Input | Description |
|---|---|
| **Prior period dependency data** | Trend in blocker count and aging |
| **Escalation history** | Patterns in which dependencies escalate and why |
| **Partner team capacity signals** | Are receiving teams under-resourced? |

---

## Analysis

### Step 1 — Run the Weekly Dependency Review

For each tracked dependency, update:
- Current status (Identified / Agreed / At risk / Blocked / Resolved)
- Age (days since created)
- Owner (who is accountable for follow-up)
- Next action and date

**Alert thresholds:**
- Age >7 days and still "Identified" (no commitment received) → escalate to EM contact
- Age >14 days in any non-Resolved status → flag as aging; requires active management
- Age >21 days → dependency is organizational debt; escalate to VP level if not resolved

### Step 2 — Calculate the Metrics

```
Alignment score = (Agreed + Resolved) ÷ Total active dependencies × 100

Decision latency = median([date_decided − date_decision_raised] for each cross-team decision)

Cross-team blockers = count(dependencies with status = Blocked)

Dependency aging = [age of oldest non-Resolved dependency in days]
                   Flag: any dependency >14 days

Collaboration health = qualitative assessment per team (Green/Yellow/Red)

Stakeholder satisfaction = partner team's signal (updated quarterly via 1:1)
```

### Step 3 — Prioritize Resolution Actions

| Priority | Condition | Action |
|---|---|---|
| **P1** | Blocked and on critical path | EM escalates same day |
| **P2** | At risk and on critical path | EM contacts partner EM within 24 hours |
| **P3** | Aging (>14 days) but not on critical path | EM follows up; adds to next cross-team meeting |
| **P4** | Identified, not yet agreed | Standard follow-up at next cadence meeting |

---

## Decision Tree

```
What is the state of the dependency?

├── DEPENDENCY IS BLOCKED (cross-team blocker active)
│   └── Immediate action: Contact partner EM directly — do not wait for cadence meeting
│       Frame: "We are blocked on [X]. Our delivery of [Y] is at risk by [date].
│               What do you need from me to unblock this?"
│       If unresolved in 24 hours: Escalate to VP level with business impact
│       → Invoke: skills/executive/executive-risk-report.md if milestone is at risk

├── DEPENDENCY IS AT RISK (agreed but delivery uncertain)
│   └── Action: Confirm the risk with the partner EM. Get the new expected date.
│       If new date affects your commitment: Surface to your VP immediately (do not wait)
│       Update your delivery risk register and status report
│       → Invoke: skills/executive/executive-status-report.md to update status

├── DEPENDENCY IS AGING (>14 days, not Resolved)
│   └── Action: Escalate within partner team if EM follow-up hasn't moved it
│       Review: Is this dependency still needed? Can the work proceed without it?
│       Consider: Does the roadmap need to adjust?
│       Log the escalation for stakeholder satisfaction tracking

├── NO COMMITMENT RECEIVED (Identified, not Agreed)
│   └── Action: Follow up at the next scheduled cadence meeting
│       If cadence meeting is >5 days away: Send async follow-up to partner EM
│       Do not let dependencies stay in Identified status for more than 7 days

└── DEPENDENCY RESOLVED
    └── Action: Mark Resolved in dependency log
        Calculate the resolution time for decision latency tracking
        Send a thank-you to the partner team — relationship investment
```

---

## Output

### Dependency Dashboard (Weekly)

```
DEPENDENCY DASHBOARD — Week of {{date}}
Maintained by: {{EM name}}

METRICS SNAPSHOT
Alignment score:       {{N}}% ({{N}} of {{N}} dependencies Agreed or Resolved)
Decision latency:      {{N}} days median (target: ≤3 days)
Cross-team blockers:   {{N}} active (target: 0)
Dependency aging:      Oldest non-Resolved: {{N}} days (alert if >14)
Collaboration health:  {{Green 🟢 | Yellow 🟡 | Red 🔴}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ACTIVE DEPENDENCIES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ID   | Description          | Partner  | Status     | Age | Next action
DEP-01 | {{description}}   | {{team}} | Blocked 🔴 | 8d  | EM escalation today
DEP-02 | {{description}}   | {{team}} | At risk 🟡 | 12d | Confirm new date by Fri
DEP-03 | {{description}}   | {{team}} | Agreed  🟢 | 3d  | Monitor
DEP-04 | {{description}}   | {{team}} | Identified | 5d  | Follow up at sync

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ESCALATIONS NEEDED THIS WEEK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• DEP-01: {{description}} — escalating to VP today — business impact: {{impact}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RESOLVED THIS WEEK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• DEP-07: {{description}} — resolved in {{N}} days
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All dependencies tracked with status and age | Base: 65% |
| Alignment score calculated | +10% |
| Decision latency tracked per decision | +10% |
| Aging dependencies have escalation plan | +10% |
| Collaboration health assessed for each partner team | +5% |
| Dependencies tracked informally (no log) | −25% |
| No aging threshold defined | −15% |
| Blocked dependencies without escalation path | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **No dependency log** | Dependencies managed in memory or Slack | Create a shared dependency log. Track status and age for every inter-team dependency. |
| **Late escalation** | Blocker surfaces in sprint review | Blocked = escalate same day. Not next week. Not in the status report. |
| **Identification without follow-up** | Dependencies logged but never committed | Set a 7-day rule: no commitment after 7 days = proactive follow-up. |
| **Aging tolerance** | 30-day-old dependency treated as normal | Define the aging threshold. 14 days is the default alert. Name who owns it. |
| **No relationship investment** | Dependencies managed transactionally | Thank partner teams when they deliver. Relationships make dependencies resolve faster. |

---

## References

- `docs/engineering-playbook.md` → Managing Across section
- `skills/executive/executive-risk-report.md` — When a dependency becomes a delivery risk
- All `skills/cross-functional/` files — partner-specific relationship management

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/product-partnership.md` | Product is the most frequent engineering dependency partner |
| `skills/executive/executive-status-report.md` | Blockers and dependency risk surface in the status report |
| `skills/executive/executive-risk-report.md` | When a dependency is on the critical path and escalation is needed |
| `skills/delivery/manage-risk.md` | Dependency risk feeds the delivery risk register |
