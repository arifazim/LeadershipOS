# Skill: Burnout

**Domain**: People Leadership Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (burnout risk assessment) + Immediate (when burnout signals are detected in 1:1 or behavior)

---

## Purpose

Detect, prevent, and respond to burnout — distinguishing it from disengagement, personal stress, and natural fatigue — so that the intervention is matched to the actual condition. Burnout is a clinical-adjacent state with a distinct signature and distinct recovery requirements. Treating it as a motivation problem or a performance problem causes harm.

**What the EM does automatically**: On a monthly cadence, the EM:
1. Assesses each direct report against the three dimensions of burnout (exhaustion, cynicism, inefficacy)
2. Monitors workload patterns that predict burnout before it appears
3. Responds to detected burnout with recovery conditions — rest, reduced load, and human acknowledgment
4. Audits team-level workload structures that produce systemic burnout risk
5. Distinguishes the EM's own burnout risk as a separate assessment

**Ethical principle**: Burnout is not a character flaw, a motivation deficit, or a failure of resilience. It is a predictable consequence of sustained overload without recovery. The EM who treats burnout as a performance issue and increases pressure in response will produce a medical or attrition crisis. The first obligation is human: acknowledge the person's experience honestly. The second obligation is structural: remove or reduce the load. The third is supportive: create the conditions for recovery without judgment.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Workload history** | Hours, sprint load, on-call frequency, and sustained high demand over the prior 3–6 months |
| **Behavioral signals** | Observed changes in energy, quality, cynicism, or withdrawal |
| **The person's self-report** | What they say about how they're feeling — especially when energy language changes |

### Optional
| Input | Description |
|---|---|
| **Organizational stress context** | Major incidents, reorgs, product crises, or team attrition that added load |
| **Personal context** | Life events or health circumstances affecting capacity (shared voluntarily) |
| **Prior burnout history** | Whether this person has experienced burnout before — they will likely recognize the pattern |

---

## Analysis

### Step 1 — Diagnose Against the Three-Dimension Burnout Model

```
Burnout is defined by three co-occurring dimensions (Maslach Burnout Inventory):

Dimension 1: Exhaustion (the depletion dimension)
  Definition: Feeling emotionally, physically, and cognitively depleted — unable to recover from work demands
  Not the same as: Being tired after a hard week (that recovers with rest)
  Signal of burnout exhaustion: Fatigue that doesn't improve over weekends; feeling behind before the day starts;
                                 described as "running on empty" or "nothing left"
  Engineering-specific signals:
    — Takes significantly longer to complete familiar tasks
    — Makes uncharacteristic errors; quality drops in ways that surprise them too
    — Stops attending optional meetings, then required ones
    — Sick days increasing; late starts; early disconnections
  
  Severity scoring:
    0: No exhaustion; normal fatigue within bounds
    1: Occasionally tired; recovering adequately
    2: Consistently tired; weekends not restoring; starting to notice the pattern
    3: Chronically depleted; no recovery; physical symptoms starting (headaches, sleep disruption)

Dimension 2: Cynicism (the detachment dimension)
  Definition: Emotional distance and negativity about the work, the team, or the organization —
              as a psychological protection against the pain of overinvestment
  Not the same as: Constructive skepticism or healthy critique
  Signal of burnout cynicism: Sarcasm has replaced their prior investment; "nothing matters anyway" framing;
                               pulling away from the work they used to care about deeply
  Engineering-specific signals:
    — "What's the point?" responses to planning or roadmap discussions
    — Previous enthusiasm about their domain replaced by flatness or dismissal
    — Talking about the work as if it belongs to someone else; low ownership language
    — Increasingly negative about leadership, product, or the company in ways that feel disproportionate
  
  Severity scoring (same 0–3 scale)

Dimension 3: Inefficacy (the capability dimension)
  Definition: Feeling unable to accomplish anything meaningful; competence and confidence eroding
  Not the same as: Impostor syndrome or temporary confidence dip
  Signal of burnout inefficacy: "I used to be good at this" language; giving up on tasks they would previously solve;
                                  not raising blockers because they assume they can't be helped
  Engineering-specific signals:
    — Long delays before asking for help; working alone on problems that stall them
    — Not completing tasks they've completed many times before
    — Dismissing their own ideas before sharing them
    — "I just can't seem to get anything done" becoming the consistent frame
  
  Severity scoring (same 0–3 scale)

Burnout diagnosis:
  Sum of three dimensions (0–9):
    0–2: Not burnout — may be fatigue or a hard week; normal check-in appropriate
    3–4: Burnout risk — one or two dimensions elevated; investigate and intervene to prevent escalation
    5–6: Burnout developing — all three dimensions present; act now
    7–9: Full burnout — clinical range; human acknowledgment first; reduce load immediately;
         consider suggesting professional support (EAP, therapy)
```

