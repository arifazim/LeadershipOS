# Skill: Calibration

**Domain**: Performance Management
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Formal cycle (semi-annual or annual calibration session) + Continuous (evidence collection throughout the year)

---

## Purpose

Enter calibration with evidence-grounded, bias-checked assessments for every direct report — and navigate the calibration process in a way that results in accurate ratings for all engineers, including those who are underrepresented, invisible to the organization, or performing work the calibration group doesn't see.

**What the EM does automatically**: Before and during calibration, the EM:
1. Builds the calibration case for each direct report throughout the year — not retrospectively the week before
2. Runs a six-bias checklist before entering any calibration conversation
3. Identifies and specifically advocates for hidden high performers and engineers from underrepresented groups whose work may be systematically underrated
4. Responds to calibration challenges with evidence, not advocacy alone
5. Translates calibration outcomes into honest, specific conversations with every direct report

**Ethical principle**: Calibration exists to ensure that performance is evaluated consistently across managers — not to force a predetermined distribution. The EM who inflates ratings to advocate for their team, and the EM who allows bias to suppress their engineers' ratings, both undermine the purpose. Calibration requires the EM to be simultaneously an accurate assessor and an effective advocate. These are not in conflict: the strongest advocacy is specific evidence.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Performance evidence** | Documented behaviors, deliverables, and impact collected throughout the review period |
| **Level expectations** | The published expectations for each level in the engineering ladder |
| **Prior calibration outcomes** | What ratings were assigned last cycle; how accurate were they |

### Optional
| Input | Description |
|---|---|
| **Cross-functional feedback** | Input from partners outside the EM's direct view |
| **Peer feedback** | What teammates have observed and shared |
| **Calibration group composition** | Who will be in the room; their known biases or blind spots |

---

## Analysis

### Step 1 — Build the Evidence File (Year-Round)

```
Calibration cannot be built from memory in the week before the session.
Evidence collected throughout the year is specific, dated, and credible.
Evidence reconstructed in the final week is vague, recency-biased, and defenseless under challenge.

Evidence collection cadence:

Weekly: After each 1:1, note any behaviors, decisions, or deliverables that rise to the level of
        evidence (above or below expectation). One sentence. Date it.

Monthly: Review evidence file for each direct report. Does the evidence tell a coherent story?
         Are there dimensions with no evidence? Collect in the next 30 days.

At significant events: After incidents, launches, major design decisions, cross-functional reviews —
                       capture the behavior and impact immediately. This is when specific language is
                       available. Six months later, you only have a general impression.

Evidence per dimension (target: 3–5 specific instances per dimension, per review period):
  Technical Execution: PRs, design decisions, incident contributions, review quality
  Scope and Ownership: Initiative taken, blockers raised, ownership extended beyond assignment
  Communication: Specific instances of communication that was above, at, or below expectations
  Leadership/Influence: Mentorship given, team practices shaped, cross-team influence
  Delivery Impact: Measurable business or engineering outcomes attributable to their work

Evidence quality standard:
  Strong evidence: Specific behavior + context + measurable outcome
    "In the search service redesign (Q3), they identified the N+1 query pattern that would have
    caused the service to degrade at 10K concurrent users. Their PRD review prevented a launch
    that would have required an emergency rollback within 30 days. Estimated savings: 2 weeks
    of on-call recovery + $8K incident cost."
  
  Weak evidence: Impression without specificity
    "They're great at catching technical issues in reviews." (not evidential in calibration)
```

### Step 2 — Run the Six-Bias Checklist

