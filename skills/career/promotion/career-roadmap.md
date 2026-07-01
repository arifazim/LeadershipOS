# Skill: Career Roadmap

**Domain**: Career / Promotion
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (update and replan) + Annual (full rebuild) + On-demand (level change, role change, reorg)

---

## Purpose

Build a structured, milestone-based career roadmap from current level to target level — with specific project recommendations, skill development sequencing, and timeline predictions — so that career advancement is a managed process, not a hope.

**What the EM does automatically**: When building or reviewing a career roadmap, the EM:
1. Maps the current-to-target level gap into concrete milestones
2. Recommends specific types of projects that will close each gap dimension
3. Sequences development work to build on itself (not random skill accumulation)
4. Predicts the timeline to readiness based on current pace and gap size
5. Answers "Which projects will maximize my growth?" with precision

Career development without a roadmap produces effort without direction. The right project is not the most interesting one or the most visible one — it is the one that closes the highest-priority gap on the promotion readiness assessment.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Readiness assessment** | Output of promotion-readiness.md — current scores by dimension |
| **Evidence gaps** | Output of promotion-evidence.md — missing evidence types |
| **Current team context** | What projects are available; what initiatives are on the roadmap |
| **Timeline constraint** | When is the next review cycle? Is there a target promotion date? |

### Optional
| Input | Description |
|---|---|
| **Manager input on opportunity** | What opportunities are available or can be created |
| **Personal development themes** | Areas the person finds energizing (sustainability matters) |
| **Organizational context** | Reorgs, strategy shifts, growth areas that create new opportunities |

---

## Analysis

### Step 1 — Sequence Development by Gap Priority

Development must be sequenced, not parallelized. Too many parallel development goals produces shallow progress on all of them.

```
Development sequencing rule:
  Focus on the single highest-scoring readiness gap dimension
  Only add a second focus when the first reaches 75%+ of maximum score

Priority order (from promotion-readiness.md dimensions):
  1. Highest-impact blocker (any dimension < 50% of max)
  2. Lowest absolute score (if no hard blocker)
  3. Track Record dimension last — it follows from evidence accumulated by improving other dimensions
```

### Step 2 — Project Selection Framework

Match project characteristics to the gap being closed:

| Gap dimension | Project characteristics needed | Avoid |
|---|---|---|
| **Scope of Impact** | Projects with org-level or cross-team scope; PM or stakeholder-facing | Small features, internal tools only visible to your team |
| **Ambiguity Handling** | Projects where the problem is undefined at the start; 0→1 work | Projects with complete specs; projects scoped by someone else |
| **Technical Leadership** | Architectural decisions; cross-team technical design; setting technical direction | Implementation-only projects; well-understood tech |
| **Organizational Leverage** | Projects requiring you to make others effective; tech leadership across multiple engineers | Projects you can ship alone; no collaboration surface |
| **Track Record** | Consistent execution across multiple projects in the development area | Single high-profile project with nothing before or after |

### Step 3 — Project Scoring Matrix

Score each candidate project against the readiness gap:

```
Project value for gap closure (0–10):
  Closes highest-priority gap dimension: +4
  Closes second-priority gap dimension: +2
  Scope is at target level or above: +2
  Outcome is measurable: +1
  Audience includes target-level decision makers: +1

Project risk for gap closure:
  Heavily scoped/defined by others (ambiguity gap doesn't close): −2
  Execution-only (leverage gap doesn't close): −2
  Low visibility (track record not observable): −2
  Short timeline (<4 weeks — insufficient to demonstrate consistency): −1

Net project score = Value − Risk

  8–10: Ideal gap-closing project — prioritize
  5–7:  Good fit — worth taking for this development focus
  3–4:  Partial fit — supplements but doesn't close the primary gap
  0–2:  Poor fit — does not advance promotion case for current development focus
```

### Step 4 — Build the Roadmap Timeline

```
Timeline estimation:
  Gap size determines minimum time to demonstrate at target level:
  
  Track Record dimension requires:
    Hard minimum: 4 months of evidence (calibration requires pattern, not peak)
    Preferred: 6–12 months at target level before submission
    
  Each dimension requires:
    Large gap (0–40% of max): 6–9 months of focused development
    Medium gap (40–65% of max): 3–6 months of focused development
    Small gap (65–80% of max): 6–12 weeks of targeted work
    
  Total roadmap timeline = Sum of sequential focus periods
  (each dimension developed in sequence, not parallel)
  
  Example: 
    Ambiguity gap (large): 6 months
    Leverage gap (medium): 3 months
    Track record accumulation runs concurrently with both
    Total: ~9 months to promotion-readiness

Review cycle alignment:
  Work backward from the next review cycle date
  If insufficient time: target the cycle after next, not the next one
  Submitting an unready case is worse than waiting for a strong one
```

---

## Decision Tree

