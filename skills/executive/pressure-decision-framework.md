# Skill: Pressure Decision Framework

**Domain**: Executive
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand — activates when a decision must be made under high time pressure, high stakes, or both

---

## Purpose

Make decisions at the same quality level under pressure as under normal conditions. Not faster. Not with more confidence than the situation warrants. At the same quality — which means: using the same structure, naming the same risks, and committing to the same reversibility discipline that calm-state decisions require.

Pressure degrades decision quality in three specific ways: it narrows the option set (the first option that reduces anxiety gets picked), it shortens the evidence window (decisions are made on what is immediately available, not what is needed), and it suppresses dissent (no one wants to slow things down by raising a problem). This skill is designed to resist all three.

**What the EM does automatically**: In pressure decisions, the EM:
1. Names the pressure before making any move — distinguishing genuine time constraint from anxiety-driven urgency
2. Uses the shortest possible version of the decision structure that still prevents the three failure modes
3. Identifies the one person who should push back, and explicitly asks them to
4. Names the reversibility posture before committing — high-stakes irreversible decisions under pressure require a higher threshold
5. Sets a reassessment point at the moment of commitment — "if X hasn't happened by [date], we revisit"

**Cardinal rule**: The difference between a pressure decision and a panic decision is whether you named the option you're not taking. If you cannot name one alternative to the path you're choosing, you are panicking, not deciding.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The decision** | Exactly what must be decided — one sentence |
| **Actual deadline** | When does the window close — with evidence, not just stated urgency |
| **What closes if you wait** | The specific cost of delay — named, not vague |
| **Reversibility** | Can this be undone? At what cost? |

### Optional
| Input | Description |
|---|---|
| **Available options** | What paths exist; if under pressure you can only see one, that is a signal |
| **The person most likely to be right when you're wrong** | Who has the highest-quality dissent available right now |
| **Prior similar decision** | From `decision-memory/` — what happened the last time you decided this type of question under pressure |

---

## Analysis

### Step 1 — Classify the Pressure Type

```
Not all pressure is equal. Pressure type determines the response.

TYPE 1 — GENUINE TIME CONSTRAINT
  Definition: An external deadline exists that will close an option if not acted on.
  Evidence required: Specific date, specific option closure, specific external actor.
  Examples:
    "Vendor slot closes Friday if we don't sign."
    "Sprint planning is Monday — any scope change after costs 1.5 weeks."
    "Engineer has competing offer; decision needed by 5pm."
  Response: Apply the pressure decision framework in full, but accept the timeline.
  Rule: If you cannot name the external actor and the specific closure mechanism,
        it is not a genuine time constraint — it is anxiety.

TYPE 2 — EXECUTIVE URGENCY
  Definition: An executive wants a decision faster than it needs to be made.
  Evidence: Urgency is expressed but no option closes if delayed.
  Examples:
    "I need to know by EOD what we're doing about this."
    "Just make a call — we can't keep debating."
  Response: Name the real decision window before agreeing to the executive's timeline.
    "I can give you a direction by EOD. I want to name that the actual decision
    window is [date] — I'm going to move toward that answer, not make a different one."
  Rule: Executive urgency is real as a relationship signal but not as a decision constraint.
        Agreeing to a premature timeline to reduce the executive's anxiety is a
        confidence engine problem, not a decision problem.

TYPE 3 — CRISIS ESCALATION
  Definition: An incident, organizational shock, or human situation is unfolding and
              requires coordinated decision-making while information is still incomplete.
  Evidence: Active, evolving situation with real-time consequences.
  Response: See `loops/crisis-loop.md`. This framework applies but in a compressed
            time window — the decompression step (Step 2) takes 5 minutes, not 20.
  Rule: Distinguish the decision from the action. In a crisis, actions may need to
        start before all decisions are made. Name which actions are reversible
        ("we're doing X to stabilize — we can walk it back") and which are not.

TYPE 4 — SELF-GENERATED URGENCY
  Definition: The EM has been avoiding a decision and the discomfort of delay is being
              interpreted as deadline pressure.
  Evidence: Urgency feeling increases as days pass without deciding; no external event
            is creating closure.
  Response: This is not a pressure decision. It is a delayed decision.
    Route to `skills/executive/executive-decision-framework.md`.
    Self-generated urgency is a self-coaching signal (em-self-coaching.md — Analyst default).
```

### Step 2 — Decompress Before Deciding

