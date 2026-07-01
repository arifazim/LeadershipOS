# Skill: Recognition

**Domain**: Performance Management
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Continuous (individual recognition within 24 hours of achievement) + Monthly (team recognition review) + Quarterly (recognition system audit)

---

## Purpose

Design and deliver recognition that actually reinforces the behaviors and impact the team needs — specific, timely, individual, and connected to the work that matters — rather than generic appreciation that engineers learn to discount within weeks of receiving it.

**What the EM does automatically**: In the recognition practice, the EM:
1. Delivers specific recognition within 24 hours of the achievement — connected to the observable behavior, not the outcome alone
2. Matches recognition style to individual preference — public vs. private vs. peer vs. deferred
3. Actively surfaces work that is invisible to the organization and recognizes it explicitly
4. Monitors for recognition gaps — people who are consistently unrecognized or whose recognition is chronically out of proportion to their contribution
5. Detects when recognition inflation has made recognition meaningless — and recalibrates

**Ethical principle**: Recognition given indiscriminately loses its function. The EM who recognizes everyone for everything has created a culture where recognition signals nothing and means nothing. Specific, timely, differentiated recognition reinforces the behaviors the team needs. Generic, consistent, undifferentiated recognition trains the team to ignore it. Recognition is a signal — design it to carry information.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Achievement or behavior** | The specific action, decision, or delivery that is being recognized |
| **Individual recognition profile** | How this person prefers to receive recognition — from `skills/people/motivation.md` |
| **Audience** | Who should hear the recognition — team, cross-functional partners, leadership |

### Optional
| Input | Description |
|---|---|
| **Impact data** | Measurable outcome connected to the behavior being recognized |
| **Prior recognition history** | When this person was last recognized and for what — to detect gaps |
| **Team recognition pattern** | Whether some team members are being systematically over- or under-recognized |

---

## Analysis

### Step 1 — Classify Recognition Type and Match to Individual

```
Recognition is not one-size-fits-all. The same message delivered in the wrong format
has zero or negative effect.

Individual recognition profiles (from skills/people/motivation.md):

Public recognizer:
  They want their name said, their work acknowledged, and the audience to know it was them.
  Demotivated by private-only recognition when public was warranted.
  Formats: All-hands shout-out, team channel mention, email to leadership that includes their name
  Trap: Over-recognition dilutes the signal; public recognition must remain specific

Private recognizer:
  Public recognition makes them uncomfortable; they experience it as a form of exposure
  They prefer the acknowledgment in 1:1 or via direct message — heartfelt and specific
  Formats: 1:1 verbal, direct Slack/email, handwritten note if appropriate
  Trap: Forcing public recognition to seem "fair" actually punishes them for performing well

Peer recognizer:
  Cares more about what their peers think than what their manager thinks
  Most energized when teammates recognize their contribution directly
  Formats: Peer-to-peer shout-outs; structured peer recognition programs; team retrospectives
  EM action: Create the conditions for peer recognition; don't own all the recognition

Deferred recognizer:
  Motivated by long-term reputation; wants to be known for the right things over time
  Cares less about in-the-moment recognition and more about career-defining attribution
  Formats: Promotion packet contribution; named in executive forums; "you built the thing
           that {{outcome}}" over 12+ month horizon
  EM action: Keep a record of their contributions; cite them in calibration; sponsor their name

Recognition across the four types:
  Most engineering teams contain all four types
  The EM who only uses one format will actively demotivate three quarters of the team
  Ask: "How do you like to be recognized when you do something well?" — and use the answer
```

### Step 2 — Deliver Specific Recognition (SBI for Recognition)

```
Generic recognition: "Great work on the release! You guys killed it."
  — Who specifically? What specifically? Why specifically does it matter?
  — This is a compliment, not recognition. Engineers learn to discount it quickly.

Specific recognition using the SBI framework:
  S (Situation): The specific context
  B (Behavior): The specific action or decision
  I (Impact): The specific, measurable consequence

Template:
  "In {{situation}}, you {{specific behavior}}, and the impact was {{specific outcome}}."

Examples:

Infrastructure work (hidden contribution):
  Generic: "Thanks for keeping the platform running!"
  Specific: "The Kubernetes migration you ran over the last 6 weeks has reduced our deployment
  failures from 1 in 8 deploys to 1 in 47. That's a 5× reliability improvement. The product
  team doesn't know it yet, but they're about to ship on a platform they can actually trust."

Interpersonal leverage (invisible contribution):
  Generic: "You've been a great mentor to the new engineers."
  Specific: "Three of our L3s told me separately that the depth of your code reviews changed
  how they approach system design. One quoted your comment on the session service PR specifically.
  That's the kind of leadership that raises the team's floor — not just your ceiling."

Crisis performance:
  Generic: "You were amazing during the incident."
  Specific: "During the 3am incident on Tuesday, you were the first on-call response and you had
  a diagnostic hypothesis within 12 minutes of the alert. The CEO joined the call 20 minutes in
  and you walked him through the status in plain language without making him feel the urgency
  was under-managed. That's exactly how I want us to show up under pressure."

The specificity test:
  Could this recognition apply to anyone else on the team in this situation?
  If yes: it's not specific enough. Add the one detail that makes it about this person.
```

