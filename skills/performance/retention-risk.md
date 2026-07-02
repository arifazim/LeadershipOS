# Skill: Retention Risk

**Domain**: Performance Management
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (risk score update per direct report) + Immediate (when any mid-to-late flight risk signal appears)

---

## Purpose

Score and address retention risk for every direct report before it becomes an attrition event — distinguishing root causes, identifying which risks are addressable, and having the honest conversations that either retain the person or help them leave well. High performer attrition is the most expensive and least recoverable event in team management.

**What the EM does automatically**: On a monthly cadence, the EM:
1. Scores each direct report against a six-factor retention risk model
2. Detects early, mid, and late flight risk signals — and responds to each stage with the appropriate urgency
3. Identifies the root cause driving the risk and designs the matching retention intervention
4. Has the direct retention conversation before the resignation letter — not after
5. Manages the post-resignation period honestly, including the counter-offer decision

**Ethical principle**: Retention management serves the person, not the headcount plan. The EM who retains someone against their interests — through counter-offers that don't address root causes, through making them feel guilty for considering leaving, or through withholding information about internal opportunities — is protecting the team at the person's expense. The goal is to create an environment the person genuinely wants to stay in. If that environment cannot be created, the most ethical outcome is a dignified, well-supported transition.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Engagement score** | Current engagement assessment from `skills/people/engagement.md` |
| **Flight risk signal stage** | Whether early, mid, or late signals are present |
| **Root cause hypothesis** | What is driving the risk — career, compensation, manager, org, role, or personal |

### Optional
| Input | Description |
|---|---|
| **Motivation profile** | Current AMP motivator state from `skills/people/motivation.md` |
| **Compensation market data** | Whether their comp is at, above, or below market for their skills |
| **Organizational context** | Reorg impact, team attrition history, or leadership changes affecting this person |

---

## Analysis

### Step 1 — Score the Six Retention Risk Factors

```
Retention risk model: Six factors, each scored 0–5. Total score = 0–30.

Factor 1: Career trajectory (0–5)
  0: Clear growth path; promotion timeline defined; progression is occurring
  1: Growth path exists but timeline is uncertain; some ambiguity
  2: Career conversation has happened; no concrete plan; progress uncertain
  3: No meaningful career development in 6+ months; person has noted the stagnation
  4: Person has been ready for promotion for 6+ months; not submitted; morale is declining
  5: Person has explicitly stated the career isn't progressing; looking externally

Factor 2: Compensation (0–5)
  0: At or above market for role and skills; recently reviewed
  1: Likely at market; not recently benchmarked; no signals of concern
  2: Below market by 5–15%; person has not raised it explicitly
  3: Below market by 15–25%; person has mentioned comp casually 1–2 times
  4: Significantly below market; person has raised comp explicitly; feel undervalued
  5: Critical comp gap; person is actively comparing offers; comp is the stated reason to leave

Factor 3: Work and role satisfaction (0–5)
  0: Work is energizing; motivators are being met; role has meaningful autonomy and challenge
  1: Mostly satisfied; minor friction in 1–2 areas; nothing sustained
  2: Some dissatisfaction; work is becoming routine; challenge is declining
  3: Significant dissatisfaction with the type of work, the role scope, or the team structure
  4: Person has expressed directly that the work isn't what they want; exploring alternatives
  5: Person is actively pursuing work in a different domain; role fit is gone

Factor 4: Manager relationship (0–5)
  0: Strong trust; honest communication; EM is a source of support and advocacy
  1: Functional relationship; no major issues; some communication gaps
  2: Some friction; person feels partially unsupported; feedback quality has declined
  3: Significant trust damage; EM's decisions have disappointed or surprised the person
  4: Person has named manager relationship as a problem; actively avoids the EM
  5: Relationship is broken; person cannot trust the EM; departure is accelerating because of the EM

Factor 5: Team and environment (0–5)
  0: Team is cohesive; culture is healthy; person feels they belong and are valued
  1: Minor friction; team is intact; culture is acceptable
  2: Some conflict or team attrition; person has noticed degradation
  3: Meaningful team health problems; person is absorbing the friction daily
  4: Team attrition has affected the person directly; they've lost peers they valued; culture has shifted
  5: Team environment is a primary stated reason to leave; safety, belonging, or culture is broken

Factor 6: Organization and leadership trust (0–5)
  0: Believes in the company direction; trusts leadership; proud of the organization
  1: Some questions about direction; mostly trusts leadership
  2: Uncertainty about company direction; some disillusionment with leadership decisions
  3: Lost confidence in company leadership; feels the company direction doesn't align with their values
  4: Active cynicism about the company; "I don't know where this is going" is a frequent frame
  5: No remaining organizational alignment; company itself is a reason to leave

Retention risk composite:
  Total score: 0–30
  
  0–5:   Low — standard investment; no immediate action
  6–10:  Moderate — monitor; one factor needs attention within 30 days
  11–16: Elevated — 2–3 factors at concern level; action within 2 weeks
  17–22: High — multiple significant factors; retention conversation this week
  23–30: Critical — departure is likely within 60 days; retention conversation now
```

