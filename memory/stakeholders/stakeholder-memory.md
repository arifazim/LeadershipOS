# Leadership Memory: Stakeholders

**Domain**: Leadership Memory → Stakeholders
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (informs cross-functional communication and negotiation strategy)
**Cadence**: Record after significant cross-functional interactions; review monthly

---

## Purpose

Cross-functional relationships are built and destroyed through patterns, not single events. A Product Director who always pushes back on engineering estimates is not obstructionist — they may have been burned by an overrun and stopped trusting commitments. A Design lead who goes silent after disagreements is not passive — they may have learned that engineering routes around their concerns. Without memory, these patterns are invisible. With memory, they become navigable.

**Questions this domain answers:**
- "Which communication style worked best with Product?"
- "What has caused friction with [stakeholder function]?"
- "What framing has gotten traction in roadmap negotiations?"
- "Which stakeholders tend to escalate vs. resolve laterally?"
- "What has built trust with [partner]? What has eroded it?"

---

## Domain-Specific Entry Fields

```
Stakeholder:          {{name / role / function — prefer role+function for transferability}}
Interaction type:     {{working session / negotiation / escalation / social / async}}
Trust trajectory:     {{Improving / Stable / Declining}} at the time of entry
Their apparent priority: {{what they are optimizing for this quarter}}
What worked:          {{specific approach or framing that reduced friction or built alignment}}
What didn't work:     {{specific approach that created resistance or conflict}}
How they responded:   {{behavioral description — what they said or did, not interpreted intent}}
Alignment outcome:    {{Aligned / Partially aligned / Stalled / Escalated}}
```

---

## What to Record

Create an entry after any of the following:

- A cross-functional negotiation produced an unexpected outcome (positive or negative)
- A communication style visibly landed or failed with a specific partner
- A stakeholder expressed a concern that revealed their real priority
- Trust appeared to shift — either toward or away from engineering
- Engineering was included in or excluded from a decision that affected them
- A joint decision was made and then relitigated (stickiness failure)
- A blocker was resolved unusually fast or remained unresolved for 14+ days

---

## Pattern Detection

After three or more entries about the same stakeholder function, look for:

**Communication preference**: Does this partner respond to data or to narrative? Do they need status updates frequently or do they prefer single-source clarity?

**Negotiation pattern**: Do they anchor high and concede, or do they seek genuine alignment? Do they escalate when stuck, or work it out laterally?

**Alignment theater signal**: Do decisions made in meetings get relitigated? If yes, the meeting produced the appearance of alignment without the substance. The root cause is usually unstated objection in the room.

**What triggers trust erosion**: Late delivery? Surprises? Engineering changing approach without notice? Understanding the specific erosion trigger allows it to be managed.

**Escalation vs. lateral resolution**: Some partners escalate routinely as a power move; others escalate only when genuinely stuck. Knowing the difference determines how urgently to resolve ambiguity before it reaches their leadership.

---

## Query Patterns

```
Q: "Which communication style worked best with [function/partner]?"
→ Filter by: person:[tag] + pattern:communication-style + outcome:positive
→ Retrieve: What worked fields

Q: "What has caused friction with [partner]?"
→ Filter by: person:[tag] + outcome:negative or outcome:reversed
→ Retrieve: What didn't work + How they responded fields

Q: "What framing works in roadmap negotiations with [function]?"
→ Filter by: situation:roadmap-negotiation + pattern:framing-effect + outcome:positive

Q: "Which stakeholders escalate vs. resolve laterally?"
→ Filter by: pattern:negotiation across all stakeholder entries
→ Aggregate: Alignment outcome field by stakeholder function

Q: "What has built trust with [partner]?"
→ Filter by: person:[tag] + pattern:trust-building + outcome:positive
```

---

## Entry Log

```
STAKEHOLDER MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example entry — replace with real entries]

ID: STK-2026-07-01-001
Date: 2026-07-01
Domain: stakeholders
Actors: Product Director (Platform domain)
Context: Roadmap negotiation for Q3. Prior quarter had a 2-sprint slip on a joint delivery.
  Trust trajectory: Declining — Product team had expressed frustration in retrospective.
What happened: Opened with acknowledgment of the Q2 slip before presenting Q3 plan. Showed
  revised estimation methodology (buffer added, dependency surface mapped). Product Director
  asked two questions about shared ownership of the dependency risk.
Outcome: Q3 plan accepted. Product Director explicitly named "the way you handled Q2 honestly"
  in the next cross-functional sync. Trust trajectory: Stabilizing.
Lesson: Acknowledging the prior miss before proposing the next plan resets the trust frame.
  This stakeholder responds to accountability before optimism. Skipping the acknowledgment
  reads as dismissiveness, not confidence.
Confidence: Emerging
Stakeholder: Product Director (Platform)
Interaction type: Negotiation
Trust trajectory: Declining → Stabilizing
Their apparent priority: Predictable joint delivery; no surprises
What worked: Proactive accountability framing before the new proposal
What didn't work: N/A — not tested
How they responded: Skeptical at opening; receptive after acknowledgment
Alignment outcome: Aligned
Tags: person:product-director, situation:roadmap-negotiation, pattern:trust-building, outcome:positive
Related entries: RMP-2026-06-01-003
```

---

## Pattern Summary (per stakeholder function)

```
STAKEHOLDER PATTERN PROFILE: {{Function / Partner name}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Communication preference:   {{data / narrative / outcome-first / unknown}}
Most effective framing:     {{delivery certainty / business impact / shared risk / unknown}}
Negotiation style:          {{anchor-and-concede / genuine-alignment / escalate-first}}
Escalation threshold:       {{low / medium / high — based on observed behavior}}
Alignment theater risk:     {{Low / Medium / High — decision stickiness pattern}}
Trust drivers:              {{what has built trust with this function}}
Trust risks:                {{what has consistently eroded trust}}
Established patterns:       {{list with entry IDs}}
Current trust level:        {{Strong / Adequate / Strained / Broken}} — as of {{date}}
Last updated:               {{date}}
```

---

## Recall Output Format

```
STAKEHOLDER RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Stakeholder: {{function / name}}
Entries reviewed: {{N}} entries, {{date range}}

PATTERN ({{Established / Emerging / Single}}):
  {{Summary of the communication or relationship pattern}}

WHAT HAS WORKED:
  {{Specific approaches with entry IDs and dates}}

WHAT HAS NOT WORKED:
  {{Specific approaches that failed, with entry IDs and dates}}

CURRENT TRUST TRAJECTORY:
  {{Improving / Stable / Declining}} — basis: {{most recent entry}}

RECOMMENDATION:
  {{Specific advice for the upcoming interaction}}

CONFIDENCE: {{High / Medium / Low}}
  Basis: {{N confirmed observations; most recent: date}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Relationship assumed stable** | No entries for a stakeholder in 90+ days; trust assumed unchanged | Trust decays silently; monthly review must include stakeholder health check |
| **Attribution error** | Behavior attributed to personal style; structural cause missed | Ask: is this pattern specific to this person, or does every PM in this function behave this way? |
| **One-sided recording** | Only negative interactions recorded; positive patterns not captured | Record what builds trust as diligently as what erodes it |
| **Stale profile** | Pattern profile based on entries from a prior quarter; priorities shift | Note entry date on every pattern; revalidate if 90+ days old |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `analytics/stakeholder-dashboard.md` — Per-partner trust scores informed by this log
- `skills/conflict/stakeholder-resolution.md` — Conflict resolution skill using this domain
- `political-signals/political-signals.md` — Structural risk signals that often appear in this log
