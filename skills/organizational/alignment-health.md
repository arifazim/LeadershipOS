# Skill: Alignment Health

**Domain**: Organizational
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (score update) + Quarterly (full assessment) + On-demand (before major commitment, after reorg)

---

## Purpose

Score the health of organizational alignment across five dimensions — strategy, cross-functional, leadership, team, and execution — so that misalignment is detected and addressed before it compounds into missed commitments, damaged relationships, or strategic drift.

**What the EM does automatically**: On a monthly cadence, the EM:
1. Scores alignment across five dimensions (0–100 each)
2. Detects the dimension(s) most at risk of degrading delivery or trust
3. Identifies when the organization is saying it's aligned but behaving as if it isn't
4. Surfaces the specific structural conditions causing misalignment
5. Produces a targeted action plan for the lowest-scoring dimension

**Ethical principle**: Alignment health assessment surfaces misalignment transparently — it does not manufacture the appearance of alignment. False alignment (where everyone says they agree but private behavior differs) is more dangerous than acknowledged disagreement. The EM who names misalignment honestly, even when it's uncomfortable, protects the organization from the much larger cost of discovering it at delivery time.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current roadmap and commitments** | What is planned and promised |
| **Five organizational signals** | Observed instances of reversals, exclusions, ambiguity, escalation, incentive misalignment |
| **Cross-functional relationship state** | Quality of Engineering-Product, Engineering-Design, Engineering-Leadership relationships |

### Optional
| Input | Description |
|---|---|
| **OKR alignment score** | From skills/product/okr-alignment.md |
| **Conflict prediction output** | Active and predicted conflicts |
| **Change resistance state** | Current change initiatives and their adoption rate |
| **Team health signals** | Engagement, attrition, satisfaction |

---

## Analysis

### Step 1 — Score Five Alignment Dimensions

Each dimension is scored 0–100. Weight the dimensions by their impact on delivery:

```
Dimension 1: Strategy Alignment (weight: 25%)
  Are engineering investments connected to company strategy?
  Are OKRs translated into engineering roadmap items?
  Does leadership understand what engineering is building and why?
  
  Inputs: OKR alignment score (skills/product/okr-alignment.md)
         Stated-vs-revealed executive priority gap (skills/organizational/executive-priorities.md)
  
  Scoring:
    OKR alignment ≥ 90% AND no executive priority gap: 85–100
    OKR alignment 75–89% OR minor priority gap: 65–84
    OKR alignment 60–74% OR significant priority gap: 40–64
    OKR alignment < 60% OR executive priorities unknown: 0–39

Dimension 2: Cross-Functional Alignment (weight: 25%)
  Are Engineering-Product-Design working from the same plan?
  Are cross-functional decisions made jointly, not handed down?
  Are cross-team dependencies confirmed and managed?
  
  Inputs: Alignment score from product/cross-functional skills
         Active cross-team blockers (skills/cross-functional/dependency-management.md)
  
  Scoring:
    No active blockers, joint decisions, shared plan: 85–100
    1–2 blockers, mostly joint, occasional misalignment: 65–84
    Multiple blockers, reactive coordination, separate plans: 40–64
    Frequent escalation, misaligned plans, no joint process: 0–39

Dimension 3: Leadership Alignment (weight: 20%)
  Are leaders in the EM's chain giving consistent direction?
  Are priorities consistent across the leadership team?
  Is engineering's perspective represented in leadership decisions?
  
  Inputs: Five signal observations (especially reversals and exclusion)
         Executive priority map (skills/organizational/executive-priorities.md)
  
  Scoring:
    Consistent direction, engineering represented, no reversals in 90 days: 85–100
    Generally consistent, occasional direction change, mostly represented: 65–84
    Inconsistent direction, sometimes excluded, recent reversals: 40–64
    Conflicting direction, regularly excluded, frequent reversals: 0–39

Dimension 4: Team Alignment (weight: 20%)
  Do team members understand what they're building and why?
  Is there clarity on priorities and how decisions are made?
  Are team members bought into the direction?
  
  Inputs: Direct observation; team 1:1 themes; delivery consistency
  
  Scoring:
    Team articulates goals, priorities, and rationale clearly: 85–100
    Most understand; some confusion on priority rationale: 65–84
    Confusion about priorities; decisions feel arbitrary to team: 40–64
    Team doesn't know why they're building what they're building: 0–39

Dimension 5: Execution Alignment (weight: 10%)
  Does what we're building match what we said we'd build?
  Are scope changes reflected in updated commitments?
  Is the team delivering against the plan it committed to?
  
  Inputs: Roadmap health score; sprint delivery vs. commitment; scope change history
  
  Scoring:
    Delivery ≥ 85% of commitment, scope changes communicated: 85–100
    Delivery 70–84%, some scope drift, mostly communicated: 65–84
    Delivery 55–69%, scope drift not tracked: 40–64
    Delivery < 55%, commitment and reality have diverged: 0–39
```