```
The most valuable 5 minutes in any pressure decision is the 5 minutes before
you make any move. Decompression interrupts the anxiety narrowing.

Decompression protocol (4 questions, timed to 5 minutes total):

Q1: "What is the actual decision I'm making?"
  Write it in one sentence. If you can't write it, you're not ready to decide.
  Common error: deciding the wrong question under pressure.
  Example of wrong question: "Should we delay the release?"
  Right question: "Given [specific risk], is the risk of shipping now greater than
                  the cost of a one-week delay plus the stakeholder trust impact?"

Q2: "What are the options I can see right now?"
  List them. Minimum 2, including "do nothing" or "delay."
  If you can only see one option: the pressure is too high. Get another person in
  the room before making the call.
  "I can only see one option" is the most important thing you can say in a pressure
  decision. It is not weakness — it is calibration.

Q3: "What is the reversibility?"
  Classify: Fully reversible / Partially reversible / Irreversible.
  The higher the irreversibility, the more the decompression must slow down,
  even under genuine time constraint.
  Rule: An irreversible decision made under pressure with only one option identified
  is the highest-risk category. Require at least 2 options before deciding.

Q4: "Who is most likely to be right when I'm wrong?"
  Name one person. This is not a committee. One person who has the clearest view
  of the failure mode you're most likely to miss.
  That person gets a 2-minute consult before you commit.
  They don't have to agree — you just have to hear them.

Rule: Decompress even if you don't have 5 minutes. Compress the 5 minutes to 3.
      Do not skip it. The decompression is what makes this a decision, not a reaction.
```

### Step 3 — Apply the Compressed Decision Structure

```
Under pressure, the full executive-decision-framework is too slow.
This is the compressed version — the minimum viable structure that prevents the
three failure modes (option narrowing, evidence shortcutting, dissent suppression).

COMPRESSED DECISION STRUCTURE (10-minute target):

1. THE DECISION (1 sentence)
   {{What must be decided.}}

2. THE REAL WINDOW (1 sentence)
   {{When does an option close? External actor? Specific consequence?}}
   If this cannot be answered: the urgency is anxiety, not timeline.

3. OPTIONS (2 minimum, including "don't decide now")
   Option A: {{description}}
   Option B: {{description}}
   Option "Wait": {{what becomes available if we wait 24h / 48h? what closes?}}

4. REVERSIBILITY
   A: {{Reversible / Partial / No}}
   B: {{Reversible / Partial / No}}
   Rule: Irreversible decisions under pressure require explicit sign-off from one
         additional person, even if you have the authority to decide alone.

5. THE DISSENT CHECK
   "{{Person}}, the case against [my preferred option] is [argument]. What am I missing?"
   They may say "nothing." That's fine. The check was done.

6. THE DECISION
   "I'm choosing Option [A/B] because [1-sentence rationale]."

7. THE REASSESSMENT POINT
   "If [specific signal] has not happened by [specific date], I will revisit this decision."
   This is not hedging. This is building in the learning loop before you commit.

Total time target: 10–15 minutes for genuine time constraint (Type 1 or 2).
                  5–8 minutes for crisis escalation (Type 3 — further compressed).
```

### Step 4 — Communicate the Decision with Appropriate Confidence

```
A pressure decision communicated with false certainty is worse than one communicated
with calibrated confidence. The team reads the difference.

Communication calibration:

HIGH CONFIDENCE (evidence supports the direction):
  "We're going with [Option A]. Here's the rationale: [2 sentences]. We'll reassess
  if [specific trigger] by [date]."

MEDIUM CONFIDENCE (direction is right, details uncertain):
  "We're moving toward [Option A] — I'm not certain on [specific variable], but I'm
  confident enough to start. We'll confirm [variable] by [date] and adjust if needed."

LOW CONFIDENCE (options are roughly equal, time requires a call):
  "I'm making the call to [Option A] with low confidence — this is a forced choice
  because [time constraint]. I want to flag that [Option B] had merit. If [signal] emerges,
  we'll revisit within [timeframe]."

Never communicate a pressure decision as "I've thought this through carefully" when you haven't.
The team knows. Calibrated confidence builds more trust than false certainty.

What to communicate to the EM's manager (brief, immediate):
  "I just made [decision] under time pressure. My rationale: [1 sentence].
  Reversibility: [high/medium/low]. Reassessment point: [date].
  I wanted you to know before you heard it another way."
  This is the no-surprises principle applied to the EM's own decisions.
```

### Step 5 — Document and Log

```
Pressure decisions that are not logged produce repeating patterns.
The EM who makes the same class of pressure decision 4 times without
examining it is not making decisions under pressure — they are avoiding
a structural problem that keeps generating pressure decisions.

Minimum documentation (5 minutes, after the dust settles):

Date: {{date}}
Decision: {{one sentence}}
Pressure type: {{Type 1–4}}
Options considered: {{2+ names}}
Option chosen: {{name + rationale}}
Reversibility: {{H/M/L}}
Dissent check: {{who, what they said}}
Reassessment point: {{date + signal}}
Outcome (fill in later): {{what happened}}
Pattern flag: {{Is this the same type of pressure decision I've made before? Y/N}}

If Pattern flag = Y: route to em-self-coaching.md as a Step 3 situation-weakness input.
  A recurring pressure decision type is a structural problem, not a decision skill problem.
  The structural fix is upstream of this skill.
```

---

## Decision Tree

