# Skill: Quarterly Business Review

**Domain**: Executive
**Owner**: `subagents/executive-summary.md`
**Cadence**: Quarterly (4–6 weeks before quarter end to prepare; present in first 2 weeks of next quarter)

---

## Purpose

Prepare and deliver a QBR (Quarterly Business Review) for engineering — a structured retrospective and forward plan that gives executives and business partners confidence that engineering is accountable, learning, and aligned.

The QBR is the highest-trust moment in the executive calendar. Done well, it is the event that earns resource decisions, earns influence on roadmap, and signals leadership maturity. Done poorly, it signals that engineering operates in its own world.

**The three jobs of a QBR**:
1. Hold yourself accountable to what you said you'd do
2. Demonstrate that you learned from what didn't go as planned
3. Build confidence in the next quarter's plan

Most EMs show up with wins and bury misses. Executives notice. The EM who surfaces misses with analysis and corrective action earns more trust than the one who only shows green.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Committed vs. actual delivery** | What was planned at quarter start vs. what shipped |
| **DORA snapshot for the quarter** | Deployment frequency, change failure rate, MTTR, lead time |
| **Quarter-start roadmap** | The original plan — before any in-quarter changes |
| **Team composition changes** | Headcount start/end, hires, departures |
| **Top 3 wins** | Business-outcome wins, not engineering achievements |
| **Top 3 misses** | What didn't ship, what slipped, what underperformed |
| **Next quarter plan** | Commitment, rationale, confidence level |

### Optional
| Input | Description |
|---|---|
| **Team health signal** | SPACE data or 1:1 pattern — Green / Yellow / Red |
| **Incident record** | P1/P2 count, MTTR, customer impact summary |
| **Hiring pipeline** | Open roles, time-to-fill, offer acceptance rate |
| **Technical debt trajectory** | Getting better, stable, or worse |
| **Budget vs. actual** | Spend vs. plan for the quarter |

---

## Analysis

### Step 1 — Score the Quarter Honestly

Before building the narrative, score the quarter by category:

| Category | Metric | Actual | Score |
|---|---|---|---|
| Delivery | % of committed work shipped | {{%}} | G/Y/R |
| Quality | Change failure rate | {{%}} | G/Y/R |
| Reliability | P1 incidents + MTTR | {{N}}, {{hrs}} | G/Y/R |
| Team | Health signal end of quarter | G/Y/R | G/Y/R |
| Plan accuracy | How close was forecast to actual | ±{{%}} | G/Y/R |

**Rule**: Score yourself before you build your narrative. If the overall score is mixed, the narrative must acknowledge it. A QBR that claims Green when the scorecard is Yellow destroys credibility.

### Step 2 — Separate What You Own vs. What Was External

For every miss, answer: was this within engineering's control?

| Type | Example | How to present |
|---|---|---|
| **Owned miss** | Scope was underestimated | Own it. State root cause. State correction. |
| **Shared miss** | Product requirements changed mid-quarter | Acknowledge, name the dependency, name the process fix |
| **External miss** | Vendor delayed, headcount frozen | Contextualize — but do not use external causes to avoid accountability for not escalating earlier |

**Warning**: Every miss sounds external if you frame it that way. Executives know this. Own more than feels comfortable.

### Step 3 — Extract the Forward-Looking Signal

The most valuable part of the QBR is what the quarter taught you about the next quarter. For each significant pattern (positive or negative):
- What does this suggest about team capacity?
- What does this suggest about estimation accuracy?
- What does this suggest about technical risk?
- What does this suggest about dependencies?

### Step 4 — Build the Next Quarter Commitment

Confidence tiers for QBR commitments:
- **High confidence (>85%)**: Core deliverables. No known blockers. Team capacity confirmed.
- **Medium confidence (70–85%)**: Target deliverables. Named risks with mitigations in place.
- **Stretch (50–70%)**: Aspirational. State as stretch explicitly — do not blend into committed list.

---

## Decision Tree

```
What is the overall quarter score?

├── STRONG QUARTER (Delivery ≥90%, no Red categories)
│   └── Format: Wins → Delivery scorecard → Lessons → Next quarter plan
│       Tone: Confident. Do not oversell — let the numbers speak.
│       Risk: Don't skip lessons. A perfect quarter with no learning signals
│             you're not paying attention.

├── MIXED QUARTER (Delivery 70–89%, or ≥1 Yellow category)
│   └── Format: Delivery scorecard first → Wins → Misses with root cause
│       → Corrective actions already in progress → Next quarter plan
│       Tone: Accountable, not defensive. "Here is what happened and here
│             is what we're doing differently."

├── DIFFICULT QUARTER (Delivery <70%, or ≥1 Red category)
│   └── Format: Acknowledge immediately → Impact on business → Root cause
│       → Actions taken → Adjusted next-quarter plan with lower risk
│       Tone: Transparent, action-oriented. Do not minimize.
│       Do NOT: Lead with a win. You've lost the room before you finish it.
│       → Also invoke: skills/executive/executive-risk-report.md if
│         recovery plan requires executive resources or scope trade-offs

└── FIRST QBR (no prior baseline)
    └── Format: Establish baseline → Current state → Forward plan
        Tone: Anchoring, not evaluative. "Here is where we are. Here is
              how we'll know if we're improving."
```

