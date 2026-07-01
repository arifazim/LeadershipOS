# Skill: Engagement

**Domain**: People Leadership Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (team engagement score) + Weekly (individual signal monitoring in 1:1s) + On-demand (flight risk detected)

---

## Purpose

Monitor and protect the engagement of every direct report — detecting the early signals of disengagement before they become attrition, and responding with the specific interventions that address root cause rather than symptoms. Engagement is the leading indicator of retention, performance, and team health.

**What the EM does automatically**: On a monthly cadence, the EM:
1. Scores each direct report against five engagement dimensions
2. Identifies the earliest signal of declining engagement — which is always present weeks before any stated intention to leave
3. Conducts stay interviews to understand what keeps each person engaged before a crisis makes the question urgent
4. Responds to flight risk with the specific intervention matched to the root cause
5. Tracks team-level engagement trends, not just individual cases

**Ethical principle**: Engagement monitoring is not surveillance. Its purpose is to understand what each person needs from their work and their manager — and to respond. An EM who monitors engagement to prevent attrition as a business metric (without caring what the person actually needs) has misunderstood the purpose. The question is: "What does this person need to find their work meaningful?" — not "How do I keep them here?"

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Observable behavior signals** | Changes in participation, output quality, communication, and energy since last assessment |
| **1:1 themes** | What topics have come up; what has changed in tone, frequency, or depth of sharing |
| **Baseline** | What "engaged" looks like for this specific person — their normal, not a generic standard |

### Optional
| Input | Description |
|---|---|
| **Team engagement survey data** | Anonymous sentiment data if available from pulse surveys |
| **Peer observations** | What teammates are noticing about each other (use carefully; not surveillance) |
| **Organizational context** | Recent changes (reorgs, priority shifts, incidents) that may be affecting engagement |

---

## Analysis

### Step 1 — Score Five Engagement Dimensions

```
Dimension 1: Energy and Enthusiasm (0–20 pts)
  What to assess: Is the person bringing energy to their work, or going through motions?
  Signals of high engagement: Initiative, goes beyond the minimum, brings ideas
  Signals of declining engagement: Shorter responses, less initiative, "just doing what was asked"
  
  Scoring:
    18–20: Visibly energized; proactively contributes beyond their scope
    12–17: Normal engaged baseline; reliable contribution
    6–11: Noticeably below their normal; investigating warranted
    0–5:  Minimal energy; going through motions; immediate action required

Dimension 2: Quality and Care (0–20 pts)
  What to assess: Is the person maintaining or dropping their standards?
  Signals of high engagement: Same or improved quality; takes pride in work; catches own mistakes
  Signals of declining engagement: PR quality dropping, less thorough reviews, "good enough" framing
  
  Scoring (same scale: 18–20 / 12–17 / 6–11 / 0–5)

Dimension 3: Connection and Belonging (0–20 pts)
  What to assess: Is the person connected to the team and the organization?
  Signals of high engagement: Participates in team rituals, helps peers, attends optional events
  Signals of declining engagement: Pulls back from team events, goes head-down solo, less informal chat
  
  Note: Introversion ≠ low belonging; assess against their own baseline, not an extroversion standard

Dimension 4: Growth and Learning (0–20 pts)
  What to assess: Is the person learning and developing?
  Signals of high engagement: Working on growth plan, asks for feedback, takes on challenges
  Signals of declining engagement: Repeating same tasks, avoiding stretch, not following up on IDP
  
  Scoring (same scale)

Dimension 5: Alignment and Purpose (0–20 pts)
  What to assess: Does the person understand and believe in why their work matters?
  Signals of high engagement: References user impact, understands company direction, connects work to outcomes
  Signals of declining engagement: "I just do what I'm told," disconnection from outcomes, cynicism about direction
  
  Scoring (same scale)

Composite engagement score:
  Score = Sum of five dimension scores (0–100)
  
  Score interpretation:
    80–100: Highly engaged — watch for sustaining conditions; prevent plateau
    60–79:  Engaged — normal range; monitor for drift in any single dimension
    40–59:  At risk — investigate root cause; act within 2 weeks
    20–39:  Significantly disengaged — act this week; flight risk is high
    0–19:   Actively disengaged — flight risk is critical; have the conversation now
```

### Step 2 — Detect Flight Risk Signals

```
Flight risk signals (ordered from earliest to latest):

Early (4–8 weeks before flight):
  — Motivation drops in one dimension without explanation
  — Less sharing in 1:1s; shorter, more closed answers
  — Questions about career become abstract ("I wonder what it's like to work at X")
  — Visible energy on personal projects but flatness on work
  — First external job inquiry or recruiter conversation (if mentioned)

Mid (2–4 weeks before flight):
  — LinkedIn profile updated or suddenly active
  — Detachment from team roadmap discussions ("that's a you problem, not mine")
  — Peer feedback requests dry up
  — Taking more PTO than usual or sudden interest in benefit details
  — Compensation mentioned more than twice in different contexts

Late (1–2 weeks before flight):
  — "I've been thinking about my career a lot lately" without follow-up
  — Knowledge transfer happening organically (documenting their work without being asked)
  — Meeting requests with their manager's manager
  — Direct statement: "I'm getting some external offers"

Response timing matters:
  Early signal response: Curiosity and career conversation; not panic
  Mid signal response: Direct retention conversation; address root cause
  Late signal response: Honest conversation about what would keep them and whether it's possible
  Post-resignation: Do not counter-offer reflexively; understand why they're leaving first
```