### Step 3 — Detect Recognition Gaps

```
Recognition gaps are systematic under-recognition of specific people or specific types of work.

Individual recognition gap signals:
  — Person has not been recognized in more than 4 weeks despite active contribution
  — Person's contributions are mentioned by others ("the API was great") but not attributed
  — Person's work is only recognized when it visibly succeeds; their process is never acknowledged
  — Person has been promoted or given significant responsibility without explicit acknowledgment
    of what they did to earn it

Work type recognition gaps (structural):
  Invisible work chronically under-recognized:
    ✗ On-call reliability work: "Nothing broke" is rarely recognized
    ✗ Code review quality: "They reviewed a lot of PRs" vs. the specific insight that prevented a production bug
    ✗ Documentation: "They wrote the runbook" vs. "The runbook they wrote saved 6 hours in the last incident"
    ✗ Junior engineer development: "They mentored {{person}}" vs. "{{Person}} went from uncertainty about
       their first component design to independently architecting a service in 8 weeks, specifically
       because of the pairing and review they received"
  
  Visible work over-recognized:
    Launch-day features that were built by the team but recognized by the presenter
    Sales-adjacent demos and integrations that are customer-visible
    Executive-requested projects regardless of their technical complexity

Recognition pattern audit (monthly):
  For each direct report: When was the last specific recognition? What was it for?
  Calculate recognition frequency vs. contribution frequency
  Identify anyone whose contributions consistently exceed their recognition
  Identify anyone whose recognition consistently exceeds their contributions (recognition inflation)
```

### Step 4 — Scale Recognition to Audience

```
Recognition calibrated to audience sends a signal about scope and importance.

Audience levels and when to use each:

Private (1:1 or DM):
  When: First recognition for a new behavior; private recognizer profile; sensitive context;
        any positive feedback about a personal quality rather than a specific work output
  Risk: Under-recognition if used exclusively; the person feels their work is invisible above the EM

Team channel or meeting:
  When: Team-visible contribution; peer recognition opportunity; reinforcing a team norm
  Risk: Over-recognition inflation if used too frequently; every "@" message reduces the value of the next

Skip-level or cross-functional:
  When: Cross-functional contribution; work that affected another team's success; building reputation
  Format: Forward the recognition from cross-functional partner with attribution;
           or proactively send: "I wanted to make sure you know that {{Name}} from my team
           built {{work}} that unblocked your Q3 initiative. They deserve the credit."
  Frequency: Monthly for high performers; quarterly minimum for the team

Executive audience:
  When: Strategic contribution; executive-level impact; promotion track building
  Format: "In the VP review last week, I mentioned that {{Name}}'s architecture decision
           reduced our infra cost by $40K and made our enterprise readiness target achievable.
           I want you to know I said your name in that room."
  This is sponsorship, not just recognition.

Peer recognition:
  When: A peer's contribution specifically benefited this person's work
  EM role: Create the structure for peer recognition; don't do it all yourself
  Format: Retro shout-outs; peer review nominations; public "thank you" in team channel
```

### Step 5 — Prevent Recognition Inflation

```
Recognition inflation occurs when recognition becomes so frequent and generic that it carries no signal.

Signs of recognition inflation:
  — Every sprint review ends with "great job everyone!"
  — The #kudos channel has 20+ messages per week; no one reads them
  — Engineers say "thanks" when recognized with the same tone they say "thanks" to being handed coffee
  — Recognition doesn't change behavior — because it's not connected to specific behavior

Inflation prevention:

Maintain selectivity: Not every contribution warrants a public shout-out
  The engineer who does their job consistently well is valued by consistent investment, career development,
  and fair compensation — not by weekly public recognition
  Reserve specific public recognition for above-baseline behavior

Connect to behavior, not outcome:
  Recognizing outcomes alone teaches luck and visibility, not contribution
  "The launch went well!" (outcome) → everyone gets credit for good luck
  "{{Name}}'s pre-launch reliability work meant we had 99.8% uptime on launch day" → specific contribution

Asymmetric recognition:
  The strongest recognition signal is earned, not ambient
  A single specific, public recognition from the EM is more motivating than weekly generic thanks
  Protect its signal value by using it deliberately

Negative recognition inflation (criticism inflation):
  Teams where criticism is constant and recognition is rare have the same problem in reverse
  The signal-to-noise ratio is destroyed by constant negative signal
  Monitor: Am I giving 3–5 specific recognitions for every critical feedback conversation?
  This is not a mandatory ratio — it is a health check
```

---

## Decision Tree

