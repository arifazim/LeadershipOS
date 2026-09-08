# Skill: Skip-Level Facilitation

**Domain**: Mentoring Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (minimum) + on-demand after significant org events (reorg, attrition, incident)

---

## Purpose

Run skip-level conversations that produce honest signal — not reassurance theater — and synthesize what you learn into actionable intelligence about team health, EM blind spots, and organizational patterns that reports would not surface in a standard 1:1.

A skip-level done well is the highest-density signal the EM's manager can receive about whether the EM's self-assessment is calibrated. A skip-level done poorly is a waste of everyone's time that damages the EM's credibility with their own team.

**What the EM does automatically**: In skip-level facilitation, the EM:
1. Prepares their manager with context that enables productive questions — not a defense document
2. Helps reports prepare so the conversation produces insight, not anxiety
3. Synthesizes the output honestly — including signals that challenge the EM's own assumptions
4. Acts on what is learned within one sprint cycle
5. Closes the loop with the team so skip-levels become a trusted channel, not a surveillance mechanism

**Ethical principle**: Everything an EM tells their manager in a skip-level prep session can be used to evaluate the EM. Say what is true, not what is safe. A skip-level prep that presents only successes is useless to the manager and a missed development opportunity for the EM. The manager will form their own view from the skip-level itself — prepare them with context that makes that view accurate.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Meeting participants** | Which engineers or roles are participating; level, tenure, current projects |
| **Skip-level purpose** | Routine quarterly check-in / post-org-event signal / specific concern investigation |
| **Recent team context** | Key deliveries, tensions, changes, incidents in the last 60 days |
| **EM's own assessment** | Current state of team health, relationships, and morale — before the skip-level |

### Optional
| Input | Description |
|---|---|
| **Prior skip-level outputs** | Themes and actions from last quarter's skip-levels |
| **Political signals** | From `skills/organizational/political-intelligence.md` — any escalation or exclusion signals relevant to participants |
| **Leadership health scores** | Dimension scores most relevant to this team |
| **1:1 sentiment signals** | Engagement trends across the team |

---

## Analysis

### Step 1 — Prepare the Skip-Level Manager

```
The manager walking into a skip-level cold is a failure mode. They will ask
generic questions and get generic answers. Prepare them specifically.

Manager prep brief (share in writing before the session):

WHO YOU'RE MEETING
  {{Name}}: {{Level}}, {{tenure}}, current project {{project}}.
  Current growth trajectory: {{on track / promotion candidate / performance watch}}
  Relationship with me: {{strong / developing / some friction around [topic]}}

TEAM CONTEXT THEY NEED
  Last 60 days: {{1–2 key deliverables, decisions, challenges}}
  Any open tensions: {{specific — if none, say "none I'm aware of"}}
  One thing I am uncertain about: {{honest signal — this is where skip-levels are most useful}}

QUESTIONS WORTH ASKING (optional — manager decides)
  — "What's one thing the team could do better that isn't being addressed?"
  — "Is there anything you'd want leadership to know that doesn't usually surface?"
  — "How are you thinking about your growth here over the next year?"
  — "What makes you want to stay at [company], and what would change that?"

WHAT I'M LISTENING FOR IN YOUR SYNTHESIS
  — Is {{theme from my own uncertainty}} confirmed or contradicted?
  — Are {{specific people}} flagging anything I might be filtering?
  — Is the team's read of [delivery / direction / culture] consistent with mine?

Manager prep brief rules:
  — Share it before the session, not after
  — Include the uncertainty you have about your own team — this is the most valuable input
  — Don't write it to make yourself look good; write it to make the conversation useful
```

### Step 2 — Prepare the Reports

```
Reports who are anxious in a skip-level produce reassurance, not signal.
Preparation removes anxiety and produces honest conversation.

What to tell direct reports before a skip-level with your manager:

WHAT THIS IS
  "{{Manager name}} does quarterly skip-levels with everyone. It's a chance for
  them to hear directly from you — not about anything specific you've done or haven't
  done, just a general check-in on how things are going."

WHAT IT IS NOT
  "This is not an evaluation of you. It's not connected to your performance review.
  I won't be there, and I won't ask {{manager}} to replay the conversation.
  They may share themes with me but not specific quotes without your consent."

WHAT TO BRING
  "The most useful thing you can do is be honest about what's working and what's not.
  If you say everything's fine when it isn't, that's a missed opportunity — both for
  the team and for your own visibility with leadership."

SAMPLE QUESTIONS (optional — give them a sense of the format)
  "They might ask things like: what's been your biggest challenge lately, how are you
  thinking about your career here, what could the team be doing differently."

What NOT to do:
  — Do not ask for a preview of what the report plans to say
  — Do not brief the report on what to say or not say
  — Do not follow up with the report after the skip-level to find out what they shared
    (this destroys the channel permanently)
```

