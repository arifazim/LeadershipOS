# Skill: Performance Review

**Domain**: People Leadership Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Formal cycle (semi-annual or annual) + Continuous calibration — never first surfaced at the formal review

---

## Purpose

Conduct performance reviews that are accurate, fair, and useful — grounded in observable evidence, calibrated against the appropriate level, and free from the cognitive biases that consistently distort engineering performance assessments. The formal review should contain no surprises: every significant evaluation should have been communicated in real-time through feedback.

**What the EM does automatically**: At every performance review cycle, the EM:
1. Gathers evidence from multiple sources — not just their own observation
2. Evaluates against level expectations, not against the best person on the team
3. Assesses five dimensions rather than a single "performance" judgment
4. Calibrates with peers to catch bias before the review reaches the employee
5. Distinguishes strong performance from high potential from high output — these are different things

**Ethical principle**: Performance review is an act of institutional power — it affects compensation, promotion, and career trajectory. The EM who rates based on recency bias, similarity bias, or organizational favoritism causes real harm. Every evaluation must be defensible with specific evidence. "I just felt like they were performing at a X level" is not a review — it is an opinion with institutional consequences. The standard for review is evidence, not instinct.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Level expectations** | The defined expectations for the person's current level (from the engineering ladder or equivalent) |
| **Evidence record** | Observable behaviors, deliverables, and impact collected over the review period |
| **Multi-source input** | Peer feedback, cross-functional perspective, and self-assessment |

### Optional
| Input | Description |
|---|---|
| **Prior review content** | What was said last cycle; what was committed to; what changed |
| **Growth plan progress** | Whether the person made progress on their stated development goals |
| **Business context** | Whether organizational changes (reorg, product pivot) affected the person's opportunity to perform |

---

## Analysis

### Step 1 — Assess the Five Performance Dimensions

```
Evaluate against level expectations across five dimensions:

Dimension 1: Technical Execution (weight: 30%)
  What to assess: Quality of code/architecture/systems work; technical judgment; 
                  handling of complexity and ambiguity; code review quality
  Evidence sources: PRs merged, incidents caused/resolved, design documents, technical decisions
  Level calibration:
    L3: Completes assigned tasks with appropriate guidance
    L4: Independently completes medium-complexity work; reviews peers effectively
    L5: Drives large technical initiatives; influences architecture across the team
    L6: Defines technical direction; raises bar across teams or the org
    M1: Ensures team delivers technically sound work; catches risks early
    M2: Sets technical direction for multiple teams; builds engineering capability

Dimension 2: Scope and Ownership (weight: 25%)
  What to assess: Proactiveness in taking on work; clarity of what they own and how they protect it;
                  raising risks before they become incidents
  Evidence sources: Committed deliverables vs. actual delivery; unsolicited ownership; risk escalations
  Level calibration:
    L3: Owns assigned tasks within a project
    L4: Owns a project or feature area end-to-end
    L5: Owns a component, service, or team-level initiative
    L6: Owns cross-team or platform-level outcomes
    M1: Team delivers on commitments; EM owns team output
    M2: Multiple teams deliver; EM owns organizational outcomes

Dimension 3: Communication and Collaboration (weight: 20%)
  What to assess: Writing quality, verbal communication, cross-functional effectiveness,
                  peer feedback given, conflict handling
  Evidence sources: Slack/doc communication, peer feedback, retrospective participation,
                   stakeholder feedback, incident communication
  Level calibration:
    L3: Communicates clearly within the team
    L4: Communicates effectively across the team; gives useful peer feedback
    L5: Communicates complex topics to non-technical stakeholders; influences cross-team
    L6: Communicates with executive stakeholders; shapes engineering narrative externally
    M1: Team communicates effectively; EM communicates for the team to partners
    M2: Cross-functional relationships are strong; org communication is healthy

Dimension 4: Leadership and Influence (weight: 15%)
  What to assess: Developing others, sponsoring peers, informal leadership, decision quality
  Evidence sources: Mentorship given, junior engineer growth attributable to them,
                   decisions they led, changes they championed
  Level calibration:
    L3: Learning; receives development; little expected at this dimension
    L4: Mentors newer engineers; contributes to team culture
    L5: Develops L3–L4 engineers; shapes team practices
    L6: Develops senior engineers; defines team culture and raises the bar
    M1: Develops direct reports; builds team cohesion
    M2: Develops managers; builds organizational capability

Dimension 5: Delivery Impact (weight: 10%)
  What to assess: Business or user outcomes attributable to their work — not output volume
  Evidence sources: Shipped features and their adoption/impact, incidents prevented,
                   cost savings, performance improvements with measured outcomes
  Level calibration:
    L3: Contributes to team delivery; individual impact emerging
    L4: Measurable individual impact on team objectives
    L5: Significant impact on product or engineering goals
    L6: Material impact on company-level outcomes
    M1: Team delivers on OKRs; delivery predictability is high
    M2: Organizational outcomes attributable to EM's leadership
```

