# Leadership Memory: Customer Feedback

**Domain**: Leadership Memory → Customer Feedback
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM + product partners (informs engineering priority and customer impact decisions)
**Cadence**: Record when significant customer feedback reaches engineering; validate outcomes quarterly

---

## Purpose

Customer feedback reaches engineering through multiple channels — support tickets, NPS comments, sales escalations, CSM reports, user research. Most of it is noise. Some of it is the earliest signal of a problem that will become a P1 incident or a churn driver six months from now. The difference between signal and noise is only visible in retrospect — unless feedback is captured with enough structure to be validated later. This domain enables that validation: record the feedback when it arrives, record the outcome when it's known, and build a calibration model for which feedback types are reliable signals in this organization.

**Questions this domain answers:**
- "Which customer feedback themes have proven accurate over time?"
- "Which feedback did we dismiss that we later wished we hadn't?"
- "What types of customer signals reliably precede incidents or churn?"
- "Which feedback sources produce the highest signal-to-noise ratio?"
- "What patterns in customer feedback are we currently ignoring?"

---

## Domain-Specific Entry Fields

```
Feedback source:      {{channel — support ticket / NPS / CSM / sales escalation / user research / exec escalation}}
Customer segment:     {{enterprise / SMB / individual / internal — relevant to signal weight}}
Feedback theme:       {{what the feedback is about — be specific, not categorical}}
Volume/frequency:     {{One-off / Recurring (2–5 instances) / Systemic (6+ instances)}}
Team response:        {{Acted on / Monitoring / Dismissed / Not yet reviewed}}
Reason if dismissed:  {{why the team decided not to act}}
Outcome:              {{fill in retrospectively: feedback was Accurate / False alarm / Noise / Unknown}}
Time to validation:   {{how long between receiving the feedback and knowing whether it was accurate}}
Cost if dismissed:    {{if feedback was accurate and dismissed: what the cost was — incident, churn, escalation}}
```

---

## What to Record

Create an entry when any of the following occurs:

- Customer feedback reaches engineering that contains a specific technical or product concern (not a generic complaint)
- Engineering makes a deliberate decision to dismiss or deprioritize feedback — the decision to not act is as important to record as the decision to act
- Customer feedback is repeated by multiple customers or sources (volume is a signal amplifier)
- A previously dismissed feedback theme materializes as a real problem
- A feedback theme that engineering addressed produces a measurable positive outcome

---

## Pattern Detection

After ten or more entries, look for:

**High-signal feedback sources**: Which channels consistently produce accurate feedback? Support tickets from specific customer segments? CSM escalations? Direct exec calls? Knowing which sources to weight heavily shapes engineering priority.

**Feedback-to-incident lead time**: How far in advance of an incident does the customer feedback typically arrive? If the lead time is 6–8 weeks, that's an actionable early warning window. If it's 1 week, it's more reactive.

**Dismissed feedback cost**: How often is feedback dismissed and later proven accurate? What is the average cost of dismissal (incident, churn, escalation)? This calibrates the dismissal threshold.

**Recurring theme identification**: Is the same theme appearing from multiple sources? Systemic volume is a structural signal — the system is consistently producing an experience that customers are consistently reporting.

**Noise source identification**: Which feedback sources reliably produce low-signal feedback? Knowing what to de-weight is as useful as knowing what to weight heavily.

---

## Query Patterns

```
Q: "Which feedback themes have been accurate?"
→ Filter by: Outcome: Accurate; aggregate by Feedback theme
→ Pattern: which themes consistently prove true

Q: "Which feedback did we dismiss that later proved accurate?"
→ Filter by: Team response: Dismissed + Outcome: Accurate
→ Retrieve: Feedback theme + Reason if dismissed + Cost if dismissed

Q: "Which sources produce the highest signal?"
→ Filter by: Outcome: Accurate; group by Feedback source
→ Calculate: accuracy rate per source

Q: "What feedback patterns are we currently ignoring?"
→ Filter by: Team response: Dismissed or Monitoring + Volume: Systemic
→ Flag: high-volume dismissed feedback for review

Q: "What preceded the last major incident in customer signals?"
→ Filter by: Outcome: Accurate + Cost if dismissed includes "incident"
→ Retrieve: Feedback theme + Time to validation
```

---

## Entry Log

