# Leadership Memory: Master Recall Engine

**Domain**: Leadership Memory
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (primary recall surface for cross-domain queries)
**Cadence**: Updated when cross-domain patterns emerge; reviewed monthly

---

## Purpose

Individual domain files capture what happened in a specific context. This file surfaces what repeats across contexts — the patterns that span executive relationships and stakeholder dynamics, that connect architecture risk habits to roadmap estimation failures, that link how an engineer responds to coaching with how they perform under calibration.

Cross-domain patterns are the highest-value outputs of the memory system. A pattern visible only in one domain is an observation. A pattern confirmed across multiple domains is a structural reality.

**Primary questions this file answers:**
- What are the established patterns in this EM's leadership environment?
- Which patterns are currently emerging and require deliberate testing?
- When the EM asks a cross-domain question, which domains contain the answer?

---

## Query Routing Table

When a recall question arrives, route to the correct domain before querying.

| Question Type | Primary Domain | Secondary Domain |
|---|---|---|
| "How did [executive] respond to X?" | executive/ | decision-history/ |
| "What communication style works with [stakeholder]?" | stakeholders/ | conflicts/ |
| "What evidence do I have for [engineer]'s promotion?" | promotions/ | career/ |
| "Which risks did we repeatedly underestimate?" | architecture/ | roadmaps/ |
| "What happened when we tried [approach] before?" | decision-history/ | conflicts/ |
| "How has [engineer] responded to coaching?" | mentoring/ | career/ |
| "What customer feedback proved accurate?" | customer-feedback/ | roadmaps/ |
| "What caused this conflict to resolve (or not)?" | conflicts/ | stakeholders/ |
| "What was the outcome of the last [initiative] decision?" | decision-history/ | roadmaps/ |
| "What does [engineer]'s career aspiration look like over time?" | career/ | promotions/ |
| "What retro themes keep coming back?" | retrospectives/ | delivery-adjacent memory |
| "What growth edge did I set for myself last month?" | em-self-development/ | decision-history/ |

---

## Cross-Domain Pattern Detection

Patterns that emerge from entries across multiple domains are recorded here. Single-domain patterns live in their respective domain files; only cross-domain patterns appear in this master file.

A cross-domain pattern requires at least two entries from different domains pointing to the same underlying dynamic.

```
CROSS-DOMAIN PATTERN RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Pattern name:     {{short descriptive label}}
Pattern type:     {{person-specific / situational / organizational / structural}}
Contributing entries: {{IDs from at least 2 different domains}}
Description:      {{what the pattern is, in specific behavioral terms}}
Implication:      {{what the EM should do or avoid based on this pattern}}
Confidence:       {{Emerging / Established}}
First observed:   {{date}}
Last confirmed:   {{date}}
Conditions:       {{when this pattern holds; when it does not}}
```

---

## Active Pattern Watch List

Patterns currently being monitored. A pattern enters this list when it appears for the first time (Single instance) or when the EM suspects a pattern but has insufficient evidence to confirm it. Patterns graduate to Established Patterns when confidence reaches 4+ confirming observations.

```
PATTERN WATCH LIST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[No entries yet — add as patterns are observed]

Pattern: {{name}}
  Status: Watching — {{N}} observations to date
  Domains: {{which domains contain the entries}}
  Next test opportunity: {{upcoming situation where this could be confirmed or refuted}}
```

---

## Established Patterns

Patterns with 4 or more confirming observations and no significant refuting evidence. These are reliable inputs for planning, communication, and relationship decisions.

```
ESTABLISHED PATTERNS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[No entries yet — populated as patterns reach Established confidence]
```

---

## Refuted Patterns

Patterns that were once Emerging or Established but were subsequently contradicted. Retained here because the failure conditions are as informative as the pattern itself.

```
REFUTED PATTERNS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[No entries yet]

Pattern: {{name}}
  Was: {{Emerging / Established}}
  Refuted by: {{entry ID}}
  Failure conditions: {{what was different when the pattern failed}}
  Revised lesson: {{what to believe instead}}
```

---

## Monthly Review Protocol

Run during the monthly kaizen review (`kaizen/monthly-review.md`).