### Step 2 — Score Each Dimension

```
Rating scale for each dimension:
  Significantly Exceeds (SE) = 5: Operating well above level expectations consistently
  Exceeds (E) = 4: Above level expectations; demonstrated consistently
  Meets (M) = 3: Fully meeting level expectations; what we expect at this level
  Developing (D) = 2: Partially meeting expectations; clear gaps with a development path
  Significantly Below (SB) = 1: Not meeting level expectations; performance action required

Composite performance score:
  Score = (Technical × 0.30) + (Scope × 0.25) + (Communication × 0.20) + 
          (Leadership × 0.15) + (Delivery × 0.10)

Score interpretation:
  4.0–5.0: Significantly Exceeds overall — promotion conversation / exceptional rating
  3.5–3.9: Exceeds — strong performer; differentiated recognition appropriate
  2.5–3.4: Meets — solid performer at level; standard rating
  2.0–2.4: Developing — on a path; needs targeted support; progress check in 90 days
  1.0–1.9: Significantly Below — performance management required; PIP may be appropriate

Hard blocker rule:
  Any dimension at SB (1) blocks an overall Meets or above rating regardless of composite
  A person cannot Meet overall if they are Significantly Below in any dimension
```

### Step 3 — Check for Cognitive Biases

```
The six most common biases in engineering performance reviews:

1. Recency bias
   Definition: Over-weighting the most recent 4–6 weeks vs. the full review period
   Check: "Am I rating based on what happened in November or across the full year?"
   Fix: Review evidence from all four quarters before forming a view

2. Halo/Horns effect
   Definition: One strong (halo) or weak (horns) attribute colors the entire rating
   Check: "Is my view of their {{technical skill}} shaping how I rate their {{communication}}?"
   Fix: Score each dimension independently before forming a composite view

3. Similarity bias
   Definition: Rating people who think, communicate, or work like the EM more favorably
   Check: "Would I rate this person the same if they had the style of someone very different from me?"
   Fix: Calibrate with peers who have different styles; look for evidence, not resonance

4. Attribution asymmetry
   Definition: Attributing successes to the person and failures to external factors (or vice versa)
   Check: "Am I giving them credit for the successful project because it was successful?
          Did I consider their contribution when it failed?"
   Fix: Ask separately: "What did they do? What was the environment?"

5. Scope visibility bias
   Definition: Higher visibility work (customer-facing, executive-attended) rated higher than
               equally valuable but less visible work (infrastructure, tooling, mentorship)
   Check: "Am I rating this person low because I don't see their work, not because they don't perform?"
   Fix: Actively gather evidence from areas you don't observe directly

6. Expectation anchoring
   Definition: Anchoring on prior ratings; good performers stay good; poor performers stay poor
   Check: "Am I re-rating based on this year's evidence or last year's review?"
   Fix: Start with a blank sheet; let the evidence determine the rating
```

### Step 4 — Calibrate Before Delivering

