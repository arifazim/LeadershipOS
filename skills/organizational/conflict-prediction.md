# Skill: Conflict Prediction

**Domain**: Organizational
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (signal scan) + On-demand (new initiative, team change, decision stall)

---

## Purpose

Detect structural conditions that predict organizational conflict before it erupts — giving the EM time to address root causes transparently rather than managing conflict after it has damaged relationships, delivery, and trust.

**What the EM does automatically**: When scanning for conflict risk, the EM:
1. Identifies the five structural conditions most predictive of organizational conflict
2. Scores conflict probability per situation (not per person)
3. Names the specific condition generating the risk
4. Recommends proactive, transparent interventions that address the structural issue
5. Distinguishes productive tension (healthy, useful disagreement) from destructive conflict (damaging to relationships and delivery)

**Ethical principle**: Conflict prediction is used to surface structural problems for transparent resolution — not to gain advantage by anticipating others' objections. The response to a predicted conflict is always direct engagement with the people and conditions involved, never preemptive positioning to win the conflict. Most organizational conflict is structural: it happens to people, not because of them.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current initiative or change** | What is happening that could generate conflict |
| **Stakeholder map** | Who is involved and what they need (from stakeholder-analysis.md) |
| **Organizational context** | Team structure, reporting lines, recent changes |

### Optional
| Input | Description |
|---|---|
| **Recent decision history** | Reversals, stalls, or disputes from the last 90 days |
| **Escalation log** | Patterns of escalation that indicate unresolved tensions |
| **Incentive structures** | Performance metrics for the teams involved |

---

## Analysis

### Step 1 — Scan the Five Conflict Predictors

Run all five. Conflict rarely comes from one source; it usually reflects multiple conditions compounding:

```
Predictor 1 — Frequent decision reversals
  Conflict signal: A decision was made, reversed, remade. Multiple parties feel unheard.
  Structural cause: Process excluded a key voice; authority boundaries not respected
  Conflict type this generates: Authority conflict (who really gets to decide?)
  Early intervention: Clarify DACI; include the voice that was missing
  Pre-conflict window: 2–4 weeks before an unresolved reversal escalates

Predictor 2 — Exclusion from key meetings
  Conflict signal: A stakeholder or team learns of decisions through the grapevine
  Structural cause: Meeting design doesn't match decision impact
  Conflict type: Respect and inclusion conflict; perceived disregard
  Early intervention: Expand meeting inclusion; create explicit communication protocol
  Pre-conflict window: 1–3 weeks — exclusion resentment compounds quickly

Predictor 3 — Ownership ambiguity
  Conflict signal: Two teams or individuals each believe they own the same outcome
  Structural cause: Organizational design left a seam; responsibilities unclear at the boundary
  Conflict type: Territorial conflict (jurisdiction, credit, control)
  Early intervention: Convene both parties; map the seam; assign ownership explicitly
  Pre-conflict window: At first sign of double-coverage or contradictory direction

Predictor 4 — Escalation patterns
  Conflict signal: The same issue has been escalated 2+ times without structural resolution
  Structural cause: Lower-level process can't resolve the issue; it reappears at higher levels
  Conflict type: Chronic tension (structural, not interpersonal)
  Early intervention: Identify why the lower-level process keeps failing; fix the structure
  Pre-conflict window: After the second escalation — before it becomes the third

Predictor 5 — Misaligned incentives
  Conflict signal: Two teams are consistently at odds on the same class of decisions
  Structural cause: Their performance metrics reward different or contradictory outcomes
  Conflict type: Systemic conflict (will recur regardless of who the people are)
  Early intervention: Name the incentive tension to shared leadership; seek structural realignment
  Pre-conflict window: When the same category of disagreement recurs for the third time
```

### Step 2 — Score Conflict Probability

