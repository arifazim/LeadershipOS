# Skill: Communication Effectiveness

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or after significant communications

---

## Purpose

Measure the clarity, frequency, and audience fit of engineering manager communications. Poor communication is the single most common source of stakeholder surprise, team confusion, and delivery misalignment.

This skill answers three questions:
1. Does the EM communicate clearly, at the right frequency, and to the right audiences?
2. Do audiences comprehend the message, or is communication creating noise?
3. What communication practices are degrading, and what would improve them?

**Invoke this skill when**: After a significant communication event (executive update, all-hands, roadmap announcement), when stakeholder confusion is reported, or before a quarterly review.

**Do not invoke this skill for**: Individual 1:1 communication quality (use `skills/people/assess-engagement.md`), written executive updates (use `skills/executive/executive-communication.md`), or meeting facilitation (use `meeting_quality.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Communication log | EM tracking or calendar export | Last 10 communications: audience, format, topic, date |
| Meeting recordings or notes | Meeting tool / EM notes | Last 3 team forums, last 3 stakeholder meetings |
| Stakeholder feedback | 1:1s, surveys, informal feedback | 3–5 verbatim comprehension or clarity comments |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Communication channel analysis | Slack / email metrics | Volume and response rate by channel |
| Audience comprehension test | Follow-up questions in 1:1s | % of audience who could correctly restate the key message |
| Reading time / attention data | Document analytics | Average time on page for written updates |
| Feedback sentiment trend | Historical feedback | Trending up / down / stable |
| Executive uptime | Calendar / meeting data | % of executive time spent in EM-initiated communication |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Frequency Assessment
Review the communication log against the expected cadence for each audience:

| Audience | Expected Cadence |
|---|---|
| Direct reports | Weekly (1:1s) + ad-hoc |
| Full team | Bi-weekly (all-hands or async update) |
| Peer EMs | Weekly (sync or async) |
| Direct manager | Weekly (1:1) + ad-hoc |
| Executive stakeholders | Bi-weekly (status update) |
| Cross-functional partners | Monthly or per-project |

Calculate:
- **Frequency compliance** = `(Communications delivered on schedule ÷ Expected communications) × 100`

| Frequency Compliance | Interpretation |
|---|---|
| ≥ 90% | High. Communication cadence is reliable. |
| 75–89% | Acceptable. Occasional misses are contextual. |
| 60–74% | At Risk. Communication gaps are visible to stakeholders. |
| < 60% | Critical. Stakeholders are not receiving expected updates. |

### Step 2 — Clarity Assessment
Review 3–5 recent communications for clarity:
- Is the main point identifiable in the first 2 sentences?
- Is jargon minimized for the audience?
- Are action items and owners explicit?
- Is the length appropriate for the format?

Rate each communication on a 1–5 clarity scale:
- 5: Main point immediately clear; action items explicit; no ambiguity.
- 4: Main point clear; action items mostly explicit; minor ambiguity.
- 3: Main point discoverable but buried; action items partially explicit.
- 2: Main point unclear; requires follow-up to understand intent.
- 1: Incomprehensible or irrelevant to audience.

Calculate:
- **Clarity score** = `(Sum of clarity ratings ÷ Number of communications) × 20` (normalized to 0–100)

| Clarity Score | Interpretation |
|---|---|
| ≥ 80 | High. Communications are clear and actionable. |
| 60–79 | Acceptable. Communications are understandable but could be tighter. |
| 45–59 | At Risk. Communications require follow-up to be understood. |
| < 45 | Critical. Communications are creating confusion, not reducing it. |

### Step 3 — Audience Fit Assessment
For each communication, assess whether the format and detail level match the audience:

| Audience | Appropriate Format | Appropriate Detail Level |
|---|---|---|
| Direct reports | 1:1, team forum | Detailed — include context, trade-offs, team impact |
| Peer EMs | Sync or shared doc | Moderate — include cross-team dependencies and risks |
| Direct manager | 1:1, written update | Concise — outcomes, risks, decisions needed |
| Executive stakeholders | Written update, slide deck | Very concise — 3 bullets, 1 ask, 1 risk |
| Cross-functional partners | Sync, shared doc | Moderate — include their impact and what you need from them |

Calculate:
- **Audience fit rate** = `(Communications with appropriate format and detail ÷ Total communications) × 100`

| Audience Fit Rate | Interpretation |
|---|---|
| ≥ 85% | High. Communications are well-targeted. |
| 70–84% | Acceptable. Most communications are appropriate; occasional mismatch. |
| 55–69% | At Risk. Communications frequently miss the audience's needs. |
| < 55% | Critical. EM is communicating in ways that do not serve the audience. |

### Step 4 — Comprehension Check
If audience comprehension data is available:
- **Comprehension rate** = `(Audience members who correctly restated the key message ÷ Audience members asked) × 100`

| Comprehension Rate | Interpretation |
|---|---|
| ≥ 80% | High. Message is landing as intended. |
| 60–79% | Acceptable. Message is landing for most; some need reinforcement. |
| 45–59% | At Risk. Message is not landing; communication is not effective. |
| < 45% | Critical. Communication is creating misinformation or confusion. |

### Step 5 — Synthesize Communication Signal
Combine frequency, clarity, audience fit, and comprehension into an overall communication effectiveness assessment. Weight: Frequency (20%), Clarity (35%), Audience fit (30%), Comprehension (15%).

---

## Decision Tree

Use this tree to determine the communication classification and primary recommendation.

```
What is the clarity score?
│
├── ≥ 80 ─────────────────────────────────────────────────
│   What is the frequency compliance?
│   │
│   ├── ≥ 90% ───────────────────────────────────────────
│   │   What is the audience fit rate?
│   │   │
│   │   ├── ≥ 85%
│   │   │   └── OUTCOME: Communication effectiveness is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Share your communication templates with the team.
│   │   │
│   │   └── < 85%
│   │       └── OUTCOME: Communication is clear and frequent
│   │             but not well-targeted.
│   │             Recommendation: Audit last 5 communications.
│   │             For each: was the format right for the audience?
│   │             Adjust format for next communication cycle.
│   │
│   └── < 90% ──────────────────────────────────────────
│       └── OUTCOME: Communication is clear but unreliable.
│             Recommendation: Fix cadence gaps.
│             Set calendar holds for recurring communications.
│             Do not let ad-hoc demands crowd out scheduled updates.
│
├── 60–79% ───────────────────────────────────────────────
│   What is the primary clarity gap?
│   │
│   ├── MAIN POINT BURIED
│   │   └── OUTCOME: Communication is functional but verbose.
│   │             Recommendation: Apply "BLUF" — Bottom Line Up Front.
│   │             State the main point in the first sentence.
│   │
│   ├── ACTION ITEMS UNCLEAR
│   │   └── OUTCOME: Communication is functional but not actionable.
│   │             Recommendation: Every communication must end with
│   │             "Action items: [owner] will [action] by [date]."
│   │
│   └── AUDIENCE MISMATCH
│       └── OUTCOME: Communication is functional but wrong audience.
│             Recommendation: Before sending, ask: "Does this audience
│             need this level of detail?" Adjust or redistribute.
│
└── < 60 ──────────────────────────────────────────────────
    What is the primary failure mode?
    │
    ├── FREQUENCY FAILURE
    │   └── OUTCOME: Communication is broken due to missing updates.
    │         Recommendation: Establish minimum communication cadence.
    │         Use calendar holds. Delegate if you cannot maintain it.
    │
    ├── CLARITY FAILURE
    │   └── OUTCOME: Communication is broken due to incomprehensible content.
    │         Recommendation: Use a template for recurring communications.
    │         Have a peer review critical communications before sending.
    │
    └── AUDIENCE FAILURE
        └── OUTCOME: Communication is broken due to wrong targeting.
              Recommendation: Map every communication to an audience need.
              If no audience need exists, do not send.
```

---

## Output

Produce the following artifacts in order.

### 1. Communication Summary (3–5 sentences)

State: overall communication effectiveness signal (strong / functional / at risk / broken), primary strength, primary gap, and one immediate improvement. Include confidence level.

> **Example**: "Communication effectiveness is functional with a clarity gap. Frequency compliance is 92% — all scheduled communications were delivered. However, clarity score is 62%: the main point is often buried in context, and action items are inconsistently explicit. Audience fit is acceptable at 78%. The primary gap is action item clarity. Immediate improvement: every communication must end with named action items, owners, and dates. Confidence: High (84%)."

### 2. Communication Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Frequency compliance | {{%}} | ≥ 90% = Green, 75–89% = Yellow, < 60% = Red | {{G/Y/R}} |
| Clarity score | {{0–100}} | ≥ 80 = Green, 60–79 = Yellow, < 60 = Red | {{G/Y/R}} |
| Audience fit rate | {{%}} | ≥ 85% = Green, 70–84% = Yellow, < 55% = Red | {{G/Y/R}} |
| Comprehension rate | {{%}} | ≥ 80% = Green, 60–79% = Yellow, < 45% = Red | {{G/Y/R}} |

### 3. Communication Audit

List recent communications and their assessment:

| Date | Audience | Format | Clarity (1–5) | Audience Fit | Notes |
|---|---|---|---|---|---|
| {{Date}} | {{Audience}} | {{Format}} | {{1–5}} | {{Y/N}} | {{Gap or strength}} |

### 4. Root Cause (if communication is At Risk or Broken)

- **Primary cause**: {{Frequency failure / Clarity failure / Audience mismatch / Comprehension failure}}
- **Evidence**: {{2–3 specific observations from the audit}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate improvement to one communication}}
- **This quarter**: {{1 systemic change to communication practice}}
- **Template** (if applicable): {{Specific template to create or adopt}}

---

## Examples

### Example A — Strong Communication

**Inputs**
- Communication log: 12 communications — all delivered on schedule (100% frequency compliance)
- Clarity assessment: Average 4.4/5 — main point in first sentence, action items explicit, jargon minimal
- Audience fit: 92% — executive updates are concise, team forums are detailed, peer syncs are moderate
- Comprehension: 85% — in follow-up 1:1s, 11 of 13 team members correctly restated the last all-hands message
- Stakeholder feedback: "I always know what's happening in engineering and what I need to do."

**Output Summary**
> Communication effectiveness is strong. Frequency compliance is 100%, clarity score is 88%, audience fit is 92%, and comprehension is 85%. The EM consistently communicates with the right cadence, clear structure, and appropriate detail for each audience. The one gap is that executive updates occasionally include too much technical detail — the VP has asked for "outcomes, not architecture." Confidence: High (94%).

**Recommendations**
- *This week*: Trim technical detail from the next executive update. Lead with outcomes and risks.
- *This quarter*: Create a one-page "Communication Guide" for the team that maps audience → format → detail level.

---

### Example B — Communication Broken

**Inputs**
- Communication log: 8 of 14 expected communications were delivered (57% frequency compliance)
- Clarity assessment: Average 2.1/5 — main point rarely stated upfront; action items missing in 6 of 8 communications
- Audience fit: 48% — executive updates include team-level detail; team forums include only high-level outcomes
- Comprehension: 38% — in follow-up 1:1s, 5 of 13 team members could not restate the last all-hands message
- Stakeholder feedback: "I never know what's actually happening in engineering until something goes wrong."

**Output Summary**
> Communication effectiveness is broken. Frequency compliance is 57% — 6 scheduled updates were missed this quarter. Clarity score is 42% — communications are verbose, bury the main point, and lack explicit action items. Audience fit is 48% — executive updates include too much detail, and team forums include too little. Comprehension is 38% — the message is not landing. The primary failure is a combination of frequency and clarity breakdown. Confidence: High (82%).

**Recommendations**
- *This week*: EM to send a catch-up communication to all stakeholders summarizing what happened this quarter, what was missed, and the plan for next quarter.
- *This quarter*: Implement a communication cadence template with calendar holds. Use a BLUF structure for all communications.
- *Template*: Create three communication templates — executive update, team forum, peer sync — and use them consistently.

---

## Confidence Score

The confidence score reflects how much to trust this communication assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any communication assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Communication log is tool-tracked (calendar or comms tool) | +5% |
| Comprehension data available | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Communication log is self-reported only | −10% |
| No stakeholder feedback available | −10% |
| Comprehension data is unavailable | −5% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in communication planning |
| 70–89% | Medium | Use output; flag gaps to stakeholders |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for executive communication; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Communication log under-reporting** | EM only logs formal communications, not ad-hoc | Log is thin but stakeholder feedback indicates frequent informal comms | Require log of all stakeholder-facing communications, formal and informal |
| **Clarity self-assessment** | EM rates their own communications as clear | EM's clarity ratings are uniformly high but stakeholder feedback is negative | Use stakeholder comprehension as the primary clarity signal |
| **Audience conflation** | EM sends the same communication to all audiences | Executive updates and team forums have identical content | Segment communications by audience need before sending |
| **Comprehension assumption** | EM assumes message landed because no one pushed back | No questions were asked, but later actions show misunderstanding | Require explicit comprehension checks, not silence |
| **Frequency theater** | EM sends frequent low-value communications to hit cadence | Frequency is high but stakeholders report "noise" or "I stopped reading" | Quality over quantity — reduce frequency if content is not actionable |
| **Format mismatch** | EM prefers one format regardless of audience | All communications are long emails regardless of audience | Audit format by audience; adopt the format each audience prefers |

---

## References

- `docs/principles.md` — Principle 3: *Default to Transparency*; Principle 8: *Predict before React*
- `docs/engineering-playbook.md` → *Managing Up*, *Executive Communication*, *Team Communication*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `skills/executive/executive-communication.md` — Executive update format and best practices
- `skills/stakeholder/manage-expectations.md` (planned — not yet built) — Stakeholder communication tactics
- Heifetz — *Leadership on the Line* (2002): Communication as a leadership tool for adaptive change
- Heath & Heath — *Made to Stick* (2007): Communication clarity principles (SUCCES framework)

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/executive-communication.md` | Executive update format and cadence (complementary) |
| `skills/stakeholder/manage-expectations.md` (planned — not yet built) | Tactical stakeholder communication (complementary) |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `meeting_quality.md` | Closely related — meetings are a primary communication channel |
| `stakeholder_alignment.md` | Closely related — poor communication causes misalignment |
| `execution_clarity.md` | Communication quality affects priority comprehension |
| `influence_score.md` | Communication quality is a primary driver of influence |
| `skills/people/assess-engagement.md` | Communication frequency and quality affect team engagement |
