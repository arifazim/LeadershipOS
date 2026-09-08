# Skill: EM Self-Coaching

**Domain**: Mentoring Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (feeds from `loops/em-growth-loop.md`) + on-demand after any significant decision or failure

---

## Purpose

Surface the patterns in the EM's own leadership — the recurring blind spots, the decisions that keep getting made the same way, the situations where the EM consistently over-indexes or under-reacts — so they can be named, examined, and changed.

Most coaching in this OS flows outward: the EM coaches their engineers. This skill inverts that. It uses the OS's accumulated context (decision memory, kaizen failures, 1:1 sentiment patterns, confidence engine outputs) to coach the EM.

**The core premise**: Leadership is a practice, not a trait. A manager who is not deliberately examining their own patterns is not improving — they are just repeating. The OS has been watching. This skill asks: what has it noticed?

**What the EM does automatically**: In self-coaching, the EM:
1. Reads their own failure log and decision history without defensiveness — looking for patterns, not verdicts
2. Names their dominant leadership default (the mode they over-use under pressure)
3. Identifies the one situation type where their judgment is consistently weakest
4. Sets one growth edge per month — not a goal, a practice
5. Closes the loop: at the end of each month, assesses whether the practice produced any observable change

**Ethical principle**: Self-coaching is only useful if it is honest. Entries that are diplomatically vague ("I could have communicated better") produce nothing. Entries that name the actual failure mechanism ("I withheld bad news for 10 days because I was trying to solve it before surfacing it — and the window closed") produce change. Calibrate to the level of honesty you would hold a direct report to.

---

## Inputs

### Required
| Input | Source |
|---|---|
| **Recent decision history** | `decision-memory/records/` — last 90 days; if no formal records, use a mental inventory of 3 significant decisions made in the period |
| **Kaizen failure log** | `kaizen/failures.md` — EM-owned or EM-relevant entries from the last quarter |
| **Kaizen weekly review outputs** | `kaizen/weekly-review.md` — last 4 weeks of Q9 / Q10 (what the EM would do differently; what pattern is repeating) |
| **Current leadership health signal** | `leadership-health/master-leadership-health.md` — most recent assessment across the 13 dimensions |

### Optional
| Input | Source |
|---|---|
| **360 feedback signals** | Any informal peer/direct/skip-level feedback received in the period |
| **Confidence engine output** | `confidence-engine/executive_confidence.md` — executive trust score; a persistently low score is an EM behavior signal, not just a team signal |
| **Political signals** | `political-signals/political-signals.md` — if political warning signals exist, ask whether EM behavior contributed |
| **Prior em-self-development memory** | `memory/em-self-development/` — prior growth edge entries, if populated |

---

## Analysis

### Step 1 — Read the Evidence Without Editing It

```
Before naming any pattern, read the raw inputs. Do not interpret yet. Just read.

From decision history:
  For each decision in the last 90 days, note:
  — Was this decision made earlier or later than it should have been?
  — Did the EM own the decision, or defer it when ownership was theirs?
  — Was the recommendation specific (a choice) or hedged (an option menu)?
  — Did the actual outcome match the expected outcome? If not, was the mismatch
    flagged before it materialized, or after?

From failure log:
  For each failure entry with EM relevance:
  — Was the OS fault or execution fault? If execution: was the EM's behavior
    the execution variable?
  — What pattern does the root cause category point to?
    (See kaizen/root-cause.md — if the same root cause appears 2+ times, that is a pattern)

From weekly kaizen Q9 ("what would I do differently"):
  Read across 4 weeks without collapsing the answers into a summary yet.
  Look for: does the same situation keep appearing? Does the same action keep
  being named as "what I'd do differently"?

From leadership health:
  Which of the 13 dimensions scored lowest? Is this dimension consistent with
  the pattern emerging from decision history and failure log?

Rule: Do not write any conclusions yet. Let the evidence sit for 10 minutes before Step 2.
```

### Step 2 — Name the Dominant Leadership Default