### Step 2 — Assess the Structural Causes

```
Burnout is never purely individual — it is produced by structural conditions.

Burnout structural predictors:

Workload overload:
  Sustained >110% of normal capacity for 6+ weeks
  On-call frequency without adequate recovery periods
  Multiple parallel high-urgency work streams
  Expectation of availability outside work hours sustained for months

Lack of control:
  Low autonomy over work content, priority, or timeline
  Repeated scope changes without engineer input
  No ability to push back on incoming requests
  "Just ship it" culture that prevents quality investment

Insufficient recognition:
  Work done; no acknowledgment
  Credit attributed to others; their contribution invisible
  No feedback — not just absence of positive; absence of any signal that the work matters

Poor relationships:
  Interpersonal conflict that isn't being addressed
  Team fragmentation — no one to rely on; working alone under pressure
  Feeling unsupported or mistrusted by the manager

Fairness violations:
  Workload distributed unequally; reliable engineers absorb more
  Comparable peers perceived as receiving better treatment (pay, flexibility, opportunity)
  Rules applied inconsistently

Values mismatch:
  Asked to build things they believe are harmful, unethical, or meaningless
  Company direction conflicts with personal values they've held silently

Recovery from burnout requires addressing the structural cause — not just the person's response to it.
Telling someone who is burned out to "practice self-care" while the structure remains unchanged is not help.
```

### Step 3 — Stage the Burnout Response

```
Response by severity:

Stage 1 — Risk (score 3–4):
  Do: Acknowledge the load. Ask directly. Reduce the lowest-value work from their plate.
  Frame: "I've noticed you seem stretched. I want to make sure we're not over-loading you.
         What's the heaviest part right now?"
  Action: Remove one thing from their plate this sprint; protect their head-down time
  Check-in: 2 weeks

Stage 2 — Developing (score 5–6):
  Do: Name what you're observing — specifically. Reduce load materially.
  Frame: "I want to check in on how you're doing — not the project, you.
         I've noticed {{specific observation}}. Can you tell me how you're actually feeling?"
  Actions:
    — Remove 25–30% of current sprint commitments immediately
    — Move any non-critical on-call coverage to others for 2–4 weeks
    — Cancel optional meetings (which become mandatory for burned-out engineers)
    — Create protected focus time blocks; block against interruptions
    — Check in weekly until improving
  Timeline: 4–6 week active recovery period

Stage 3 — Full burnout (score 7–9):
  Do: Human acknowledgment first; structural change second; professional support third
  Frame: "Before anything else — I want to make sure you know that what you're experiencing
         is real and it matters. You're not failing. You've been carrying too much for too long
         and the system has to change, not you."
  Actions:
    — Remove all non-essential work; assign minimum viable ownership only
    — Actively discuss reduced hours, temporary leave, or modified role if needed
    — Connect to EAP or suggest professional support explicitly
    — Structural fix: the conditions that produced this cannot repeat
    — Notify HR if the situation warrants leave or accommodation
  Timeline: 6–12 week recovery; reassess scope gradually; do not rush return to full load
  
  Critical: Do not performance-manage someone through burnout.
  The clinical-range burnout state is not a performance failure.
  It is an occupational health condition.
```

