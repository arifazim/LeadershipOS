# Skill: Motivation

**Domain**: People Leadership Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (motivation check-in in 1:1) + On-demand (when engagement signals shift or coaching stalls)

---

## Purpose

Understand what actually drives each person — their specific motivational profile — so that work, recognition, and development are tailored to what genuinely moves them, not to what the EM assumes motivates engineers in general. Motivation is individual, not demographic.

**What the EM does automatically**: When assessing motivation, the EM:
1. Distinguishes intrinsic motivation (the work itself) from extrinsic motivation (recognition, compensation, advancement)
2. Maps each person against three primary motivators — Autonomy, Mastery, and Purpose — with individual variation
3. Detects when a person's motivators are being met and when they aren't
4. Notices when motivation shifts and investigates before disengagement compounds
5. Avoids universal motivational assumptions ("engineers are motivated by technical challenge")

**Ethical principle**: Motivation is not manipulation. Understanding what drives a person so that the EM can design their work appropriately is fundamentally different from using that understanding to extract more productivity. The EM who treats motivational insight as a technique for increasing output has misunderstood the purpose. The purpose is to help people find work that is genuinely meaningful to them — which also tends to produce better outcomes, but that is the result, not the goal.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Person's engagement pattern** | Energy and enthusiasm level across different types of work |
| **Observed behavior** | What they gravitate toward vs. what they avoid or approach without energy |
| **Their stated motivators** | What they say energizes them — in their own words |

### Optional
| Input | Description |
|---|---|
| **Life context** | Major changes (family, health, housing) that may be affecting their motivational state |
| **Recent wins and losses** | Recent successes that may be sustaining motivation or failures that may have drained it |
| **Peer comparison** | Whether they feel relatively recognized and valued compared to their perception of peers |

---

## Analysis

### Step 1 — Map the Individual Motivational Profile

```
The AMP Model (Autonomy, Mastery, Purpose) — from Daniel Pink's Drive:

Motivator A: Autonomy
  Definition: The desire to direct their own work — what they work on, how, when, with whom
  High-autonomy person signal: Thrives when given open-ended problems; resists micromanagement strongly;
                               their best work comes when given a goal, not a method
  Low-autonomy person signal: Disengages when given ambiguous scope; prefers clear tasks with defined bounds
  
  In practice:
    High autonomy need: Give problem, not prescription. "Here's the outcome we need. How you get there is yours."
    Low autonomy need: Provide structure without over-constraining. "Here's the outcome, here's a starting approach."
  
  EM failure: Applying the same level of direction to both types; creating friction for the high-autonomy person
              or anxiety for the low-autonomy person

Motivator M: Mastery
  Definition: The desire to become better at something — to progress, to develop capability, to close skill gaps
  High-mastery person signal: Excited by learning opportunities; frustrated by work that doesn't challenge them;
                               deep satisfaction in becoming skilled at something difficult
  Low-mastery urgency signal: Motivated more by completion than improvement; prefers tasks they're already good at
  
  In practice:
    High mastery need: Ensure growth challenges exist in every quarter; stagnation is demotivating
    Low mastery urgency: Recognize excellence in what they already do; don't force learning they don't want

Motivator P: Purpose
  Definition: The desire to be part of something larger — to contribute to a meaningful outcome beyond themselves
  High-purpose person signal: Motivated by why, not just what; needs connection between their work and user/business impact;
                              may take visible pay or title cuts to work on something they believe in
  Low-purpose urgency signal: Motivated by craft, team, or compensation more than organizational mission
  
  In practice:
    High purpose need: Connect their work explicitly to user impact; share customer stories; make the "why" visible
    Low purpose urgency: Don't over-engineer mission framing; recognize execution excellence directly

AMP profile combinations:
  High A, High M, High P: Requires meaningful autonomy, clear growth, and visible impact — lose any one and they leave
  High A, Low M, High P: Give them ownership of a purposeful problem; minimize mandatory skill-building
  Low A, High M, Low P: Structured learning opportunities with clear progression — mastery is the reward
  High A, Low M, Low P: Compensation, title, and flexibility are primary motivators — mission framing won't land
```

### Step 2 — Assess Motivation Across Four Additional Dimensions

