# Skill: Promotion Readiness

**Domain**: Career / Promotion
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (self-assessment) + Quarterly (manager calibration) + On-demand (before review cycle)

---

## Purpose

Assess operating level against the target level — producing a scored readiness profile that answers "What level am I operating at?" with precision, not optimism, and identifies the specific gaps between current demonstrated performance and promotion-ready performance.

**What the EM does automatically**: When assessing promotion readiness, the EM:
1. Scores current operating level across five dimensions (0–100 per dimension)
2. Identifies the level at which the person is *consistently* operating (not occasionally)
3. Calculates the gap between current performance and the target level bar
4. Surfaces the specific behaviors and outcomes missing for readiness
5. Produces a confidence score: "You are X% ready to be promoted to Level N"

Promotion is not a reward for sustained performance at current level. It is recognition of sustained performance at the *next* level. The readiness assessment measures performance at the level above, not performance at the level held.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current level and title** | IC or Manager track; current level (e.g., Senior Engineer, L4, EM) |
| **Target level** | The level being assessed for readiness |
| **Performance evidence** | Projects, decisions, outcomes from the past 12 months |
| **Scope of impact** | Team, org, company, or external reach of current work |

### Optional
| Input | Description |
|---|---|
| **Manager feedback** | Formal and informal feedback on strengths and gaps |
| **Peer feedback** | 360 signals from peers, cross-functional partners |
| **Prior review cycle outcomes** | Prior ratings, promo decisions, feedback from calibration |
| **Company leveling rubric** | Published criteria for the target level (use if available) |

---

## Analysis

### Step 1 — Establish the Level Framework

Use this framework for both IC and Manager tracks. Adapt to company-specific titles if provided.

**IC Track:**
| Level | Common title | Scope | Ambiguity handled | Impact horizon |
|---|---|---|---|---|
| L3 | Engineer | Task / story | Low — well-defined problems | Self |
| L4 | Senior Engineer | Feature / component | Medium — drives feature definition | Team |
| L5 | Staff Engineer | System / initiative | High — defines the problem space | Org |
| L6 | Principal Engineer | Platform / organization | Very high — strategic ambiguity | Company |

**Manager Track:**
| Level | Common title | Scope | Decision authority | Impact horizon |
|---|---|---|---|---|
| M1 | Engineering Manager | Team (4–10) | Team-level delivery | Team |
| M2 | Senior EM / Director | Multi-team / org | Cross-team architecture and delivery | Org |
| M3 | Sr Director / VP | Multi-org | Engineering strategy and investment | Company |

### Step 2 — Score Readiness Across Five Dimensions

For each dimension, score 0–100 based on demonstrated evidence (not self-perception):

```
Dimension 1: Scope of Impact (25 pts)
  Is the person solving problems at the scope of the TARGET level — not their current level?
  
  Target level scope not reached: 0–10 pts
  Occasionally reaching target scope: 11–20 pts
  Consistently reaching target scope (>70% of work): 21–25 pts

Dimension 2: Ambiguity Handling (20 pts)
  Can the person operate in the ambiguity of the target level without being unblocked?
  
  Requires regular direction-setting from manager: 0–8 pts
  Handles moderate ambiguity; needs occasional direction: 9–15 pts
  Consistently self-directs at target level ambiguity: 16–20 pts

Dimension 3: Technical/Domain Leadership (20 pts)
  Is the person the go-to authority at the scope of the target level?
  
  Still developing credibility: 0–8 pts
  Recognized within team; some cross-team recognition: 9–15 pts
  Trusted authority at target scope — others seek their judgment: 16–20 pts

Dimension 4: Organizational Leverage (20 pts)
  Does the person make others (not just themselves) more effective at target level?
  
  Individual contributor only; no visible multiplier effect: 0–8 pts
  Multiplies 2–3 others; some mentoring or process improvement: 9–15 pts
  Consistently multiplies team or org; changes how others work: 16–20 pts

Dimension 5: Track Record and Consistency (15 pts)
  Is there sustained evidence at target level, or isolated examples?
  
  Single example or < 6 months of evidence: 0–5 pts
  2–3 examples over 6–9 months: 6–10 pts
  4+ examples over 12+ months: 11–15 pts
```

### Step 3 — Calculate Readiness Score

```
Readiness score = Sum of five dimension scores (0–100)

Readiness interpretation:
  85–100: Promotion-ready — strong case, proceed with packet
  70–84:  Nearly ready — 1–2 gap areas; target 90 days
  55–69:  In progress — clear gaps; target 6 months with focused development
  40–54:  Developing — multiple gaps; target 12 months
  < 40:   Early stage — significant distance; focus on current level mastery first

Important: Readiness score is not the same as "will be promoted."
Promotion also requires: organizational timing, headcount, manager advocacy, and calibration.
The readiness score controls what you can control. Everything else is context.
```

### Step 4 — Identify the Promotion Blockers

A readiness score of 84 does not mean "almost there." It means one dimension is a blocker. Identify the single lowest-scoring dimension — that is the promotion blocker, not the overall score.

```
Promotion blocker rule:
  If any single dimension scores below 50% of its maximum:
    That dimension is a hard blocker — other high scores do not compensate
    
  Example: Overall score 78/100, but Ambiguity Handling = 6/20 (30%)
    → Ambiguity Handling is the promotion blocker regardless of total score
    → All development investment should prioritize this dimension until it reaches 75%+ of maximum
```

---

## Decision Tree