```
Every EM has a dominant default — the leadership behavior they reach for automatically,
especially under pressure. The default is not wrong by definition. It becomes wrong when
it is the only tool available.

The six most common EM leadership defaults and their pressure failure modes:

DEFAULT 1 — The Solver
  Description: Moves immediately to fixing problems. Defines "good manager" as someone
               who removes blockers and has answers.
  Strength: Effective in incidents, fast decisions, early team development
  Pressure failure mode: Disempowers the team. Engineers stop thinking independently
    because the EM always solves it. In high-ambiguity situations, the solver fills the
    space with energy but not clarity.
  Signal in data: Decision history shows EM making decisions engineers could have made.
    Kaizen Q9 frequently says "I should have let them figure it out."
  Growth edge: "For one situation per week, name the problem clearly and leave the room."

DEFAULT 2 — The Harmonizer
  Description: Prioritizes team cohesion and positive relationships. Avoids conflict.
               Protects psychological safety.
  Strength: Excellent at building trust, retaining talent, creating safe environments
  Pressure failure mode: Delays hard conversations. Tolerates underperformance because
    confronting it feels like a relationship risk. Executives read this as lack of
    accountability.
  Signal in data: Kaizen Q9 contains "I should have said that earlier." Failure log has
    entries about situations that were visible for weeks before being addressed.
    Leadership health coaching_score high; execution_clarity low.
  Growth edge: "Name one uncomfortable truth per week, to the right person, promptly."

DEFAULT 3 — The Analyst
  Description: Gathers more data before deciding. Builds comprehensive options tables.
               Values accuracy over speed.
  Strength: Produces high-quality decisions in stable, low-time-pressure situations
  Pressure failure mode: Analysis paralysis. Decisions that needed to be made with 70%
    information are delayed until 95% information is available — by which point the window
    has closed or the cost of deciding has compounded.
  Signal in data: Decision history shows decisions made later than optimal. Confidence
    engine shows low Prediction Confidence not from data absence but from
    data accumulation that never triggered a decision.
  Growth edge: "Set a decision deadline before gathering data. Stop gathering when the
    deadline arrives."

DEFAULT 4 — The Driver
  Description: Moves fast, pushes hard, optimizes for output and delivery.
               Defines "good manager" as someone whose team ships.
  Strength: Highly effective in crunch, recovery from missed commitments, driving
    accountability
  Pressure failure mode: Burns out the team. Creates a culture of output-over-wellbeing.
    In people crises (flight risk, burnout, team conflict), the driver speeds up
    exactly when the situation requires slowing down and listening.
  Signal in data: Leadership health team_autonomy and delegation_score low.
    Kaizen Q9 contains "I pushed too hard on [person/situation]."
    People skills confidence scores low.
  Growth edge: "Before any pushback conversation, name one thing you respect about
    the person's position."

DEFAULT 5 — The Strategist
  Description: Thinks in systems, focuses on the long game, prioritizes the org-level
               view. Comfortable with abstraction and ambiguity.
  Strength: Excellent at navigating complexity, building roadmaps, engaging executives
  Pressure failure mode: Loses the floor. Team feels direction without presence.
    Individual contributors don't see the EM engaging with their day-to-day reality.
    "They're always in meetings / always thinking about the big picture."
  Signal in data: Leadership health meeting_quality and coaching_score low.
    1:1 sentiment signals declining (if available). Kaizen Q9 contains "I wasn't
    in the room enough / I wasn't available enough."
  Growth edge: "One day per week with no external meetings — visible to the team."

DEFAULT 6 — The Diplomat
  Description: Manages upward and sideways expertly. Executive relationship is strong.
               Organizational navigation is a core skill.
  Strength: Highly effective at stakeholder management, securing resources, protecting
    the team from organizational noise
  Pressure failure mode: The team experiences the EM as absent — always in politics,
    never in the work. Engineers feel managed, not coached. The EM protects the team
    from the org but forgets to develop it.
  Signal in data: Leadership health coaching_score and delegation_score low.
    Confidence engine delivery_confidence diverges from team reality. Team feels
    the EM as a political operator, not a developer of people.
  Growth edge: "What would each member of my team say I care about? Is that what
    I want them to say?"

Self-assessment:
  "My dominant default is [Default name]."
  "The pressure failure mode I have exhibited in the last 90 days is [specific description]."
  "The kaizen Q9 entry that most directly names this pattern is: [quote]."
```