---

## Output Template

```
ENGINEERING QBR — Q{{N}} {{YEAR}}
Presented by: {{EM / VP}} | Audience: {{VP / SVP / CTO / Exec Team}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q{{N}} SCORECARD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Overall: {{Green 🟢 | Yellow 🟡 | Red 🔴}}

Delivery:    {{N}}% of committed work shipped    [🟢 / 🟡 / 🔴]
Quality:     {{N}}% change failure rate          [🟢 / 🟡 / 🔴]
Reliability: {{N}} P1 incidents | avg {{N}}hr MTTR [🟢 / 🟡 / 🔴]
Team:        {{Green | Yellow | Red}} — {{one-sentence rationale}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WINS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Win}} — {{Business outcome: "This enabled...", "This reduced...", "This grew..."}}
2. {{Win}} — {{Business outcome}}
3. {{Win}} — {{Business outcome}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MISSES AND WHAT WE LEARNED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Miss 1}}: {{Root cause in one sentence}}
  → What we're doing differently: {{specific change}}

{{Miss 2}}: {{Root cause}}
  → What we're doing differently: {{specific change}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q{{N+1}} PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Committed (High confidence):
• {{Deliverable}} — {{business outcome}} — by {{month}}
• {{Deliverable}} — {{business outcome}} — by {{month}}

Target (Medium confidence):
• {{Deliverable}} — {{business outcome}} — requires {{dependency}}

Top risk to Q{{N+1}} plan: {{one risk + mitigation}}
Confidence in overall plan: {{High | Medium | Low}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ASK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Specific ask — or "No decisions needed. Sharing for accountability and alignment."}}
```

---

## Example

```
ENGINEERING QBR — Q2 2025
Presented by: Arif (VP Engineering) | Audience: Executive Team

Q2 SCORECARD
Overall: 🟡 Yellow

Delivery:    84% of committed work shipped    🟡
Quality:     2.1% change failure rate         🟢
Reliability: 1 P1 incident | 3.2hr MTTR       🟢
Team:        Yellow — on-call rotation elevated through June

WINS
1. Checkout v2 launched June 1 — 14% improvement in transaction completion
2. Partner API shipped — unlocks 3 enterprise contracts in Q3 pipeline
3. Zero P1 incidents in May — first incident-free month in 6 quarters

MISSES AND WHAT WE LEARNED
Reporting dashboard slipped to Q3: Scope was underestimated by 40% after
stakeholder review in Week 6 added 3 new requirements without timeline adjustment.
  → What we're doing differently: Requirements sign-off required before sprint
    commitment — process change starts Q3 Sprint 1.

Mobile SDK delayed 3 weeks: Integration partner API was undocumented; discovery
took 2 sprints instead of 0.5.
  → What we're doing differently: Technical discovery sprint now mandatory before
    any third-party integration is scheduled.

Q3 PLAN
Committed (High confidence):
• Reporting dashboard v1 — enables Sales self-serve reporting — by end August
• Enterprise security certification (SOC 2 Type II) — required for Q4 launch — by September

Target (Medium confidence):
• Mobile SDK v2 — depends on partner API documentation being published

Top risk: SOC 2 audit timeline is tight. External auditor engaged. Will surface
immediately if timeline slips.
Confidence in overall plan: Medium — delivery is realistic; SOC 2 is the single point of risk.

ASK
Approval to begin Q4 headcount planning for 2 senior engineers — enterprise tier
growth requires capacity that is not in current headcount. Proposal attached.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Quarter scorecard completed honestly | Base: 65% |
| Misses named with root cause | +10% |
| Corrective actions are specific | +10% |
| Next quarter plan has confidence tiers | +10% |
| Ask is specific and framed with business case | +5% |
| Misses attributed entirely to external causes | −20% |
| No lessons extracted from misses | −15% |
| Next quarter plan has no confidence signal | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Win-only QBR** | 10 minutes of wins, misses buried or absent | Surface misses first. Executives already know the misses. |
| **External blame** | Every miss is someone else's fault | Own at minimum the failure to escalate earlier. |
| **Vague corrections** | "We'll do better next quarter" | Name the specific process or threshold change. |
| **Overcommitted Q+1** | Same pace after a difficult quarter | Reduce scope, increase realism. Executives prefer honesty. |
| **No lessons slide** | Wins → plan, no learning section | The learning section is the most important signal of leadership maturity. |
| **Jargon in scorecard** | "Sprint velocity", "PRs merged", "story points" | Translate everything before the room. |

---

## References

- `skills/executive/executive-communication.md` — Translation foundations
- `skills/executive/board-level-summary.md` — Board-level version of QBR content
- `docs/engineering-playbook.md` → Executive Communication section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/board-level-summary.md` | QBR is the internal version; board summary is the compressed external version |
| `skills/executive/annual-planning.md` | Q4 QBR feeds directly into annual planning inputs |
| `skills/executive/executive-risk-report.md` | When a QBR miss requires standalone risk escalation |
| `skills/executive/investment-proposal.md` | When QBR ask involves headcount or budget decision |
