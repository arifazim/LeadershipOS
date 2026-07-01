# Skill: Promotion Gaps

**Domain**: Career / Promotion
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (gap audit) + Before every review cycle + On-demand (after readiness assessment)

---

## Purpose

Synthesize all promotion readiness signals into a single, ranked gap analysis — answering "What promotion packet should I build?" and "What is standing between me and promotion right now?" with the specificity needed to act, not just reflect.

**What the EM does automatically**: As the master synthesis skill of the Promotion Operating System, the EM:
1. Pulls signals from all five promotion skills (readiness, evidence, tracker, visibility, leadership, feedback)
2. Produces a unified gap register with priority ranking
3. Answers the five continuous promotion questions in a single output
4. Generates a 90-day action plan targeted at the highest-leverage gaps
5. Builds the promotion packet outline: what to include, what each section says, what is still missing

This skill is the command center of the promotion operating system. Every other skill feeds it. It synthesizes the inputs and produces the plan.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Readiness score** | Output from promotion-readiness.md (0–100 + dimension breakdown) |
| **Evidence completeness** | Output from promotion-evidence.md (% complete + gap list) |
| **Impact tracker status** | Monthly score + evidence type coverage from impact-tracker.md |
| **Target level** | Current level and promotion target |

### Optional
| Input | Description |
|---|---|
| **Visibility score** | Output from visibility-score.md |
| **Leadership behavior assessment** | Output from leadership-growth.md |
| **Executive feedback themes** | Output from executive-feedback.md |
| **Review cycle date** | When is the next calibration/review cycle? |

---

## Analysis

### Step 1 — Five Continuous Questions Assessment

Run this assessment on every invocation. These five questions are the output the Promotion Operating System exists to answer:

```
Q1: WHAT LEVEL AM I OPERATING AT?
Source: promotion-readiness.md
Answer: "You are operating at {{current effective level}} based on:
  - Consistent at target level: {{dimensions scoring 75%+}}
  - Inconsistent (sometimes target, sometimes current): {{dimensions 50–75%}}
  - Not yet at target level: {{dimensions <50%}}
  Overall: You are {{N}}% of the way to consistent target-level performance."

Q2: WHAT EVIDENCE AM I MISSING?
Source: promotion-evidence.md + impact-tracker.md
Answer: "Your evidence portfolio is {{N}}% complete for {{target level}}.
  Missing entirely: {{list of evidence types with 0 entries}}
  Present but weak (< 8/10 quality): {{list}}
  Strongest entries: {{top 3 with quality scores}}
  Collection pace: {{N}} impact points/month (target: 6+)"

Q3: WHAT PROMOTION PACKET SHOULD I BUILD?
Source: Synthesized from all skills
Answer: Packet outline with section-by-section guidance (see Output)

Q4: WHAT LEADERSHIP BEHAVIORS SHOULD I DEMONSTRATE?
Source: leadership-growth.md + promotion-readiness.md (Leverage and Ambiguity dimensions)
Answer: "The two behaviors highest-leverage for your promotion case right now:
  Primary: {{behavior}} — currently {{Absent/Developing}} — {{specific action}}
  Secondary: {{behavior}} — currently {{Absent/Developing}} — {{specific action}}"

Q5: WHICH PROJECTS WILL MAXIMIZE MY GROWTH?
Source: career-roadmap.md + promotion-readiness.md gaps
Answer: "The highest-value project for your current development focus would:
  {{requirement 1 — scope characteristic}}
  {{requirement 2 — ambiguity level}}
  {{requirement 3 — leverage opportunity}}
  Current best match in your context: {{project name or type}}"
```

### Step 2 — Gap Register

Identify and rank all gaps across five categories:

```
Gap categories:
  A. Readiness gaps (from promotion-readiness.md) — what level you're not yet operating at
  B. Evidence gaps (from promotion-evidence.md) — what documentation is missing
  C. Visibility gaps (from visibility-score.md) — who doesn't know about your work
  D. Leadership behavior gaps (from leadership-growth.md) — what behaviors aren't demonstrated
  E. Feedback gaps (from executive-feedback.md) — what calibration-level signal is missing

For each gap: rank by promotion case impact

  Critical: Fixes this gap → promotion case moves from failing to viable
  High: Fixes this gap → promotion case moves from viable to strong
  Medium: Fixes this gap → promotion case moves from strong to compelling
  Low: Nice to have; won't determine outcome
```

### Step 3 — Gap Interaction Patterns

Some gaps interact and reinforce each other. Identify these compounding patterns:

