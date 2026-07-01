# Skill: Leadership Growth

**Domain**: Career / Promotion
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (behavior review) + Quarterly (calibration against target level) + On-demand (feedback integration)

---

## Purpose

Identify the specific leadership behaviors required for the target level, assess current demonstration of those behaviors, and build a concrete practice plan — answering "What leadership behaviors should I demonstrate?" with precision, not platitudes.

**What the EM does automatically**: For leadership development, the EM:
1. Maps the leadership behaviors required for the target level
2. Assesses which behaviors are demonstrated consistently, occasionally, or not at all
3. Identifies the two highest-leverage behaviors to develop this quarter
4. Connects behaviors to specific observable actions (not vague aspirations)
5. Tracks behavior demonstration as evidence for the promotion case

Leadership behavior is not a personality trait — it is a practiced skill set that can be described, observed, and measured. "Demonstrates leadership" is not evidence. "Made the technical call under ambiguity when peers deferred, explained the tradeoffs, and owned the outcome" is evidence.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current and target level** | Determines the leadership behavior requirements |
| **Readiness assessment output** | Which dimensions are gaps (especially Ambiguity and Leverage) |
| **Recent work context** | What situations have occurred where leadership could have been demonstrated |

### Optional
| Input | Description |
|---|---|
| **360 feedback** | Peers and reports describing leadership they have observed (or not) |
| **Manager feedback themes** | Specific feedback on leadership presence, decisions, and influence |
| **Prior promotion feedback** | If a prior cycle resulted in a delayed promotion, what specifically was cited |

---

## Analysis

### Step 1 — Leadership Behaviors by Level

These behaviors are what must be *consistently demonstrated* — not occasionally, not in exceptional circumstances, but as the normal operating mode:

#### IC Track Leadership Behaviors

**L3 → L4 (Senior Engineer behaviors):**
- Takes ownership of a feature end-to-end without requiring step-by-step direction
- Raises design concerns before implementation rather than after
- Writes documentation others actually use
- Gives specific, actionable code review feedback (not just approvals)
- Identifies when a problem is larger than originally scoped and escalates appropriately

**L4 → L5 (Staff Engineer behaviors):**
- Defines the problem before defining the solution
- Makes technical decisions with explicit tradeoff documentation
- Unblocks other engineers — makes them faster, not dependent
- Says "I don't know, but I'll find out" without losing authority
- Disagrees with senior stakeholders with evidence, respectfully and clearly
- Drives technical alignment across teams without authority
- Identifies technical work that should not be done

**L5 → L6 (Principal Engineer behaviors):**
- Sets technical direction for a domain that others follow without being told to
- Makes engineering strategy legible to non-engineers
- Shapes organizational decisions through technical judgment
- Creates frameworks others use, not just solutions others copy
- Sponsors and develops engineers at L4/L5 toward the next level
- Represents engineering perspective in business and product strategy

#### Manager Track Leadership Behaviors

**M1 → M2 (Senior EM / Director behaviors):**
- Delegates outcomes, not just tasks — trusts leads to define the how
- Builds team culture deliberately, not reactionally
- Disagrees with PM or product direction using business rationale, not technical preference
- Identifies team health problems before they surface in delivery
- Develops direct reports' careers as a primary responsibility, not a side task
- Represents the team with business-level framing to VP+
- Makes the case for investment using ROI, not headcount
- Operates effectively with ambiguous or missing direction from above

**M2 → M3 (VP / Sr Director behaviors):**
- Sets organizational direction that teams internalize without constant reinforcement
- Makes trade-offs between teams explicitly — no invisible prioritization
- Builds leadership bench: managers who manage managers
- Moves engineering from cost center narrative to business capability narrative
- Shapes company strategy by influencing what is and isn't possible
- Manages up effectively — VP+ sees engineering as a strategic partner, not an executor

### Step 2 — Behavior Assessment

