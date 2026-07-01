# Skill: Growth Plans

**Domain**: People Leadership Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Created after performance review or at onboarding — updated quarterly — reviewed monthly in 1:1s

---

## Purpose

Build individual development plans (IDPs) that close the gap between where a person is and where they want to go — using the 70-20-10 model to distribute learning across experience, exposure, and education, with measurable milestones and honest accountability for both the EM and the engineer.

**What the EM does automatically**: For each direct report, the EM:
1. Identifies the specific gaps between current capability and target level
2. Designs learning opportunities weighted toward on-the-job experience (not courses)
3. Tracks progress at monthly 1:1s and adjusts when life or the org disrupts the plan
4. Distinguishes growth plateaus (person is stuck) from context failures (system didn't create opportunity)
5. Holds themselves accountable for creating the conditions for growth — not just assigning it

**Ethical principle**: A growth plan is a commitment, not a form. The EM who creates a growth plan and then never opens it again has made a false promise. Growth plans require EM investment: finding opportunities, opening doors, giving feedback on attempts, and adjusting the plan when the first approach doesn't work. If the EM doesn't have time to actively support the growth plan, they should not create one — they should be honest about that capacity constraint first.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current capability assessment** | Where the person is today across the five performance dimensions |
| **Target level or aspiration** | Where the person wants to go (current role, next level, or different track) |
| **Gap identification** | Specific dimensions where current state ≠ target state |

### Optional
| Input | Description |
|---|---|
| **Person's learning style** | How they learn best — reading, doing, observing, teaching |
| **Available opportunities** | Projects, mentors, or committees available in the coming quarter |
| **Timeline** | Whether there is a promotion target date or a natural checkpoint to plan toward |

---

## Analysis

### Step 1 — Identify the Specific Gaps

```
Gap categories (mapped to performance dimensions):

Technical gap:
  "Can implement but not design" → needs architecture exposure
  "Strong individual contributor; struggles with cross-team technical decisions" → needs platform-level scope
  "Code quality strong; system design untested at scale" → needs a large-scale initiative

Scope gap:
  "Takes assigned work; doesn't proactively identify what should be done" → needs ownership stretch
  "Owns features; hasn't owned a project with cross-team dependencies" → needs cross-functional project
  "Owns within team; hasn't operated at organizational scope" → needs initiative above team level

Communication gap:
  "Clear in writing; struggles to simplify for non-technical audience" → needs stakeholder presentation
  "Good in 1:1s; quiet in group settings" → needs facilitation experience or structured presentation
  "Excellent communicator; not yet visible above team level" → needs executive-facing opportunity

Leadership gap:
  "Doesn't mentor yet; only does their own work" → needs a mentee
  "Mentors but doesn't influence team practices" → needs to lead a team-wide technical initiative
  "Influences the team; doesn't operate cross-team" → needs cross-functional leadership opportunity

Impact gap:
  "Ships work; doesn't connect it to outcomes" → needs to own a metric or outcome end-to-end
  "Contributes to impact; can't articulate their specific contribution" → needs evidence coaching

Gap sizing:
  Large gap: Operating more than half a level below target — needs 6–9 months of focused development
  Medium gap: Partially meeting target level — needs 3–6 months of targeted experience
  Small gap: Close to meeting target level — needs 6–12 weeks of specific opportunity
```

### Step 2 — Apply the 70-20-10 Model

```
70% — On-the-job experience (doing)
  The most powerful and most underused development mechanism
  Types of experience-based development:
    — Stretch assignments: work just above current capability
    — Ownership transfers: giving them ownership of something they've only supported before
    — Increased scope: adding accountability for a broader outcome
    — Technical leadership: leading a project rather than contributing to it
    — Cross-functional exposure: working directly with Product, Design, or Customers
  
  EM's role: Create or find the opportunity; then step back enough for them to own it;
  stay close enough to catch them before they fail
  
  Warning: Experience must be at the right level of stretch
    Too easy → no growth; the person coasts
    Too hard → failure that damages confidence; not productive challenge

20% — Learning from others (observing and connecting)
  Types of relationship-based development:
    — Coaching from the EM (→ skills/people/coaching.md)
    — Mentorship from a senior IC or leader outside the EM's direct authority
    — Peer learning: deliberate pairing with someone strong in the gap dimension
    — Shadowing: observing the EM or a senior leader in high-stakes situations
    — Feedback loops: structured feedback after every stretch opportunity
    — Skip-level conversations: exposure to how decisions are made at the next level
  
  EM's role: Make the introductions; create the conditions for the relationship

10% — Education and training (formal learning)
  Types of formal learning:
    — Courses, certifications, conferences
    — Books and structured reading
    — Internal training programs
    — Writing (documentation, blog posts, technical talks)
  
  Note: 10% is the design weight — not the execution default
  Most growth plans over-index on this because it is the easiest to schedule and prove
  A growth plan that is 80% courses is a professional development budget expenditure,
  not a development plan
```

### Step 3 — Design Milestones

```
Growth plan milestone format:
  Gap addressed: {{Which dimension}}
  Opportunity: {{What they will do}}
  Type: {{70% / 20% / 10%}}
  Timeline: {{Specific date range or quarter}}
  Success signal: {{What observable evidence shows the gap has closed}}
  EM action required: {{What the EM must do to create or support this opportunity}}

Example milestones:

Technical gap — "Can implement but not design at system scale"
  Opportunity: Lead the architecture for the new notification service (70%)
  Timeline: Q2 (April–June)
  Success signal: Design document reviewed and approved without major revisions by senior IC;
                  implementation team follows the design without needing architecture decisions re-opened
  EM action required: Assign the initiative; introduce them to the senior ICs who will review;
                      hold weekly architecture check-in for the first month

Communication gap — "Strong writer; not yet effective with executive audience"
  Opportunity: Present the platform reliability roadmap to the VP of Engineering (20%)
  Timeline: Week 6 — preparation in weeks 4–5
  Success signal: VP leaves the conversation with confidence in the roadmap;
                  no significant clarifying questions required during the presentation
  EM action required: Set up the presentation; attend and debrief; give specific SBI feedback within 24 hours

Leadership gap — "No mentorship experience; works solo"
  Opportunity: Pair with new L3 hire for their onboarding project; responsible for their
               technical direction and first code review (70%)
  Timeline: First 60 days of new hire's tenure
  Success signal: L3 reports that they understood the codebase by end of month 1;
                  their first solo PR is accepted without structural revisions
  EM action required: Assign the pairing explicitly; check in with the L3 independently
```

### Step 4 — Hold Accountability on Both Sides

```
EM accountability in the growth plan:

The plan fails when the EM commits to "find opportunities" but doesn't follow through.
EM commitments must be specific:
  ✓ "I will introduce you to {{person}} by {{date}}"
  ✓ "I will create the conditions for you to lead {{initiative}} starting in {{month}}"
  ✓ "I will give you feedback after every senior leadership presentation you do"
  ✗ "I'll look for opportunities for you to present more"
  ✗ "Let's see what comes up"

Monthly IDP check-in (in 1:1):
  "Last month we said you would {{milestone}}. What happened?"
  If completed: "What did you learn? What's the next milestone?"
  If not completed: "What got in the way?" 
    — If EM's action was missing: name it and commit to a specific date
    — If person didn't create the opportunity: explore why without judgment
    — If circumstances changed: adapt the plan; don't abandon it

Engineer accountability:
  Growth plans are not done TO the person — they are done WITH them
  If the person isn't invested in the plan: the plan won't work
  Signal of disengagement from the growth plan: → Invoke skills/people/engagement.md

Growth plan stall indicators:
  — Same milestone has been in progress for 8+ weeks with no movement
  — Person never brings IDP topics to 1:1 unless the EM does
  — Milestones completed on paper but behavior hasn't changed
  — Plan was created; not referenced again for 3+ months
```

### Step 5 — Context Failure vs. Growth Plateau

```
Not all slow growth is the person's failure to develop.

Context failure (system didn't create opportunity):
  Signal: Person is motivated, doing the work, but the opportunity didn't arise
  Example: "We planned for them to lead a cross-team initiative in Q3, but the initiative
           was cancelled due to a product pivot"
  EM response: This is an organizational failure, not a development failure
  Fix: Acknowledge the context failure; find a substitute opportunity; adjust the timeline

Growth plateau (person is not developing despite opportunity):
  Signal: Opportunity was created and taken; behavior has not materially changed
  Example: "They led the architecture initiative but still defers all design decisions to seniors"
  EM response: Something in the approach isn't working
  Explore: Is the gap in capability, confidence, or motivation?
    Capability: They don't know how → coaching + more targeted instruction
    Confidence: They know but won't act → more structured support; smaller first steps
    Motivation: They don't care → → Invoke: skills/people/motivation.md; reassess the goal

Wrong goal identified:
  Sometimes the growth plan was built toward a goal the person doesn't actually want
  Signal: Low energy about milestones; asks "why does this matter?" about growth activities
  Response: Return to the career development conversation
  "Let me ask again — is this the direction you actually want to grow? Or has that changed?"
  → Invoke: skills/people/career-development.md
```

---

## Decision Tree

```
What does the growth plan status reveal?

├── PLAN IS WORKING — MILESTONES COMPLETING, BEHAVIOR CHANGING
│   └── Increase the stretch; add the next level's milestones
│       "You've grown into {{dimension}}. Let's add the next challenge."
│       Review for promotion readiness quarterly
│       → Invoke: skills/career/promotion/promotion-readiness.md

├── MILESTONE NOT COMPLETED — EM ACTION MISSING
│   └── This is the EM's failure; name it directly
│       "I said I would {{action}} and I didn't. Here's when I'll do it by."
│       Never let the person's growth suffer because the EM didn't create the opportunity

├── MILESTONE NOT COMPLETED — PERSON DIDN'T ACT
│   └── Explore without judgment: "What got in the way?"
│       If workload: assess whether growth time is being protected in the sprint
│       If motivation: → Invoke: skills/people/motivation.md
│       If fear or confidence: reduce the size of the first step; increase support

├── GROWTH PLAN STALLED (SAME MILESTONE, 8+ WEEKS)
│   └── Name it directly: "This milestone has been open for two months.
│       I don't want to keep carrying it without addressing what's in the way."
│       Investigate: capability, confidence, or motivation barrier
│       If wrong goal: → Invoke: skills/people/career-development.md to reset

├── CONTEXT FAILURE (OPPORTUNITY CANCELLED OR RESTRUCTURED)
│   └── Acknowledge the organizational failure; don't attribute it to the person
│       Find a substitute: "The initiative was cancelled. Let's find the equivalent opportunity."
│       Adjust the timeline; don't abandon the plan

└── PLAN IGNORED (CREATED BUT NEVER REFERENCED)
    └── This is a failure of EM follow-through
        Reopen in next 1:1: "I want to pick up the IDP we created. What happened to it?"
        Recommit to monthly reviews; put it on the 1:1 agenda explicitly
        If person is disengaged: → Invoke: skills/people/engagement.md
```

---

## Output

### Individual Development Plan (IDP)

```
INDIVIDUAL DEVELOPMENT PLAN — {{Person}} — {{Level}} — Created: {{date}}

DEVELOPMENT DIRECTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Current level: {{L3/L4/L5/L6/M1/M2}} | Target: {{level or aspiration}}
Primary gap dimension: {{Dimension}} | Secondary gap: {{Dimension or N/A}}
Timeline to target: {{3 months | 6 months | 9–12 months}} | Reason: {{Gap size}}
Career direction: {{IC track | Management track | Specialist track}}

MILESTONES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Quarter | Gap addressed | Opportunity | Type    | Success signal         | EM action required
Q{{N}}  | {{dimension}} | {{what}}    | 70/20/10| {{observable outcome}} | {{specific EM commitment}}
Q{{N}}  | {{dimension}} | {{what}}    | 70/20/10| {{observable outcome}} | {{specific EM commitment}}
Q{{N}}  | {{dimension}} | {{what}}    | 70/20/10| {{observable outcome}} | {{specific EM commitment}}

70/20/10 BALANCE CHECK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Experience (70%): {{N}}% of milestones | Target: 60–75%
Relationship (20%): {{N}}% of milestones | Target: 15–25%
Education (10%): {{N}}% of milestones | Target: 5–15%
Balance: {{Healthy | Too education-heavy (add experience milestones)}}

MONTHLY CHECK-IN RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Month}}: Milestone status: {{On track | Behind — reason}} | EM commitment fulfilled: {{Y/N}}
Progress signal: {{Capability changing | Stable | Stalled}}
Plan adjustment: {{None | Updated — what changed}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Specific gaps identified by dimension | Base: 65% |
| 70-20-10 balance designed | +15% |
| EM commitments named specifically (not "I'll find opportunities") | +10% |
| Monthly check-in cadence established | +10% |
| Milestones have observable success signals | +5% |
| Plan is course-heavy (>40% education) | −20% |
| EM commitments are vague | −15% |
| Plan created but never reviewed after creation | −30% (disqualifying) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Course-heavy plan** | IDP is a list of Udemy courses and conference attendance | 70% of development comes from doing real work. Add stretch assignments and ownership transfers. |
| **Vague EM commitments** | "I'll look for opportunities" appears multiple times | Name the specific opportunity, the specific date, and the specific person the EM will introduce. |
| **Plan abandoned after creation** | IDP file exists; never opened; person can't recall what's in it | Put one IDP milestone on every 1:1 agenda. A plan not referenced is not a plan. |
| **Wrong goal** | Plan designed toward a goal the person doesn't actually want | Ask: "Is this still the right direction for you?" at every quarterly check-in. |
| **Context failure misattributed** | Opportunity cancelled; person rated as not growing | Acknowledge when the org failed to create the opportunity. Adjust; don't blame. |

---

## References

- `skills/people/performance-review.md` — Growth plan created at end of every review cycle
- `skills/people/career-development.md` — Long-term career direction informs growth plan goal-setting
- `skills/people/coaching.md` — Monthly IDP reviews are coaching conversations
- `skills/career/promotion/promotion-readiness.md` — Growth plan milestones should close identified promotion gaps

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/performance-review.md` | Every review should produce or update an IDP |
| `skills/people/career-development.md` | Career direction provides the "north star" for the growth plan |
| `skills/people/coaching.md` | IDP progress tracked through coaching sessions |
| `skills/career/promotion/career-roadmap.md` | Project scoring matrix used to select the right stretch assignments |
