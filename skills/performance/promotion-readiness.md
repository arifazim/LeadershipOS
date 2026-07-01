# Skill: Promotion Readiness

**Domain**: Performance Management
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (readiness tracking per direct report) + Quarterly (formal readiness review in 1:1) + Calibration cycle (readiness submission)

---

## Purpose

Assess each direct report's promotion readiness continuously — not only at the formal review cycle — so that readiness is detected when it happens, development gaps are named and addressed in advance, and no one sits at a level they've outgrown while the EM waits for the next calibration window.

**What the EM does automatically**: On a monthly cadence, the EM:
1. Scores each direct report across five readiness dimensions against the target level expectations
2. Detects the five performance intelligence signals as they relate to promotion: the engineer ready now who hasn't been submitted, the engineer who believes they're ready but isn't, the hidden candidate whose readiness is invisible to the org, the coaching opportunity that would close the last gap, and the flight risk driven by a promotion that's overdue
3. Builds the evidence continuously rather than in the pre-calibration sprint
4. Communicates readiness status to each person directly and honestly, including the gap that stands between them and the next level

**Ethical principle**: The most harmful pattern in promotion readiness management is false ambiguity — where the EM knows the person isn't ready but won't say so clearly, and the person continues optimizing toward a goal the EM doesn't believe is achievable on the current path. This is dishonest and wastes the person's most valuable developmental time. Clarity is kinder than ambiguity, even when the message is hard to hear.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current level expectations** | The documented requirements for both the current level and the target level |
| **Performance evidence** | Observable behaviors and impact from the current review period |
| **The person's stated aspiration** | Whether they want to be promoted and to what level |

### Optional
| Input | Description |
|---|---|
| **Calibration outcomes** | Prior ratings and calibration group's perspective on this person |
| **Cross-functional evidence** | Peer and partner feedback that demonstrates level-appropriate capability |
| **Organizational promotion context** | Current cycle's bar, quota pressure, or historical patterns |

---

## Analysis

### Step 1 — Score Readiness Across Five Dimensions

```
The five readiness dimensions are identical to performance review dimensions,
but evaluated specifically against the TARGET level — not the current level.

Rule: Operating at current level = Meets
      Operating at next level consistently = Ready for promotion
      Operating at next level sometimes = Not yet (inconsistency is the gap)

Dimension 1: Technical Execution at target level
  Question: "Is their technical judgment, code quality, and design capability at the level
             we'd expect from someone already at {{target level}}?"
  L3→L4: Can complete medium-complexity work independently; provides useful peer reviews
  L4→L5: Drives large technical initiatives; designs systems across the team scope
  L5→L6: Defines technical direction for multiple teams; sets the bar
  M1→M2: Team's technical health is strong; EM catches technical risks before they surface
  
  Readiness score: 0 (Not demonstrated) → 3 (Occasionally) → 7 (Frequently) → 10 (Consistently)

Dimension 2: Scope and Ownership at target level
  Question: "Are they proactively taking ownership at the scope of the next level —
             before being asked, without prompting from the EM?"
  L3→L4: Owns full features end-to-end; not just assigned tasks
  L4→L5: Owns cross-team or platform-level initiatives; not just team scope
  L5→L6: Owns org-level outcomes; sets the direction others execute against
  
  Readiness score: 0 → 3 → 7 → 10

Dimension 3: Communication and Influence at target level
  Question: "Is their communication reaching and influencing the audiences expected at
             the next level?"
  L3→L4: Clear within the team; gives and receives peer feedback
  L4→L5: Influences cross-functional decisions; simplifies complexity for non-technical audience
  L5→L6: Communicates with executive stakeholders; shapes external engineering narrative
  M1→M2: Strong cross-functional relationships; organizational communication is healthy
  
  Readiness score: 0 → 3 → 7 → 10

Dimension 4: Leadership and Influence at target level
  Question: "Are they demonstrating leadership behaviors that belong to the next level?"
  L3→L4: Mentors newer engineers when given the opportunity
  L4→L5: Consistently develops L3–L4 engineers; shapes team practices and norms
  L5→L6: Develops senior engineers; creates the culture the team operates in
  M1→M2: Develops direct reports effectively; team attrition is low; engagement is high
  
  Readiness score: 0 → 3 → 7 → 10

Dimension 5: Demonstrated Track Record at target level
  Question: "Have they sustained the above for long enough to be confident it's who they are,
             not a performance on behalf of the promotion?"
  Sustained demonstration: 3–6 months of consistent behavior at target level
  Occasional demonstration: Multiple instances, but not sustained over time
  Single demonstration: One visible example without a pattern
  
  Readiness score: 0 (No evidence) → 3 (Single instance) → 7 (Pattern, not sustained) → 10 (Sustained 3+ months)

Composite readiness score (0–50):
  Sum of five dimension scores
  
  Score interpretation:
    42–50: Ready now — submit this cycle; don't wait
    35–41: Ready in 1 quarter — one dimension needs one more demonstration
    25–34: Ready in 2–3 quarters — 1–2 dimensions need focused development
    15–24: Development needed — significant gap in ≥2 dimensions; 6–12 months of focused work
    0–14:  Early stage — current level not yet consolidated; focus on Meets at current level first
  
  Hard blocker:
    Any dimension with a score ≤ 2 blocks submission regardless of composite total
    (A person cannot be promoted if they are not demonstrating the basics of target level
    in any one dimension)
```

