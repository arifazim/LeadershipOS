# Skill: Technical Leadership

**Domain**: Mentoring Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly dimension assessment + Monthly observation + Annual trajectory review

---

## Purpose

Develop engineers from individual contributors into technical leaders — not by giving them the title, but by systematically building the five dimensions of technical leadership: vision, cross-functional influence, team elevation, risk detection, and ambiguity navigation. Track growth against a scored framework so that technical leadership development produces observable, calibration-ready evidence rather than a vague sense that someone is "more senior now."

**What the EM does automatically**: In technical leadership development, the EM:
1. Assesses each of the five technical leadership dimensions using specific behavioral evidence, not general impression
2. Designs deliberate growth opportunities for the dimension with the highest development leverage
3. Identifies the moment when an engineer's role effectively changes from executor to technical leader — and signals it explicitly, even before the title changes
4. Detects the failure modes that stall technical leaders (still executing, context hoarding, communication gap, standards without teaching) and intervenes before they calcify
5. Connects technical leadership growth to both promotion readiness and delegation maturity so that organizational advancement follows demonstrated capability

**Ethical principle**: Technical leadership is earned through demonstrated impact on others, not demonstrated technical depth alone. An engineer who is technically excellent but whose excellence makes others dependent rather than more capable is not a technical leader — they are a technical bottleneck. The measure of technical leadership is not what the person can build; it is what the team can build because of them. This distinction determines the direction of every development conversation.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current role and level** | Where the engineer is today; what the next target level's expectations require |
| **Technical domain expertise** | What domain(s) they work in; what depth they've demonstrated |
| **Team impact observations** | What specific behaviors of theirs have changed what other engineers can do |

### Optional
| Input | Description |
|---|---|
| **Cross-functional partner feedback** | What non-engineers say about working with this person on technical decisions |
| **Delegation maturity scores** | From `skills/mentoring/delegation.md` — Level 4 in primary domain is a prerequisite signal |
| **Promotion readiness assessment** | From `skills/performance/promotion-readiness-tracking.md` — technical leadership maps to Leadership/Influence dimension |

---

## Analysis

### Step 1 — Assess the Five Technical Leadership Dimensions (0–10 each)

