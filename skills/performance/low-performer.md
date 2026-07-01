# Skill: Low Performer

**Domain**: Performance Management
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Continuous monitoring — act when the pattern is established (3+ instances), not at the formal review cycle

---

## Purpose

Detect low performance early — including the quiet underperformance that is invisible to the organization until it has compounded for months — and respond with the appropriate intervention matched to the root cause: coaching for capability gaps, direct feedback for motivation and behavior gaps, and structured performance management when the pattern has not responded to intervention.

**What the EM does automatically**: When low performance signals appear, the EM:
1. Distinguishes quiet underperformance (the most dangerous and most common type) from visible underperformance
2. Classifies the root cause — capability, motivation, fit, or circumstance — before designing the response
3. Intervenes early, when the cost is low, rather than waiting for the formal review cycle
4. Separates the decision to manage performance from the decision about the person's future
5. Documents every intervention in real-time — not reconstructed later

**Ethical principle**: The manager who avoids a low-performance conversation — to protect their own comfort or to avoid a difficult interaction — fails two parties: the person who deserved honest feedback and the team who has absorbed the consequence of under-delivery. Specific, early, and honest feedback is not cruelty. It is the most respectful thing a manager can do for someone whose performance is not meeting expectations. The alternative — silence, then sudden action at a formal review — is genuinely unfair.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Performance evidence** | Specific, observable instances of below-expectation delivery |
| **Level expectations** | The defined expectations for the person's current level |
| **Pattern duration** | How long the underperformance has been observable |

### Optional
| Input | Description |
|---|---|
| **Root cause hypothesis** | Whether this appears to be capability, motivation, fit, or circumstance-driven |
| **Prior feedback given** | What has already been said, when, and how it was received |
| **Organizational context** | Whether team, product, or org changes have affected the person's opportunity to perform |

---

## Analysis

### Step 1 — Detect Quiet Underperformance

```
Quiet underperformance is the most dangerous low-performance pattern because:
  — It is invisible to calibration until it has accumulated for 6–12 months
  — The person appears engaged: attends meetings, communicates actively, seems busy
  — The EM often feels uncertain: "Am I being unfair? They seem to be trying."
  — The team absorbs the gap, usually silently — until the strongest members start leaving

Quiet underperformer profile:
  Delivers on: Assigned tasks (but slowly or with significant help); meeting attendance;
               Slack responsiveness; participation in team rituals
  Does not deliver: Proactive ownership; initiative beyond what was assigned;
                    scope above the minimum bar for their level; work that others can build on;
                    measurable impact beyond task completion
  Net effect: They occupy a full engineering head count with partial engineering output

Detection questions (run monthly per direct report):
  "What has this person shipped in the last 6 weeks that I could name specifically?"
  "If they were absent from the last sprint, what work would not have happened?"
  "When I compare their output to the expectations at their level, what's the gap?"
  "Have their peers' names come up in cross-team conversations this month? Has theirs?"

Quiet underperformance red flags:
  ✗ Task completion rate is acceptable; initiative rate is near zero
  ✗ Every PR requires extensive review feedback before it meets the bar
  ✗ They've been "working on" the same area for 3+ sprints without shipping
  ✗ Their name never comes up when the team needs someone to take a lead
  ✗ Peers at the same level are measurably outpacing them in scope and influence
  ✗ They frequently "almost have it ready" — perpetually close but perpetually incomplete
  ✗ Their work requires more rescuing than it contributes; net burden to team velocity

The "busy signals" trap:
  Slack messages, meeting attendance, and visible effort are not performance signals.
  They are activity signals. Activity ≠ Impact.
  The question is not "Are they working?" but "What is the team getting for that work?"
```

### Step 2 — Classify the Root Cause