### Step 2 — Stage Flight Risk Signals

```
Three flight risk stages with distinct response urgency:

Early stage signals (4–10 weeks before flight):
  — Motivation profile shift detected in 1:1s (less energy for specific work types)
  — Career growth questions become more abstract ("what does Staff look like at other companies?")
  — LinkedIn profile updated or connections with external recruiters visible
  — Reduced investment in long-horizon work ("I'll finish this, but I'm not sure about the roadmap")
  — One or two casual mentions of compensation or external opportunity
  
  Response: Curiosity, not panic. Career conversation. Address the earliest-surfacing factor.
  "I want to check in on how things are going for you — not just the work."
  Urgency: 2-week window to assess and respond

Mid stage signals (2–4 weeks before flight):
  — Career mentioned directly: "I've been thinking about what's next for me"
  — Compensation raised explicitly for the second or third time
  — Team participation declining; head-down mode increasing
  — Taking PTO in patterns that suggest interview preparation
  — Asking about company documentation, benefit details, or departure logistics
  
  Response: Direct retention conversation. Address the stated factor specifically.
  "I've been noticing some signals that I want to acknowledge. I want to be direct: I want you here.
  What would need to be true for this to still feel like the right place?"
  Urgency: Conversation this week; actions within days

Late stage signals (1–2 weeks before flight):
  — Direct statement: "I'm considering some external opportunities"
  — Organizing or documenting their work in a way that enables handoff
  — Meeting with the EM's manager or HR on topics outside their norm
  — Peers sense it and have started asking the EM
  
  Response: Honest conversation about what is and isn't possible.
  "I want to be transparent. You don't have to tell me if you've decided to leave.
  But I want to make sure you have full information before you finalize anything.
  Here's what I can offer and what I can't."
  Urgency: Conversation today; no delay
```

### Step 3 — Match Retention Intervention to Root Cause

```
Retention intervention must address the root cause, not the symptom.
Generic retention ("we value you so much") without structural change does not work.

Root cause 1: Career stagnation
  Intervention: Concrete promotion timeline or explicit development milestone
  Not: "We'll find opportunities for you" (vague)
  Yes: "I'm submitting you for promotion in {{month}}. Here's what I'm building the case on."
  Or: "You're not ready yet. Here's exactly what you need to do to be ready by {{quarter}}.
       I'm creating this opportunity: {{specific}}"
  Timeline: Must be named specifically; vague timelines accelerate departure

Root cause 2: Compensation gap
  Intervention: Market rate benchmark + actual compensation adjustment (if gap exists)
  Not: "You're so valuable to us" without a number
  Yes: "I've benchmarked your compensation and here's the reality: {{gap}}. I'm escalating
       this to get you to market rate by {{date}}."
  If the gap can't be closed: "I've escalated and the answer was no. I want you to have
  accurate information. The gap is {{amount}} and it's not being addressed right now."
  This is better than false hope — they deserve to make an informed decision

Root cause 3: Work and role dissatisfaction
  Intervention: Role redesign or internal transfer
  Not: "We'll try to find you more interesting work" (no plan)
  Yes: "I want to explore what the right version of your role would look like.
  If I could design your next 6 months, what would be in it?"
  If redesign isn't possible: "I don't think this team can give you the work you want.
  I want to help you find an internal transfer. Here are three teams that might be right."

Root cause 4: Manager relationship
  The hardest root cause to address — it requires the EM to change their own behavior
  Not: Denying the issue or defending the EM's past decisions
  Yes: "I've heard that the relationship between us isn't working the way I'd want.
  Tell me specifically what you've experienced. I want to understand what I need to change."
  If the relationship is irreparable: explore internal transfer to a different team
  If the EM is the root cause and won't change: the person will and should leave

Root cause 5: Team environment
  Intervention: Address the team health issue directly
  Not: "I know the team has been rough lately" with no action
  Yes: Specific team health intervention (→ skills/conflict/team-alignment.md or skills/people/engagement.md)
  If team attrition is the driver: honest acknowledgment + specific stability signals
  "I know losing {{person}} was hard. Here's what I'm doing to stabilize the team."

Root cause 6: Organizational disillusionment
  The hardest structural root cause — often beyond EM's authority
  Not: "I'm sure it'll get better" (hollow)
  Yes: "I hear your concerns about the company direction. I want to be honest about
  what I can and can't change. Here's what I believe is true about our direction.
  Here's what I'm uncertain about too. What do you need to see from the company?"
  If the concern is about values or mission: this may not be addressable; be honest
```