### Step 3 — Synthesize the Output Honestly

```
After the skip-level, the manager will share themes with the EM. The EM's job
is to receive this without defensiveness and extract the most useful signal.

Synthesis framework:

CONFIRMS MY ASSESSMENT
  "{{Manager}} heard [theme]. I expected this — it validates [my current approach /
   my concern / my read of this person]."
  Action: No change needed; continue current approach.

CONTRADICTS MY ASSESSMENT (most valuable signal)
  "{{Manager}} heard [theme]. I did not expect this. I had assessed [different thing]."
  Questions to ask:
    — Is the contradiction because I have incomplete information?
    — Is it because the report says different things in different contexts?
    — Is it because my assessment was wrong?
  Action: One follow-up conversation with the report within 5 business days.
         No leading questions; open-ended: "How are you feeling about [topic]?"
         Do not reference the skip-level directly.

CONFIRMS A CONCERN I WAS MINIMIZING
  "{{Manager}} heard [theme I knew about but wasn't treating as urgent]."
  Questions to ask:
    — Was I minimizing this because it's genuinely low-priority, or because it's uncomfortable?
    — How long has this been present? What have I done about it?
  Action: Treat this as a signal to act on within 2 weeks, not "watch more closely."

NEW SIGNAL (not on my radar at all)
  "{{Manager}} heard [something I had no knowledge of]."
  Questions to ask:
    — What does it mean that I didn't know this?
    — Is this person filtering information from me, or am I not creating the conditions
      for them to surface it?
  Action: Self-coaching input — this is a leadership blind spot, not just a communication gap.
         Log to `skills/mentoring/em-self-coaching.md` as a kaizen Q9 data point.

THE EM IS THE SUBJECT OF THE SIGNAL
  "{{Manager}} heard [something about how I manage, communicate, or behave]."
  This is the highest-value skip-level output and the hardest to receive.
  Rules:
    — Do not ask for the specific quotes
    — Do not attempt to rebut the signal in the synthesis conversation
    — Ask one clarifying question: "Is this isolated to one person or a pattern?"
    — Log it as a self-coaching data point (em-self-coaching.md)
    — Act on it within 30 days with a measurable change
```

### Step 4 — Act and Close the Loop

```
A skip-level that produces no action is worse than no skip-level.
It signals to reports that they can be honest with leadership but nothing changes.

Action framework:

  Within 5 days: Share synthesis themes (not specific quotes) with the team
    Format: "{{Manager}} walked away with [theme 1], [theme 2]. I want to [action]."
    This closes the loop and demonstrates the channel works.

  Within 2 weeks: Act on the most actionable signal
    If team context: process change, conversation, structural fix
    If EM behavior: growth edge (em-self-coaching.md)

  Within the quarter: Reference the skip-level input in a team decision
    "One thing {{manager}} heard last quarter was [theme] — here's how we've responded."

What to tell reports after:
  "I heard from {{manager}} that the overall themes were [general summary — no attributions].
   I'm going to [specific action] as a result."

What NOT to do:
  — Do not tell reports what specific people said
  — Do not reverse-engineer who said what and adjust your behavior toward them
  — Do not use skip-level input in performance reviews without the report's knowledge
  — Do not punish (consciously or unconsciously) a report whose skip-level feedback was hard

If the skip-level revealed the EM as the problem signal:
  Acknowledge it with the manager: "I heard [theme]. I agree / I want to understand
  this better. Here's what I'm going to do about it."
  Do not minimize. The manager already knows.
```

---

## Decision Tree

```
What does the skip-level situation require?

├── FIRST SKIP-LEVEL WITH THIS GROUP
│   └── Invest in preparation for both parties.
│       Step 1 (manager prep) and Step 2 (report prep) are both required.
│       Set expectations explicitly: "This is what skip-levels are. Here's what they're not."
│       First-skip-level threshold: lower expectations on signal depth. Trust builds over time.

├── POST-ORG-EVENT SKIP-LEVEL (after reorg, attrition, leadership change)
│   └── Purpose is explicitly signal-gathering, not routine.
│       Tell the manager: "I want to know what I'm missing in the emotional response."
│       Increase the specificity of the uncertainty you share in Step 1.
│       Primary question for synthesis: what does the team believe about [event] that
│       they haven't told me?

├── SKIP-LEVEL REVEALS EM AS THE PROBLEM SIGNAL
│   └── This is the highest-value output. Do not defend.
│       Required: Acknowledge with the manager. Set a growth edge. Reference it in 30 days.
│       Common mistake: requesting more specifics to refute the signal.
│       Better question: "What pattern did you see? What would change it?"
│       Route to em-self-coaching.md immediately.

├── SKIP-LEVEL CONTRADICTS THE EM'S OWN ASSESSMENT
│   └── One follow-up 1:1 within 5 days. Not a skip-level debrief — a genuine check-in.
│       Do not reference the skip-level. Open-ended only: "How are things feeling to you?"
│       If the contradiction is confirmed: update your model of this person.
│       If it's not reproduced: explore why different contexts produce different signals.

├── REPORT IS ANXIOUS ABOUT THE SKIP-LEVEL
│   └── More preparation, not less. Do not skip the report-prep step.
│       Anxiety-reducing framing: "This is about how the team is doing, not about you."
│       If the anxiety is persistent: explore whether there is a trust issue with
│       leadership that predates this skip-level.

└── NO MANAGER SYNTHESIS SHARED WITH EM
    └── Ask explicitly: "Would you share the top 2–3 themes you took away?"
        If the manager is unwilling to share: the skip-level relationship model
        needs to be negotiated. EM is flying blind on whether their self-assessment
        is calibrated.
```