```
What does the career roadmap assessment reveal?

├── NEXT REVIEW CYCLE < 3 MONTHS AWAY AND SCORE < 85
│   └── Do not submit for this cycle — time insufficient to close gaps
│       Recommendation: Explicitly target the next cycle (typically 6 months)
│       Use this cycle: Ensure manager alignment on your trajectory
│       Frame: "I'm targeting the {{date}} review cycle, not the upcoming one.
│       Here's what I'm building toward and what I need from you."
│       → Invoke: skills/career/promotion/executive-feedback.md for alignment

├── SCOPE GAP IS THE PRIMARY BLOCKER
│   └── Project selection is the most critical decision
│       Required: Project at target level scope in the next 60 days
│       If no such project exists in current team context:
│         Have the conversation with manager: "I need a project at this scope.
│         What is available or can be created?"
│       Do NOT: Wait for the perfect project to appear
│       → Evaluate all available projects using the scoring matrix

├── LEVERAGE/PEOPLE GAP IS THE PRIMARY BLOCKER
│   └── Often invisible because it happens in the margins, not in projects
│       Required: Name one engineer you are developing intentionally
│       Document: What you taught, what changed, what they shipped differently
│       Required: Lead one technical design session with the team this month
│       → Invoke: skills/career/promotion/leadership-growth.md

├── TRACK RECORD GAP (score strong but evidence < 6 months old)
│   └── Nothing to build — only time resolves this gap
│       Recommendation: Begin collection discipline now; do not rush submission
│       Frame: "Strong current performance. The case strengthens with 3 more months
│       of documented evidence. Submit in {{date}} cycle."

└── ROADMAP IS ON TRACK (sequential development progressing per timeline)
    └── Monthly check: Is current project closing the priority gap?
        Quarterly update: Re-score readiness dimensions; update timeline
        Confirm with manager: Visibility and advocacy alignment
```

---

## Output

### Career Roadmap

```
CAREER ROADMAP — {{Name}} — {{Current Level}} → {{Target Level}} — {{date}}

TARGET TIMELINE: {{Quarter/Year}} — {{N}} months from today
Review cycle target: {{date}}

DEVELOPMENT SEQUENCE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Phase 1 — {{Months 1–N}}: Close {{Primary gap dimension}}
  Current score: {{N}}/{{max}} | Target: {{N}}/{{max}}
  Project: {{recommended project}} (Score: {{N}}/10)
  Key behaviors to demonstrate: {{specific list}}
  Evidence to generate: {{specific type from evidence requirements}}
  Success signal: {{what "closed" looks like}}

Phase 2 — {{Months N–N}}: Close {{Secondary gap dimension}}
  Current score: {{N}}/{{max}} | Target: {{N}}/{{max}}
  Project: {{recommended project}} (Score: {{N}}/10)
  Key behaviors to demonstrate: {{specific list}}
  Evidence to generate: {{specific type}}

Phase 3 — {{Final months}}: Track record consolidation + packet build
  Ensure 12-month window shows consistent evidence across all dimensions
  Begin promotion packet construction
  Manager alignment and pre-calibration conversation

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PROJECT RECOMMENDATIONS (scored for current gap)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Rank | Project                 | Score | Gap it closes    | Timeline  | Decision
1    | {{project}}             | {{N}} | {{dimension}}    | {{weeks}} | PRIORITIZE
2    | {{project}}             | {{N}} | {{dimension}}    | {{weeks}} | Good fit
3    | {{project}}             | {{N}} | {{dimension}}    | {{weeks}} | Supplemental

PROJECTS TO AVOID (do not advance promotion case this phase)
  {{project}} — Score: {{N}} — Why: {{closes wrong gap or wrong scope}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
QUARTERLY MILESTONES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q{{N}}: {{Primary gap dimension}} reaches {{target score}} | Evidence: {{types collected}}
Q{{N+1}}: {{Secondary gap}} reaches {{target}} | Readiness score: {{N}}/100
Q{{N+2}}: Readiness ≥ 85/100 | Packet submitted for {{date}} cycle
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Roadmap based on readiness assessment output | Base: 65% |
| Projects scored against gap dimensions | +15% |
| Sequential (not parallel) development phases | +10% |
| Timeline based on gap size calculation | +10% |
| Review cycle alignment checked | +5% |
| Roadmap built without readiness assessment | −25% |
| Parallel development across all dimensions | −15% |
| No project recommendations | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Interesting over strategic** | Project selected for excitement, not gap closure | Score every candidate project against the current development gap. Interesting is a tiebreaker, not the primary criterion. |
| **Parallel development** | Three focus areas simultaneously | Sequential development closes gaps faster. Parallel development spreads effort thin and closes nothing. |
| **Waiting for the perfect project** | No projects taken because none are a perfect fit | The best available project that closes the highest-priority gap is better than waiting. |
| **Timeline optimism** | "I'll be ready in 3 months" without gap size analysis | Use the gap-size-to-timeline formula. Gut feel consistently underestimates by 2–3× for scope and leverage gaps. |
| **No review cycle alignment** | Development plan built without knowing when cycles occur | Promotion timing is constrained by review cycles. Work backward from the cycle date, not forward from today. |

---

## References

- `skills/career/promotion/promotion-readiness.md` — Readiness scores drive roadmap priorities
- `skills/career/promotion/promotion-evidence.md` — Evidence gaps determine required project outputs
- `skills/career/promotion/leadership-growth.md` — Leverage and people development in Phase 2
- `skills/career/promotion/impact-tracker.md` — Tracks evidence generated by roadmap projects

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/career/promotion/promotion-readiness.md` | Readiness assessment is the roadmap's required input |
| `skills/career/promotion/promotion-evidence.md` | Projects must generate specific evidence types |
| `skills/career/promotion/leadership-growth.md` | Leadership behaviors are developed through roadmap phases |
| `skills/career/promotion/visibility-score.md` | Projects generate impact; roadmap ensures the right people see it |