### Step 4 — Prevention Systems

```
The most effective burnout intervention is the one that happens 8 weeks earlier.

Monthly workload audit per person:
  Sustained load:       N sprints at >100% capacity in the last 12 weeks
  On-call frequency:    On-call for more than 1 week in every 3 = elevated risk
  Parallel pressure:    More than 2 high-urgency streams simultaneously = high risk
  Recovery windows:     Has the person had a sprint below 80% capacity in the last 6 weeks?
  
  If any single indicator is elevated: Investigate before symptoms appear

Team-level burnout prevention:
  Capacity planning: Never plan to 100% consistently; 80–85% planned; 15–20% buffer
  → Invoke: skills/strategy/capacity-planning.md
  On-call rotation: Sufficient rotation depth to ensure no one is on-call more than 1 in 4 weeks
  Incident recovery: After every major incident: explicit "no sprint changes, reduce scope"
  Recognition: After sustained high-load periods: explicit acknowledgment before the next push

EM self-assessment:
  The EM is not immune to burnout — and a burned-out EM cannot support burned-out engineers
  Monthly self-check: Exhaustion, Cynicism, Inefficacy — against the same 0–3 scale
  If EM score is 5+: Escalate to EM's manager; do not manage alone
  The EM who burns out silently will harm their team before it becomes visible
```

### Step 5 — Recovery and Return to Full Capacity

```
Recovery is a process, not an event. The person who says "I'm fine now" after one low-load sprint is not recovered.

Recovery phases:

Phase 1 — Acute rest (2–4 weeks):
  Minimum viable ownership
  No new responsibilities
  On-call coverage moved elsewhere
  Check-in focused on how they feel, not what they're delivering

Phase 2 — Gradual reengagement (4–8 weeks):
  Slowly restore ownership — one piece at a time
  Ask permission before adding: "Would you be ready to take back {{X}} this sprint?"
  Watch for the exhaustion dimension — it recovers last; cynicism and inefficacy improve faster
  
Phase 3 — Structural change review (before returning to full load):
  "Before we go back to full capacity, I want to make sure we've fixed what caused this."
  Identify the structural predictor(s) and address them
  If the structure doesn't change: burnout will recur within 6–12 months

Recovery failure signals:
  Person says they're fine; their behavior still shows exhaustion and inefficacy
  They return to full load in week 2; symptoms return in week 4
  They "recover" but cynicism remains elevated — they've detached to protect themselves
  → Do not declare recovery without observing behavioral indicators across all three dimensions
```

---

## Decision Tree

```
What does the burnout assessment reveal?

├── SCORE 0–2 — NO BURNOUT SIGNAL
│   └── Monthly check-in maintained
│       Workload audit: "Is this person accumulating structural risk?"
│       If load has been high for 6+ consecutive weeks: proactive intervention before symptoms

├── SCORE 3–4 — BURNOUT RISK
│   └── Act before it becomes Stage 2
│       Ask directly; acknowledge the load; remove one item this sprint
│       "What's the thing I can take off your plate right now?"
│       Check workload audit: what structural condition is generating this?
│       Check-in in 2 weeks

├── SCORE 5–6 — BURNOUT DEVELOPING
│   └── 25–30% load reduction this sprint; no optional meetings; on-call coverage moved
│       Name what you're observing: "I'm concerned about how you're doing."
│       Weekly check-in for the next 4 weeks
│       Structural fix identified and planned before returning to full load

├── SCORE 7–9 — FULL BURNOUT
│   └── Human acknowledgment first: "You've been carrying too much. That's on the system."
│       Load reduction to minimum viable
│       Discuss leave, EAP, or accommodation if warranted
│       HR notification if relevant
│       Structural fix is mandatory before return to full capacity
│       Do NOT performance manage; do NOT increase pressure

├── EM SELF-SCORE 5+
│   └── Escalate to EM's manager today
│       You cannot give what you don't have
│       A burned-out EM cannot protect their team from burnout
│       Request coverage; reduce meetings; take the leave

└── TEAM-LEVEL BURNOUT (25%+ AT SCORE 5+)
    └── Individual interventions are insufficient
        Systemic cause must be addressed: capacity model, on-call structure, incident frequency
        → Invoke: skills/strategy/capacity-planning.md
        → Escalate to leadership: "The team is burning out. Here's why. Here's what we need to change."
```