```
Before entering calibration, the EM checks each direct report against six biases:

Bias 1 — Recency bias
  Risk: Q4 performance (good or bad) overweights the full-year picture
  Check: "Am I rating based on the last 6 weeks or the full review period?"
  Fix: Review evidence from all four quarters; recalculate if Q4 is driving the rating

Bias 2 — Halo/Horns effect
  Risk: One exceptional dimension (halo) or one poor dimension (horns) colors all five
  Check: "Would I rate this person's Communication the same if their Technical was different?"
  Fix: Score each dimension independently before forming a composite view

Bias 3 — Similarity bias
  Risk: Engineers who think, communicate, or work like the EM are rated more favorably
  Check: "Would I rate this person the same if they had a completely different working style?"
  Fix: Calibrate with a colleague who has a different style than the EM

Bias 4 — Attribution asymmetry
  Risk: Successes attributed to the person; failures attributed to circumstances — or vice versa
  Check: "Am I giving them credit for the successful project because it succeeded?
         Did I consider their contribution on the project that failed?"
  Fix: Ask separately: "What did they specifically do in each case?"

Bias 5 — Scope visibility bias
  Risk: High-visibility work (customer-facing, executive-attended) rated higher than equally
        valuable but invisible work (infrastructure, tooling, mentorship, documentation)
  Check: "Am I rating this person's impact based on the visibility of their work
         or the actual value of their work?"
  Fix: Translate invisible impact into business terms. Rate the value, not the visibility.

Bias 6 — Expectation anchoring
  Risk: Last cycle's rating becomes this cycle's rating without re-evaluating on current evidence
  Check: "Am I re-rating based on this year's evidence or last year's review?"
  Fix: Start with a blank assessment each cycle; let the evidence determine the rating

Additional check — Protected class risk:
  Consistent with research: engineers from underrepresented groups in tech are
  systematically rated lower on ambiguous dimensions (communication, leadership) while
  being rated accurately on concrete dimensions (technical execution, delivery)
  
  Check: "For any dimension where the rating is below bar — what is the specific evidence?
  Is this evidence specific or is it an impression that could be influenced by cultural differences
  in communication or leadership style?"
  Fix: Require concrete behavioral evidence for any below-bar rating in ambiguous dimensions
```

### Step 3 — Prepare the Calibration Presentation

```
For each direct report, prepare a calibration brief:

Standard format (30–60 seconds in calibration):
  "[Name] is an [level] who I'm rating [SE/E/M/D/SB] overall.
  
  Their strongest dimension is [dimension]: [one specific evidence instance with impact].
  Their area for growth is [dimension]: [one specific development gap with plan].
  
  Overall: [they are operating at / above / significantly above their level].
  [If promotion case: They are ready for [next level] based on [headline evidence].]"

The one-instance rule:
  If the calibration group challenges a rating, the EM's response is one specific instance:
  "On [date], they [specific behavior], which resulted in [specific impact].
  That's the kind of work I'm basing the [Exceeds] rating on."
  
  If the EM cannot produce a specific instance: the rating is not defensible.

Preparing for likely challenges:

Challenge type 1: "That sounds like [Meets] to me, not [Exceeds]"
  Prepared response: "Here's what [Exceeds] looks like at L4 in our ladder: [criteria].
  Here's the specific behavior: [evidence]. My read is that this clearly crosses that bar."

Challenge type 2: "I don't know this person"
  This is a visibility gap, not a performance gap.
  Prepared response: "They haven't had much cross-org visibility. Let me give you a picture:
  [one cross-functional example that demonstrates level]."
  Prevention: Send one cross-functional attribution email per high performer per quarter
  so the calibration group has seen their name before the session.

Challenge type 3: "The bar has been raised this cycle"
  Prepared response: "I want to understand the bar. Here's my evidence for [rating].
  What specifically would you need to see for this to reach [higher rating]?"
  This converts a vague challenge into a specific calibration anchor.

Challenge type 4: "We've promoted a lot of people recently; we need to be selective"
  This is a quota argument, not an evidence argument.
  Prepared response: "I understand. I want to make sure the selectivity is applied consistently.
  Here's the evidence for [name]'s readiness. If this doesn't clear the bar, can you tell me
  specifically what would?"
```

### Step 4 — Navigate Calibration Group Dynamics