For each target behavior, assess demonstration level:

```
Demonstration levels:

Consistent (C): Behavior observed in majority of relevant situations;
                part of normal operating mode; others could cite examples unprompted
  
Developing (D): Behavior observed occasionally; improving but not yet reliable;
                appears in some situations, absent in others

Absent (A):     Behavior rarely or never observed; may be aspirational but
                not yet demonstrated; requires intentional development

Partial (P):    Technical behavior present but impact dimension missing
                (e.g., defines the problem but doesn't drive alignment on it)

Score:
  Consistent: 2 pts
  Developing: 1 pt
  Absent: 0 pts
  Partial: 0.5 pts
```

### Step 3 — Identify the Two Development Behaviors

```
Development focus selection:
  1. Identify all behaviors assessed as Absent or Partial
  2. Of those, select the one most directly mapped to the readiness gap dimension
  3. Add a second behavior only if it maps to the same gap dimension or
     is a prerequisite for the first

Example:
  Gap: Ambiguity Handling (12/20)
  Target L5 behaviors for this gap:
    "Defines the problem before defining the solution" — Absent ← Primary focus
    "Makes technical decisions with explicit tradeoff documentation" — Partial
  Focus: "Defines the problem" first; "tradeoff documentation" enables it → develop together
```

### Step 4 — Convert Behaviors to Observable Actions

Each development behavior must be translated into specific, scheduled actions:

| Behavior | Observable action | Frequency | Evidence generated |
|---|---|---|---|
| "Defines the problem before defining the solution" | Write a problem statement before any PRD or design doc is received | On every initiative | 3+ documented problem statements demonstrating L5 framing |
| "Unblocks other engineers — makes them faster" | Schedule 30-min weekly pairing session with a junior/mid engineer | Weekly | Named engineer + specific technical skill transferred |
| "Disagrees with senior stakeholders with evidence" | In the next product review, state one concern with supporting data | Next relevant meeting | Impact tracker entry: concern raised, outcome |
| "Delegates outcomes, not tasks" | Before assigning next project: define the outcome, not the steps | Every delegation | Documented outcome brief; report's self-direction observed |
| "Makes the case for investment using ROI" | Next time a headcount need arises: quantify the cost of not hiring | Next investment discussion | Investment memo with ROI calculation |

---

## Decision Tree

```
What does the leadership behavior assessment reveal?

├── MULTIPLE ABSENT BEHAVIORS (3+ in target level list)
│   └── Do not attempt to develop all simultaneously
│       Focus on one — the one most foundational (others often build on it)
│       Frame: "{{Behavior}} is the prerequisite for the others.
│       Master it first; the adjacent behaviors unlock faster afterward."
│       Set a 60-day intensive practice period for the single behavior
│       → Invoke: skills/career/promotion/career-roadmap.md — this is Phase 1

├── BEHAVIOR ABSENT IN HIGH-STAKES SITUATIONS ONLY
│   └── Common pattern: behavior present in safe contexts, absent under pressure
│       This is not a skill gap — it is a confidence/habit gap
│       Practice: Identify one upcoming high-stakes situation
│       Plan the specific behavior in advance; script it if needed
│       Debrief: What happened? What would you do differently?

├── "PARTIAL" PATTERNS (technical component present, influence component absent)
│   └── The work is happening; the leverage isn't
│       Example: Great design docs that no one reads or references
│       The gap is not the document — it is the circulation, adoption, and influence
│       Action: After writing the next design doc, explicitly drive alignment on it
│       → Invoke: skills/career/promotion/visibility-score.md — same issue different angle

├── MANAGER FEEDBACK CONTRADICTS SELF-ASSESSMENT
│   └── This is a calibration problem — and information
│       If manager rates behaviors higher than self: Confidence gap; act on what you have
│       If manager rates behaviors lower than self: Perception gap; how are you showing up?
│       Either way: Have the explicit conversation
│       → Invoke: skills/career/promotion/executive-feedback.md

└── CONSISTENT ACROSS TARGET BEHAVIORS (2+ pts on all)
    └── Leadership dimension is not the blocker
        Ensure behaviors are documented as promotion evidence
        Shift development focus to the next lowest readiness dimension
        → Invoke: skills/career/promotion/promotion-readiness.md for re-score
```