### Step 2 — Detect the Five Performance Intelligence Signals

```
Signal 1 — HIDDEN CANDIDATE (ready but invisible)
  Definition: The person meets or exceeds all readiness criteria but has not been
              considered for promotion because their work is invisible above the team level
  Detection: Composite score ≥ 42; cross-functional visibility score is low; their name
             doesn't come up when leadership discusses "who should be at the next level?"
  Why it happens: Quiet contributor; infrastructure work; introverted style; underrepresented group
  Response: Immediate — create the visibility before the next calibration cycle
            "You're ready. I haven't done enough to make that visible. Here's what I'm going to do."
            → Invoke: skills/performance/high-performer.md + skills/performance/calibration.md

Signal 2 — OVERDUE SUBMISSION (ready; not submitted)
  Definition: Person has been performing at target level for 6+ months; promotion has not been initiated
  Detection: Composite score ≥ 42 for 2+ consecutive quarters; promotion not on the roadmap
  Why it happens: EM deferred due to calibration pressure, quota concerns, or hesitation
  Response: Urgent — every month of over-level performance without promotion is a retention risk
            "I've been watching your work at the {{target level}} scope for two quarters.
            I'm submitting you for promotion this cycle. Here's the case I'm making."
            → Invoke: skills/people/promotion.md for submission

Signal 3 — SELF-ASSESSED READY — EM ASSESSMENT DISAGREES
  Definition: Person believes they are ready for promotion; the EM's evidence-based assessment disagrees
  Detection: Person raises promotion in 1:1; EM's composite score is < 35
  Why it happens: Self-assessment without calibration to level expectations; or EM hasn't communicated
                  the gap clearly enough for the person to understand where they are
  Response: Honest, specific, evidence-grounded conversation
            "I want to share my honest assessment of where you are against the {{target level}} bar.
            Here's what I see and what I need to see more of: {{specific dimension + evidence gap}}"
            Do NOT: Be ambiguous, soften the assessment, or imply they're closer than they are

Signal 4 — COACHING OPPORTUNITY (specific gap, high coachability)
  Definition: Person's composite score is 30–41; one or two dimensions are holding them back;
              the gap is coachable and an opportunity exists to close it this quarter
  Detection: Specific dimension score ≤ 3; coaching available for that dimension; person is engaged
  Response: Name the gap; design the development opportunity; coach through it
            "You're close. The specific thing standing between you and promotion readiness is {{dimension}}.
            Here's what that looks like at {{target level}}: {{specific}}.
            Here's the opportunity that will close it: {{stretch assignment}}."
            → Invoke: skills/people/coaching.md + skills/people/growth-plans.md

Signal 5 — FLIGHT RISK DUE TO OVERDUE PROMOTION
  Definition: Person is performing at target level; promotion has been delayed or denied;
              engagement signals are declining; flight risk is increasing
  Detection: Composite score ≥ 42; engagement score declining; motivation signals shifting;
             external conversations surfacing
  Response: Retention conversation + honest promotion timeline communication
            "I know your promotion has been delayed. I want to be honest with you about the timeline
            and what I'm doing to change it. Here's specifically what happened and what comes next."
            → Invoke: skills/performance/retention-risk.md for full retention protocol
```

### Step 3 — Communicate Readiness Status Honestly