```
Technical leadership is not one skill — it is five distinct capabilities that develop at
different rates. Score each dimension independently using behavioral evidence.
Do not average across dimensions to assign an overall level; each dimension tells a different story.

DIMENSION 1 — TECHNICAL VISION (0–10)
  What it measures: Ability to see and articulate where the technical system should be in 6–18 months,
  and to map a path from current state to desired state that others can follow and contribute to.

  0–2: Executes against current technical direction; does not contribute to setting it
  3–4: Has a point of view about technical direction; cannot yet articulate it to non-technical stakeholders
  5–6: Can articulate a clear technical direction for their domain; aligns the engineering team around it
  7–8: Shapes technical direction beyond their immediate domain; influences architecture decisions cross-team
  9–10: Defines the technical future of significant organizational capability; others cite their vision

  Behavioral indicators at 7+:
  — Initiates architectural conversations before problems become visible
  — Technical direction they articulate survives leadership turnover
  — Other engineers ask them what to build next, not just how to build it
  — Proposes tradeoffs at the organization level, not just the feature level

  Development actions:
  — Assign them to a 6-month technical roadmap exercise for their domain
  — Ask them to present their technical direction to a VP-level audience quarterly
  — Require a written technical vision document; review and challenge

DIMENSION 2 — CROSS-FUNCTIONAL INFLUENCE (0–10)
  What it measures: Ability to get product managers, designers, data scientists, and business
  stakeholders to understand, respect, and act on technical constraints — without requiring EM
  mediation or using engineering authority as a substitute for persuasion.

  0–2: Communicates technical constraints within engineering; discomfort in cross-functional forums
  3–4: Can explain technical constraints to non-engineers; sometimes successful; needs preparation
  5–6: Reliably translates technical complexity into business terms; cross-functional partners trust them
  7–8: Shapes product decisions by raising technical constraints early; prevents expensive rework
  9–10: Actively sought by non-engineers before decisions are made; seen as a technical business partner

  Behavioral indicators at 7+:
  — Product manager comes to them before writing the PRD, not after
  — Has changed a roadmap decision by framing a technical risk as a business risk
  — Non-engineers use their language ("load" instead of "weight"; "latency" correctly)
  — Escalates technical risks to leadership with a recommendation, not just a warning

  Development actions:
  — Include them in pre-sprint product planning (not just sprint planning)
  — Assign them to present a technical risk to a cross-functional team without EM present
  — Coaching on translation: "Here's the technical constraint. Write me a one-sentence version
     that a VP would act on."

  Common failure mode: "They need to understand our constraints" (education) vs. "I need to
  express this in a way that makes acting on it the easier path" (influence). The former is a
  posture; the latter is technical leadership.

DIMENSION 3 — TEAM ELEVATION (0–10)
  What it measures: The degree to which other engineers on the team perform better, learn faster,
  and operate more independently because of this engineer's presence, input, and mentorship.

  0–2: Does not invest time in others; focused on own technical work; may block others by hoarding context
  3–4: Helpful when asked; good code reviewer; doesn't proactively invest in others' growth
  5–6: Proactively mentors; code reviews improve understanding not just catch bugs; others seek them out
  7–8: The team's technical floor has visibly risen since they joined; engineers cite specific growth they enabled
  9–10: Multiplier: three or more engineers demonstrably better because of sustained investment by this person

  Behavioral indicators at 7+:
  — Engineers on the team describe specific ways they grew from this person's code reviews
  — New engineers onboard faster because of documentation, pairing, or architectural context they provided
  — The team can solve problems in this person's domain even when they're on vacation
  — Their PRs include "here's why" comments that the team has adopted as a standard

  Development actions:
  — Assign them to mentor one specific engineer for a quarter; track that engineer's growth (skills/mentoring/mentor-plan.md)
  — Ask them to run a technical deep-dive for the team in their domain — not a lecture; a working session
  — In code review: require them to write why a change is needed, not just what change is needed

  The multiplication test: "Is the team stronger because this person is on it — not just when they're
  on it, but in the ways they've changed how the team works?"

DIMENSION 4 — RISK DETECTION (0–10)
  What it measures: Ability to identify architectural, dependency, quality, security, and scalability
  risks proactively — before they become incidents, before the sprint has started, before the PRD is approved.

  0–2: Identifies risks during their own work; does not look beyond current task
  3–4: Raises risks when asked or when reviewing work explicitly assigned for review
  5–6: Proactively raises risks in design discussions; catches integration issues before they ship
  7–8: Reviews upcoming work for risks before being asked; tracks risk patterns across the system
  9–10: Maintains a mental model of the whole system; anticipates second-order effects of proposed changes

  Behavioral indicators at 7+:
  — Named a risk in a PRD that prevented a launch that would have required emergency rollback
  — Identified a cross-team dependency that others didn't see until it would have blocked shipping
  — Tracks system-level metrics and alerts EM to patterns before they trigger incidents
  — Asks "what does this break?" before asking "how do we build this?"

  Development actions:
  — Include them in architecture review of adjacent teams' work, not just their own team's
  — Ask them to conduct a quarterly technical risk audit for their domain
  — After each incident: require a written "what I should have caught and when" document (not blame — learning)

DIMENSION 5 — AMBIGUITY NAVIGATION (0–10)
  What it measures: Ability to make and communicate good technical decisions when requirements
  are incomplete, stakeholders disagree, constraints are uncertain, or all options have significant costs.

  0–2: Requires clear requirements before beginning; escalates when requirements are ambiguous
  3–4: Identifies and resolves ambiguity in defined scope; still blocked by structural uncertainty
  5–6: Defines their own constraints when given ambiguous goals; documents decisions and rationale
  7–8: Drives alignment among stakeholders with conflicting requirements; proposes a path when none is obvious
  9–10: Creates organizational alignment around a technical direction in deeply uncertain situations;
        decision-making is trusted by leadership as sound even under incomplete information

  Behavioral indicators at 7+:
  — "I don't have enough information to decide X, so I've made these assumptions, and here's what
     we'd need to revisit them" — documented before being asked
  — Successfully drove to a decision on a cross-functional disagreement without EM escalation
  — Has a track record of decisions that looked right 6 months later; not just in the moment

  Development actions:
  — Give them a problem with intentionally incomplete requirements; observe how they navigate
  — Assign them to facilitate a technical alignment meeting with conflicting stakeholder inputs
  — After a significant ambiguous decision: debrief using skills/mentoring/delegation.md debrief structure
```

