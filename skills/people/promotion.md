# Skill: Promotion

**Domain**: People Leadership Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Ongoing advocacy — with formal submission at calibration cycles (typically semi-annual or annual)

---

## Purpose

Advocate effectively for direct reports' promotions by building a defensible case grounded in evidence, calibrating the timing correctly, preparing the person for the calibration process, and managing both the success and the disappointment outcomes with honesty and care.

**What the EM does automatically**: When promoting a direct report, the EM:
1. Assesses promotion readiness against level expectations — not against the most senior person on the team
2. Builds a promotion packet that makes the case through evidence, not advocacy alone
3. Navigates calibration politics honestly — without gaming the system or inflating claims
4. Prepares the person for what to expect before, during, and after the decision
5. Manages disappointment outcomes so they do not become attrition

**Ethical principle**: Promoting someone before they are ready causes harm — both to the person (set up to fail at the next level) and to the team (level expectations degraded). Promoting someone long after they are ready causes harm too — the person loses trust in the organization and frequently leaves. The EM's job is accurate assessment plus effective advocacy, not advocacy alone. Inflating a case to win calibration is a short-term win with long-term trust costs.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Promotion readiness assessment** | Output from `skills/career/promotion/promotion-readiness.md` |
| **Evidence record** | Specific examples of operating at the next level, from `skills/career/promotion/promotion-evidence.md` |
| **Level expectations** | The documented bar for the target level from the engineering ladder |

### Optional
| Input | Description |
|---|---|
| **Calibration context** | Who will be in the room; what bar has been set in recent cycles |
| **Organizational dynamics** | Whether there is quota pressure, budget constraints, or a known bias pattern in calibration |
| **Person's visibility** | How well-known the person is to the decision-makers beyond the EM |

---

## Analysis

### Step 1 — Assess Readiness Before Advocating

```
The EM must honestly answer three questions before building a promotion case:

Question 1: Is this person operating at the next level — or just close to it?
  Operating at the next level: The behavior, scope, and impact are consistent and observable
                               at the target level over a sustained period (typically 3–6 months)
  Close to it: The potential is there; the consistent demonstration isn't
  
  Why it matters: Promotion on potential (not sustained demonstration) has a high failure rate
  Calibration question: "Show me 3 instances in the last 6 months where they operated at Level N+1"
  
  If the answer is "I believe they will" rather than "here is where they did":
  → Not ready. → Invoke: skills/people/growth-plans.md to build the path.

Question 2: Will they succeed at the next level — or just receive the title?
  The test: If this person were placed in an L(N+1) role today with L(N+1) expectations,
  would they succeed without additional scaffolding?
  
  Failure mode: Promoting someone who needs to be managed like an L(N) after the promotion
  Result: Performance issues appear at the new level; person feels set up to fail

Question 3: Will not promoting them cause attrition or significant disengagement?
  This question must be separated from the readiness question
  Do NOT promote someone who isn't ready just to retain them
  DO accelerate the development plan if attrition risk is high
  → Invoke: skills/people/engagement.md for retention risk

Readiness levels:
  Ready now: Evidence is strong; case is defensible; promote this cycle
  Ready in 1–2 quarters: Evidence needs one more demonstration; develop and resubmit
  Not ready: Significant gap in ≥1 dimension; development plan needed before promotion discussion
```

### Step 2 — Build the Promotion Packet

```
Promotion packet structure (EM-authored):

Section 1: The Case (2–3 sentences)
  "{{Name}} has been operating consistently at the {{target level}} for the past 
  {{N months}}. The clearest evidence of this is {{headline example}}. 
  They are ready for this promotion now."
  
  This section is what calibrators read first and remember most.
  It must be specific, confident, and evidence-anchored.
  Hedging language ("I believe," "I think they might be") signals the EM's own uncertainty.

Section 2: Evidence by Dimension (5 sections, mirroring performance dimensions)
  Format for each: Behavior → Context → Impact → Level connection
  
  Technical Execution:
    "In {{situation}}, {{name}} {{behavior}}, which resulted in {{impact}}.
    This demonstrates {{target level}} because {{level expectation}}."
  
  Scope and Ownership:
    Same format. Focus on the size and type of ownership, not just quality.
  
  Communication and Collaboration:
    Same format. Focus on audience level and influence, not just clarity.
  
  Leadership and Influence:
    Same format. Focus on observable impact on others' growth or decisions.
  
  Delivery Impact:
    Name specific, measurable outcomes. Numbers > descriptions.
    "$45K annual infrastructure savings" > "significantly reduced infrastructure cost"

Section 3: Cross-Functional Validation
  Quotes or paraphrases from partners outside the team
  "{{Cross-functional partner}} noted that {{specific observation}}"
  This section demonstrates visibility beyond the EM's direct view

Section 4: Next Level Expectations
  Name 2–3 areas where they will continue to grow into the new level
  This demonstrates the EM's honest assessment, not just advocacy
  "At {{target level}}, I'll support {{name}}'s continued development in {{area}}.
  This will not prevent their success — it is the natural growth edge at that level."

Section 5: Timing Rationale
  Why now, not next cycle?
  If there is a specific business reason (team needs, expanded scope): name it
  If there is urgency: be honest about it; don't manufacture urgency
```

