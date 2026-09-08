# Leadership Memory: Retrospectives

**Domain**: Leadership Memory → Retrospectives
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (informs team process health, sprint improvement tracking, and action item accountability)
**Cadence**: Record after every retrospective; review quarterly per team

---

## Purpose

Retrospectives produce two things: insights and commitments. Without memory, both evaporate. The team identifies the same root causes quarter after quarter. Action items are assigned and forgotten. The process feels healthy — the meeting happened — but nothing actually changes. With memory, the EM can detect recurring themes across sprints, track which action items closed vs. were silently dropped, and measure whether the retrospective process itself is producing improvement.

**Questions this domain answers:**
- "What themes have come up in retros more than once?"
- "Which action items were assigned but never completed?"
- "Which retro formats produced the most actionable output?"
- "Is team sentiment improving, flat, or degrading across sprints?"
- "Have we addressed the root cause we identified three sprints ago?"

---

## Domain-Specific Entry Fields

```
Sprint:               {{sprint identifier or date range}}
Format:               {{Start-Stop-Continue / 4Ls / Mad-Sad-Glad / Sailboat / Custom: [name]}}
Facilitator:          {{EM / team lead / rotating / external}}
Participation:        {{Full team / Partial — N of M present}}
Energy level:         {{High (engaged, generative) / Medium (functional) / Low (going through the motions)}}
Top theme:            {{the single most significant pattern that emerged}}
Secondary themes:     {{up to 2 additional recurring topics}}
Sentiment:            {{Positive / Neutral / Negative / Mixed}}
Sentiment drift:      {{Improving / Stable / Degrading — vs. prior retro}}
Action items:         {{list with owner and due date for each}}
Prior retro follow-up: {{which items from last retro were: Done / Partial / Dropped}}
Recurring theme flag: {{Yes / No — does this theme match any entry in the prior 90 days?}}
```

---

## What to Record

Create an entry after every retrospective. Minimum viable entry: Top theme + Action items + Prior retro follow-up. Full entry preferred.