```
Beyond AMP, assess five secondary motivators to complete the profile:

Motivator 4: Recognition
  How does this person want their contributions acknowledged?
  Public recognizers: Appreciate shout-outs in team channels, all-hands mentions, visible credit
  Private recognizers: Find public recognition uncomfortable; prefer 1:1 acknowledgment
  Deferred recognizers: Motivated by long-term reputation; care about who knows their name at levels above the EM
  Peer recognizers: Value being acknowledged by peers more than by the manager
  
  Assessment question: "How do you like to be recognized when you do something well?"
  Wrong assumption: All engineers want the same type of recognition; most want it privately but assume they should want public

Motivator 5: Belonging and Connection
  How important is team culture and relationships to this person's motivation?
  High belonging: Demotivated by remote-only, isolation, or team friction; thrives in cohesive team contexts
  Low belonging need: Work is separable from relationships; can stay motivated in fragmented team contexts
  
  Signal: Moves toward or away from team events, cross-team collaboration, social interaction

Motivator 6: Stability and Security
  How important is predictability to this person's engagement?
  High stability: Demotivated by constant reorganization, shifting priorities, unclear futures
  High tolerance for uncertainty: Energized by ambiguity; finds stable environments boring
  
  Signal: Reaction to reorgs, priority changes, and unclear roadmap periods

Motivator 7: Compensation and Advancement
  How central is tangible reward (money, title, benefits) to this person's motivation?
  Primary motivator: If compensation is significantly below their perception of market rate, no other motivator compensates
  Secondary motivator: Compensation must be fair but doesn't need to be exceptional for engagement
  
  Note: Compensation below the person's perceived market rate creates dissatisfaction that no recognition or purpose framing will fix
  → This must be addressed structurally; it cannot be coached around

Motivator 8: Impact Visibility
  How important is it that the person can see and feel the outcome of their work?
  High visibility need: Demotivated by platform/infrastructure work with no user-facing outcomes
  Low visibility need: Satisfied by foundational work; doesn't need to see end-user reactions
```

### Step 3 — Detect Motivational Shifts

```
Motivation is not static. Life changes, role changes, and organizational changes shift it.

Shift signals:

Energy shift:
  "They used to get excited about architecture problems. Now they just want to ship tasks."
  Possible causes: Lost autonomy (over-management), mastery gap (no new challenge), burned out
  → Invoke: skills/people/burnout.md if burnout is suspected

Interest shift:
  "They keep asking about product decisions and user research — they never cared about this before."
  Possible cause: Purpose motivator is surfacing; they want to understand why, not just what
  EM response: Create the connection. Invite them into product conversations. Surface user data.

Withdrawal shift:
  "They've stopped participating in architecture reviews they used to love."
  Possible causes: Interpersonal friction, confidence drop, disengagement, or personal circumstances
  → Invoke: skills/people/engagement.md for full engagement protocol

Recognition gap:
  "They've seemed flat since the all-hands where their project wasn't mentioned."
  Public recognition withheld for someone with a high recognition need creates lasting damage
  EM response: Address directly: acknowledge the omission; correct it next opportunity

Compensation signal:
  "They mentioned what the market is paying for their skill set for the second time."
  This is usually a warning signal, not a casual comment
  EM response: Take it seriously; investigate market rate; escalate if there is a gap
  Do not: reassure them they're fairly compensated without actually checking
```

### Step 4 — Design the Motivational Environment

```
Per-person motivational design:

For the high-autonomy engineer:
  Work style: Give them the outcome, not the method
  Check-in style: "What are you working on?" not "Is it done?"
  Danger zone: Any behavior that signals distrust of their process (asking for daily updates, over-reviewing)

For the high-mastery engineer:
  Work style: Rotate them through technical challenges; avoid repetitive execution work
  Growth: Ensure every quarter has at least one stretch beyond current capability
  Danger zone: Flat sprint after flat sprint with no learning opportunity

For the high-purpose engineer:
  Work style: Connect every sprint goal to a user or business outcome explicitly
  Recognition: "You saved $47K in infrastructure costs" > "Great work on the optimization"
  Danger zone: Pure platform or infrastructure work disconnected from business outcomes

For the high-recognition engineer:
  Public recognition: Always attribute publicly in the format they prefer; never omit
  Private recognition: Do it within 24 hours of the achievement
  Danger zone: Consistent omission in team recognition when others are credited

For the high-stability engineer:
  Communication: More context about changes before they happen; never announce-then-ask
  Change management: Loop them in early on any reorgs or team changes
  Danger zone: Surprise reorgs or sudden priority pivots without explanation

Team-level motivational mix:
  Most teams contain a mix of motivational profiles
  A recognition system designed for one profile will demotivate another
  (e.g., mandatory team all-hands celebrations demotivate private recognizers)
  Design recognition, feedback, and development with the full team profile in mind
```

---

## Decision Tree

