# Skill: Upward Feedback & Self-Advocacy

**Domain**: People Leadership Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand — triggered by a promotion outcome, a performance conversation with your own manager, or any moment feedback/blame about you personally needs to be acted on rather than absorbed

---

## Purpose

Give the EM the same rigor for feedback they *receive* about themselves that `skills/people/feedback.md` gives them for feedback they *deliver*. Most feedback an EM gets from their own manager or a stakeholder is not a single clean claim — it blends genuine developmental signal with externally-imposed conditions (workload pressure, VP asks, org constraints) that were not the EM's decision. Accepting the blend wholesale internalizes blame that isn't earned; rejecting it wholesale forfeits real development signal. This skill separates the two before the EM responds.

**What the EM does automatically**: When feedback about themselves arrives, the EM:
1. Decomposes a single feedback statement into its discrete claims — it is rarely actually one thing
2. Applies the same SBI validity test to feedback received that `skills/people/feedback.md` applies to feedback given — a claim without a Situation and an observable Behavior is not yet actionable
3. Classifies each valid claim as Personal (within the EM's control), Structural (caused by a decision or pressure from above the EM), or Ambiguous
4. Triangulates ambiguous or structural claims against independent evidence — direct signal from the EM's own team, not just the secondhand narrative — before accepting or contesting them
5. Responds on a track matched to the classification, rather than one uniform reaction (full acceptance or full defensiveness) to the whole statement

**Ethical principle**: The EM who demands specific, behavioral feedback from their reports but accepts vague, attributed feedback about themselves without the same scrutiny is holding an inconsistent standard. Symmetry matters: the muscle that says "that's an interpretation, not a behavior" when coaching a report must fire the same way when the EM is on the receiving end. At the same time, triangulating and separating causes is not the same as deflecting — a claim confirmed as Personal after triangulation must still be owned in full, not re-litigated.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The feedback, as close to verbatim as possible** | What was actually said — write it down before analyzing it; memory reshapes feedback toward what's easiest to accept or reject |
| **Source and relationship** | Who delivered it (manager, skip-level, peer stakeholder) and what authority or context they have |
| **Attached decision, if any** | Was this tied to a promotion outcome, a performance review, or delivered standalone? |

### Optional
| Input | Description |
|---|---|
| **Independent team signal** | What the EM's own 1:1s and observations show about the same period, for triangulation |
| **Known external directives** | Any pressure, scope increase, or deadline the EM's own manager imposed in the same window |
| **Prior instances** | Has this same feedback (or its structural cause) surfaced before? |

---

## Analysis

### Step 1 — Decompose Before Reacting

Do not respond to the feedback as a single block. Write out each discrete claim on its own line. A statement like "your communication isn't crisp and the team isn't happy" is at minimum two claims — do not let them be evaluated as one.

### Step 2 — SBI Validity Test (reused from `skills/people/feedback.md`)

For each claim, check:

```
Does it name a Situation?        (a specific moment, not "generally" or "sometimes")
Does it name a Behavior?         (an observable action, not a trait — "not crisp" is a trait)
Does it name an Impact?          (a specific consequence, not a vague feeling)

All three present  → Valid claim. Proceed to Step 3.
Any missing        → Invalid claim. Do not classify or act on it yet.
                      Return to the source: "Can you give me a specific example?"
                      Per feedback.md: vague trait feedback ("communicate better") is not
                      actionable and should never be silently accepted or silently absorbed.
```

### Step 3 — Personal / Structural / Ambiguous Classification

For each claim that passed Step 2:

```
Personal:
  The behavior is within the EM's control and would recur regardless of external conditions.
  Example: "In the roadmap review, you presented three options without a recommendation,
  and the room spent 40 minutes debating instead of deciding."

Structural:
  The behavior or outcome traces to a decision, directive, or pressure imposed from above
  the EM — the same situation would produce the same result for anyone in the EM's seat.
  Example: "The team absorbed a 30% scope increase in two weeks because of the VP ask,
  and morale dropped as a result" — this is not a communication failure, it is a capacity
  decision made above the EM.

Ambiguous:
  Cannot be classified without more evidence. Do not guess. Proceed to Step 4.
```

**This mirrors `skills/organizational/conflict-prediction.md`'s "Personalizing structural conflict" failure mode — applied reflexively, to feedback about the EM instead of tension between two other parties.**

### Step 4 — Triangulate Before Responding

For every Structural or Ambiguous claim:

```
Do not accept the source's framing as the only data point.
Run your own check:
  - What do your own 1:1s from the same period show?
  - Is there a documented directive, timeline, or decision that explains the outcome
    independent of your behavior?
  - Does the timing line up — did the dissatisfaction predate or postdate the
    external pressure being named as unrelated?

If triangulation confirms Structural: proceed to Step 5's Structural track.
If triangulation reveals it was actually Personal: reclassify honestly — triangulation
  is not a search for exoneration, it is a search for accuracy.
If triangulation is inconclusive: treat as Ambiguous and gather one more data point
  before responding definitively — do not respond with false certainty either way.
```

### Step 5 — Response Track by Classification

```
Personal + specific (passed Step 2, confirmed Personal):
  Own it fully. No hedging, no "but."
  Build a forward action using the same forward-ask discipline from feedback.md:
  "Going forward, here's specifically what I'll do differently: {{behavior}}."
  → Invoke: skills/people/growth-plans.md if this becomes a standing development area

Invalid (failed Step 2 — no SBI):
  Do not accept or act on it yet. Return to the source directly:
  "I want to act on this, but I need a specific example to know what to change."
  This is not defensiveness — it is the same standard the EM holds for giving feedback.

Structural (confirmed via triangulation):
  Name it back without blame-shifting. Do not accuse; separate.
  "Help me separate what's about my communication from what's about the capacity
  we absorbed from {{the directive}} — those feel like two different problems to me."
  Ask for joint ownership of the structural piece, not absolution from it.

Ambiguous, unresolved after one round of triangulation:
  State the uncertainty honestly rather than picking a side prematurely:
  "I want to understand this fully before I respond — can we come back to this
  after I've had a chance to check in with the team directly?"

Attached to a promotion outcome:
  Route the Personal-track claims into skills/people/promotion.md's Step 4
  ("Promotion Declined — Next Steps") as the specific, named gap — not a vague
  acceptance of "not ready." Route Structural-track claims into a direct conversation
  with your own manager about calibration timing and workload, separate from the
  development conversation.

Source is a peer stakeholder, not your manager, and the feedback arrived secondhand
(i.e., you learned about it from a third party rather than the stakeholder directly):
  This is a stakeholder-relationship case, not a self-feedback case. Do not apply
  the tracks above. Go to the stakeholder directly first — see
  `skills/organizational/political-intelligence.md` (Signal 4: Escalation Patterns) and Related Skills below.
```

---

## Decision Tree

```
What does the feedback contain, after decomposition?

├── ALL CLAIMS VALID (SBI) AND PERSONAL
│   └── Own it fully. Build a specific forward action. No triangulation needed —
│       specificity + personal attribution is already actionable.
│
├── ONE OR MORE CLAIMS FAIL THE SBI TEST
│   └── Do not act on the invalid claims. Return to the source for a specific example
│       before responding to those claims at all. Proceed normally on the valid ones.
│
├── VALID CLAIMS, BUT CLASSIFICATION IS STRUCTURAL OR AMBIGUOUS
│   └── Triangulate against independent team signal and known directives before
│       responding. Do not accept the secondhand framing as the only data point,
│       and do not dismiss it either — triangulate, then classify honestly.
│
├── MIX OF PERSONAL AND STRUCTURAL CLAIMS IN THE SAME CONVERSATION
│   └── Address them separately and explicitly in your response. Do not let an
│       accurate Personal claim get diluted by disputing the Structural one, and
│       do not let a Structural claim get absorbed as Personal for the sake of a
│       simpler conversation.
│
├── FEEDBACK IS ATTACHED TO A DENIED PROMOTION
│   └── Route Personal-track gaps into skills/people/promotion.md's outcome
│       delivery framework as a named, specific development gap. Route Structural-
│       track claims into a direct, separate conversation about calibration timing.
│       Log the pattern to memory (see Output) regardless of outcome.
│
└── FEEDBACK ORIGINATES SECONDHAND FROM A PEER STAKEHOLDER, NOT YOUR MANAGER
    └── Wrong skill for this branch. This is a stakeholder-conflict case:
        go to the stakeholder directly first. See
        skills/organizational/political-intelligence.md (escalation signal detection).
```

---

## Output

### Self-Feedback Triage Brief

```
SELF-FEEDBACK TRIAGE — {{date}}
SOURCE: {{name/role}} | CONTEXT: {{promotion outcome / performance conversation / standalone}}

CLAIM-BY-CLAIM BREAKDOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Claim: {{verbatim or close paraphrase}}
  SBI valid? {{Y/N — if N, what's missing}}
  Classification: {{Personal | Structural | Ambiguous}}
  Evidence used: {{triangulation source, or "none yet — needed"}}
  Response track: {{Own it / Return for specifics / Name back without blame / Hold for more data}}

[repeat per claim]

RECOMMENDED CONVERSATION OPENER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{1–2 sentences, specific to the mix of tracks above}}

WHAT TO LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Domain: {{memory/promotions/ if promotion-linked, else memory/career/}}
Tags: {{person:manager-role, situation:performance-conv or situation:promotion-discussion,
        pattern:attribution-conflation (if a Structural/Personal mix was found), outcome:{{...}}}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Every claim run through the SBI validity test before classification | Base: 65% |
| Structural/Ambiguous claims triangulated against independent team signal | +15% |
| Source provided specific examples when asked | +15% |
| Structural claim corroborated by a named, dated directive or decision | +10% |
| Accepted a claim wholesale without requesting specifics | −25% |
| No triangulation attempted on a Structural or Ambiguous claim | −15% |
| Personal and Structural claims responded to as if they were one claim | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Blanket acceptance** | Feedback treated as infallible because it came from someone senior | Run every claim through Step 2 (SBI) regardless of the source's seniority |
| **Blanket defensiveness** | All claims contested to protect against discomfort, including valid Personal ones | Classify claim-by-claim; a Structural claim elsewhere in the same conversation does not invalidate a valid Personal one |
| **Silent resentment** | Structural claim accepted outwardly but never actually named back to the source | Step 5's Structural track requires naming it in the conversation, not just recognizing it privately |
| **Triangulation as exoneration-seeking** | Independent evidence gathered only until it supports "not my fault" | Triangulation must be willing to reclassify Structural back to Personal if the evidence points that way |
| **Wrong-skill application** | This skill applied to a secondhand stakeholder complaint instead of a direct feedback conversation | Check the source: manager/skip-level feedback about you uses this skill; a peer stakeholder's secondhand complaint is a stakeholder-conflict case — go direct to them first |

---

## References

- `skills/people/feedback.md` — SBI framework and the "interpretation stated as behavior" failure mode this skill applies in reverse
- `skills/organizational/conflict-prediction.md` — "Personalizing structural conflict" failure mode, mirrored upward instead of laterally
- `skills/people/promotion.md` — Step 4 outcome-delivery framework, invoked when the EM is the recipient of a declined case rather than the deliverer
- `memory/schema.md` — `pattern:attribution-conflation` tag for logging this exact pattern when it recurs

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/feedback.md` | Same SBI discipline, opposite direction (giving vs. receiving) |
| `skills/organizational/conflict-prediction.md` | Source of the Personal/Structural distinction this skill applies reflexively |
| `skills/people/promotion.md` | Where Personal-track gaps from a declined promotion get converted into a development plan |
| `skills/people/growth-plans.md` | Where a confirmed, recurring Personal claim becomes a standing development area |
| `skills/organizational/political-intelligence.md` | Correct skill instead of this one when the feedback is a secondhand stakeholder complaint, not direct manager feedback (Signal 4: Escalation Patterns) |