```
For each identified predictor, score:
  Probability: 0.1 | 0.3 | 0.5 | 0.7 | 0.9
  Severity if conflict materializes:
    1 = Uncomfortable but manageable; resolved at team level
    2 = Delivery impact; requires EM intervention
    3 = Relationship damage; requires manager above EM
    4 = Organizational damage; requires VP+ resolution
    5 = Escalates to leadership or HR; structural damage

Expected conflict impact = Probability × Severity

  0.1–0.9:  Low — monitor
  1.0–2.0:  Medium — proactive engagement recommended
  2.1–3.5:  High — intervention required this week
  3.6–5.0:  Critical — intervene before the next interaction between the parties

Compounding rule:
  If 2+ predictors are present simultaneously, multiply expected impact by 1.5
  (Structural conflicts that share multiple causes escalate faster)
```

### Step 3 — Distinguish Productive Tension from Destructive Conflict

Not all disagreement is conflict to prevent. Productive tension is necessary:

```
Productive tension (preserve):
  - Disagreement about the right technical approach
  - Debate about product priorities with both sides presenting evidence
  - Candid feedback that challenges an assumption
  - "We disagree on X — let's surface this and decide together"

Destructive conflict (prevent):
  - Decisions being relitigated after agreed
  - Teams working around each other rather than with each other
  - Issues surfacing in performance reviews rather than conversations
  - Parties attributing bad intent rather than different perspectives
  - Communication stopping — silence is often worse than argument

EM intervention threshold:
  Productive tension: Do not intervene to suppress; let the argument run; facilitate resolution
  Destructive conflict: Intervene before it damages the relationship or delivery
```

### Step 4 — Intervention Design

For each predicted or emerging conflict, design a transparent intervention:

```
Intervention options (in order of preference):

1. Direct facilitation: Bring the parties together; create the conversation that hasn't happened
   Use when: Parties haven't directly addressed the tension
   Frame: "I've noticed a pattern I want to address openly. Can we talk about {{issue}}?"

2. Process clarification: Fix the structural condition generating the conflict
   Use when: Conflict is structural (ownership, incentive, process)
   Frame: "The conflict keeps recurring because of {{structural issue}}.
   Let's fix the process, not manage the individuals."

3. Escalation with framing: Surface to shared authority with the structural analysis
   Use when: The EM doesn't have authority to fix the structural cause
   Frame: "This is a structural issue between {{A}} and {{B}} about {{condition}}.
   I can't resolve it at my level. Here's the situation and what I recommend."

4. Accept and manage: Some conflicts cannot be fully resolved; manage their impact
   Use when: Incentive misalignment requires organizational change above the EM's level
   Frame: "Until this incentive structure is addressed, I'm managing the impact by {{action}}.
   I want leadership to know this is a risk."

Never: Position, manipulate, or manage perception to win a conflict before it starts
```

---

## Decision Tree

```
What does the conflict prediction scan reveal?

├── CRITICAL RISK (3.6–5.0) — INTERVENE IMMEDIATELY
│   └── Do not wait for the conflict to surface organically
│       Identify the parties and the structural condition
│       Schedule a direct conversation with both parties this week
│       Frame: "I want to address something before it becomes a problem."
│       If beyond your authority: escalate with the structural analysis
│       → Invoke: skills/organizational/political-risk.md if escalation involves senior leaders

├── HIGH RISK (2.1–3.5) — INTERVENTION REQUIRED THIS WEEK
│   └── Direct engagement before the next interaction between at-risk parties
│       Fix the process condition: DACI, meeting inclusion, ownership map
│       Document: Put the intervention and outcome in writing

├── OWNERSHIP AMBIGUITY AS PREDICTOR
│   └── This is both the most common and most fixable predictor
│       Convene: The parties in a structured conversation
│       Agenda: Map the seam explicitly; assign ownership; write it down
│       Do NOT: Hope the ambiguity resolves itself; it gets worse under pressure
│       → Invoke: skills/organizational/decision-network.md

├── MISALIGNED INCENTIVES (SYSTEMIC CONFLICT RISK)
│   └── Do NOT try to resolve this between the teams — it is above them
│       Document the pattern: Same category of conflict, recurring, structural
│       Surface to shared leadership: "This conflict will recur until the incentive
│       structure is addressed. Here are three examples. Here is what I recommend."
│       → Invoke: skills/organizational/political-risk.md

├── PRODUCTIVE TENSION MISIDENTIFIED AS CONFLICT
│   └── Check: Are the parties engaged or disengaged?
│       Engaged disagreement = productive tension = do not suppress
│       Support: Facilitate the conversation; ensure both sides are heard
│       Let the argument run; it will produce a better decision than consensus

└── LOW RISK / MONITOR
    └── Log the signal; check monthly
        If same signal appears in the next scan without change → escalate to Medium/High
```