| Pattern | Gaps involved | Compounding effect |
|---|---|---|
| **Dark horse** | Strong readiness, low visibility | Can't promote what calibration doesn't know; readiness is invisible |
| **Well-known and not ready** | High visibility, low readiness | Creates a risk: people know you're targeting promotion but evidence isn't there |
| **Evidence without narrative** | Strong evidence, no packet structure | Evidence exists but isn't packaged as a coherent case |
| **Behavior gap blocking evidence** | Leadership gap → evidence gap | The behavior that would produce evidence isn't being demonstrated; evidence can't accumulate |
| **Advocacy vacuum** | Good work + no executive feedback | No one at calibration level will know what to say; manager advocates alone |

### Step 4 — Build the Promotion Packet Outline

The promotion packet is a business case, not a resume update. It must argue, not just list.

```
PROMOTION PACKET STRUCTURE

Section 1: The Case (2–3 sentences)
  "{{Name}} is operating at {{target level}}. The evidence below demonstrates {{N}}-months
  of consistent {{scope}} impact across {{N}} initiatives. The team and organization
  are measurably better because of this work."

Section 2: Impact at Target Level (3–5 examples, strongest first)
  For each example:
    Situation: What was the challenge or problem?
    Action: What did you do specifically? (target-level behaviors)
    Result: What measurably changed? (quantified)
    Scope: Who and what were affected?
    Who observed: Named witnesses

Section 3: Organizational Leverage
  Evidence that others were made more effective:
  - Named engineers developed or unblocked
  - Processes or systems that scaled your impact
  - Cross-team or cross-functional outcomes enabled

Section 4: Leadership Behaviors Demonstrated
  For each target-level behavior:
    Behavior: {{exact behavior from level rubric}}
    Example: {{specific instance with context and outcome}}

Section 5: Feedback and External Validation
  Quotes from skip-level, cross-functional partners, or senior leaders
  Calibration-ready statements the reader can reference

Section 6: Growth Trajectory (for nearly-ready cases)
  Evidence of development and response to feedback
  Demonstrates coachability and forward momentum

What NOT to include:
  - Activities without outcomes
  - Evidence at current level presented as target-level work
  - "Worked on" or "helped with" language
  - List of responsibilities (this is a case, not a job description)
```

---

## Decision Tree

```
What does the synthesis reveal?

├── READINESS < 70 AND REVIEW CYCLE < 90 DAYS
│   └── Do not submit this cycle — submitting a weak case does more harm than waiting
│       Frame to manager: "I'm targeting the next cycle. Here's my 90-day plan."
│       Use remaining time to generate evidence, not to submit prematurely
│       Set explicit milestone: "If I reach {{N}} in {{dimension}} by {{date}}, I'm ready"

├── READINESS ≥ 85 BUT EVIDENCE COMPLETENESS < 75%
│   └── Performance is there; documentation is not
│       The case will fail in calibration even if the work was done
│       90-day focused evidence reconstruction and collection
│       → Invoke: skills/career/promotion/impact-tracker.md for emergency collection

├── READINESS ≥ 85, EVIDENCE ≥ 75%, VISIBILITY SCORE < 60
│   └── The Dark Horse pattern — strongest and most correctable late-stage gap
│       Priority: Two visibility actions in next 30 days
│         1. Skip-level 1:1 with one impact story
│         2. One cross-functional visibility moment (presentation, design doc, retrospective)
│       → Invoke: skills/career/promotion/visibility-score.md

├── ALL SIGNALS STRONG (Readiness ≥ 85, Evidence ≥ 85, Visibility ≥ 70)
│   └── Build the packet now
│       Manager alignment: Share the packet draft before submitting
│         "I want to make sure this matches what you would say in calibration"
│       Confirm advocacy: Who will speak for you if asked?
│       Submit with confidence

└── ADVOCACY VACUUM (no skip-level or executive feedback in last 6 months)
    └── This is a high risk even if all other signals are strong
        Action: One skip-level 1:1 before the review cycle — minimum requirement
        One cross-functional senior feedback request — ideally before the cycle
        → Invoke: skills/career/promotion/executive-feedback.md
```

---

## Output

### Promotion Gap Analysis + Packet Builder