---

## Output

### Skip-Level Synthesis Brief

```
SKIP-LEVEL SYNTHESIS — {{Date}} — {{Manager Name}} with {{Team/Person}}

WHAT I PREPARED (Step 1 summary)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Context shared: {{key team events, tensions, uncertainties shared with manager}}
My prior uncertainty: "{{honest statement of what I wasn't sure about}}"
Questions I asked manager to explore: {{if any}}

SYNTHESIS — WHAT THE MANAGER HEARD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Theme 1: {{topic}} — {{Confirms / Contradicts / New signal / EM as subject}}
Theme 2: {{topic}} — {{Confirms / Contradicts / New signal / EM as subject}}
Theme 3: {{topic}} — {{Confirms / Contradicts / New signal / EM as subject}}

CALIBRATION ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
My prior assessment was:   {{accurate / partially accurate / inaccurate}} in {{N}}/{{N}} themes
Key miscalibration: {{specific — what I thought vs. what the manager heard}}
Self-coaching input: {{Y/N — if Y, log to em-self-coaching.md within 3 days}}

ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Within 5 days:  {{close loop with team — what themes were heard, what EM will do}}
Within 2 weeks: {{most actionable signal — specific action}}
Within quarter: {{reference skip-level input in a visible team decision}}

MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Logged to memory/: {{stakeholders / executive / em-self-development — select domain}}
Key pattern for retention: {{one-sentence summary of most durable insight}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Manager prep brief shared before skip-level | Base: 60% |
| Report preparation completed (anxiety managed) | +10% |
| Synthesis received and assessed against prior assessment | +15% |
| EM-as-subject signal received without defensiveness | +15% |
| Actions defined and loop closed with team within 5 days | +10% |
| Manager prep skipped entirely | −25% |
| No synthesis received from manager | −20% |
| EM did not share honest uncertainty in prep brief | −15% |
| No actions taken after synthesis | −20% (skip-level trust destroyed) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Prep theater** | Manager prep brief is a success story with no uncertainties | Require the honest uncertainty. If you won't write it, ask yourself why. |
| **Reverse-engineering attribution** | EM adjusts behavior toward specific reports based on inferred skip-level quotes | Never attribute skip-level themes to specific individuals. Act on themes as team-level signal. |
| **Defensive synthesis reception** | EM asks clarifying questions that amount to rebuttals | The synthesis step has one rule: receive first. Respond later. |
| **No loop close** | Reports never hear what was learned or acted on | Close the loop within 5 days. A skip-level channel without follow-through destroys itself. |
| **Quarterly theater** | Skip-levels run on schedule but produce no actions and no calibration | Quarterly cadence is a floor, not a target. The purpose is signal-gathering, not ceremony. |

---

## References

- `skills/mentoring/em-self-coaching.md` — Skip-level output that reveals EM as subject routes here
- `skills/organizational/political-intelligence.md` — Political signals context is prep input for post-event skip-levels
- `leadership-health/master-leadership-health.md` — Leadership health dimensions calibrated against skip-level signal
- `memory/executive/`, `memory/stakeholders/` — Skip-level synthesis logs to the relevant domain
- `loops/em-growth-loop.md` — Skip-level synthesis is an input to the monthly EM growth review

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/mentoring/em-self-coaching.md` | EM-as-subject skip-level signals are self-coaching inputs |
| `skills/organizational/political-intelligence.md` | Escalation pattern signals surface in skip-levels; prep accordingly |
| `skills/people/one-on-one.md` | Post-skip-level follow-up uses 1:1 as the channel; not a direct reference but the instrument |
| `skills/executive/vp-one-on-one.md` | Skip-level prep parallels the upward 1:1 prep; same honesty standard applies |