---

## Output

### Leadership Growth Plan

```
LEADERSHIP GROWTH PLAN — {{Name}} — {{Current Level}} → {{Target Level}} — {{date}}

LEADERSHIP GAP SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Target level behaviors assessed: {{N}}
Consistent: {{N}} | Developing: {{N}} | Absent/Partial: {{N}}

Readiness gap addressed: {{Ambiguity Handling | Organizational Leverage | Technical Leadership}}

BEHAVIOR ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Behavior                              | Level | Status | Evidence?
{{behavior}}                          | {{L}} | C 🟢   | {{Yes — entry in tracker}}
{{behavior}}                          | {{L}} | D 🟡   | {{Partial — 1 example}}
{{behavior}}                          | {{L}} | A 🔴   | No
{{behavior}}                          | {{L}} | P 🟠   | Yes but limited

PRIMARY DEVELOPMENT FOCUS (this quarter)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Behavior: {{exact behavior text}}
Why this one: {{connection to readiness gap dimension}}

Observable actions:
  Weekly:  {{specific scheduled action}}
  Monthly: {{specific observable output}}
  Quarter goal: {{what "Consistent" demonstration looks like by end of quarter}}

Evidence to generate: {{specific entry in impact tracker}}
Success signal: {{others cite this behavior without prompting — who, in what context}}

SECONDARY DEVELOPMENT FOCUS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Behavior: {{behavior}}
Observable action: {{action}}
Start: Only after primary behavior reaches "Developing" status

FLAGS
⚠️ {{Absent behaviors blocking specific evidence types}}
⚠️ {{Behaviors present in self-assessment but absent in manager view — calibration gap}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Behaviors assessed at target level (not current level) | Base: 65% |
| Each behavior translated to observable action | +15% |
| Development focus limited to one behavior at a time | +10% |
| Evidence connection made per behavior | +10% |
| Manager calibration used | +5% |
| Behaviors described as traits not actions | −20% |
| Multiple simultaneous development focuses | −15% |
| No observable actions specified | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Trait language** | "Demonstrate leadership" / "Be more strategic" | Convert every behavior to an observable action with a frequency and a named output. |
| **All behaviors simultaneously** | Development plan has 8 focus behaviors | Pick one. Develop it to Consistent. Then the next. Sequential development closes gaps faster. |
| **Behaviors at current level** | Development focused on strengthening current-level behaviors | Assess against target level. Strong current-level behaviors don't close the promotion gap. |
| **Practice without evidence** | Behavior developed but not documented | Every behavior practice session should generate at least one impact tracker entry. |
| **Self-assessment without calibration** | Assessment based on self-perception | Calibrate with manager annually. Perception gap is itself a leadership development area. |

---

## References

- `skills/career/promotion/promotion-readiness.md` — Ambiguity and Leverage dimensions drive behavior priorities
- `skills/career/promotion/impact-tracker.md` — Behavior demonstrations are logged as evidence entries
- `skills/career/promotion/executive-feedback.md` — Senior feedback calibrates behavior assessment
- `skills/career/promotion/career-roadmap.md` — Behavior development phases are part of the roadmap

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/career/promotion/promotion-readiness.md` | Readiness dimensions determine which behaviors to develop |
| `skills/career/promotion/impact-tracker.md` | Behavior demonstrations generate evidence entries |
| `skills/career/promotion/executive-feedback.md` | Senior feedback validates behavior assessment |
| `skills/career/promotion/visibility-score.md` | Demonstrated behaviors must be visible to decision-makers |