```
Root cause determines intervention. The same behavior (late deliveries, low quality) has
three entirely different causes and requires three entirely different responses.

Root cause 1 — Capability gap (can't do it)
  Definition: The person lacks the technical skill, domain knowledge, or problem-solving
              approach required to perform at their level
  Signal: They are trying; effort is visible; results are below bar consistently
          They ask for help appropriately; struggle with complexity above their current skill
          Often seen in: Overhired (hired at level above their demonstrated capability);
                        promotion before readiness; rapid technology change; role change
  Response: Coaching + structured skill development; adjust scope until skill catches up
            Do NOT PIP someone for a capability gap — address it with development first
  Timeline: 60–90 day development plan with measurable skill milestones
  → Invoke: skills/people/coaching.md + skills/people/growth-plans.md

Root cause 2 — Motivation gap (won't do it)
  Definition: The capability exists; the will to apply it consistently does not
  Signal: Inconsistent performance — strong when interested; below bar when not
          High quality on self-selected work; chronic underdelivery on assigned work
          Often seen in: Role misalignment (wrong work for this person);
                        career frustration; disengagement from team or company direction;
                        unaddressed conflict
  Response: Direct conversation about the pattern and its consequences;
            explore root cause of motivation gap; address structural causes
  Timeline: 30-day behavioral expectation + follow-up; if no change → performance management
  → Invoke: skills/people/motivation.md; skills/people/engagement.md

Root cause 3 — Fit gap (wrong role, team, or company)
  Definition: The person may be capable and motivated, but not for this specific work, team,
              or organization. The mismatch is structural, not a character or skill failure.
  Signal: Has performed well in other roles or contexts; struggle is specific to this environment;
          they themselves often sense the misalignment
          Often seen in: Internal transfers that didn't land; post-acquisition integration;
                        team culture mismatch; career pivot that didn't translate
  Response: Honest, non-punitive conversation about fit;
            explore internal transfer if appropriate; support the transition honestly
  Timeline: 30-day exploration of alternatives; if no fit found → managed transition

Root cause 4 — Circumstance gap (life or org events temporarily degrading performance)
  Definition: Performance has been adequate or strong historically; a specific event has
              caused a temporary drop
  Signal: Performance drop correlates with a specific event (personal crisis, team incident,
          reorg, bereavement)
          They may be embarrassed about the cause; may be hiding it
  Response: Acknowledgment and short-term accommodation; not performance management
            "I've noticed a change in your work. I want to make sure you're okay.
            What's going on? I'm asking about you, not the work."
  Timeline: 4–8 week accommodation; assess recovery; escalate to HR if leave is needed
  Do NOT: Performance manage a circumstance gap. This causes lasting trust damage.
```

### Step 3 — Stage the Intervention

```
Intervention sequence (match urgency to pattern duration):

Stage 0 — Single instance
  Observations: One below-bar deliverable; one missed commitment
  Response: Feedback conversation (SBI); document the instance
  Do NOT: Jump to performance management from a single instance
  → Invoke: skills/people/feedback.md for SBI delivery

Stage 1 — Developing pattern (2–3 instances, same category)
  Observations: Same type of underperformance repeated; feedback from Stage 0 not sustained
  Response: Direct pattern conversation: "This is the second/third time I've seen this.
            I want to understand what's getting in the way."
  Explore the root cause. Make the expectation explicit.
  Set a specific 30-day observation period with named milestones.
  Document the conversation and the milestones.

Stage 2 — Established pattern (4+ instances, or sustained performance below bar for 6+ weeks)
  Observations: Pattern has not responded to Stages 0–1; impact on team delivery is measurable
  Response: Formal performance conversation with written documentation
            "I've shared feedback about this pattern {{N}} times. The performance has not improved
            to the level I need. I want to be direct about what will happen next: {{specific consequence}}."
  HR notification recommended at this stage.
  Begin performance improvement plan preparation.
  → Invoke: skills/performance/performance-improvement.md

Stage 3 — Performance Improvement Plan
  Observations: Stage 2 hasn't produced sustained improvement; pattern continues
  Response: Formal PIP with HR involvement
  → Invoke: skills/performance/performance-improvement.md for full PIP protocol
```

### Step 4 — Document in Real Time