### Step 4 — The Retention Conversation

```
Retention conversation design:

Before the conversation:
  Know: What is the root cause (from the risk model)?
  Know: What can you actually offer? (Don't promise what you can't deliver)
  Know: What is the specific timeline for any promised action?
  Know: What is the honest answer if the ask is beyond your authority?

Opening:
  Direct, not ambiguous: "I want to have a conversation that might feel a little direct.
  I want you to know I want you here, and I'm sensing something has shifted for you.
  Am I reading that right?"
  Wait for their answer. Don't fill the silence with reassurance.

If they confirm something is shifting:
  "Tell me what's going on. I'd rather hear it directly from you."
  Listen without defending. Their perception is their reality.

Offer what is real:
  ✓ "Here's specifically what I can do: {{concrete action with timeline}}"
  ✗ "We'll try to do better" without specificity
  ✗ "I'll look into it" without a named deadline
  ✗ Any promise that requires authority you don't have and haven't verified

Name what you can't offer:
  "I want to be honest — {{thing they want}} is beyond what I can deliver here right now.
  I don't want to give you false hope about it."
  Then: "Does that change what you're thinking about?"
  Being honest about what can't be delivered is more respectful than managing expectations

Close with a decision point (for mid-to-late signals):
  "I want to give you something concrete and real. Here's what I'm committing to:
  {{specific action}} by {{specific date}}.
  I want to give you time to think about whether this is the right place.
  Can we talk again in {{1–2 weeks}}?"
```

### Step 5 — After the Resignation

```
When a resignation arrives despite retention efforts:

First response (always):
  "Thank you for telling me directly. I want to make sure your last weeks here are
  as good as they can be."
  Do not: Express disappointment in a way that makes them feel guilty
  Do not: Immediately pivot to counter-offer
  Do: Ask: "Would you be willing to tell me why you made this decision?"

The counter-offer decision:
  Counter-offers have a documented 80% failure rate within 12 months —
  the reasons for leaving remain; the offer temporarily masks them.
  
  When NOT to counter-offer:
  ✗ The root cause cannot be fixed (culture, company direction, manager relationship)
  ✗ The compensation offer requires a permanent exception that creates equity problems
  ✗ They have already started at the new job emotionally; the counter-offer is a delay tactic
  
  When a counter-offer may be appropriate:
  ✓ The root cause is addressable and you can commit to a specific fix on a specific timeline
  ✓ The compensation gap is real and the adjustment is within your authority
  ✓ The person is leaving for a role that doesn't actually address what was driving their dissatisfaction
  
  Counter-offer framing (if appropriate):
  "Before you finalize this, I want to make sure you've heard the specific thing I'm committing to.
  This isn't 'we value you' — here's the specific change: {{action, timeline}}."

Transition management:
  Handle the transition with generosity — their reputation and the EM's are both affected
  "What do you need from me to make this transition good for you and the team?"
  Avoid extractive transitions: don't maximize the person's handoff at the expense of their goodwill

Learning from the exit:
  "Is there anything I could have done differently that would have kept you here?"
  Receive the answer honestly; use it to close the feedback loop on the retention model
  The attrition is a lagging indicator — the leading indicators were there earlier
  → Update: skills/people/engagement.md and skills/people/motivation.md for this person's pattern
```

---

## Decision Tree

```
What does the retention risk assessment reveal?

├── SCORE 0–5 (LOW RISK)
│   └── Monthly check-in maintained
│       Stay interview this quarter to understand what's keeping them engaged
│       Continue career investment; don't let the low risk signal become complacency

├── SCORE 6–10 (MODERATE — FACTOR NEEDS ATTENTION)
│   └── Identify the highest-scoring factor; address it within 30 days
│       "I've been thinking about {{factor}} and I want to make sure it's not becoming a problem."
│       Specific action for the highest-scoring factor; follow up in 30 days

├── SCORE 11–16 (ELEVATED — ACTION WITHIN 2 WEEKS)
│   └── Direct 1:1 conversation: "I want to check in on how you're doing here."
│       Address the top 2 factors with concrete action or honest constraint
│       Check in weekly for 4 weeks; score again after actions are taken

├── SCORE 17–22 (HIGH — RETENTION CONVERSATION THIS WEEK)
│   └── Have the retention conversation — don't wait for the next scheduled 1:1
│       "I want to be direct. I'm sensing something has shifted. I want you here.
│       What would need to be true for this to feel like the right place?"
│       Offer what is real; name what isn't possible; give a decision timeline

├── SCORE 23–30 (CRITICAL — CONVERSATION TODAY)
│   └── Departure is likely within 60 days without intervention
│       Immediate: Honest conversation; concrete commitments; honest constraints
│       If root cause is not addressable: begin honest transition planning
│       "I want to help you succeed — whether that's here or somewhere else.
│       Let's talk about what you actually need."

├── POST-RESIGNATION
│   └── Receive it graciously; ask why; evaluate counter-offer decision carefully
│       Manage transition generously; protect team morale
│       Conduct exit learning; update retention model

└── EM IS THE ROOT CAUSE (FACTOR 4, SCORE 4–5)
    └── The most uncomfortable but most important scenario to address honestly
        Seek external mediation; consider internal transfer for the person
        "I want to acknowledge that our relationship hasn't been working the way I'd want.
        I want to understand what you've experienced."
        If you cannot change the behavior that is causing the risk: support the transfer
```