### Step 3 — Identify the Consistent Weakness Situation

```
Beyond the default, every EM has a situation type where their judgment is
consistently weaker than average. This is distinct from the default:
the default is about how you behave; the situation is about what triggers
lower-quality responses regardless of default.

The seven most common EM situation-type weaknesses:

SITUATION 1 — High-stakes conversations under time pressure
  "When I have a hard message to deliver and a short window to deliver it,
  I either compress it to the point of confusion or over-prepare until the
  moment has passed."
  Warning signals in data: Failure entries with "delayed too long"; decisions with
  closed windows in decision history.

SITUATION 2 — When the EM is the one being evaluated
  "When I am the subject of scrutiny — a skip-level, a performance review, an
  executive review of my team's delivery — my judgment degrades. I either
  over-defend or over-acknowledge."
  Warning signals in data: Confidence engine executive_trust_score low; memory/executive/
  entries with "defensive" or "over-corrected" patterns.

SITUATION 3 — When a high-performer is struggling
  "I tolerate performance decline in people I respect longer than I would in
  others. The relationship creates a judgment filter."
  Warning signals in data: Failure entries about delayed conversations; performance skill
  confidence scores for specific individuals lower than team average.

SITUATION 4 — When two teams conflict and the EM is the referee
  "Cross-team conflict activates a harmonizer response — I try to make both
  sides feel heard instead of driving resolution."
  Warning signals in data: skills/conflict entries where resolution took more than 3 cycles;
  political signals showing ownership ambiguity as recurring.

SITUATION 5 — When asked to commit to a date under executive pressure
  "Under direct executive pressure for a date, I anchor to a date that is
  more optimistic than my internal estimate. I know this but do it anyway."
  Warning signals in data: Decision history with missed commitments; confidence engine
  prediction_confidence consistently low; ROADMAP.md milestones with repeated slippage.

SITUATION 6 — When the org is politically unstable
  "During reorgs, leadership changes, or funding uncertainty, I hoard
  information 'until I know more' — which means my team hears news from
  others before they hear it from me."
  Warning signals in data: Memory/executive entries with "managed the narrative";
  team trust signals declining during org change periods.

SITUATION 7 — When I personally disagree with a decision I must execute
  "When I am asked to execute a decision I believe is wrong, I communicate
  it without conviction. The team reads my ambivalence and mirrors it."
  Warning signals in data: Political signals showing misalignment; team execution
  quality dropping after specific strategic pivots.

Self-assessment:
  "The situation type where my judgment is most consistently weaker is [Situation N]."
  "The most recent example of this was [specific instance, even if not formally recorded]."
  "The pattern I can see in retrospect: [what I do in that situation, and what a stronger
   response would have looked like]."
```

### Step 4 — Set the Monthly Growth Edge

```
A growth edge is not a goal. Goals are outcome-oriented. A growth edge is
practice-oriented: it names a specific behavior to do differently in a
specific type of situation, for the next 30 days.

Rules for a growth edge:
  — It must be executable on Tuesday, not someday
  — It must be specific enough to assess: "Did I do this or not?"
  — It must connect directly to the dominant default or situation weakness identified
    in Steps 2–3 — not a general self-improvement aspiration
  — One growth edge only. Two is a wish list.

Growth edge format:
  "When [specific trigger situation] occurs, I will [specific behavior change],
  instead of [current default behavior]."

Examples:
  "When an engineer asks me how to solve a problem, I will ask them one question
  before answering, instead of solving it immediately."

  "When asked for a delivery date under executive pressure, I will say 'my internal
  estimate is X; the date I can commit to with 80% confidence is X + 2 weeks,'
  instead of giving the number they want to hear."

  "When I need to deliver bad news and my instinct is to wait until I have a solution,
  I will surface the problem within 24 hours of knowing it, even without a solution."

Growth edge check:
  "Can I do this tomorrow? Y/N"
  "Will I know whether I did it? Y/N"
  "Does it directly address the default or situation weakness I identified? Y/N"
  If any answer is N: rewrite.
```