### Step 3 — Navigate Calibration

```
What happens in calibration:
  A group of managers (often with a senior leader facilitating) reviews promotion cases
  together. Cases are evaluated against level expectations across the organization.
  Some companies have quota pressure; some have no limits.

How to present in calibration:
  Start with the case summary (Section 1)
  Lead with the strongest evidence instance
  Answer "tell me more" with the specific behavior — not the impact alone
  Be ready for: "How does this compare to {{person at that level}}?" 
  → Answer in terms of the level expectations, not the person

Calibration challenges and responses:

Challenge: "This feels more like a strong L4 than an early L5"
  Response: "I hear that. Here's the L5 behavior I'm anchoring on: {{specific}}.
  Can you tell me what would make this a clearer L5 case for you?"
  Never: "I strongly disagree" without evidence to follow

Challenge: "We've promoted several people recently; the bar is high"
  Response: Name the evidence; don't engage the quota argument
  "I understand. Here's what the case rests on: {{evidence}}.
  If this doesn't clear the bar, I want to understand exactly what would."

Challenge: "I don't know this person"
  This is a visibility failure — address it before calibration if possible
  "{{Name}} hasn't had much cross-functional visibility yet.
  {{Cross-functional partner}} would speak to their work. Would it help to loop them in?"

After calibration:
  If approved: Follow the process for communicating; don't tell the person before the process allows
  If declined: Understand the specific reason from the calibrating group
               "What specifically wasn't there? What would I bring next cycle?"
               Translate the calibration feedback to development action immediately
```

### Step 4 — Deliver the Outcome

```
Promotion approved:

Delivery format: In person, not email; this is a significant moment
Frame: "I'm delighted to tell you that your promotion to {{level}} has been approved."
Then: Name why it happened — name specific evidence from the packet
"The case I made was centered on {{headline example}}. This is exactly the kind of work
that demonstrates {{level}} capability."
After the celebration: Set clear expectations for the next level
"As {{new level}}, here's what I'll be expecting from you going forward: {{specific expectations}}"

Promotion declined:

Delivery format: In person; within 48 hours of the decision; before they hear from someone else
Frame: "I want to give you direct feedback on how the promotion conversation went.
I advocated for you and the calibration group didn't approve it this cycle.
Here's exactly what was said."
Be specific about the calibration feedback — do not soften it into vagueness
"The specific concern raised was {{concern}}. Here is what I'm going to do differently
to build the case for next cycle: {{specific action}}"

Critical: Do not let the declined promotion become a mystery.
"You just need to keep doing what you're doing" after a rejection is dishonest.
Name what the gap was. Name what changes. Name the next target cycle.
→ Invoke: skills/career/promotion/promotion-gaps.md to update the development plan

Managing disappointment:
  Give the person space to react: "How are you feeling about this?"
  Don't rush past the disappointment: "I know this is disappointing. I want to sit with that."
  Then: future-focused conversation with specific commitments
  Monitor engagement for the 4 weeks following: rejection is a high attrition-risk moment
  → Invoke: skills/people/engagement.md for monitoring protocol
```

### Step 5 — Timing the Promotion

```
When to promote (timing factors):

Too early signals:
  ✗ Evidence is from the last 4–6 weeks only (recency)
  ✗ Only one dimension at target level; others developing
  ✗ Motivated by retention risk, not readiness
  ✗ The person themselves is uncertain when asked

Right timing signals:
  ✓ 3+ months of consistent demonstration at target level
  ✓ Multiple dimensions at or above target level
  ✓ Cross-functional validation exists
  ✓ Person can articulate their own readiness when asked
  ✓ Their peers at the target level would accept them as peers

Late timing signals (act immediately):
  ✗ Person has been performing at the next level for 6+ months without promotion
  ✗ Person has started mentioning external opportunities or interviews
  ✗ Peers at their current level who are less capable have been promoted
  ✗ Person's motivation has visibly dropped

The cost of late promotion:
  The person who earns a promotion at month 6 and receives it at month 18 has experienced
  12 months of performing above their pay grade and title. This creates resentment that
  does not fully resolve after the promotion. Do not let readiness drift.
```

---

## Decision Tree