### Step 2 — Calculate Technical Leadership Composite Score

```
Technical Leadership composite score: sum of all five dimensions (0–50)

SCORE THRESHOLDS

42–50 — Technical Leader, Staff+ Operating Level
  All five dimensions showing consistently at 7+
  The team, the product organization, and leadership all see this person as a technical leader
  Action: Formal promotion case should be open or imminent; sponsorship at VP+ level active
  Risk: Without formal recognition, flight risk is high (skills/performance/retention-risk.md)

32–41 — Senior IC With Emerging Technical Leadership
  3–4 dimensions at 6+; 1–2 dimensions at 4–5
  Peers recognize them as a technical leader; organization may not yet
  Action: Close the gap dimensions; build cross-functional visibility; begin calibration attribution
  Timeline to 42+: Typically 2–4 quarters with deliberate investment in the gap dimensions

22–31 — Developing Technical Leader
  Mixed profile: 1–2 dimensions strong; others at 3–4
  Growing into technical leadership; still primarily IC-oriented
  Action: Identify highest-leverage dimension to develop; design one deliberate opportunity per quarter
  Timeline to 32+: Typically 3–6 quarters; depends heavily on role scope and delegation maturity

12–21 — IC Focus; Leadership Development Secondary
  Most dimensions at 2–3; some may be at 1
  Current role may not provide the scope to develop leadership dimensions
  Action: Confirm career aspiration (skills/people/career-development.md); IC leadership track may not be the goal
  Do not force leadership development on engineers who aspire to deep IC specialization

0–11 — Execution Focus; Leadership Development Premature
  Dimensions primarily at 1–2; role requires execution clarity, not leadership scope
  Action: Focus on skills/people/growth-plans.md technical dimension; leadership is a second phase
  Exception: Identify if structural role constraints are suppressing dimensions that have potential

Hard blockers to technical leadership advancement:
  Dimension 3 (Team Elevation) ≤2: Technical expertise that doesn't transfer is hoarding, not leadership
  Dimension 2 (Cross-Functional) ≤2: Cannot be a technical leader if non-engineers cannot work with them
  These two dimensions are cultural to technical leadership — low scores require direct conversation
```

### Step 3 — Detect Technical Leadership Failure Modes