```
What does the readiness assessment reveal?

├── READINESS SCORE 85–100 (promotion-ready)
│   └── Build the promotion packet now
│       Check: Has evidence been collected continuously or needs reconstruction?
│       Check: Does manager have the same read? If not, align before submitting
│       → Invoke: skills/career/promotion/promotion-evidence.md
│       → Invoke: skills/career/promotion/promotion-gaps.md for final gap check

├── READINESS SCORE 70–84 (nearly ready, 1–2 gaps)
│   └── Identify the lowest-scoring dimension (the blocker)
│       Build a 90-day targeted development plan for that dimension
│       Increase evidence collection cadence
│       → Invoke: skills/career/promotion/promotion-gaps.md to name the gaps
│       → Invoke: skills/career/promotion/leadership-growth.md for the behavioral plan

├── READINESS SCORE 55–69 (in progress, 6-month target)
│   └── Score gap by dimension — find the two lowest dimensions
│       Frame: "You need X to get from {{score}} to 85. The path is:"
│       Build a structured 6-month development roadmap
│       → Invoke: skills/career/promotion/career-roadmap.md
│       → Invoke: skills/career/promotion/impact-tracker.md to begin evidence discipline

├── READINESS SCORE < 55 (developing, 12+ months)
│   └── Focus on excellence at current level before targeting promotion
│       Identify the highest-leverage skill to develop this quarter
│       Set a 6-month checkpoint to re-assess
│       → Invoke: skills/career/promotion/leadership-growth.md for current-level mastery

└── DIMENSION HARD BLOCKER IDENTIFIED (any dimension < 50% of maximum)
    └── All other development is secondary until this is resolved
        Name it explicitly: "The promotion case will not succeed
        until {{dimension}} demonstrates {{specific behavior}} — 
        current evidence shows {{specific gap}}"
        → Invoke: skills/career/promotion/promotion-gaps.md for remediation plan
```

---

## Output

### Promotion Readiness Assessment

```
PROMOTION READINESS ASSESSMENT — {{Name}} — {{Current Level}} → {{Target Level}} — {{date}}

READINESS SCORE: {{N}}/100  |  {{Ready 🟢 | Nearly ready 🟡 | In progress 🟠 | Developing 🔴}}

DIMENSION SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Scope of Impact:         {{N}}/25  | {{🟢/🟡/🔴}}  Current: {{describe}} | Target requires: {{describe}}
Ambiguity Handling:      {{N}}/20  | {{🟢/🟡/🔴}}  Current: {{describe}} | Target requires: {{describe}}
Technical/Domain Lead:   {{N}}/20  | {{🟢/🟡/🔴}}  Current: {{describe}} | Target requires: {{describe}}
Organizational Leverage: {{N}}/20  | {{🟢/🟡/🔴}}  Current: {{describe}} | Target requires: {{describe}}
Track Record:            {{N}}/15  | {{🟢/🟡/🔴}}  Evidence: {{N}} examples over {{N}} months

PROMOTION BLOCKER: {{None | Dimension name — score N/max — specific gap}}

CURRENT OPERATING LEVEL: {{Level}} — {{explanation}}
  "You are consistently operating at {{level}} in {{strong dimensions}}.
   You are operating at {{level below}} in {{weak dimensions}}."

RECOMMENDED ACTION
Timeline to readiness: {{N}} months with focused development
Priority development area: {{dimension + specific behavior}}
Evidence collection needed: {{what must be documented in next 90 days}}

→ Next: skills/career/promotion/promotion-gaps.md for gap detail
→ Next: skills/career/promotion/career-roadmap.md for development plan
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All five dimensions scored with evidence | Base: 65% |
| Scores based on demonstrated behavior (not self-report) | +15% |
| Hard blocker rule applied | +10% |
| 12-month evidence window used (not just recent) | +10% |
| Manager calibration included | +5% |
| Self-report only, no evidence | −25% |
| Fewer than 3 dimensions assessed | −20% |
| Score without blocker analysis | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Recency bias** | Assessment based on last 2–3 months only | Use 12-month window. Promotion requires consistency, not a peak. |
| **Current level performance confused with next level** | "I'm doing great work" assessed against current bar | Always assess against target level. Strong L4 performance does not make an L5 case. |
| **High overall, blocked dimension ignored** | 82/100 score celebrated; one dimension at 8/20 ignored | A single dimension < 50% blocks promotion regardless of total score. |
| **Self-report without calibration** | Assessment based on self-perception, not observed behavior | Calibrate with manager quarterly. Calibration gap is itself a readiness signal. |
| **Scope self-inflation** | "I influenced the architecture" without evidence of outcome | Scope claims require evidence: what decision, what outcome, who observed it? |

---

## References

- `skills/career/promotion/promotion-gaps.md` — Gap analysis from readiness assessment
- `skills/career/promotion/promotion-evidence.md` — Evidence collection requirements
- `skills/career/promotion/career-roadmap.md` — Development plan toward readiness
- `skills/career/promotion/leadership-growth.md` — Behavioral development for target level

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/career/promotion/promotion-gaps.md` | Readiness score reveals gaps; gap skill details them |
| `skills/career/promotion/promotion-evidence.md` | Evidence requirements derive from readiness dimensions |
| `skills/career/promotion/career-roadmap.md` | Readiness gap determines roadmap timeline and milestones |
| `skills/career/promotion/leadership-growth.md` | Organizational leverage and ambiguity dimensions drive leadership behaviors |