```
Calibration session purpose:
  To surface and correct for individual manager bias before ratings reach employees
  Not to force consensus — to require justification

Calibration preparation:
  Bring evidence, not opinions: "They are a solid performer" is not calibratable
  "Here are three instances of operating at L5 scope in the last quarter" is
  
  Calibration-ready evidence format:
  Name + Level + Dimension + Behavior observed + Impact + Comparison to level expectation

In calibration:
  When challenged: "What evidence do you have for that rating?"
  When you hear it applied to your reports: welcome the challenge
  If your rating is out of step with peers: investigate why before defending it
  
  Common calibration corrections:
  EM rate too high: "You said this person Exceeds at L4; here's what our L5 benchmark looks like"
  EM rate too low: "You said they're Developing in communication; three cross-functional partners
                   gave them positive feedback. Are you weighing those?"

Rating distribution awareness:
  Most teams should have a roughly normal distribution of ratings
  If everyone on your team Exceeds: you are either managing an exceptional team (rare)
  or you have calibration bias (common)
  If everyone Meets exactly: you may be avoiding differentiation
  Differentiation serves the high performers who deserve recognition
  and the low performers who need clarity
```

### Step 5 — Deliver the Review Conversation

```
Review conversation structure:

Before the conversation:
  The person should not be surprised by any substantive content
  If there is surprise: you failed to give real-time feedback during the year
  Fix for next cycle: → more frequent feedback using skills/people/feedback.md

Conversation format (60–90 minutes):

Part 1: Start with their self-assessment (15–20 min)
  "Before I share my perspective, I want to hear yours. How do you think this period went?"
  This reveals: their self-awareness, whether they'll be surprised by your assessment,
  and what they're proud of that you may have underweighted

Part 2: Share your assessment (20–30 min)
  Dimension by dimension; evidence for each rating
  Acknowledge convergence: "That matches what I observed"
  Name divergence: "I saw that differently — here's the evidence I'm working from"
  Do NOT hedge a difficult rating: if they're Developing, say Developing
  
  Framing for difficult ratings:
  "My assessment is that you're Developing in {{dimension}} this period.
  Here's what I observed: {{evidence}}. Here's what Meets looks like: {{behavior}}.
  Here's what I want to see from you in the next 6 months: {{specific expectations}}"

Part 3: Forward-looking development (20–25 min)
  Regardless of rating: what is the person working toward?
  → Invoke: skills/people/growth-plans.md for IDP creation or update
  The review should end with a development conversation, not just a rating

Part 4: Close with shared understanding
  "What's your reaction to this assessment?"
  "Is there anything I've said that doesn't feel right to you?"
  "What do you need from me to make the next 6 months strong?"
```

---

## Decision Tree

```
What does the performance assessment reveal?

├── SIGNIFICANTLY EXCEEDS IN MULTIPLE DIMENSIONS
│   └── Promotion conversation is likely appropriate
│       Do not let strong performance stagnate — attrition follows
│       → Invoke: skills/people/promotion.md for internal promotion advocacy
│       Calibrate: "This person is operating at the next level. Here is the evidence."

├── DEVELOPING — 1–2 DIMENSIONS WITH CLEAR PATH
│   └── This is a development case, not a performance case
│       Create a focused development plan for the specific dimensions
│       90-day check-in with explicit expectations
│       → Invoke: skills/people/growth-plans.md for IDP structure
│       Communicate: "I am invested in your success. Here is what I see and what I need."

├── SIGNIFICANTLY BELOW IN ANY DIMENSION
│   └── Do not wait — this is a performance management situation
│       Prepare a written performance improvement plan (PIP)
│       Loop in HR before the conversation
│       Be direct: "Your performance in {{dimension}} is not meeting expectations.
│       Here is what I need to see change, by when, and what will happen if it doesn't."
│       Document all conversations from this point forward
│       → Escalate to HR if behavior doesn't change within the agreed timeline

├── PERSON DISPUTES THE RATING
│   └── Listen fully before responding
│       Ask for their evidence: "Tell me what you're seeing that I'm not"
│       If new evidence emerges: update the rating
│       If no new evidence: hold the rating with explanation
│       "I hear that you see it differently. My assessment is based on {{evidence}}.
│       I'm open to reviewing this if you have additional evidence to share."
│       Document the dispute

├── REVIEW CONTAINS A SURPRISE FOR THE PERSON
│   └── This is a feedback failure — the EM did not give real-time feedback
│       Acknowledge it: "I realize this may be coming as a surprise. I should have
│       raised this earlier. That's on me. Going forward, I'm committed to giving
│       this feedback in real-time so you're never surprised in a review."
│       Commit to more frequent feedback next cycle

└── HIGH OUTPUT BUT WRONG KIND OF WORK
    └── Volume of activity ≠ impact
        The engineer who ships a lot of low-value code may have lower impact than one
        who ships selectively and perfectly
        Calibrate against outcomes, not activity
        "The question isn't how much you shipped — it's what the outcomes were."
```