```
What does the recognition assessment reveal?

├── ACHIEVEMENT JUST OCCURRED — RECOGNIZE WITHIN 24 HOURS
│   └── Identify: Public/Private/Peer/Deferred — and match the format
│       Write the SBI version before sending/saying anything
│       Test: "Could this recognition apply to anyone? If yes — add the specific detail."
│       Deliver; record it in the recognition log

├── RECOGNITION GAP DETECTED (4+ WEEKS, ACTIVE CONTRIBUTOR)
│   └── This is urgent for high performers and private recognizers — they feel invisible
│       Review: What did they do in the last 4 weeks that deserved acknowledgment?
│       Deliver: "I realized I haven't specifically acknowledged {{work}} yet. I want to fix that."
│       Address: Why wasn't this recognized when it happened? Close that loop.

├── INVISIBLE WORK RECOGNITION NEEDED
│   └── Infrastructure, reliability, mentorship, code review quality
│       Translate the invisible impact into business terms before recognizing
│       "Prevented N incidents" | "Enabled N engineers to grow in this way" | "Saved N hours/week"
│       Use executive audience level if appropriate — this work often needs sponsorship, not just thanks

├── RECOGNITION INFLATION DETECTED
│   └── The team discounts recognition; it has stopped being signal
│       Reset: Reduce generic recognition to near-zero
│       Rebuild: Be very specific and selective for 4–6 weeks
│       Signal to the team that recognition is meaningful again by making it specific and rare

├── PEER RECOGNITION ABSENT
│   └── All recognition flows from the EM; peers don't recognize each other
│       Create the structure: Retro shout-out section; #kudos format with required specificity
│       Model it: Recognize a peer-contributed recognition in the next team meeting
│       Over time: the team develops the habit; EM's direct recognition becomes one input, not the only one

└── RECOGNITION PATTERN IS HEALTHY
    └── Continue; don't let busy sprints create a gap
        Monthly audit: check the frequency and specificity against the team roster
        Quarterly: confirm each person's recognition profile is still accurate
```

---

## Output

### Recognition Log and Pattern Report

```
RECOGNITION LOG — {{Team}} — {{date}}

INDIVIDUAL RECOGNITION RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Name       | Profile        | Last recognized | Content (specific)     | Audience level | Gap?
{{Name}}   | Public         | {{date}}        | {{SBI summary}}        | Team channel   | N
{{Name}}   | Private        | {{date}}        | {{SBI summary}}        | 1:1            | N
{{Name}}   | Deferred       | 6+ weeks ago    | {{last known}}         | — none         | Y → act

WORK TYPE AUDIT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
On-call reliability work recognized this month: {{Y/N}}
Code review quality recognized: {{Y/N}}
Junior engineer development recognized (attributing the developer): {{Y/N}}
Documentation/runbook work recognized: {{Y/N}}
Under-recognized work type this month: {{specific}} — action: {{recognize this week}}

INFLATION CHECK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Generic recognition events (no SBI, no specificity) this month: {{N}}
Specific recognition events this month: {{N}}
Inflation risk: {{Y — recalibrate | N}}

SPONSORSHIP RECOGNITION (above-team visibility)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Name}} mentioned in executive forum: {{Y/N}} | Context: {{what was said}}
Skip-level recognition sent: {{Y/N}} | For: {{name}} — {{behavior}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Individual recognition profiles used | Base: 65% |
| Recognition is specific (SBI format) | +15% |
| Delivered within 24 hours of achievement | +10% |
| Recognition gap audit run monthly | +10% |
| Invisible work types explicitly recognized | +5% |
| Generic recognition used exclusively ("great job everyone!") | −30% |
| Recognition inflation not monitored | −15% |
| One recognition style applied to all individuals | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Generic recognition** | "Great sprint everyone!" after every sprint | Write the specific behavior and impact before delivering. If you can't, you haven't observed closely enough. |
| **Recognition style mismatch** | Public recognition delivered to a private recognizer; they look uncomfortable | Ask: "How do you like to be recognized?" Use the answer. |
| **Invisible work gap** | Infrastructure and reliability engineers chronically unrecognized | Audit work types monthly. If a person's contributions aren't being named, they will not feel valued — regardless of compensation. |
| **Recognition inflation** | Team discounts all recognition; "thanks" is ambient noise | Reduce and recalibrate. Be selective. Use specificity to rebuild signal value. |
| **Sponsorship omitted** | EM recognizes privately; high performer never becomes visible above the team | Sponsorship — saying their name in rooms they're not in — is recognition that compounds. |

---

## References

- `skills/people/motivation.md` — Individual recognition profiles; how each person prefers to be acknowledged
- `skills/performance/high-performer.md` — High performer recognition design; invisible contribution surfacing
- `skills/performance/calibration.md` — Recognition history feeds calibration evidence
- `skills/people/feedback.md` — Positive feedback uses the same SBI framework as developmental feedback

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/motivation.md` | Recognition style is one of the secondary motivators; profile sourced there |
| `skills/performance/high-performer.md` | High performer recognition includes sponsorship, not just appreciation |
| `skills/performance/calibration.md` | Well-documented recognition becomes calibration evidence at review time |