```
Documentation failure is the most common reason performance management fails legally and ethically.

Documentation principles:

Document each instance immediately:
  Date + Specific behavior + Specific impact + Conversation held + Commitment made
  "On {{date}}, {{name}} submitted the authentication PR 6 days past the sprint commitment.
  The delay blocked the security audit scheduled for the following Monday.
  I gave feedback using SBI on {{date}}. They acknowledged the delay and committed to
  flagging blockers within 24 hours of identifying them in the future."

Do NOT:
  ✗ Reconstruct documentation from memory 4 months later
  ✗ Document interpretations instead of behaviors ("they're checked out")
  ✗ Document in a way that assumes an outcome ("clearly they need to be let go")
  ✗ Leave significant gaps: "I knew about this but didn't write it down"

Documentation for each stage:
  Stage 0: Personal notes — date, behavior, impact, feedback given
  Stage 1: Shared record — email summary of the conversation sent to the person
           "Per our conversation today: {{summary of what was discussed and committed to}}"
  Stage 2: Formal written documentation — given to HR; copy to person
  Stage 3: PIP — formal document; signed by both parties; HR required

The email summary (Stage 1+):
  After every significant performance conversation, send a written summary:
  "Thanks for the conversation today. I want to capture what we discussed so we're aligned.
  {{Summary}}. The specific expectations going forward are {{expectations}}.
  We'll check back in on {{date}}."
  This serves two purposes: clarity for the person; documentation for the record.
```

### Step 5 — Protect the Team Without Scapegoating

```
The team impact of low performance must be addressed — but never by scapegoating.

Team impact of unaddressed underperformance:
  — High performers absorb the gap; they notice and resent it
  — Team velocity suffers but the cause is invisible to the team
  — If the low performer is tenured or senior, the implicit message is "standards don't apply here"
  — When the low performer eventually exits, the team often says "that was overdue"

What the EM can communicate to the team:
  ✓ Set clear expectations for the whole team about delivery standards
  ✓ Address load imbalance by redistributing work (not by naming why)
  ✓ Recognize high performers specifically and specifically (raises the visible bar)
  ✗ Do NOT: name the low performer to the team
  ✗ Do NOT: invite peer pressure as a management tool
  ✗ Do NOT: allow the team to speculate and fail to address the speculation

When team members raise the issue:
  "I've noticed {{person}} seems to be struggling with delivery — it's affecting the rest of us."
  Response: "I hear your concern. I want you to know I'm aware of it and addressing it.
  I can't share the details of my conversations with them. What I can tell you is that
  I'm not ignoring it and it won't continue indefinitely."
```

---

## Decision Tree

```
What does the low performance assessment reveal?

├── QUIET UNDERPERFORMANCE — FIRST DETECTION
│   └── Do not wait for the pattern to confirm itself over months
│       Name it now, specifically: "I want to talk about what I'm observing in your output."
│       Run the root cause classification before the conversation
│       Stage 0 response: SBI feedback; document; observe for 30 days

├── ROOT CAUSE: CAPABILITY GAP
│   └── Do not performance manage a capability gap
│       "I want to help you close this gap. Here's what I see and here's what we're going to do."
│       60–90 day development plan; coaching; scope adjustment
│       → Invoke: skills/people/coaching.md + skills/people/growth-plans.md
│       If capability gap does not close after 90 days of focused development: reassess fit

├── ROOT CAUSE: MOTIVATION GAP
│   └── Direct conversation: "I'm seeing a pattern where performance is strong when
│       you're interested and below bar when you're not. I need consistency. What's going on?"
│       30-day behavioral expectation; if no improvement → Stage 2
│       → Invoke: skills/people/motivation.md to understand root cause of motivation gap

├── ROOT CAUSE: FIT GAP
│   └── Honest, non-punitive conversation: "I want to explore whether this is the right role."
│       Explore internal transfer; if none available, support dignified transition
│       Do not PIP a fit gap if the person is willing to find a better-fit role voluntarily

├── ROOT CAUSE: CIRCUMSTANCE GAP
│   └── Accommodate first; do not performance manage
│       "I want to understand what's happening. What do you need from me right now?"
│       4–8 week accommodation; check in regularly; involve HR if leave is warranted
│       Reassess performance only after the circumstance has stabilized

├── ESTABLISHED PATTERN — NO RESPONSE TO STAGE 1
│   └── Escalate to Stage 2; notify HR
│       "We've had this conversation {{N}} times. The performance hasn't improved.
│       I need to be direct about what happens next."
│       → Invoke: skills/performance/performance-improvement.md

└── TEAM IMPACT BECOMING VISIBLE
    └── The team is absorbing the gap; the EM must accelerate the timeline
        Do not let the team's patience protect someone whose performance is not improving
        Accelerate to Stage 2 if Stage 1 milestones are not met; notify HR
```