```
MONTHLY MEMORY REVIEW CHECKLIST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. SINGLE-INSTANCE SCAN (each domain)
   □ Identify all Single instance entries older than 90 days
   □ For each: has this pattern recurred? If yes → promote. If no → note as isolated.
   □ Apply decay tier: 90–180 days old → add [WATCH] tag
   □ Apply decay tier: > 180 days old with no confirmation → add [STALE] note with archive deadline

2. EMERGING PATTERN PROMOTION
   □ Identify Emerging entries with 4+ confirming observations → promote to Established
   □ Add to Established Patterns section above

3. DECAY-WEIGHT CHECK
   □ Identify any Established or Emerging entries with no confirming observation in > 12 months
   □ Add [DECAY-WEIGHT] tag; treat as one confidence level lower in recall until reconfirmed
   □ Surface these in the next relevant recall response with the explicit decay caveat

4. CONTEXT-EXPIRY SWEEP
   □ Did any major context shift occur this month? (reorg, role change, person left/joined, product pivot)
   □ If yes → identify all entries involving the affected person/context → add [CONTEXT-EXPIRED] note
   □ Do not wait for monthly review for context expiry — apply immediately when the shift occurs

5. ARCHIVE EXECUTION
   □ Identify all entries with a [STALE] note whose archive deadline has passed
   □ Move each to the ## Archived Entries section of its domain file
   □ Add Archived date and Archive reason fields to each moved entry

6. ACTIVE WATCH LIST REVIEW
   □ For each watched pattern: did any new entries confirm or refute it this month?
   □ Update confidence; graduate to Established or Refuted as appropriate

7. CROSS-DOMAIN SCAN
   □ Are there new entries in multiple domains that point to the same dynamic?
   □ If yes → create a cross-domain pattern record above

8. REFUTED PATTERN CHECK
   □ Did any established pattern fail this month?
   □ If yes → move to Refuted Patterns with failure conditions documented

9. STALE ENTRY AUDIT (legacy rule — now superseded by decay tiers above, retained for reference)
   □ Any entry older than 12 months that has not been referenced or confirmed?
   □ Apply decay-weight or archive per the decay tier table in memory/schema.md
```

---

## Recall Response Format

When the EM asks a recall question, structure the response using this format:

```
RECALL RESPONSE — {{date}} — {{query}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

QUERY: {{exact question asked}}

RELEVANT ENTRIES ({{N}} found):
  {{Entry ID}} — {{date}} — {{one-sentence summary of lesson}}
  {{Entry ID}} — {{date}} — {{one-sentence summary of lesson}}

DECAY STATUS (flag if any relevant entry is tagged):
  {{Entry ID}}: [WATCH] / [STALE] / [DECAY-WEIGHT] / [CONTEXT-EXPIRED] — {{brief implication}}
  (Omit this section if no relevant entries carry a decay tag)

PATTERN MATCH:
  {{Does this query match an established or emerging pattern?}}
  {{If yes: pattern name, confidence level, and implication}}

ANSWER:
  {{Direct answer to the query, synthesized from entries}}
  Confidence: {{High / Medium / Low — based on number and recency of confirming entries}}

CAVEATS:
  {{Conditions under which the recalled pattern may not hold}}
  {{Date of most recent confirming entry — older entries may reflect stale conditions}}

RECOMMENDED ACTION:
  {{What the EM should do with this recalled information}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Capture gap** | Significant events pass without entries; memory degrades to impressions | Trigger: after every meeting with an executive, stakeholder, or direct report, ask "does anything here warrant a memory entry?" |
| **Pattern inflation** | Every event is labeled a pattern; confidence is promoted too quickly | Require behavioral specificity in the Lesson field; Emerging requires 2–3 distinct observations, not variations of one event |
| **Stale confidence** | Established patterns from 18+ months ago applied to changed conditions | Monthly review; note the date of the last confirming observation for each established pattern |
| **Single-domain myopia** | Patterns identified only within one domain; cross-domain signal missed | Cross-domain scan during monthly review; link entries generously |
| **Memory as fact** | Recalled patterns applied without checking current conditions | Every recall response includes a Caveats section; verify before acting |

---

## References

- `memory/schema.md` — Universal entry format and tagging taxonomy
- All domain files in `memory/` subdirectories
- `kaizen/monthly-review.md` — Monthly review trigger
- `decision-memory/decision-memory.md` — Engineering decision memory (distinct scope)