```
Technical leaders exhibit predictable failure modes when growing into the role.
Detect early; intervene before the pattern calcifies.

FAILURE MODE 1 — STILL EXECUTING
  What it looks like: Person is technically excellent but continues contributing at IC level;
  spending 80%+ of time on direct technical work rather than enabling others
  Why it happens: Execution feels productive and certain; leadership is ambiguous and slower
  Why it matters: The team remains dependent on one person's capacity; can't scale
  Detection: "Would the team be able to solve [X] if this person were unavailable for 2 weeks?"
  Intervention: Explicit conversation: "I want to be direct about something. Your value to the
  team is no longer primarily in what you build. It's in what you make possible for others to build."
  Action: Reduce direct technical work by 20–30%; explicitly assign leadership work in its place

FAILURE MODE 2 — COMMUNICATION GAP
  What it looks like: Can articulate technical decisions brilliantly to engineers; completely unable
  to communicate the same ideas to product managers or executives in a way that produces action
  Why it happens: Technical communication is its own skill; most EMs develop engineers in
  technical domains without developing their communication range
  Why it matters: Technical decisions that leadership can't understand get overruled or ignored
  Detection: "Can they explain the cost of the technical debt to a VP in one sentence?"
  Intervention: Assign specific cross-functional communication practice; debrief after each
  instance; coach on the business-language translation: "What does this mean for the customer?"

FAILURE MODE 3 — CONTEXT HOARDING
  What it looks like: Technical leader becomes a single point of failure; team cannot function
  without them; they hold architectural reasoning in their head and do not transfer it
  Why it happens: Context = power; sharing it feels like losing influence; often unconscious
  Why it matters: When the context holder leaves, the organization loses years of learning
  Detection: "Do new engineers need to ask this person for every architectural decision?
             Is there documentation they created that others can learn from independently?"
  Intervention: Make context documentation a professional expectation, not a nice-to-have
  Action: Require an architectural decision record (ADR) for every significant technical choice;
  require runbooks for every critical system they own; measure: "Can someone else use this?"

FAILURE MODE 4 — STANDARDS WITHOUT TEACHING
  What it looks like: Technical leader raises the team's bar in code review by rejecting work
  that doesn't meet their standard — but doesn't explain the standard in a way others can internalize
  Why it happens: It's faster to reject than to teach; teaching requires patience and skill
  Why it matters: The team becomes demoralized and dependent; the bar doesn't actually rise
  Detection: "After 3 months of reviews by this person, have any of the junior engineers
             improved? Or are they still submitting the same quality and being corrected?"
  Intervention: Redirect code review behavior: "For every correction you give, include a
  'here's why' comment that the person could use independently next time."
  Measure: Are engineers growing faster because of their reviews?

FAILURE MODE 5 — TECHNICAL LEADER WITHOUT ORGANIZATIONAL VISIBILITY
  What it looks like: Person operates as a technical leader but is invisible in calibration;
  leadership doesn't know their name; promotions take longer than warranted or don't happen
  Often: engineers from underrepresented groups; engineers in infrastructure or backend roles
  Why it matters: Leadership rewards what they see; invisible leaders lose to visible ICs
  Detection: "Could the CTO describe this person's impact in two sentences?"
  Intervention: Sponsorship (skills/people/career-development.md); attribution in executive forums;
  send cross-functional attribution monthly to decision-makers before calibration
```

### Step 4 — Design Technical Leadership Growth Opportunities

```
Technical leadership dimensions are developed through specific experiences — not courses
and not passive observation. Match the experience to the dimension gap.

Growth opportunity design by dimension:

DIMENSION 1 — TECHNICAL VISION
  Opportunity: "Own the 12-month technical roadmap for [domain]. Present it to [VPs] next quarter."
  What to observe: Can they articulate a future state? Can they prioritize investments?
  Debrief focus: How did leadership respond? What would you change about the framing?
  Timeline: 6–9 months to see reliable execution at 7+

DIMENSION 2 — CROSS-FUNCTIONAL INFLUENCE
  Opportunity: "You're the technical lead for the next product initiative planning session.
  You do not need to attend with me — represent engineering yourself."
  What to observe: Do non-engineers leave with a changed understanding? Did any decisions shift?
  Debrief focus: What was harder than expected? What would you do differently in the framing?
  Timeline: 3–6 months with regular practice

DIMENSION 3 — TEAM ELEVATION
  Opportunity: "You're mentoring [specific engineer] for the next quarter. Their growth goal is
  [specific skill]. I'll measure it at the end of the quarter."
  What to observe: Did the mentee grow? Is the team asking fewer questions to the mentor over time?
  Debrief focus: What about mentoring was harder than building? What changed in how you think about impact?
  Timeline: One successful mentoring cycle produces measurable change; 2–3 cycles establishes the behavior

DIMENSION 4 — RISK DETECTION
  Opportunity: "Before the next sprint review, I want a written technical risk audit for [domain].
  Two pages. What could go wrong in the next 6 months? What's your confidence in the current system?"
  What to observe: Are the risks specific and prioritized? Do they include system-level thinking?
  Debrief focus: Which risks did you catch that I wouldn't have? What would you add next time?
  Timeline: After 3–4 cycles, risk detection becomes a habit, not an assignment

DIMENSION 5 — AMBIGUITY NAVIGATION
  Opportunity: "Here is a problem with no clear answer. [Give real, unresolved technical question
  the team faces.] I want you to facilitate the team to a decision by [date]. I'll be in the room
  but you're leading it."
  What to observe: Do they create clarity without forcing premature closure? Do they document
  the decision with rationale? Do they identify what would trigger a revisit?
  Debrief focus: What made ambiguity uncomfortable? What did you do to manage it?
  Timeline: 4–6 instances to develop reliable behavior; 12–18 months to reach 7+
```

