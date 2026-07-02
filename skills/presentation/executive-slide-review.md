# Skill: Executive Slide Review

**Domain**: Presentation
**Owner**: `subagents/executive-summary.md`
**Cadence**: Before any executive-audience presentation

---

## Purpose

Review a slide deck for executive readiness — auditing for jargon, slide count, message clarity, ask specificity, and the presence of the three slides that matter most in time-compressed scenarios.

**The three-slide test:**
> "I have 15 minutes with the VP. What are the three slides that matter most?"
>
> **Slide 1 — Status** (Green/Yellow/Red + one headline sentence)
> **Slide 2 — Risk** (The one thing that could go wrong, in business terms)
> **Slide 3 — Ask** (What you need from them — specific, time-bound)
>
> If these three slides cannot be found in your deck in under 60 seconds, the deck is not executive-ready.

Every executive has been in too many meetings with too many slides. The deck that earns respect is the one that respects their time.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The deck** | Slides to review — title and content for each |
| **Audience level** | VP / SVP / CTO / Board |
| **Time available** | Total minutes allocated |
| **Goal of the presentation** | What outcome do you need from this meeting? |

### Optional
| Input | Description |
|---|---|
| **Prior deck versions** | Has this audience seen earlier versions? |
| **Audience context** | Known concerns, recent decisions, org context |
| **Appendix slides** | Backup slides that are prepared but not in main flow |

---

## Analysis

### Step 1 — Slide Count Audit

```
Time budget: N minutes ÷ 3 = maximum core slides
                N minutes × 0.3 = time for Q&A (reserve this)

Acceptable ranges:
  15 minutes → 3–5 core slides (STRICT — do not exceed 5)
  30 minutes → 7–10 core slides
  60 minutes → 12–15 core slides

If slide count exceeds budget: flag every slide above the limit for cut or appendix.
```

### Step 2 — The Three-Slide Check

Find the following in the deck. If any is missing, flag as critical gap:

| Required slide | What it must contain | Common failure |
|---|---|---|
| **Status slide** | Green/Yellow/Red signal + one-sentence headline | Status buried in slide 6 after 5 context slides |
| **Risk slide** | One named risk in business terms + mitigation | No risk slide ("everything is fine") — executives distrust this |
| **Ask slide** | Specific ask, named owner, decision deadline | Vague ask: "Your thoughts on direction" |

### Step 3 — Jargon Audit

Scan every slide for banned terms. Any occurrence fails the review:

**Banned from VP-level decks**: sprint, velocity, story points, deployment, CI/CD, PR, backlog, ticket, refactor, microservices, API (use "integration"), latency, uptime SLA, MTTR (translate it), P1/P2/P3 (translate to "service disruption"), on-call, pipeline

**Banned from board-level decks**: Everything above, PLUS: incident, infrastructure, architecture, technical debt, sprint, iteration, scrum, agile

**Translation pattern:** "Two-hour P1 outage affecting 40% of users" → "A two-hour service disruption affected 40% of customers, resolved the same day."

### Step 4 — Slide-by-Slide Review

For each slide, answer:
1. **10-second test**: Can the key message be understood in 10 seconds?
2. **So what test**: Does it answer "so what does this mean for the business?"
3. **Action test**: Does it move the audience toward the goal?

If a slide fails all three tests, it should be removed or moved to appendix.

### Step 5 — Opening and Closing Test

- **First slide**: Does it state the core message in one sentence? (Not a title. A message.)
- **Last slide**: Does it restate the ask? Is it the same ask as the Ask slide?

---

## Decision Tree

```
What is the primary review finding?

├── SLIDE COUNT TOO HIGH
│   └── Rule: Time ÷ 3 = maximum core slides
│       Action: Identify lowest-value slides and move to appendix
│       Order of cuts: Context slides → Data slides → Summary slides → Core slides
│       Never cut: Status / Risk / Ask — these survive all cuts

├── THREE-SLIDE CHECK FAILED
│   └── Missing Status: Add slide 1. Status signal is non-negotiable.
│       Missing Risk: Add "one risk they should know" even if the answer is
│         "No material risks — sharing for completeness." Never imply no risks exist.
│       Missing Ask: This is the most common failure. Rewrite the closing.
│         An implicit ask ("let us know your thoughts") is not an ask.

├── JARGON FOUND
│   └── Severity: Any banned term = audit failure. Fix before presenting.
│       Process: Search every slide text. Replace using translation table.
│       If unsure: "Would someone with no engineering background understand this?"
│         If no — rewrite.

├── SLIDES PASS BUT NARRATIVE IS WEAK
│   └── Symptom: Individual slides are fine but the story doesn't flow
│       → Invoke: skills/presentation/storyline-generator.md
│       The deck needs a narrative pass — not individual slide fixes.

└── DECK IS READY
    └── Confirm: Slide count within budget / Status + Risk + Ask present /
        Jargon-clean / Ask is specific
        → Invoke: skills/presentation/meeting-preparation.md for final prep
```