```
What does the motivation assessment reveal?

├── AMP GAP DETECTED — ONE MOTIVATOR BEING STARVED
│   └── Autonomy starved: "Who is micro-managing this person? Is it me?"
│       Mastery starved: "When did they last work on something genuinely new to them?"
│       Purpose starved: "When did they last see or hear from a user their work impacted?"
│       Each answer generates a specific structural change — not a conversation.

├── COACHING STALLED — MOTIVATION IS THE BARRIER
│   └── The person knows what to do but won't do it
│       Explore: "What would make doing this feel worthwhile?"
│       If the work itself is demotivating: the coaching content is wrong
│       Reassess: Is this work aligned with what actually motivates them?
│       → Invoke: skills/people/career-development.md to reassess direction

├── RECOGNITION GAP IDENTIFIED
│   └── Person's preferred recognition style is not being met
│       If public omission: correct it at the next team forum; do not delay
│       If private recognition missing: say it directly, specifically, this week
│       Compensation gap: escalate compensation review; recognition words won't fill a pay gap

├── COMPENSATION AS PRIMARY DEMOTIVATOR
│   └── No motivational conversation will fix a compensation gap
│       Run a market rate comparison; escalate to comp team
│       Be honest with the person: "I'm looking into this. I want to give you a real answer."
│       If the gap can't be closed: be honest about that too
│       "I've advocated for the adjustment and the answer was {{outcome}}.
│       I want you to have accurate information to make decisions about your career."

├── MOTIVATION SHIFT DETECTED — NEW DIRECTION EMERGING
│   └── Don't redirect back to their prior profile — explore the new one
│       "I've noticed you seem more energized by {{new area}}. Tell me more about that."
│       This may be a career development inflection point
│       → Invoke: skills/people/career-development.md for aspiration conversation

└── MOTIVATION STABLE — PERSON ENGAGED
    └── Don't disturb what's working
        Track the motivational profile; update after life events or role changes
        Monthly check: "What's giving you the most energy right now?"
```

---

## Output

### Individual Motivation Profile

```
MOTIVATION PROFILE — {{Person}} — Updated: {{date}}

AMP SCORES (1–5 per motivator)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Autonomy: {{1–5}} — Evidence: {{Observable preference or behavior}}
Mastery: {{1–5}} — Evidence: {{Observable preference or behavior}}
Purpose: {{1–5}} — Evidence: {{Observable preference or behavior}}
AMP profile: {{Dominant motivator(s): A/M/P or combination}}

SECONDARY MOTIVATORS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Recognition style: {{Public | Private | Peer | Deferred}} — Evidence: {{...}}
Belonging need: {{High | Medium | Low}} — Evidence: {{...}}
Stability need: {{High | Medium | Low}} — Evidence: {{...}}
Compensation signal: {{Primary driver | Secondary | Not signaling}} — Last raised: {{date or N/A}}

MOTIVATIONAL ENVIRONMENT DESIGN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
What energizes this person: {{In their words}}
What drains this person: {{In their words or observed}}
EM adjustments made: {{Specific changes to work design or management style}}

SHIFT SIGNALS (running log)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Date}}: {{Observed shift}} — {{Response taken}}
Motivation trend: {{Stable 🟢 | Shifting — monitoring 🟡 | Declining — action needed 🔴}}
Next review: {{date}} | Skill to invoke if declining: {{skills/people/engagement.md or burnout.md}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| AMP profile assessed per individual | Base: 65% |
| Secondary motivators assessed | +15% |
| Profile based on observed behavior, not assumption | +10% |
| Motivational shifts tracked over time | +10% |
| Recognition style explicitly confirmed with the person | +5% |
| Generic motivational assumption applied without individual assessment | −25% |
| Compensation gap addressed with words, not structural fix | −20% |
| Using motivational insight to extract productivity (not to serve the person) | −50% (disqualifying) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Universal motivation assumption** | "Engineers are motivated by technical challenge" applied to everyone | Assess individually. Profile is built from observed behavior, not demographic assumption. |
| **Recognition style mismatch** | Public celebration for a private recognizer; private acknowledgment for a peer recognizer | Ask explicitly: "How do you like to be recognized?" Then match the delivery. |
| **Compensation gap workaround** | Person signals comp concern; EM responds with career conversations | Comp gap must be addressed structurally. No amount of purpose-framing fixes it. |
| **Motivation assumed static** | Profile built at onboarding; never updated as life and role change | Update after major life events, reorgs, role changes, and promotion cycles. |
| **Instrumentalizing motivation** | EM uses motivational insight to increase output for team benefit | Motivation insight exists to serve the person. The question is "what makes work meaningful for them?" — not "how do I get more from them?" |

---

## References

- `skills/people/one-on-one.md` — Monthly motivation check-in embedded in 1:1 Mode 2 (Check-in)
- `skills/people/engagement.md` — Motivation decline is the leading indicator of disengagement
- `skills/people/burnout.md` — Motivation collapse combined with exhaustion = burnout, not disengagement
- `skills/people/career-development.md` — Career direction must align with motivational profile to be sustainable

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/engagement.md` | Motivation profile informs engagement monitoring; declines here predict disengagement there |
| `skills/people/coaching.md` | When coaching stalls, motivation is usually the barrier — this skill diagnoses it |
| `skills/people/career-development.md` | Career aspiration must align with the person's dominant motivators |