### Step 5 — Close the Prior Month's Loop

```
If a growth edge was set last month, it must be assessed before a new one is set.

Assessment format (3 questions):
  1. How many times did the trigger situation arise in the last 30 days?
  2. How many times did I apply the new behavior (not the default)?
  3. What was one specific instance where I either succeeded or failed at it?

Scoring:
  Applied in ≥ 75% of trigger situations: growth edge produced change — graduate it or raise the bar
  Applied in 40–74%: partial; continue for one more month before changing
  Applied in < 40%: growth edge was wrong (too broad, too vague, or wrong trigger) — rewrite

If the trigger situation arose zero times: that growth edge was hypothetical, not grounded.
Replace with a growth edge tied to a situation that actually happens in this EM's context.

The closed loop entry goes to memory/em-self-development/:
  "Growth edge [description] — Month [N]. Applied [N] of [total] trigger situations.
   Key instance: [specific]. Outcome: [graduated/continue/rewrite]. Confidence: [H/M/L]."
```

---

## Decision Tree

```
What does the self-coaching assessment reveal?

├── NO DECISION HISTORY OR FAILURE LOG EXISTS
│   └── Self-coaching cannot produce reliable patterns without data.
│       Minimum requirement: 3 recent significant decisions recalled from memory
│       and 2 recent situations recalled from kaizen Q9.
│       Proceed with lower confidence; prioritize building the record for next month.
│       Confidence modifier: −25%

├── SAME PATTERN ACROSS DECISION HISTORY + FAILURE LOG + KAIZEN Q9
│   └── High-confidence pattern identification.
│       Name it precisely (Step 2 defaults or Step 3 situations).
│       Set growth edge directly tied to this pattern.
│       Confidence modifier: +20%

├── PATTERN APPEARS IN ONLY ONE SOURCE
│   └── Medium confidence — observe one more month before treating as established pattern.
│       Set a lightweight growth edge and look for confirmation.
│       Confidence modifier: ±0

├── LEADERSHIP HEALTH SCORE BELOW 6/10 ON COACHING OR DELEGATION
│   └── Default signal regardless of other patterns: the EM is not developing their team.
│       Check: Is the solver or strategist default active?
│       Growth edge must address the people-development gap directly.
│       Do not set a growth edge in a different area until this is addressed.

├── CONFIDENCE ENGINE EXECUTIVE TRUST SCORE BELOW 60
│   └── Secondary check: Is low executive trust a delivery problem (team) or an
│       EM behavior problem (visibility, communication, commitment accuracy)?
│       If EM behavior: growth edge targets upward communication or commitment accuracy.
│       If team delivery: this is outside self-coaching scope — route to delivery skills.

├── PRIOR GROWTH EDGE NEVER APPLIED (< 40% trigger situations)
│   └── Do not set a new growth edge until diagnosing why the last one failed.
│       Options: Trigger situation was too rare / Growth edge was too broad /
│       EM did not believe the change was worth making / Environmental obstacle
│       Rewrite with more specific trigger and more concrete behavior.

└── GROWTH EDGE SET, LOOP CLOSED, PATTERN CHANGED
    └── Elevate the bar: same domain, harder practice.
        Or: identify the next-priority default/situation weakness.
        Log the growth — graduated patterns belong in memory/em-self-development/
        as a durable record that this EM consciously changed a leadership behavior.
```

---

## Output

### Monthly Self-Coaching Report