---

## Output

### Low Performance Assessment and Intervention Record

```
LOW PERFORMANCE ASSESSMENT — {{Person}} — {{date}}

DETECTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Type: {{Quiet underperformance | Visible underperformance | Recently emerged}}
Duration: {{N weeks/months}} | Pattern established: {{Y (3+ instances) | N (1–2 instances)}}
Team impact visible: {{Y/N}}

Quiet underperformance indicators detected:
  Task completion without initiative: {{Y/N}}
  Perpetual "almost ready" pattern: {{Y/N}}
  Net positive / net neutral / net negative contribution to team velocity: {{assessment}}

ROOT CAUSE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Root cause: {{Capability | Motivation | Fit | Circumstance}}
Evidence: {{Specific observed signals supporting this classification}}
Ruling out: {{Why other root causes are less likely}}

INTERVENTION RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Stage: {{0 | 1 | 2 | 3 (PIP)}}
Instance log:
  {{date}}: {{Behavior observed}} → {{Feedback given}} → {{Commitment made}}
  {{date}}: {{Behavior observed}} → {{Feedback given}} → {{Commitment made}}
Written summary sent: {{Y/N — date}}
HR notified: {{Y/N — at Stage 2+}}

EXPECTATIONS SET
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Specific behavior expected: {{Observable and measurable}}
Timeline: {{N weeks}} | Check-in date: {{date}}
Consequence if not met: {{Named explicitly to the person}}

FIVE SIGNAL STATUS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Coaching opportunity present: {{Y — dimension: {{specific}} | N}}
Circumstance gap ruled out: {{Y/N}}
Fit gap assessed: {{Internal transfer explored: Y/N}}
→ Next action: {{Specific, dated}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Quiet underperformance checklist run | Base: 65% |
| Root cause classified before intervention | +15% |
| Intervention staged (0→1→2→3) | +10% |
| Every instance documented in real time | +10% |
| Circumstance gap ruled out | +5% |
| Intervention skipped to PIP from first instance | −30% |
| Documentation reconstructed retrospectively | −25% |
| Underperformance tolerated to avoid conversation | −40% (disqualifying) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Avoidance** | Pattern established; no feedback given; EM "hoping it will improve" | The conversation must happen at Stage 0 or 1. Delay produces Stage 3 situations that require HR and cause more pain for everyone. |
| **Capability gap PIPs** | Person can't do the work; EM writes a PIP | PIPs are for motivation and behavior, not skill. Develop the capability first; manage performance only if development fails. |
| **Circumstance gap performance management** | Person in personal crisis; EM manages performance | Accommodate first. Performance-managing someone in a crisis produces attrition and legal risk. |
| **Activity counted as performance** | Person attends meetings and sends Slack messages; EM rates them as engaged | Measure impact, not activity. "What did the team get for their work?" is the question. |
| **Documentation retroactive** | First documentation happens at Stage 2 or Stage 3 | Document each instance at Stage 0. Retroactive documentation is unreliable and unfair. |

---

## References

- `skills/people/feedback.md` — SBI framework used at Stage 0 and Stage 1 interventions
- `skills/people/coaching.md` — Capability gap response; coaching to close the skill gap
- `skills/people/growth-plans.md` — Structured development plan for capability gap root cause
- `skills/performance/performance-improvement.md` — Stage 3 escalation; full PIP protocol
- `skills/performance/calibration.md` — Low performance evidence building for calibration sessions

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/performance/performance-improvement.md` | Stage 2–3 escalation from this skill into formal PIP |
| `skills/people/coaching.md` | Capability gap → coaching is the first response before performance management |
| `skills/people/motivation.md` | Motivation gap root cause identified here; full protocol there |