### Step 3 — Conduct Stay Interviews

```
Stay interview purpose:
  Understand what keeps each person engaged before they think about leaving
  Not an exit interview — that is too late
  Not a satisfaction survey — that collects ratings, not insight

Stay interview frequency:
  Once per quarter per direct report — embedded in 1:1 or as a dedicated conversation

Stay interview questions:
  "What keeps you here?"
  "When do you feel most engaged with your work?"
  "What's the best part of your job right now?"
  "What part of your job do you wish you could change?"
  "What would you need to see from us for this to still feel like the right place in a year?"
  "If you were designing your ideal role, what would it look like?"
  "Is there anything keeping you here out of obligation rather than choice?"

What to do with stay interview answers:
  Act on what is actionable: If they name a specific frustration that can be addressed, address it
  Be honest about what isn't: "I can't change {{thing}}. I want to be honest about that."
  Track the answers: The gap between stay interview answers and the environment is the retention risk
  
  Do NOT:
  Ask stay interview questions and then not act
  Promise things that aren't in your authority to deliver
  Use the answers to identify risk without addressing root cause
```

### Step 4 — Respond to Root Cause, Not Symptom

```
Engagement root causes and matching responses:

Root cause: Role misalignment (wrong work for this person)
  Signal: Engagement high in some contexts, low in the majority of their role
  Response: Redesign the role toward what energizes them; identify the transfer of the demotivating work
  → Invoke: skills/people/career-development.md

Root cause: Relationship breakdown (manager or peer conflict)
  Signal: Withdrawal correlated with a specific person or interaction
  Response: Address the interpersonal dynamic directly
  → Invoke: skills/conflict/difficult-conversations.md or skills/conflict/mediation.md

Root cause: Career stagnation (no visible path forward)
  Signal: Growth and Purpose dimensions both declining; mentions of other opportunities
  Response: Career conversation; concrete development milestones; sponsor the person's visibility
  → Invoke: skills/people/career-development.md

Root cause: Organizational disillusionment (trust in company or leadership lost)
  Signal: Cynicism language increasing; "why does this matter anyway?" framing
  Response: Honest conversation about what's in and out of the EM's control; don't dismiss
  "I hear your frustration. Some of what you're describing is beyond my authority.
  Here's what I can and can't do."

Root cause: Compensation gap (feel undervalued financially)
  Signal: Compensation mentioned repeatedly; peer comparisons surfacing
  Response: Market rate assessment; compensation adjustment if gap exists; honest answer if it doesn't
  Do not: Offer recognition, career conversations, or coaching as a substitute for a pay gap

Root cause: Burnout (exhaustion has depleted engagement)
  Signal: Energy dimension collapsed across all work; not specific to context
  Response: → Invoke: skills/people/burnout.md — distinct protocol; engagement approach won't fix burnout

Root cause: Personal circumstances (external life factors affecting work)
  Signal: Engagement correlated with life events (family, health, housing); not work-originated
  Response: Flexibility, reduced load temporarily, EAP resources, human acknowledgment
  Do not: Expect the person to separate life context from work engagement during a crisis
```

### Step 5 — Team-Level Engagement Trend

```
Team engagement is not the average of individual scores — it is an independent signal.

Team engagement indicators:
  High engagement: Ideas flow voluntarily; team defends norms without EM involvement;
                   retrospectives surface real issues; people cover for each other
  Low engagement: Ideas require prompting; norms erode; retrospectives are polite;
                  people don't help each other without being asked

Team engagement threats:
  — High attrition rate: team trauma compounds; each departure increases the next
  — Repeated roadmap cancellation: team stops believing commitments matter
  — No visible career path: team accepts stagnation as the norm
  — Unaddressed interpersonal conflict: poison spreads; top performers leave first

Monthly team engagement review:
  "How many of my direct reports are in the At Risk or below range?"
  If more than 25% are At Risk or below: team-level problem, not individual cases
  → Address the systemic condition; individual retention conversations are secondary
```

---

## Decision Tree