```
PROMOTION OPERATING SYSTEM — FULL SYNTHESIS
{{Name}} | {{Current Level}} → {{Target Level}} | {{date}} | Cycle target: {{date}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
THE FIVE QUESTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
❶ WHAT LEVEL AM I OPERATING AT?
  Overall readiness: {{N}}/100 | {{Ready 🟢 | Nearly ready 🟡 | In progress 🟠 | Developing 🔴}}
  Operating consistently at target level in: {{dimensions}}
  Not yet at target level in: {{dimensions}}
  Current effective operating level: {{level description}}

❷ WHAT EVIDENCE AM I MISSING?
  Evidence completeness: {{N}}%
  Strong (8–10/10): {{N}} items — {{brief list}}
  Needs strengthening: {{N}} items
  Missing entirely: {{evidence types}}
  Collection pace: {{N}} points/month | {{At target 🟢 | Below target 🔴}}

❸ WHAT PROMOTION PACKET SHOULD I BUILD?
  Packet readiness: {{Ready to build | Needs {{N}} more items before building}}
  Section 1 (The Case): {{Draft 1-2 sentence version based on current evidence}}
  Section 2 (Top impact items):
    ✅ {{Item 1 — quality score, brief description}}
    ✅ {{Item 2 — quality score}}
    ⚠️ {{Item 3 — needs strengthening: how}}
    ❌ Missing: {{required item type — how to get it}}
  Section 3 (Leverage): {{Strong / Needs more people-development evidence}}
  Section 4 (Leadership behaviors): {{N}} of {{N}} target behaviors documented
  Section 5 (External validation): {{N}} calibration-ready quotes | {{Source names}}

❹ WHAT LEADERSHIP BEHAVIORS SHOULD I DEMONSTRATE?
  Primary focus: "{{behavior}}" — currently {{Absent/Developing}}
    Observable action: {{specific action this week/month}}
  Secondary focus: "{{behavior}}" — currently {{Developing}}
    Observable action: {{specific action}}
  Evidence to generate: {{entry type in impact tracker}}

❺ WHICH PROJECTS WILL MAXIMIZE MY GROWTH?
  Current highest-priority gap: {{dimension}}
  Project requirements to close it:
    → {{scope requirement}}
    → {{ambiguity requirement}}
    → {{leverage requirement}}
  Best match available: {{project or type}}
  Score: {{N}}/10 for current development focus

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
GAP REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Priority | Gap                      | Category  | Action                   | By when
Critical | {{gap}}                  | {{A–E}}   | {{specific action}}      | {{date}}
High     | {{gap}}                  | {{A–E}}   | {{specific action}}      | {{date}}
Medium   | {{gap}}                  | {{A–E}}   | {{specific action}}      | {{date}}

PATTERN DETECTED: {{Dark horse | Well-known not ready | Evidence without narrative | other}}
  Implication: {{specific risk to promotion case}}
  Correction: {{specific action}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
90-DAY ACTION PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Month 1 — Close critical gap:
  {{Specific, calendared action with success criterion}}

Month 2 — Close high-priority gap:
  {{Specific, calendared action with success criterion}}

Month 3 — Packet build + pre-calibration:
  {{Packet draft complete}} by {{date}}
  {{Manager alignment conversation}} by {{date}}
  {{Skip-level 1:1}} by {{date}}

READINESS FORECAST
  Current: {{N}}/100
  Projected in 90 days (if plan executed): {{N}}/100
  Target for submission: 85/100
  On track for {{date}} cycle: {{Yes / No — target {{alternate date}} instead}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All five promotion questions answered | Base: 65% |
| Inputs from ≥ 3 of 6 promotion skills | +15% |
| Gap register ranked by promotion case impact | +10% |
| Packet outline generated with specific gaps | +10% |
| 90-day plan is specific and calendared | +5% |
| Only readiness assessment used | −30% |
| No packet outline produced | −15% |
| Action plan is vague ("work on visibility") | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Partial synthesis** | Only one or two skill outputs used; others ignored | Run all five promotion questions. Each has a different source. Missing one produces a blind spot. |
| **Gap without action** | Gaps listed but plan says "develop more" | Every gap needs a specific, time-bounded action. Vague improvement goals don't close gaps. |
| **Premature packet** | Packet built while readiness < 70 | Evidence collection comes before packet building. A weak packet submitted on schedule is worse than a strong packet submitted later. |
| **Packet as resume** | Packet lists activities and responsibilities | Packet is a business case. Every item must demonstrate target-level behavior and quantified outcome. |
| **Annual-only synthesis** | Gap analysis run only at review time | Run quarterly. Gaps found 90 days before a cycle can be addressed. Gaps found at the cycle cannot. |

---

## References

This skill is the synthesis hub of the Promotion Operating System. It draws from all other skills:
- `skills/career/promotion/promotion-readiness.md` — Q1 source
- `skills/career/promotion/promotion-evidence.md` — Q2 source + packet content
- `skills/career/promotion/impact-tracker.md` — Evidence quality and currency
- `skills/career/promotion/career-roadmap.md` — Q5 source
- `skills/career/promotion/visibility-score.md` — Q3 visibility gap
- `skills/career/promotion/leadership-growth.md` — Q4 source
- `skills/career/promotion/executive-feedback.md` — Calibration advocacy and quote extraction

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/career/promotion/promotion-readiness.md` | Master input — readiness score drives everything |
| `skills/career/promotion/promotion-evidence.md` | Evidence completeness feeds packet readiness |
| `skills/career/promotion/career-roadmap.md` | Project recommendations come from gap analysis output |
| `skills/career/promotion/visibility-score.md` | Visibility gap is one of five gap categories |
| `skills/career/promotion/leadership-growth.md` | Behavior gaps map to Q4 answer |