---

## Output

### Conflict Prediction Report

```
CONFLICT PREDICTION SCAN — {{Context}} — {{date}}

OVERALL CONFLICT RISK: {{Critical | High | Medium | Low}}

PREDICTOR ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Predictor                  | Present? | Probability | Severity | Expected Impact | Compounding?
Decision reversals         | {{Y/N}}  | {{N}}       | {{N}}    | {{N}}           | {{Y/N}}
Exclusion from meetings    | {{Y/N}}  | {{N}}       | {{N}}    | {{N}}           | {{Y/N}}
Ownership ambiguity        | {{Y/N}}  | {{N}}       | {{N}}    | {{N}}           | {{Y/N}}
Escalation patterns        | {{Y/N}}  | {{N}}       | {{N}}    | {{N}}           | {{Y/N}}
Misaligned incentives      | {{Y/N}}  | {{N}}       | {{N}}    | {{N}}           | {{Y/N}}

Compound multiplier applied: {{Yes × 1.5 | No}} | Adjusted total: {{N}}

CONFLICT SITUATIONS IDENTIFIED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Situation: {{description}}
Parties: {{names / teams}}
Structural cause: {{predictor + root cause}}
Type: {{Authority | Territorial | Respect | Chronic | Systemic}}
Expected impact: {{N}} | Severity: {{Critical/High/Medium/Low}}
Intervention: {{specific, transparent action}}
Owner: {{EM | EM's manager | VP}}
Deadline: {{date}}

PRODUCTIVE TENSIONS (preserve, not suppress)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Description of healthy disagreement that should be facilitated, not resolved prematurely}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All five predictors assessed | Base: 65% |
| Expected impact calculated with probability × severity | +15% |
| Productive tension distinguished from destructive conflict | +10% |
| Transparent intervention designed (not positioning) | +10% |
| Structural cause identified per predictor | +5% |
| Interpersonal causes assumed over structural | −20% |
| Intervention is manipulative (not transparent) | −50% (disqualifying) |
| Only one predictor assessed | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Personalizing structural conflict** | "A and B don't get along" instead of "A and B have misaligned incentives" | Most organizational conflict is structural. Find the structure; don't manage the people. |
| **Suppressing productive tension** | Conflict aversion causes EM to smooth over legitimate disagreements | Productive disagreement produces better decisions. Facilitate, don't suppress. |
| **Late intervention** | EM waits until conflict is visible before addressing predictors | Predictors are detectable weeks before conflict erupts. Act on the signal, not the symptom. |
| **Preemptive positioning** | EM uses conflict prediction to get there first, win the argument | Prediction is for prevention, not advantage. Direct, transparent engagement is the only ethical response. |
| **Escalation without structural analysis** | Issues escalated repeatedly without fixing the underlying process | Escalation solves an instance. Process change prevents recurrence. Do both. |

---

## References

- `skills/organizational/stakeholder-analysis.md` — Stakeholder tensions feed conflict predictors
- `skills/organizational/decision-network.md` — Ownership ambiguity and reversal patterns detected here
- `skills/organizational/political-risk.md` — High-severity conflicts become political risks

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/organizational/stakeholder-analysis.md` | Stakeholder misalignment is a conflict predictor |
| `skills/organizational/decision-network.md` | Ownership ambiguity in decisions predicts territorial conflict |
| `skills/organizational/alignment-health.md` | Conflict score feeds alignment health assessment |
| `skills/organizational/political-risk.md` | Unresolved conflicts become political risks |