---

## Output

### Burnout Assessment and Recovery Plan

```
BURNOUT ASSESSMENT — {{Person}} — {{date}}

DIMENSION SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Exhaustion:  {{0–3}} | Evidence: {{Observable signal}}
Cynicism:    {{0–3}} | Evidence: {{Observable signal}}
Inefficacy:  {{0–3}} | Evidence: {{Observable signal}}
Total:       {{0–9}} | Stage: {{Risk | Developing | Full burnout | None}}

STRUCTURAL CAUSES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Sustained overload: {{N}} sprints at >100% | On-call frequency: {{N in last 12 weeks}}
Structural predictor: {{Workload | Control | Recognition | Relationship | Fairness | Values}}
Fix required: {{Specific structural change}} by {{date}}

RECOVERY PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Immediate: {{Load removed — specific}} | On-call coverage moved: {{Y/N}}
Phase 1 (weeks 1–{{N}}): {{Minimum viable ownership details}}
Phase 2 (weeks {{N}}–{{N}}): {{Gradual reengagement checkpoints}}
Phase 3 (before full return): {{Structural change confirmed — what, by when}}
EAP/professional support offered: {{Y/N}} | HR notified: {{Y/N}}

EM SELF-ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EM total score: {{0–9}} | Status: {{OK | At risk — monitoring | Escalated to manager}}

TEAM WORKLOAD AUDIT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Team members at Stage 2+: {{N}} ({{%}} of team)
Systemic burnout risk: {{None | Elevated | Critical}} | Action: {{Individual | Team-level}}
Capacity model fix needed: {{Y/N → skills/strategy/capacity-planning.md}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All three burnout dimensions scored | Base: 65% |
| Structural cause identified | +15% |
| Recovery plan includes structural fix | +10% |
| EM self-assessment included | +10% |
| EAP or professional support offered when score ≥7 | +5% |
| Burnout treated as performance issue | −50% (disqualifying) |
| Load reduced without structural fix | −20% |
| Stage 3 managed without HR awareness | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Performance-managing burnout** | Person burned out; EM increases accountability and check-in frequency | Burnout requires recovery, not pressure. Increased management at this stage causes attrition or medical crisis. |
| **Self-care redirect** | "Have you tried mindfulness?" offered without removing any load | Structural change is required. Self-care without structural change is blame with a wellness coating. |
| **Recovery declared prematurely** | Person says "I'm fine"; EM returns them to full load in sprint 2; symptoms return in sprint 4 | Recovery takes 6–12 weeks. Assess all three dimensions before returning to full load. |
| **EM burnout unaddressed** | EM identifies team member burnout; their own score is 7; says nothing | A burned-out EM cannot protect their team. Escalate. |
| **Structural root cause unaddressed** | Person recovers; conditions unchanged; burnout recurs 3 months later | Before returning to full load: what structural condition produced this and how is it being changed? |

---

## References

- `skills/people/engagement.md` — Burnout mimics disengagement; score the burnout dimensions to distinguish
- `skills/people/one-on-one.md` — Burnout most often first signals in 1:1 energy and tone changes
- `skills/people/motivation.md` — Motivation collapse is a burnout symptom, not a motivation issue; this skill diagnoses it
- `skills/strategy/capacity-planning.md` — Sustained overload is the primary structural burnout predictor; fix the model

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/engagement.md` | Burnout produces disengagement symptoms; requires distinct intervention |
| `skills/strategy/capacity-planning.md` | Workload model must change; burnout without capacity change recurs |
| `skills/organizational/alignment-health.md` | Team burnout degrades all five alignment dimensions; particularly Execution |