---

## Output

### Performance Review Document

```
PERFORMANCE REVIEW — {{Person}} — {{Period}} — {{date}}

SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Overall rating: {{SE | E | M | D | SB}} | Composite score: {{N}}/5
Level: {{Current}} | Operating at: {{Below level | At level | Above level | Consistently above}}
Promotion ready: {{Y / N / Not yet — 6–12 months}}
Review contains surprises: {{Y (feedback gap — address) | N}}

DIMENSION SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Dimension               | Rating | Evidence (2–3 specific instances)
Technical Execution     | {{SE/E/M/D/SB}} | {{Specific behavior + impact}}
Scope and Ownership     | {{SE/E/M/D/SB}} | {{Specific behavior + impact}}
Communication           | {{SE/E/M/D/SB}} | {{Specific behavior + impact}}
Leadership/Influence    | {{SE/E/M/D/SB}} | {{Specific behavior + impact}}
Delivery Impact         | {{SE/E/M/D/SB}} | {{Specific behavior + impact}}

BIAS CHECK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Recency bias: {{Checked | Identified — corrected}}
Halo/Horns: {{Checked | Identified — corrected}}
Similarity bias: {{Checked | Calibrated with peer}}
Calibrated: {{Y/N}} | Calibration outcome: {{No changes | Rating adjusted — reason}}

FORWARD PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Development focus for next 6 months: {{Specific dimension and behavior}}
Expectations for next review: {{What SE/E/M looks like for this person}}
IDP created/updated: {{Y/N → skills/people/growth-plans.md}}
Performance action required: {{Y — HR looped in | N}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Five dimensions scored with evidence | Base: 65% |
| Multi-source input gathered | +15% |
| Bias check performed before calibration | +10% |
| Calibrated with peers before delivery | +10% |
| Review contains no surprises (real-time feedback given) | +5% |
| Single overall impression used instead of dimensions | −25% |
| Review based on recency only | −20% |
| Rating not supported by specific behavioral evidence | −30% (disqualifying) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Review as surprise** | Employee hears significant developmental feedback for the first time in the formal review | Give real-time feedback. Reviews confirm patterns; they don't deliver them. |
| **Activity rated as performance** | High-output engineer rated above high-impact engineer | Calibrate against outcomes and level expectations, not volume of commits or PRs. |
| **Bias unchecked** | All engineers on the team rated similarly; or notable outliers without evidence | Run the six-bias checklist before calibration. Evidence required for every rating. |
| **Difficult rating avoided** | Person should be Developing or SB; EM rates Meets to avoid the conversation | A dishonest rating serves neither the person nor the team. They deserve to know, with time to fix it. |
| **Forward plan omitted** | Rating delivered; no development conversation; person leaves unclear on next steps | Every review ends with a growth plan conversation, regardless of the rating. |

---

## References

- `skills/people/feedback.md` — Performance reviews should contain no content not already delivered via real-time feedback
- `skills/people/growth-plans.md` — Forward plan from every review should produce or update an IDP
- `skills/people/promotion.md` — Strong performance reviews initiate the promotion process
- `skills/career/promotion/promotion-readiness.md` — Level expectations referenced in this skill

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/feedback.md` | Real-time feedback is the prerequisite for a non-surprising review |
| `skills/people/growth-plans.md` | Development plan created or updated at every review |
| `skills/people/promotion.md` | SE performance rating initiates the EM's promotion advocacy process |