---

## Output

### Review Report

```
EXECUTIVE SLIDE REVIEW — {{Deck title}} — {{Date}}
Audience: {{level}} | Time: {{N}} min | Goal: {{goal}}
Reviewer: Claude (engineering-manager-os)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SUMMARY VERDICT: {{Ready / Needs revision / Not ready}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SLIDE COUNT
Budget: {{N}} slides for {{N}} minutes
Actual: {{N}} slides
Status: {{Within budget / Over by N — cut or move to appendix}}

Slides to cut or move to appendix:
• Slide {{N}}: {{title}} — {{reason: low value / redundant / context only}}

THREE-SLIDE CHECK
Status slide:  {{Found (Slide N) | MISSING}}
Risk slide:    {{Found (Slide N) | MISSING}}
Ask slide:     {{Found (Slide N) | MISSING}}

JARGON AUDIT
{{Clean | N violations found}}
{{If violations: Slide N — "{{term}}" → replace with "{{translation}}"}}

SLIDE-BY-SLIDE
Slide 1 — {{title}}: {{Pass / Fix — specific issue}}
Slide 2 — {{title}}: {{Pass / Fix — specific issue}}
[...continue for each slide...]

OPENING: {{Strong — states core message / Weak — fix: "Replace title with: [message]"}}
CLOSING: {{Strong — ask restated / Weak — fix: "Add explicit ask: [specific ask]"}}

PRIORITY FIXES (before presenting):
1. {{Critical fix}}
2. {{Critical fix}}
3. {{Nice to have fix}}
```

---

## Example

```
EXECUTIVE SLIDE REVIEW — Q3 Engineering Update — June 30, 2025
Audience: VP Engineering | Time: 20 min | Goal: Seek approval for reliability sprint
Reviewer: Claude

SUMMARY VERDICT: Needs revision (2 critical, 1 jargon fix)

SLIDE COUNT
Budget: 7 slides for 20 minutes
Actual: 14 slides
Status: Over by 7 — cut or move to appendix

Slides to cut/move:
• Slides 3–7: Sprint-by-sprint velocity charts — background context, not decision-relevant
• Slide 9: Architecture diagram — move to appendix, show if asked
• Slides 11–12: Team bios — remove entirely

THREE-SLIDE CHECK
Status slide:  Found (Slide 1) ✓
Risk slide:    MISSING ✗ — Add before closing
Ask slide:     Found (Slide 14) but too late and too vague ✗

JARGON AUDIT
2 violations:
• Slide 2 — "sprint velocity declined 18%" → "delivery rate declined 18% vs. target"
• Slide 8 — "P2 incident in auth service" → "service disruption affecting login — 4 hours"

PRIORITY FIXES:
1. CRITICAL: Add Risk slide (Slide 2 or 3): Authentication reliability risk — business impact — ask
2. CRITICAL: Rewrite Ask slide: "Approve 2-week reliability sprint starting July 7.
   This delays Feature X by 2 weeks. I recommend the trade-off." (Specific. Time-bound. Decision clear.)
3. FIX: Replace velocity/P2 jargon on Slides 2 and 8
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All three required slides identified | Base: 70% |
| Jargon audit completed | +10% |
| Slide count within budget | +10% |
| Ask is specific with deadline | +10% |
| Any banned term remains | −20% (reject — fix first) |
| Risk slide absent | −15% |
| Ask slide absent or vague | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **No risk slide** | "Everything is going well" | Executives are skeptical of no-risk presentations. Name one risk, even if managed. |
| **Vague ask** | "Let us know your thoughts" | Rewrite: "I need [specific thing] by [date]." No ask = no outcome. |
| **Over-slide** | 20 slides for 15 minutes | Apply the budget formula. Cut ruthlessly. Core slides survive. |
| **Jargon buried** | Technical terms in body text, not titles | Scan body text, not just titles. Executives read both. |
| **Status buried** | VP finds out status on slide 7 | Status is always slide 1. The rest is explanation. |

---

## References

- `skills/executive/executive-communication.md` — Jargon translation rules
- `skills/presentation/presentation-coach.md` — Presentation strategy upstream of this review
- `skills/executive/board-level-summary.md` — Stricter rules for board audience

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/presentation/presentation-coach.md` | Pre-review: determines what the deck should contain |
| `skills/presentation/storyline-generator.md` | When narrative is weak — fix story before fixing slides |
| `skills/executive/board-level-summary.md` | Board-specific review (stricter standards); see its deck variant |
| `skills/executive/executive-status-report.md` | Written equivalent of the status slide |