```
Readiness status communication — quarterly minimum, monthly if in the 35–41 range:

Ready now (score 42–50):
  "Based on what I've observed in the last 3–6 months, you're ready for {{next level}}.
  Here's the evidence I'll be making the case with: {{headline instances}}.
  I'm planning to submit you this cycle. Is there anything about your own assessment that I should know?"

One quarter out (score 35–41):
  "You're close to promotion-ready. Here's where you are: [summary]. Here's the one thing
  I'm still watching for: {{specific dimension + what it needs to look like}}.
  If you close this in the next quarter, I'll be in a position to submit you."

Two to three quarters out (score 25–34):
  "I want to give you an honest assessment. You're developing toward {{next level}} but not ready yet.
  Here's specifically what needs to change: {{1–2 dimensions with specific evidence gaps}}.
  Here's the plan: {{growth plan milestones for those dimensions}}.
  If we execute this plan, I'd expect to be in a position to make the case in {{N} quarters."

Not ready (score ≤ 24):
  "I want to give you an honest picture. At this point, the right focus is on building a
  strong foundation at {{current level}}. Here's what that means: {{specific expectations}}.
  Once you're consistently delivering at the full expectations of {{current level}},
  we can start building toward {{next level}}. That's probably a {{6–12 month}} horizon."

What NOT to say:
  ✗ "You just need to keep doing what you're doing" (when they're not ready — false hope)
  ✗ "You're almost there!" (when composite score is < 25)
  ✗ "It depends on calibration" (when you haven't made the case because you don't believe it)
  ✗ Anything vague enough to be interpreted as "you might get promoted" when the evidence doesn't support it
```

### Step 4 — Track Readiness Trends Over Time

```
Promotion readiness is a trend, not a snapshot.

Trend patterns and their implications:

Improving trend (score increasing 5+ points per quarter):
  "This person is on a development trajectory that will reach readiness in {{N quarters}}"
  Action: Continue the growth plan; maintain the momentum; protect the stretch opportunities

Plateau trend (score stable for 2+ quarters):
  "This person has reached a plateau. The development approach is not producing progress."
  Action: Investigate the plateau cause: wrong opportunity, wrong coaching approach, wrong goal?
  "We've been at the same place for two quarters. What do you think is in the way?"
  → Invoke: skills/people/coaching.md for plateau response

Decline trend (score decreasing):
  "Readiness is declining — something is actively degrading their performance or engagement"
  Action: This is an engagement or burnout signal, not primarily a development issue
  → Invoke: skills/people/engagement.md or skills/people/burnout.md

Ceiling trend (score stuck at 30–34, not progressing):
  This person may have found their optimal level
  They are performing well at current level; the next level may not be the right goal
  "I want to ask an honest question. Is promotion to {{next level}} still what you want?
  Or is excelling at {{current level}} actually the more fulfilling path?"
  Both answers are valid. The EM's job is to ensure the goal is genuinely theirs.
```

---

## Decision Tree

```
What does the readiness assessment reveal?

├── SCORE 42–50 — READY NOW
│   └── FIRST: Have they been submitted? If not, why not?
│       Overdue submission is a failure of EM initiative
│       Submit this cycle; build the case from the evidence file
│       → Invoke: skills/people/promotion.md for submission process

├── SIGNAL 1 — HIDDEN CANDIDATE
│   └── Visibility creation is urgent
│       This week: Name them in a room above the team level
│       This month: Translate impact into calibration evidence
│       This cycle: Submit with a strongly evidenced case
│       "You're ready. I haven't done enough to make that clear to the organization."

├── SIGNAL 2 — SELF-ASSESSED READY, EM DISAGREES
│   └── Have the specific, honest conversation this week — not at the next review cycle
│       Share the composite score and the specific gaps
│       Show them the level expectations; ask them to self-assess against each dimension
│       Build the development plan for the specific gap; name the timeline honestly

├── SIGNAL 4 — COACHING OPPORTUNITY DETECTED
│   └── Name the dimension; design the opportunity; start the coaching this sprint
│       "You're close. Here's the one specific thing standing between you and readiness.
│       Here's what I'm creating for you to close it."
│       Time-box: "If we close this in Q{{N}}, I'll submit you in Q{{N+1}}."

├── SIGNAL 5 — FLIGHT RISK DUE TO OVERDUE PROMOTION
│   └── Retention conversation is more urgent than calibration cycle planning
│       Today: "I want to be honest about what's happening with your promotion.
│       Here's the reality and here's my plan."
│       → Invoke: skills/performance/retention-risk.md for full protocol

├── PLATEAU — SAME SCORE FOR 2+ QUARTERS
│   └── Investigate the plateau: wrong goal, wrong opportunity, burnout, or ceiling
│       "We've been at the same place for two quarters. I want to understand what's in the way."
│       If ceiling: have the honest conversation about optimal level

└── SCORE ≤ 24 — EARLY STAGE
    └── Set clear expectations for current level first
        Do not initiate a promotion track conversation until Meets is consolidated
        "Let's focus on being excellent at {{current level}} before we talk about the next one.
        Here's what that looks like: {{specific expectations}}"
```