---

## Decision Tree

```
What does the technical leadership assessment reveal?

├── COMPOSITE SCORE <22 (Execution Focus)
│   └── Confirm career aspiration before investing in leadership development
│       skills/people/career-development.md — IC specialist track vs. technical leadership track
│       If IC specialist is the goal: leadership development is wrong investment
│       If technical leadership is the goal: start with Dimension 3 (team elevation) — lowest barrier

├── DIMENSION 3 (TEAM ELEVATION) ≤2
│   └── Critical gap — technical leadership cannot develop without this dimension
│       Direct conversation: "Technical leadership means others grow because of you, not with you."
│       Assign mentoring responsibility with observable outcome tracking
│       Check for Context Hoarding failure mode — may be the root cause

├── DIMENSION 2 (CROSS-FUNCTIONAL INFLUENCE) ≤3
│   └── Technical expertise without cross-functional influence is a bottleneck, not leadership
│       Assign cross-functional forum responsibility (without EM) next month
│       Coach on business-language translation before each exposure
│       Measure: Did any product/business decision change based on their input?

├── FAILURE MODE DETECTED (Still Executing / Context Hoarding / Standards Without Teaching)
│   └── Name it directly; don't let it calcify
│       Frame: "I want to be direct about what I'm observing. Here's the pattern. Here's why it matters."
│       Assign the specific behavioral change; set a 60-day measurement point

├── COMPOSITE 32–41 (EMERGING LEADER) BUT NO ORGANIZATIONAL VISIBILITY
│   └── Sponsorship is urgently needed — invisible leaders don't get promoted
│       Cross-functional attribution email: monthly before calibration period
│       Executive forum visibility: next Q-business review or architecture review
│       skills/performance/calibration.md — build calibration brief with leadership evidence now

├── COMPOSITE 42+ (OPERATING AT STAFF LEVEL)
│   └── Promotion case should be open
│       If not: Flight risk is elevated — skills/performance/retention-risk.md
│       If delayed: Honest conversation about timeline; specific gap preventing submission
│       If structural ceiling (role doesn't exist): Career conversation (skills/people/career-development.md)

└── STABLE COMPOSITE ACROSS 3 QUARTERS (SAME SCORE ± 3)
    └── Plateau investigation
        Is the role providing sufficient scope?
        Is the EM under-delegating, limiting the person's ability to practice leadership?
        Is the target level realistic for this person's career aspiration?
        Ask directly: "You've been at roughly this level for 3 quarters. What do you think is holding the score flat?"
```

---

## Output

### Technical Leadership Profile