```
CUSTOMER FEEDBACK MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example entry — record at time of feedback receipt]

ID: CUS-2026-07-01-001
Date: 2026-07-01
Domain: customer-feedback
Entry type: Feedback record
Feedback source: CSM escalation (three enterprise accounts in the same week)
Customer segment: Enterprise
Feedback theme: "Export takes more than 30 seconds for large datasets — customers are
  abandoning the export flow and downloading raw CSVs instead."
Volume/frequency: Recurring — 3 separate CSM escalations; estimated 15+ customer reports
  behind those escalations.
Team response: Monitoring — added to backlog but no sprint commitment
Reason if dismissed: "We have a known performance backlog item; this is a known issue."
Outcome: TBD — check in 90 days
Time to validation: TBD
Cost if dismissed: TBD

---

[Example outcome entry — added retrospectively]

ID: CUS-2026-10-01-001
Date: 2026-10-01
Domain: customer-feedback
Entry type: Outcome validation (for CUS-2026-07-01-001)
Outcome: Accurate — three enterprise accounts escalated to renewal risk in Q3.
  Two cited export performance as the primary reason for reduced contract size.
  Engineering addressed the performance issue in the Q3 sprint after the renewal risk.
Time to validation: 90 days from first signal to outcome materialization
Cost if dismissed: Two accounts reduced contract size; estimated $180K ARR impact.
  Engineering effort to fix: 2 weeks. Engineering effort if addressed in Q2 when first
  reported: same 2 weeks. Timing was the only difference.
Lesson: CSM escalation from enterprise accounts on the same theme across a single week
  is a high-confidence signal — not a monitoring item. The "known issue" rationalization
  produced a 90-day delay with real revenue cost.
Confidence: Emerging (two prior instances of CSM escalation proving accurate within 90 days)
Tags: person:customer, situation:escalation, pattern:underestimated-risk, outcome:negative
Related entries: CUS-2026-07-01-001
```

---

## Signal Calibration Profile

```
CUSTOMER FEEDBACK SIGNAL PROFILE: {{Team / Period}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

FEEDBACK SOURCE ACCURACY (outcomes validated):
  Source              | Entries | Accurate | False alarm | Noise | Accuracy %
  Support ticket      | {{N}}   | {{N}}    | {{N}}       | {{N}} | {{%}}
  CSM escalation      | {{N}}   | {{N}}    | {{N}}       | {{N}} | {{%}}
  NPS comment         | {{N}}   | {{N}}    | {{N}}       | {{N}} | {{%}}
  Sales escalation    | {{N}}   | {{N}}    | {{N}}       | {{N}} | {{%}}
  Exec escalation     | {{N}}   | {{N}}    | {{N}}       | {{N}} | {{%}}
  User research       | {{N}}   | {{N}}    | {{N}}       | {{N}} | {{%}}

  Highest signal source: {{source}} — {{%}} accuracy
  Lowest signal source:  {{source}} — {{%}} accuracy

FEEDBACK-TO-OUTCOME LEAD TIME (when feedback was accurate):
  Average: {{N}} days | Shortest: {{N}} days | Longest: {{N}} days
  Implication: feedback that materializes in <{{N}} days is near-miss; >{{N}} days is strategic

DISMISSED FEEDBACK COST (when dismissal proved wrong):
  Instances: {{N}} | Average cost: {{description or metric}}
  Pattern: dismissed feedback most often cost {{incident / churn / escalation}}

RECURRING THEMES CURRENTLY MONITORED:
  {{theme}}: {{N}} reports | Source: {{source}} | Status: {{Monitoring / Escalated}}

HIGH-SIGNAL CURRENT WATCH LIST:
  Feedback themes flagged for active monitoring based on source + volume:
  1. {{theme}} — {{source}} — {{volume}} — added {{date}}
  2. {{theme}} — {{source}} — {{volume}} — added {{date}}

Last updated: {{date}}
```

---

## Recall Output Format

```
CUSTOMER FEEDBACK RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Query: {{what was asked}}
Entries reviewed: {{N}} entries, {{date range}}

SIGNAL CALIBRATION:
  Highest-signal sources: {{list}} ({{%}} accuracy)
  Dismissal cost history: {{N}} dismissed themes that proved accurate; avg cost: {{}}

RELEVANT THEME HISTORY:
  {{theme}}: appeared {{N}} times; outcome: {{Accurate / False alarm}}
  {{theme}}: appeared {{N}} times; outcome: {{Accurate / False alarm}}

CURRENT WATCH LIST:
  {{theme}}: {{volume}}, {{source}}, {{days monitored}}

RECOMMENDATION:
  Themes to escalate to sprint priority: {{based on source + volume + pattern match}}
  Themes to continue monitoring: {{lower confidence but worth watching}}
  Themes that can be closed as noise: {{based on pattern of similar dismissed themes}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Known issue rationalization** | Feedback dismissed because the problem is already in the backlog | "In the backlog" is not the same as "being addressed"; volume and source weight determine urgency, not backlog presence |
| **Outcome never validated** | Feedback logged; no outcome entry added; signal calibration never improves | Quarterly outcome validation review; mark each entry as Accurate / False alarm / Noise when enough time has passed |
| **Source weighting absent** | All feedback sources treated equally; high-signal sources not prioritized | Build source accuracy table over time; explicit weighting by source |
| **Volume aggregation missing** | Three CSM escalations logged as three separate items; systemic signal missed | Check for recurring themes at intake; flag systemic volume explicitly |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `analytics/executive-dashboard.md` — Customer impact score fed by this domain
- `analytics/strategy-dashboard.md` — Customer impact and innovation signals
- `skills/meetings/retrospective.md` — Customer feedback themes often surface here