```
What does the engagement assessment reveal?

├── SCORE 80–100 (HIGHLY ENGAGED)
│   └── Protect the conditions that are producing this
│       "What's working for you right now?"
│       Risk: Over-work and under-recognition can burn out highly engaged people
│       Watch: Are they being asked to do more than their peers because they're reliable?
│       → Invoke: skills/people/burnout.md if energy is very high but quality is dropping

├── SCORE 60–79 (ENGAGED — MONITOR)
│   └── Normal range; no action required unless trend is declining
│       Monthly check: "Is the trend stable or declining over the last 3 months?"
│       If stable: maintain current conditions; stay interview this quarter
│       If declining: investigate root cause before it hits At Risk

├── SCORE 40–59 (AT RISK — ACT WITHIN 2 WEEKS)
│   └── This is the window where intervention is most effective
│       Identify the lowest-scoring dimension: that is the root cause
│       Have the direct conversation: "I've noticed a shift. I want to understand what's going on."
│       Match response to root cause (role, relationship, career, org, comp, burnout, personal)

├── SCORE 20–39 (SIGNIFICANTLY DISENGAGED — ACT THIS WEEK)
│   └── Flight risk is high; every week of inaction increases the probability of resignation
│       Have the retention conversation directly: "I want you here. What would make staying
│       the right choice for you? What would need to change?"
│       Be honest about what can and can't change

├── SCORE 0–19 (ACTIVELY DISENGAGED — CONVERSATION NOW)
│   └── The person may have already decided to leave internally
│       The conversation is still worth having: "Are you still finding this role meaningful?
│       I want to give you an honest picture of what I can offer and hear what you need."
│       Possible outcomes: retention with structural change, mutual agreement on timeline,
│       or dignified transition
│       Forced retention of an actively disengaged person hurts the team

└── 25%+ TEAM BELOW 60 — SYSTEMIC PROBLEM
    └── Individual retention conversations are secondary
        Identify the systemic condition: reorg trauma, roadmap cancellations, leadership distrust
        Address it at the team or organizational level
        → Invoke: skills/organizational/alignment-health.md or skills/people/burnout.md (team-level)
```

---

## Output

### Team Engagement Dashboard

```
ENGAGEMENT DASHBOARD — {{Team}} — {{date}}

INDIVIDUAL SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Name     | Energy | Quality | Connection | Growth | Purpose | Total | Status       | Flight risk
{{Name}} | {{N}}  | {{N}}   | {{N}}      | {{N}}  | {{N}}   | {{N}} | {{Engaged/At Risk/...}} | {{None/Low/Medium/High/Critical}}
Trend: {{Stable 🟢 | Improving 🟢 | Declining 🔴}} | Root cause: {{if declining}}

TEAM SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Highly engaged (80–100): {{N}} | Engaged (60–79): {{N}} | At risk (40–59): {{N}}
Significantly disengaged (20–39): {{N}} | Actively disengaged (<20): {{N}}
At risk or below: {{%}} | Team risk: {{Normal | Elevated | Critical}}

FLIGHT RISK TRACKER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Name | Signal stage | Root cause | Action taken | Action by | Status
{{Name}} | {{Early/Mid/Late}} | {{root cause}} | {{action}} | {{date}} | {{Open/Resolved}}

STAY INTERVIEW LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Name}}: Last stay interview: {{date}} | Key insight: {{what keeps them}} | Action: {{what EM committed to}}

SYSTEMIC SIGNALS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Team-level condition affecting engagement: {{Y/N}} | Condition: {{description}}
Escalation needed: {{Y/N}} | Route: {{skills/organizational/alignment-health.md or direct to EM's manager}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Five dimensions scored per individual | Base: 65% |
| Scores based on individual baseline (not generic standard) | +15% |
| Stay interviews conducted quarterly | +10% |
| Root cause identified (not just symptom) | +10% |
| Flight risk signals tracked across sessions | +5% |
| Score based on single impression, not dimensions | −20% |
| Stay interviews never conducted | −15% |
| Flight risk detected, no action taken for 2+ weeks | −30% (critical gap) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Acting on symptom, not root cause** | Person seems disengaged; EM assigns them to interesting project without understanding why | Identify which dimension is lowest. The intervention must match the root cause. |
| **Stay interview theater** | Questions asked; answers heard; nothing changes; person notes the disconnect | Act on stay interview feedback within 30 days. Unaddressed stay interview answers accelerate disengagement. |
| **Flight risk ignored** | Signals observed; no conversation initiated; person resigns | Early-stage signals require early conversations. Waiting for certainty means waiting too long. |
| **Team average masking individuals** | Team average engagement is 72; two people are at 25; both averaged away | Monitor each person independently. Averages hide the people most at risk. |
| **Burnout confused with disengagement** | Low energy + withdrawal addressed with engagement techniques | Burnout requires rest, not motivation. Engagement interventions applied to burnout make it worse. → skills/people/burnout.md |

---

## References

- `skills/people/one-on-one.md` — Engagement signals first detected in weekly 1:1s
- `skills/people/motivation.md` — Motivation profile informs which engagement dimensions are most vulnerable per person
- `skills/people/burnout.md` — Energy dimension collapse = burnout, not disengagement; distinct protocols
- `skills/people/career-development.md` — Career stagnation is the most common root cause of disengagement

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/burnout.md` | Burnout mimics disengagement; require distinct interventions; often co-occurring |
| `skills/people/motivation.md` | Motivation profile predicts which engagement dimensions are most fragile per person |
| `skills/people/career-development.md` | Career stagnation is the most treatable root cause of disengagement |
| `skills/organizational/alignment-health.md` | Team Alignment dimension predicts engagement; team-level disengagement feeds alignment health score |