```
TECHNICAL LEADERSHIP PROFILE — {{Name}} — {{Level}} — {{Date}}

DIMENSION SCORES (0–10 each)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Dimension                    | Q-2   | Q-1   | Current | Trend | Key behavioral evidence
Technical Vision             | {{N}} | {{N}} | {{N}}   | {{↑/→/↓}} | {{specific instance}}
Cross-Functional Influence   | {{N}} | {{N}} | {{N}}   | {{↑/→/↓}} | {{specific instance}}
Team Elevation               | {{N}} | {{N}} | {{N}}   | {{↑/→/↓}} | {{specific instance}}
Risk Detection               | {{N}} | {{N}} | {{N}}   | {{↑/→/↓}} | {{specific instance}}
Ambiguity Navigation         | {{N}} | {{N}} | {{N}}   | {{↑/→/↓}} | {{specific instance}}

COMPOSITE: {{0–50}} | Level: {{Staff+ Operating / Emerging / Developing / IC Focus / Execution}}

FAILURE MODE SCAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Still executing: {{Detected / Not detected}} | If detected: {{action}}
Context hoarding: {{Detected / Not detected}} | If detected: {{action}}
Communication gap: {{Detected / Not detected}} | If detected: {{action}}
Standards without teaching: {{Detected / Not detected}} | If detected: {{action}}
Organizational invisibility: {{Detected / Not detected}} | If detected: {{sponsorship action}}

ACTIVE GROWTH OPPORTUNITY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Target dimension: {{dimension}} | Current score: {{N}} | Target score: {{N}}
Assigned opportunity: {{specific experience}}
Observable outcome: {{what will be measurably different in 90 days}}
Debrief scheduled: {{date}}

PROMOTION READINESS CONNECTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Leadership/Influence PR dimension score: {{N}}/10 | Evidence from TL profile: {{Y/N}}
Calibration-ready evidence: "In {{context}}, they demonstrated {{behavior}} that elevated {{who}}.
The observable outcome was {{impact}}."
Promotion case status: {{Not started / In development / Submitted / Declined / Approved}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All 5 dimensions scored with specific behavioral evidence | Base: 60% |
| Failure modes actively scanned quarterly | +15% |
| Growth opportunity assigned per gap dimension with observable outcome | +15% |
| Organizational visibility actions taken (sponsorship, attribution) | +10% |
| Composite trend tracked across 3+ quarters | +5% |
| Dimensions scored from impression without behavioral evidence | −30% |
| Failure modes present but not named directly | −20% |
| Technical leader invisible to calibration group | −20% |
| Leadership development pursued for engineer who aspires to IC specialization | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Still executing** | Technical leader contributes at IC level; team remains dependent; no multiplication | Explicit conversation. Reduce direct technical work. Assign leadership scope with measurable outcome. |
| **Context hoarding** | Team cannot function without this person present; single point of failure | Require ADRs and runbooks. Make context transfer a professional expectation. Measure independence. |
| **Invisible leader** | Composite 40+; not recognized in calibration; promotion overdue | Monthly cross-functional attribution. Executive forum visibility. Sponsorship — say their name in the right rooms. |
| **Standards without teaching** | Juniors not growing despite regular code review; feel rejected, not developed | Redirect: every correction requires a "here's why" comment; measure junior growth velocity. |
| **Leadership development mismatch** | Engineer aspires to deep IC specialization; EM investing in leadership dimensions | Career aspiration conversation first. Technical leadership development requires career alignment. |

---

## References

- `skills/mentoring/delegation.md` — Level 4–5 delegation maturity is the operational expression of technical leadership
- `skills/mentoring/growth-tracking.md` — Technical leadership dimension scores feed growth tracking
- `skills/mentoring/mentor-plan.md` — Mentoring assignment (Dimension 3) designed here
- `skills/people/career-development.md` — Career aspiration determines whether TL development is the right investment
- `skills/performance/promotion-readiness-tracking.md` — Leadership/Influence dimension of promotion readiness scored from TL dimensions
- `skills/performance/calibration.md` — Calibration-ready evidence for leadership dimension built from this profile

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/mentoring/delegation.md` | Level 4–5 delegation maturity is the operational proxy for technical leadership scope |
| `skills/performance/promotion-readiness-tracking.md` | Technical leadership composite → Leadership/Influence PR dimension |
| `skills/performance/calibration.md` | TL behavioral evidence is the strongest calibration evidence for leadership claims |
| `skills/people/career-development.md` | Career aspiration must align before TL development investment |
| `skills/mentoring/growth-tracking.md` | TL dimension scores are tracked in the growth tracking dashboard monthly |