```
EM SELF-COACHING — {{EM Name}} — {{Month YYYY}}

DATA SOURCES READ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decisions reviewed: {{N}} — period: last 90 days
Failure entries reviewed: {{N}} — period: last quarter
Kaizen Q9 entries reviewed: {{N}} — period: last 4 weeks
Leadership health: latest score {{N}}/10 — date {{date}}
Prior growth edge: {{set / not set}} — outcome: {{assessed / not yet due}}

DOMINANT DEFAULT IDENTIFIED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Default: {{Solver / Harmonizer / Analyst / Driver / Strategist / Diplomat}}
Confidence: {{High (3+ data points) / Medium (2 data points) / Low (1 data point)}}
Evidence:
  Decision history: "{{specific pattern observed}}"
  Failure log: "{{root cause category that repeats}}"
  Kaizen Q9: "{{verbatim quote from Q9 entry}}"

Pressure failure mode exhibited in last 90 days:
  "{{Specific instance — what happened, what the default produced}}"

SITUATION WEAKNESS IDENTIFIED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Situation type: {{1–7 from analysis}}
Most recent example: {{specific instance}}
Pattern in retrospect: {{what I do / what a stronger response looks like}}

PRIOR GROWTH EDGE — LOOP CLOSE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Prior edge: {{description or "first month — no prior edge"}}
Trigger situations arose: {{N times}}
New behavior applied: {{N times}} ({{%}})
Key instance: {{specific}}
Assessment: {{Graduated / Continue one more month / Rewrite}}

THIS MONTH'S GROWTH EDGE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"When [{{trigger situation}}] occurs, I will [{{new behavior}}]
instead of [{{current default}}]."

Executable tomorrow? {{Y}}
Assessable? {{Y}}
Addresses identified pattern? {{Y}}

Review date: {{date + 30 days}} — log to memory/em-self-development/ at that point

CONFIDENCE: {{High / Medium / Low}} — {{reason}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Decision history or failure log reviewed (≥ 3 data points) | Base: 55% |
| Same pattern confirmed across 2+ independent sources | +20% |
| Leadership health score input included | +10% |
| Prior growth edge loop closed before new one set | +10% |
| Growth edge is specific, executable, and tied to identified pattern | +10% |
| No decision history or failure log available | −25% |
| Pattern identified from single source only | −10% |
| Growth edge is vague or general ("communicate better") | −20% |
| Prior growth edge not assessed before setting new one | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Diplomatic vagueness** | "I could have handled that better" instead of naming the actual mechanism | Require the failure entry format: what happened, what the default produced, what a stronger response looked like |
| **Pattern shopping** | Identifying a flattering pattern (Strategist) instead of the accurate one (Harmonizer who avoids conflict) | Cross-check against failure log root causes. The accurate pattern is usually uncomfortable. |
| **Growth edge inflation** | Setting 3 growth edges at once | One only. Two is a wish list. Three is a way of avoiding any of them. |
| **No loop close** | Setting a new growth edge without assessing the last one | The new edge cannot be set until the prior one is assessed. The loop close is mandatory. |
| **Self-coaching as documentation** | Running this skill produces a report no one reads, including the EM | The output must feed action: the growth edge must be referenced the following week in kaizen Q10. |

---

## References

- `kaizen/weekly-review.md` — Q9 ("what would I do differently this week?") and Q10 ("one thing to practice") feed directly into this skill
- `kaizen/failures.md` — EM-relevant failure entries are the highest-quality self-coaching inputs
- `decision-memory/` — decision outcomes are the evidence base for identifying judgment patterns
- `leadership-health/master-leadership-health.md` — 13-dimension assessment provides the quantitative signal
- `loops/em-growth-loop.md` — orchestrates this skill on the monthly cadence

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/mentoring/coaching-style.md` | EM's coaching default is a self-coaching target; this skill identifies it |
| `skills/mentoring/growth-tracking.md` | Growth tracking outward (for engineers); this skill applies the same rigor inward |
| `skills/executive/pressure-decision-framework.md` | Situation weakness in high-stakes decisions → pressure decision framework is the response |
| `skills/people/difficult-message-delivery.md` | Harmonizer default + hard conversations → this skill surfaces it; DMDI provides the fix |
| `loops/em-growth-loop.md` | This skill is the core analysis step in the monthly EM growth loop |