```
Calibration sessions are group processes with their own dynamics.

Who tends to have more influence in calibration:
  — Senior leaders whose recommendations carry more weight
  — EMs with higher organizational visibility
  — EMs who advocate confidently with specific evidence
  — EMs who have built pre-calibration relationships with decision-makers

Who tends to have less influence:
  — Junior EMs who defer when challenged
  — EMs whose reports are invisible to the group
  — EMs who advocate generally ("they're great") vs. specifically ("here is what they did")

Dynamics to watch for:

Halo transfer: One prominent engineer from a team sets the bar; others on the same team
  are rated relative to that person rather than the level expectations
  Watch for: "They're not as good as [star engineer] so they can't be [Exceeds]"
  Response: "I'm calibrating against the level expectations, not against [star engineer].
  Here's what the level requires and here's what I observed."

Quiet consensus: No one challenges a rating; the room moves on; the rating stands by default
  Risk: The room may be deferring to social pressure rather than evaluating the evidence
  EM obligation: If you have evidence that a rating is wrong, say so — even without being challenged
  "Before we move on — I want to add something about [name]'s rating that I think the group should hear."

Stack ranking pressure: Informal pressure to rank engineers against each other rather than
  against the level expectations
  Response: "I'd rather calibrate against the level expectations than against each other.
  Here's the specific evidence for [name]'s rating against the L4 bar."
```

### Step 5 — Deliver Calibration Outcomes to Direct Reports

```
The calibration conversation with each direct report should happen within one week of calibration.

Principles:
  They should not hear their rating from HR, payroll, or a letter before hearing it from their manager.
  If there is a surprise: investigate why your real-time feedback process failed.
  Every rating should reflect content already shared in feedback and 1:1s.

Conversation structure:

"I want to share your performance rating from this review cycle and the calibration process.
[Rating]. Here's the context behind it and what it means."

For Exceeds/Significantly Exceeds:
  "Your rating reflects [specific evidence]. The specific dimensions where I see you above level
  are [dimensions]. This is where we left off on your promotion conversation: [update]."

For Meets:
  "Your rating reflects consistent delivery at level. Here's what the period looked like: [summary].
  Here's what I'd like to see you grow toward in the next period: [specific development focus]."

For Developing/Significantly Below:
  "I want to be direct. Your rating is [D/SB]. Here's the evidence behind it: [specific].
  This shouldn't be a surprise — we've talked about [gap] in our 1:1s. Here's what I'm asking
  for going forward: [specific expectation]. Here's the support I'm committing: [specific].
  And here's the timeline: if [criteria] aren't met by [date], here's what that means: [consequence]."
  
  Do not soften a Developing rating into ambiguity. The person must know.

If calibration outcome differs from EM's assessment (in either direction):
  "I want to be transparent. My original assessment was [X]. Through calibration, the group
  landed on [Y]. Here's what drove that: [calibration feedback]. Here's what I took from it: [interpretation].
  Here's what I'm asking for in the next period: [specific]."
  
  Never: "Calibration decided this, not me." The EM owns the outcome.
```

---

## Decision Tree

```
What does the calibration preparation reveal?

├── EVIDENCE INSUFFICIENT FOR A DIMENSION
│   └── Do not estimate — collect evidence in the next 2 weeks before calibration
│       "I'm rating this dimension on impression, not evidence"
│       is a red flag that requires evidence collection, not guessing

├── BIAS DETECTED IN OWN ASSESSMENT
│   └── Name which bias; recalculate the rating with bias removed
│       "I think I've been applying recency bias to {{name}}'s Q4 performance.
│       Let me re-evaluate Q1–Q3 independently."
│       If significant recalibration needed: update before entering calibration

├── HIDDEN HIGH PERFORMER IN THE RATINGS
│   └── Build the case specifically; prepare the cross-functional attribution
│       Enter calibration with the one-instance response ready
│       "I know this person is invisible to the group. Let me give you the picture."
│       Pre-brief: If possible, share the evidence with the calibration lead before the session

├── PROTECTED CLASS RISK IDENTIFIED
│   └── Review every below-bar rating for specificity of evidence
│       For any vague or impression-based rating: require yourself to produce specific evidence
│       If you cannot: change the rating or change the evidence requirement

├── CALIBRATION OUTCOME DIFFERED FROM EM ASSESSMENT
│   └── Evaluate honestly: Was the calibration group right and I was wrong?
│       If yes: update your evidence collection approach for next cycle
│       If no: prepare to re-advocate in the next calibration session with stronger evidence
│       Either way: Deliver the calibration outcome to the person with your honest interpretation

└── CALIBRATION COMPLETE — DELIVER OUTCOMES
    └── Every person within 1 week of calibration close
        No one hears their rating from anyone but their manager first
        Every rating explained with specific evidence
        Developing/SB ratings delivered with specific development expectations
```