```
What does the promotion assessment reveal?

├── READY NOW — STRONG EVIDENCE ACROSS MULTIPLE DIMENSIONS
│   └── Build the packet this cycle; advocate with specificity
│       Prepare the person: "I'm going to make the case for your promotion.
│       Here's what my case is built on. Is there anything I'm missing?"
│       Navigate calibration; deliver the outcome with specificity

├── READY IN 1–2 QUARTERS — ONE DIMENSION NEEDS MORE EVIDENCE
│   └── Name the gap to the person: "You're nearly there. Here's what I'm watching for."
│       Build the evidence opportunity into the growth plan
│       Set the expectation: "If you get this in Q{{N}}, I'll make the case next cycle."
│       Do NOT wait until calibration to tell them the case isn't ready

├── NOT READY — SIGNIFICANT GAP IN ≥1 DIMENSION
│   └── Be honest: "You're not ready yet. Here's specifically why."
│       Build a development plan with a realistic timeline
│       "Based on the work needed, I'd expect to be in a position to make the case
│       in {{6–12 months}} if we make progress on {{dimension}}."

├── PROMOTION DECLINED — NEXT STEPS
│   └── Name the calibration feedback specifically to the person
│       Convert calibration feedback to development milestones immediately
│       Monitor engagement for 4 weeks
│       Set the next target cycle: "Here's what I'm building toward for {{cycle}}"

├── PERSON BELIEVES THEY ARE READY — EM DISAGREES
│   └── This requires a direct, evidence-grounded conversation
│       Do NOT avoid it: "Here's the gap I'm seeing between your self-assessment and mine."
│       Show them the level expectations; ask them to self-assess against them
│       Often: they haven't seen the rubric; showing it resolves the disagreement
│       If disagreement persists: acknowledge it; name the evidence you'll be watching for

└── READY BUT DECLINING TO PROMOTE (ORGANIZATIONAL CONSTRAINTS)
    └── If the organization is blocking a deserved promotion, the EM must be honest
        "I believe you're ready. The organization isn't approving it this cycle due to {{constraint}}.
        I want to be transparent: I'll try again next cycle. If it doesn't happen then,
        I want to have an honest conversation about your options."
        This is retention-critical transparency.
```

---

## Output

### Promotion Readiness and Advocacy Summary

```
PROMOTION CASE — {{Person}} — {{Target level}} — {{date}}

READINESS ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Readiness: {{Ready now | Ready in N quarters | Not ready}}
Duration at target level behavior: {{N months}}
Strongest dimension: {{Dimension + headline evidence}}
Weakest dimension: {{Dimension + gap description}}
Hard blocker? {{Y — which dimension | N}}

THE CASE (calibration summary)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"{{Name}} has been operating consistently at {{target level}} for {{N months}}.
The clearest evidence of this is {{headline example}}.
They are ready for this promotion now."

EVIDENCE BY DIMENSION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Technical: {{Behavior → Impact → Level connection}}
Scope: {{Behavior → Impact → Level connection}}
Communication: {{Behavior → Impact → Level connection}}
Leadership: {{Behavior → Impact → Level connection}}
Delivery: {{Measurable outcome → level connection}}

Cross-functional validation: {{Quote or paraphrase from partner}}

TIMING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Target cycle: {{Q{{N}} {{year}}}} | Urgency: {{High (attrition risk) | Standard}}
Calibration strategy: {{Headline evidence to lead with | Anticipated challenge + response}}

OUTCOME RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision: {{Approved | Declined}} | Date: {{date}}
Calibration feedback: {{Specific gap named by calibrators}}
→ Development action: {{What changes in the growth plan}} by {{date}}
→ Next target cycle: {{Q{{N}} {{year}}}}
Engagement monitoring started: {{Y/N}} | Risk signal: {{None | Flagged}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Readiness assessed against level expectations (not peers) | Base: 65% |
| Evidence from 3+ months of sustained demonstration | +15% |
| Cross-functional validation included | +10% |
| Timing rationale is readiness-based (not retention-based) | +10% |
| Declined outcome converted to specific development action | +5% |
| Promotion driven by retention risk, not readiness | −30% |
| Evidence based on recent 4–6 weeks only | −20% |
| Calibration feedback not delivered to the person | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Premature promotion** | Person promoted; struggles immediately at new level; EM over-supports | Wait for sustained demonstration. Potential is not performance. |
| **Late promotion** | Person performing at next level for 9+ months; no promotion initiated | Late promotion creates resentment that doesn't fully heal. Act when the evidence is there. |
| **Retention-driven promotion** | "They'll leave if we don't promote" drives the decision | Build the retention plan separately. Promotion before readiness harms the person. |
| **Vague calibration feedback** | Declined; EM tells person "you just need more time" | Convert calibration feedback to specific development milestones. "More time" tells them nothing. |
| **Delayed disappointment conversation** | Declined on Tuesday; EM waits until next 1:1 to tell them | Deliver the outcome within 48 hours, in person. They will hear it from elsewhere if you wait. |

---

## References

- `skills/career/promotion/promotion-readiness.md` — Readiness score from the IC/engineer's perspective
- `skills/career/promotion/promotion-evidence.md` — Evidence quality rubric and collection framework
- `skills/career/promotion/promotion-gaps.md` — Master synthesis for what to build toward
- `skills/people/performance-review.md` — Performance review is the primary input for promotion timing

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/career/promotion/promotion-readiness.md` | IC-perspective readiness assessment feeds this EM-perspective advocacy skill |
| `skills/people/growth-plans.md` | Failed promotion cycles produce updated growth plans |
| `skills/people/engagement.md` | Declined promotions are high attrition-risk moments; monitor for 4 weeks |