### Step 2 — Calculate Overall Alignment Health Score

```
Alignment health score = Σ (Dimension score × Weight)

  = (Strategy × 0.25) + (Cross-functional × 0.25) + (Leadership × 0.20)
    + (Team × 0.20) + (Execution × 0.10)

Score interpretation:
  85–100: Healthy — organization is aligned and operating coherently
  70–84:  Yellow — notable gaps in one or two dimensions; address within 30 days
  55–69:  Red — significant misalignment; affecting or about to affect delivery
  < 55:   Critical — systemic misalignment; escalation and structural intervention required

Compound risk flag:
  If any single dimension scores < 40: Flag as hard blocker regardless of overall score
  (A single critically misaligned dimension degrades all others over time)
```

### Step 3 — Detect the Five Signals in Alignment Context

```
Signal detection — map each signal to the alignment dimension it affects:

Frequent decision reversals → Leadership Alignment gap
  Score impact: −15 from Leadership Alignment per reversal in 90 days
  Response: Alignment meeting to re-establish consistent direction

Exclusion from key meetings → Cross-functional OR Leadership Alignment gap
  Score impact: −10 from relevant dimension per identified exclusion
  Response: Request structural inclusion; audit meeting design

Ownership ambiguity → Cross-functional AND Execution Alignment gap
  Score impact: −15 from both dimensions
  Response: Convene parties; establish explicit accountability

Escalation patterns → Leadership Alignment gap (chronic)
  Score impact: −20 from Leadership Alignment if same issue escalated 2+ times
  Response: Structural fix required; individual escalations are symptoms

Misaligned incentives → Cross-functional Alignment gap (structural)
  Score impact: −25 from Cross-functional; may also affect Strategy Alignment
  Response: Escalate to shared leadership; name the structural conflict
```

### Step 4 — False Alignment Detection

The most dangerous misalignment is the kind that appears healthy:

```
False alignment indicators:
  ✓ Everyone agrees in the meeting; nothing changes afterward
  ✓ No one raises concerns; issues surface in retrospectives
  ✓ All-hands sentiment is positive; team 1:1s reveal different picture
  ✓ Roadmap says one thing; sprint work reflects different priorities
  ✓ "We're aligned" stated; different teams working from different assumptions

Test for false alignment:
  Ask team members separately: "What are our top two priorities right now?"
  If answers vary significantly: alignment is false; the team does not share a common understanding
  
  Ask cross-functional partners: "What do you expect engineering to deliver this quarter?"
  If different from the engineering team's answer: cross-functional alignment is false
```

---

## Decision Tree

```
What does the alignment health score reveal?

├── OVERALL SCORE < 55 (CRITICAL)
│   └── Stop and address before continuing delivery commitments
│       Identify the two lowest-scoring dimensions
│       Schedule an alignment session with all leadership stakeholders this week
│       Frame: "Our organizational alignment is significantly degraded.
│       Before we commit to Q{{N}} deliverables, I want to make sure we're
│       operating from the same plan. Can we hold an alignment session?"
│       → Invoke: skills/executive/quarterly-business-review.md for leadership framing

├── SINGLE DIMENSION < 40 (HARD BLOCKER)
│   └── Even if overall score is Yellow, this dimension creates systemic risk
│       Prioritize this dimension over all others until it reaches 55+
│       Name it to leadership: "Our {{dimension}} alignment is critically low.
│       Here's what I'm observing and what I recommend."

├── FALSE ALIGNMENT DETECTED
│   └── This is more urgent than acknowledged misalignment
│       Surface it directly: "I've noticed that our stated alignment
│       doesn't match our observed behavior. Here are the specific gaps."
│       Run a structured alignment check: ask the same questions separately,
│       then compare answers in a group setting
│       Do NOT: Accept "we're aligned" without the behavioral test

├── STRATEGY ALIGNMENT LOW (OKR coverage or executive priority gap)
│   └── → Invoke: skills/product/okr-alignment.md for full alignment audit
│       → Invoke: skills/organizational/executive-priorities.md for priority recalibration

├── CROSS-FUNCTIONAL ALIGNMENT LOW
│   └── → Invoke: skills/cross-functional/dependency-management.md
│       → Invoke: skills/organizational/conflict-prediction.md for active tensions

└── ALIGNMENT HEALTH IS YELLOW (70–84)
    └── Identify the lowest-scoring dimension
        Build a 30-day targeted improvement plan for that dimension only
        Re-score at 30 days; if no improvement → escalate to Red treatment
```