Also create a follow-up observation entry when:
- An action item is confirmed completed (update the original entry's Outcome)
- A theme recurs in a subsequent retro (update Recurring theme flag; link entries)
- Team energy level shifts significantly from one retro to the next
- A retro format change produces noticeably different quality of output
- An action item is quietly dropped — record the drop as a pattern, not just a gap

---

## Pattern Detection

After three or more entries, look for:

**Recurring themes**: The same topic (deployment pain, cross-team dependencies, meeting overhead, unclear priorities) appearing in multiple sprints is not a team complaint — it is an unresolved structural issue. If a theme appears in three consecutive retros, it requires an EM-level decision, not another action item.

**Action item completion rate**: What percentage of action items from each retro actually close? A rate below 50% means retros are producing commitments the team cannot honor — either the items are too large, ownership is unclear, or there is no follow-through mechanism.

**Format effectiveness**: Which retro formats produce the most actionable items? Teams with high psychological safety often generate more candid output in anonymous or asynchronous formats. Energy level is the leading indicator.

**Sentiment trajectory**: Is team sentiment improving sprint-over-sprint? A single negative retro is noise. Two consecutive negative retros warrant investigation. Three is a signal requiring direct EM action.

**Facilitator effect**: Does a specific facilitator (the EM, a rotating team member, an external) produce better retro output? Some teams open up more when the EM is not facilitating.

---

## Query Patterns

```
Q: "What themes keep coming up in our retros?"
→ Filter by: Recurring theme flag: Yes; sort by frequency
→ Cross-reference: Related entries to find first occurrence date

Q: "Are our retro action items actually closing?"
→ Filter by: all entries; aggregate Prior retro follow-up field
→ Compute: Done / Partial / Dropped rates

Q: "Is team sentiment improving?"
→ Filter by: all entries; retrieve Sentiment + Sentiment drift in date order
→ Pattern: direction of drift over last 4–6 sprints

Q: "Which retro format works best for our team?"
→ Filter by: Format field; compare Energy level + action item count per format
→ Pattern: which format correlates with high energy + high action item completion

Q: "Have we addressed the root cause from two sprints ago?"
→ Filter by: related entry ID from prior retro; check Outcome field
→ Cross-reference: action item status
```

---

## Entry Log

```
RETROSPECTIVE MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example entry — replace with real entries]

ID: RET-2026-07-14-001
Date: 2026-07-14
Domain: retrospectives
Actors: Full team (7 engineers, EM, product partner)
Context: End of Sprint 23. Sprint delivered 88% of committed scope. One major incident
  mid-sprint (P2, resolved in 4h). Team has flagged deployment process in prior two retros.
What happened: Used Start-Stop-Continue format. Deployment pain came up again — third
  consecutive retro. Team energy was medium; participation was full but tone was frustrated
  rather than generative. Three action items assigned: (1) EM to schedule deployment process
  review with infra team by Jul 21; (2) Team lead to draft a deployment checklist by Jul 28;
  (3) On-call rotation to be rebalanced — Alice as owner by Aug 1. Prior retro items: 2 Done,
  1 Dropped (async communication norms — never prioritized).
Outcome: Deployment action item is now a formal EM commitment, not just a team ask. Dropped
  item is a signal that async norms are a low-priority complaint, not a structural issue.
Lesson: When the same theme appears three times, it stops being a retro item and becomes
  an EM agenda item. Assigning it again without escalating would have produced the same
  dropped outcome. The team noticed it was being escalated — energy shifted briefly.
Confidence: Emerging
Sprint: Sprint 23 (2026-07-01 to 2026-07-14)
Format: Start-Stop-Continue
Facilitator: EM
Participation: Full team
Energy level: Medium
Top theme: Deployment process friction (third occurrence)
Secondary themes: On-call rotation imbalance; async communication norms
Sentiment: Mixed
Sentiment drift: Stable (second consecutive Mixed)
Action items:
  - EM: Schedule deployment review with infra — due 2026-07-21 ✓
  - Team lead: Draft deployment checklist — due 2026-07-28
  - Alice: Rebalance on-call rotation — due 2026-08-01
Prior retro follow-up: Done (2), Dropped (1 — async norms)
Recurring theme flag: Yes — deployment (3rd occurrence); on-call (2nd occurrence)
Tags: situation:retrospective, pattern:repeated-mistake, pattern:scope-creep, outcome:neutral
Related entries: RET-2026-06-30-001, RET-2026-06-16-001
```

---

## Sprint Retrospective Summary (rolling view)

```
RETROSPECTIVE SUMMARY: {{Team name}} — Last {{N}} sprints
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Period:                {{date range}}
Sprints covered:       {{N}}

SENTIMENT TRAJECTORY:
  {{Sprint N-3}}: {{Positive / Neutral / Negative / Mixed}}
  {{Sprint N-2}}: {{Positive / Neutral / Negative / Mixed}}
  {{Sprint N-1}}: {{Positive / Neutral / Negative / Mixed}}
  {{Sprint N}}:   {{Positive / Neutral / Negative / Mixed}}
  Overall drift:  {{Improving / Stable / Degrading}}

RECURRING THEMES (appeared in 2+ sprints):
  Theme:        {{theme name}}
  Occurrences:  {{N}} of {{total sprints}}
  Status:       {{Addressed / In progress / Unresolved — requires EM decision}}

ACTION ITEM COMPLETION:
  Total assigned:  {{N}}
  Done:            {{N}} ({{%}})
  Partial:         {{N}} ({{%}})
  Dropped:         {{N}} ({{%}})
  Completion rate: {{%}} — {{Healthy (≥70%) / Warning (50–69%) / At-risk (<50%)}}

TOP RECURRING DROP PATTERN:
  {{What types of action items keep getting dropped — and why}}

FORMAT EFFECTIVENESS:
  Best performing format: {{format name}} — average energy: {{High/Medium/Low}}
  Worst performing:       {{format name}} — average energy: {{High/Medium/Low}}

RECOMMENDED ACTION:
  {{Based on sentiment trajectory + recurring themes + completion rate}}
```

---

## Recall Output Format

```
RETROSPECTIVE RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Query: {{exact question asked}}
Entries reviewed: {{N}} entries, {{date range}}

THEME PATTERN:
  {{Theme}}: {{N}} occurrences across {{N}} sprints
  First seen: {{date}} | Last seen: {{date}}
  Status: {{Addressed / Persisting}}

ACTION ITEM HEALTH:
  Completion rate (last {{N}} sprints): {{%}}
  Most-dropped category: {{type}}
  Open items older than one sprint: {{list}}

SENTIMENT TREND:
  Direction: {{Improving / Stable / Degrading}}
  Confidence: {{High / Medium / Low}} ({{N}} data points)

RECOMMENDATION:
  {{Specific action — escalate theme / change format / address dropped item / none}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Theme accumulation** | Same topic in 3+ consecutive retros with no EM-level resolution | Recurring theme flag triggers escalation; the EM, not the team, must own structural fixes |
| **Action item theater** | Items are assigned every retro; completion rate is below 50% | Reduce action item count; assign to one owner per item; track follow-up before next retro |
| **Sentiment blindness** | Retros run on schedule; EM not tracking trajectory | Sentiment drift field + rolling summary; two consecutive Negative/Mixed retros require direct investigation |
| **Format inertia** | Team uses same format regardless of what is needed | Rotate formats deliberately; map energy level to format to find what works for this team |
| **No follow-up** | Prior retro items not reviewed at next retro opening | Prior retro follow-up field forces the review into every entry; it is not optional |

---

## References

- `memory/schema.md` — Universal entry format and tagging taxonomy
- `memory/memory.md` — Cross-domain pattern detection
- `loops/retrospective-loop.md` — Retrospective facilitation and output processing
- `kaizen/weekly-review.md` — Q6 (incident recurrence) and Q5 (team growth) feed from retro observations
- `skills/delivery/review-sprint.md` — Sprint review skill; retro is a downstream input
- `analytics/people-dashboard.md` — Team sentiment index informed by this log