---

## Output

### Retention Risk Profile

```
RETENTION RISK PROFILE — {{Name}} — {{date}}

FACTOR SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Factor                          | Score | Evidence
Career trajectory               | {{0–5}} | {{Signal observed}}
Compensation                    | {{0–5}} | {{At/below market — signal}}
Work and role satisfaction      | {{0–5}} | {{Observed motivation shift}}
Manager relationship            | {{0–5}} | {{Trust signal}}
Team and environment            | {{0–5}} | {{Team health observation}}
Organizational trust            | {{0–5}} | {{Org-level signal}}

COMPOSITE: {{N}}/30 | Risk level: {{Low | Moderate | Elevated | High | Critical}}

FLIGHT RISK SIGNAL STAGE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Signal stage: {{None | Early (4–10 wks) | Mid (2–4 wks) | Late (1–2 wks)}}
Specific signal observed: {{description}}

ROOT CAUSE AND INTERVENTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Primary root cause: {{Career | Compensation | Work/role | Manager | Team | Org}}
Addressable within EM authority: {{Y/N}}
Intervention committed: {{Specific action}} by {{date}}
What cannot be offered: {{Honest constraint named to person}}

CONVERSATION LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Retention conversation held: {{Y/N}} | Date: {{date}}
Commitments made: {{Specific}} | Deadline: {{date}}
Person's response: {{Engaged | Uncertain | Likely leaving}}
Counter-offer considered: {{N/A | No — reason | Yes — terms and outcome}}
Transition plan: {{N/A | Started — {{date}}}}

TREND
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Last month score: {{N}} | This month: {{N}} | Direction: {{Improving 🟢 | Stable 🟡 | Worsening 🔴}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All six retention factors scored | Base: 65% |
| Root cause identified (not just risk level) | +15% |
| Flight risk signal stage determined | +10% |
| Retention conversation happened before resignation | +10% |
| Intervention matched to root cause (not generic reassurance) | +5% |
| Retention conversation had after resignation only | −30% |
| Counter-offer made without addressing root cause | −20% |
| Root cause is EM behavior — not acknowledged | −30% (disqualifying) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Late detection** | Flight risk identified at late stage; resignation follows within 2 weeks | Monitor monthly. Early-stage signals are 6–10 weeks before departure; intervention at that stage is 80%+ effective. |
| **Generic retention** | "We really value you here" without structural change | The root cause must be addressed. "We value you" without a specific commitment is transparent and ineffective. |
| **False promise retention** | EM promises a promotion or comp adjustment they can't deliver; person stays; nothing changes; leaves 3 months later angrier | Only commit to what you can deliver. Honest constraint is better than false hope. |
| **Counter-offer without root cause fix** | Counter-offer accepted; root cause unchanged; person leaves 6–12 months later | Before counter-offering: "Is the root cause addressable?" If not, the counter-offer is a delay. |
| **EM as unacknowledged root cause** | Manager relationship is the primary driver; EM doesn't see it or won't address it | Run the factor scoring honestly. If Factor 4 is 4–5, that requires self-examination first. |

---

## References

- `skills/people/engagement.md` — Engagement score is the leading indicator that feeds retention risk Factor 1–3
- `skills/people/motivation.md` — Motivation shifts feed factors 1, 3, and 6 of the retention risk model
- `skills/performance/high-performer.md` — High performer flight risk is the most expensive variant; elevated urgency
- `skills/performance/promotion-readiness-tracking.md` — Overdue promotion (Signal 5) is the most actionable retention root cause

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/engagement.md` | Engagement decline is the primary leading indicator of retention risk |
| `skills/performance/high-performer.md` | High performer attrition is the most asymmetric risk; requires dedicated monitoring |
| `skills/performance/promotion-readiness-tracking.md` | Overdue promotion is the most common and most fixable retention root cause |
| `skills/people/career-development.md` | Career stagnation is the most common Factor 1 driver |