---

## Output

### Calibration Brief per Direct Report

```
CALIBRATION BRIEF — {{Name}} — {{Level}} — {{Cycle}}

PROPOSED RATING: {{SE | E | M | D | SB}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Composite score: {{N}}/5 | Dimension breakdown:
  Technical Execution: {{SE/E/M/D/SB}} | Evidence: {{Specific instance}}
  Scope and Ownership: {{SE/E/M/D/SB}} | Evidence: {{Specific instance}}
  Communication:       {{SE/E/M/D/SB}} | Evidence: {{Specific instance}}
  Leadership/Influence:{{SE/E/M/D/SB}} | Evidence: {{Specific instance}}
  Delivery Impact:     {{SE/E/M/D/SB}} | Evidence: {{Measurable outcome}}

BIAS CHECKLIST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Recency bias: {{Checked | Detected — corrected}}
Halo/Horns: {{Checked | Detected — corrected}}
Similarity bias: {{Checked | Peer review: {{colleague name}}}}
Attribution asymmetry: {{Checked}}
Scope visibility: {{Checked | Invisible work translated to business terms: Y/N}}
Expectation anchoring: {{Checked | Rated from current evidence, not prior cycle}}
Protected class check: {{All below-bar ratings have specific behavioral evidence: Y/N}}

CALIBRATION PRESENTATION (30-second summary)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"{{Name}} is an {{level}} who I'm rating {{rating}} overall.
Strongest dimension: {{dimension}} — {{headline evidence}}.
Growth area: {{dimension}} — {{gap + plan}}.
[Promotion case if applicable]: Ready for {{next level}} based on {{headline evidence}}."

CHALLENGE PREPARATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Most likely challenge: {{type}} | Prepared response: {{specific evidence to deploy}}
Visibility gap: {{Y/N}} | Pre-calibration attribution sent: {{Y/N}}
Hidden HP flag: {{Y/N}} | Special advocacy needed: {{Y/N}}

OUTCOME DELIVERY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Calibration outcome: {{rating}} | Differed from EM assessment: {{Y/N}}
Delivered to person: {{date}} | Surprise level: {{None | Minor | Significant (feedback gap)}}
Forward expectation set: {{Specific — what the next cycle requires}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Evidence collected throughout year (not retroactive) | Base: 65% |
| Six-bias checklist completed | +15% |
| Specific instance prepared per rating challenge | +10% |
| Hidden high performers explicitly flagged and advocated | +10% |
| Calibration outcomes delivered within 1 week | +5% |
| Evidence retroactively reconstructed | −25% |
| Bias checklist skipped | −20% |
| Rating delivered without explanation to the person | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Retroactive evidence building** | EM reconstructs "evidence" the week before calibration from memory | Collect evidence in real-time throughout the year. Impressions are not evidence. |
| **Advocacy without evidence** | "I just know they're an Exceeds performer" fails every calibration challenge | One specific, dated instance with measurable impact is worth more than all the advocacy in the room. |
| **Bias unchecked** | Same bias applied to every review cycle; systematic under- or over-rating | Run the six-bias checklist independently before every calibration submission. |
| **Outcome ownership denied** | "Calibration gave you that rating, not me" | The EM owns the outcome. Blaming calibration destroys trust without reducing the impact of the rating. |
| **Developing rating softened** | Person receives a Developing rating framed as "approaching Meets" | Name the rating clearly. The person deserves to know where they stand. |

---

## References

- `skills/people/performance-review.md` — Detailed dimension scoring framework; calibration is the cross-manager process
- `skills/performance/high-performer.md` — Hidden high performer evidence building
- `skills/performance/recognition.md` — Recognition history as calibration evidence
- `skills/people/feedback.md` — Real-time feedback is the foundation of non-surprising calibration

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/performance-review.md` | Calibration is the group version of the performance review; shares the dimension framework |
| `skills/performance/high-performer.md` | Hidden high performers require deliberate advocacy in calibration |
| `skills/performance/promotion-readiness.md` | Calibration and promotion readiness are co-located in the same cycle |