---

## Output

### Alignment Health Dashboard

```
ALIGNMENT HEALTH ASSESSMENT — {{Team / Organization}} — {{date}}

OVERALL SCORE: {{N}}/100 | {{Healthy 🟢 | Yellow 🟡 | Red 🔴 | Critical 🔴🔴}}

DIMENSION SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Dimension              | Score | Weight | Weighted | Signal | Hard Blocker?
Strategy Alignment     | {{N}} | 25%    | {{N}}    | {{🟢/🟡/🔴}} | {{Y/N}}
Cross-Functional       | {{N}} | 25%    | {{N}}    | {{🟢/🟡/🔴}} | {{Y/N}}
Leadership Alignment   | {{N}} | 20%    | {{N}}    | {{🟢/🟡/🔴}} | {{Y/N}}
Team Alignment         | {{N}} | 20%    | {{N}}    | {{🟢/🟡/🔴}} | {{Y/N}}
Execution Alignment    | {{N}} | 10%    | {{N}}    | {{🟢/🟡/🔴}} | {{Y/N}}

COMPOSITE: {{N}}/100

SIGNALS AFFECTING SCORE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{Signal type}} → {{Dimension affected}} −{{N}} pts → {{Transparent response}}
⚠️ {{False alignment indicator}} → {{Dimension}} → {{Test to run}}

FALSE ALIGNMENT CHECK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"Top 2 priorities" test: {{Results — consistent or divergent?}}
Cross-functional expectation check: {{Engineering plan matches partner expectations? Y/N}}
Stated vs. behavioral alignment: {{Consistent or gap detected?}}

TOP 3 ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Specific action for lowest-scoring dimension}} by {{date}}
2. {{Specific action for detected signal}} by {{date}}
3. {{Structural fix or escalation}} by {{date}}

TREND
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Last month: {{N}} | This month: {{N}} | Change: {{+/− N pts}} | Direction: {{🟢 Improving | 🟡 Stable | 🔴 Degrading}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All five dimensions scored | Base: 65% |
| Five organizational signals mapped to dimensions | +15% |
| False alignment check performed | +10% |
| Trend tracked over time | +10% |
| Specific actions produced per dimension gap | +5% |
| Only one or two dimensions assessed | −25% |
| No false alignment check | −15% |
| Score without action plan | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **False alignment accepted** | "Everyone nodded in the meeting" treated as alignment | Run the behavioral test. Agreement in meetings ≠ shared understanding in practice. |
| **Overall score masking hard blocker** | Score of 72 looks Yellow; one dimension at 35 is Critical | Any dimension < 40 is a hard blocker. Address it regardless of overall score. |
| **Static assessment** | Alignment assessed once per year | Alignment degrades continuously, especially during change. Monthly score updates are minimum. |
| **Alignment as consensus** | Every decision requires full buy-in; no one can move without everyone agreeing | Alignment is shared understanding of direction and priorities — not unanimous consent. |
| **Surface alignment reported up** | EM reports "we're aligned" to leadership without running the test | False alignment is more dangerous than acknowledged misalignment. Name it honestly. |

---

## References

- `skills/product/okr-alignment.md` — Strategy alignment score feeds Dimension 1
- `skills/organizational/conflict-prediction.md` — Active conflicts are scored in cross-functional and leadership dimensions
- `skills/organizational/executive-priorities.md` — Executive priority calibration feeds leadership alignment
- `skills/cross-functional/dependency-management.md` — Dependency health feeds cross-functional alignment

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/okr-alignment.md` | OKR alignment is the primary input for strategy dimension |
| `skills/organizational/conflict-prediction.md` | Conflict risk degrades alignment score |
| `skills/organizational/political-risk.md` | Low alignment health is a leading indicator of political risk |
| `skills/organizational/change-resistance.md` | Change adoption rate affects execution alignment score |