```
What type of pressure decision is this?

├── PRESSURE TYPE 4 (self-generated urgency / delayed decision)
│   └── Do not apply this skill.
│       Route to executive-decision-framework.md.
│       Log the avoidance pattern in em-self-coaching.md (Analyst default).

├── ONLY ONE OPTION VISIBLE
│   └── Stop. Get one other person in the room before proceeding.
│       "I can only see one option" means the pressure has narrowed your thinking.
│       Minimum: 5-minute consult with the person most likely to see what you're missing.
│       After that: at minimum name Option A and "wait."

├── IRREVERSIBLE DECISION + SINGLE OPTION + TYPE 1/3 PRESSURE
│   └── Highest-risk combination. Require:
│       — Written 10-line compressed structure before committing
│       — Explicit dissent check with one other person
│       — EM manager informed before, not after
│       — Reassessment point set within 48 hours
│       This combination is where the biggest mistakes happen. Slow down by 10 minutes.

├── TYPE 3 (CRISIS ESCALATION)
│   └── Route to loops/crisis-loop.md for orchestration.
│       Apply this framework at Step 3 (compressed decision) within the crisis loop.
│       Distinguish: actions that must start immediately (reversible, stabilizing) vs.
│       decisions that can wait for 15 more minutes of information.

├── DECISION IS MINE + REVERSIBLE + TYPE 1/2 PRESSURE
│   └── Standard application. 10-minute structure. Communicate with calibrated confidence.
│       Log after the dust settles.

└── SAME PRESSURE DECISION TYPE RECURRING
    └── This is a structural problem. Route to em-self-coaching.md.
        Ask: what upstream condition keeps generating this type of forced choice?
        Fix the upstream condition, not the decision quality.
```

---

## Output

### Pressure Decision Record

```
PRESSURE DECISION — {{Date}} — {{One-sentence title}}

PRESSURE TYPE: {{1: Genuine timeline / 2: Executive urgency / 3: Crisis / 4: Self-generated}}
WINDOW: {{Specific date and closure mechanism — or "anxiety, not constraint"}}

DECOMPRESSION COMPLETE: {{Y / N — if N, flag and note why it was skipped}}

OPTIONS CONSIDERED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
A: {{description}} — Reversible: {{H/M/L}}
B: {{description}} — Reversible: {{H/M/L}}
Wait: {{what 24h buys / what closes}} — Available: {{Y/N}}

DISSENT CHECK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Person consulted: {{name}}
Case against preferred option: {{argument raised}}
Their input: {{what they said}}

DECISION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Option chosen: {{A/B/Wait}}
Rationale: {{1 sentence}}
Communication confidence: {{High / Medium / Low}} — communicated as: {{quote of framing used}}

REASSESSMENT POINT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Signal: {{what would trigger revisiting}}
Date: {{specific}}

MANAGER INFORMED: {{Y/N}} — {{before/after}}

PATTERN FLAG: {{Is this a recurring pressure decision type? Y/N}}
If Y: Route to em-self-coaching.md — situation weakness analysis required

OUTCOME (fill in later): {{what happened}}
Logged to decision-memory: {{Y / N}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Pressure type classified before deciding | Base: 60% |
| Decompression protocol completed | +15% |
| ≥2 options identified (including "wait") | +10% |
| Dissent check completed | +10% |
| Reassessment point set | +5% |
| Only one option considered | −30% |
| Decompression skipped entirely | −20% |
| Decision irreversible + single option + no dissent check | −35% (critical risk) |
| Pressure type 4 (self-generated) treated as genuine constraint | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Option collapse** | One option considered and chosen under pressure | Require minimum 2 options before committing. "Wait" is always an option. |
| **False urgency acceptance** | EM agrees to an executive's premature timeline without naming the real window | Classify pressure type before agreeing to any timeline. Type 2 urgency is real but not a constraint. |
| **Irreversibility blindness** | High-stakes irreversible decision made without a dissent check | Irreversibility classification is mandatory. If irreversible: dissent check is mandatory, not optional. |
| **Confidence overcommunication** | "I've thought this through carefully" when the time window was 15 minutes | Calibrate communication to actual confidence. False certainty destroys trust faster than honest uncertainty. |
| **Pattern blindness** | Same pressure decision type made repeatedly with no upstream fix | Pattern flag in the log. Route to em-self-coaching.md. The structural problem must be named. |

---

## References

- `skills/executive/executive-decision-framework.md` — Full (non-compressed) decision framework; use when time is not the constraint
- `loops/crisis-loop.md` — Orchestration for crisis-type pressure decisions (Type 3)
- `skills/mentoring/em-self-coaching.md` — Recurring pressure decision patterns feed into situation-weakness analysis
- `decision-memory/` — Log every pressure decision; pattern detection runs monthly

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/executive-decision-framework.md` | Full-form decision structure; this skill is the compressed version for time-constrained situations |
| `loops/crisis-loop.md` | Crisis escalation (Type 3) is orchestrated here; this skill provides Step 3 decision structure within it |
| `skills/mentoring/em-self-coaching.md` | Recurring pressure decisions are a self-coaching input — situation weakness analysis |
| `skills/people/difficult-message-delivery.md` | Pressure decisions that require delivering hard messages often follow immediately |