---

## Output

### Promotion Readiness Tracker

```
PROMOTION READINESS TRACKER — {{Name}} — {{Current level}} → {{Target level}} — {{date}}

READINESS SCORE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Dimension              | Score (0–10) | Evidence (strongest instance)     | Hard blocker?
Technical Execution    | {{N}}        | {{Specific behavior + impact}}    | {{Y/N}}
Scope and Ownership    | {{N}}        | {{Specific behavior + impact}}    | {{Y/N}}
Communication/Influence| {{N}}        | {{Specific behavior + impact}}    | {{Y/N}}
Leadership             | {{N}}        | {{Specific behavior + impact}}    | {{Y/N}}
Track Record (sustained)| {{N}}       | {{Duration of consistent behavior}}| {{Y/N}}

COMPOSITE: {{N}}/50 | Status: {{Ready now | 1Q out | 2–3Q | Dev needed | Early stage}}

FIVE SIGNAL SCAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Hidden candidate: {{Detected — visibility action: {{specific}} | Not detected}}
Overdue submission: {{Detected — submitting this cycle | Not detected}}
Self/EM disagreement: {{Detected — honest conversation: {{date}} | Aligned}}
Coaching opportunity: {{Detected — dimension: {{specific}} — opportunity: {{specific}} | Not yet}}
Flight risk: {{Detected — retention conversation: {{date}} | Not detected}}

TREND
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q{{N-2}}: {{score}} | Q{{N-1}}: {{score}} | Q{{N}}: {{score}} | Trend: {{Improving 🟢 | Plateau 🟡 | Declining 🔴}}
Projected readiness: {{Q{{N+X}} — if trend continues}}

COMMUNICATION LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Last readiness conversation: {{date}} | Message delivered: {{Ready now | N quarters out | Specific gap}}
Person's response: {{Aligned | Surprised | Disagreed}}
Gap closed: {{Dimension + how}} | New gap: {{Dimension + what's needed}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All five dimensions scored against target level | Base: 65% |
| Five signals scanned | +15% |
| Trend tracked over 3+ quarters | +10% |
| Readiness status communicated to person quarterly | +10% |
| Evidence collected throughout year (not retroactive) | +5% |
| Readiness status communicated ambiguously to protect EM from difficult conversation | −30% |
| Overdue submission tolerated without action | −20% |
| Promotion readiness confused with promotion advocacy (pressure not evidence) | −25% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **False ambiguity** | Person thinks they're 1 quarter out; EM knows the gap is 18 months | Name the score and the gap. False ambiguity wastes the person's developmental time. |
| **Overdue submission** | Person has been at next-level behavior for 9 months; not submitted | Submit when the evidence is there. Every month of delay is a retention risk and an EM failure. |
| **Hidden candidate missed** | Strong performer invisible to calibration; not advocated for | Run the hidden candidate signal monthly. If their name never comes up above the team level, it's an advocacy failure. |
| **Coaching opportunity missed** | Small gap exists; no development plan designed; person waits another quarter | "You're close. Here's the one thing. Here's the opportunity." Design the closing move explicitly. |
| **Flight risk reaction** | Promotion delayed; person disengaging; EM waits for explicit signal | Overdue promotion → declining engagement is a predictable sequence. Intervene at the promotion delay, not after the resignation. |

---

## References

- `skills/people/promotion.md` — EM-side submission process once readiness is confirmed
- `skills/career/promotion/promotion-readiness.md` — IC-perspective readiness; shares dimension framework
- `skills/performance/calibration.md` — Calibration advocacy relies on readiness evidence built here
- `skills/performance/retention-risk.md` — Flight risk due to overdue promotion triggers this skill

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/promotion.md` | Execution: once readiness ≥ 42, promotion skill takes over |
| `skills/performance/calibration.md` | Readiness evidence is calibration evidence; same file |
| `skills/performance/retention-risk.md` | Signal 5 (flight risk, overdue promotion) routes to full retention protocol |
