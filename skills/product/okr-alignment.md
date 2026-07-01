# Skill: OKR Alignment

**Domain**: Product
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (OKR planning) + Monthly (check-in) + On-demand (new feature request, roadmap change)

---

## Purpose

Map every engineering roadmap item to a company OKR, detect items that map to nothing (roadmap drift), detect OKRs that have no roadmap items (strategy without execution), and produce an alignment score that tells leadership exactly how well engineering is executing on stated company priorities.

**What the EM does automatically**: For any roadmap or backlog state, the EM:
1. Maps each item to an OKR (or flags it as unmapped)
2. Calculates an alignment score (0–100)
3. Identifies OKRs with no coverage (strategy-execution gap)
4. Flags items that are consuming capacity without strategic justification
5. Recommends which unmapped items to remove, defer, or reclassify

OKR alignment is the single most important signal for roadmap credibility. An EM who presents engineering investment with OKR traceability is making a business argument. An EM who cannot trace engineering to strategy is making a hope argument.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current roadmap or backlog** | All items the team is working on or committed to |
| **Company OKRs** | Objectives and Key Results for the current quarter or year |
| **Item effort estimates** | Person-weeks or story points per item |

### Optional
| Input | Description |
|---|---|
| **OKR confidence level** | How confident leadership is that each KR is achievable |
| **Item priority tier** | Must/Should/Could classification (from MoSCoW) |
| **Previous quarter actuals** | What was delivered vs. what was committed to OKRs |
| **Strategic bets** | Longer-horizon company bets that don't yet have formal KRs |

---

## Analysis

### Step 1 — Build the Alignment Map

For each roadmap item, identify:

```
Item → OKR Objective → Key Result → Contribution type

Contribution types:
  Direct:    This item is the primary driver of this KR
  Enabling:  This item unlocks another item that drives the KR
  Partial:   This item contributes to a KR but is not the primary driver
  None:      This item has no traceable connection to any OKR
```

**Mapping rules:**
- One item may map to multiple OKRs (allowed — but flag if >2, as diluted focus)
- One OKR may be served by multiple items (expected — verify capacity covers the KR)
- Items that map to "team health" or "tech debt" are valid only if a KR explicitly calls for reliability improvement. Otherwise they are unmapped.

### Step 2 — Calculate the Alignment Score

```
Alignment score = (Capacity weighted to OKRs) ÷ (Total committed capacity) × 100

Capacity weighted to OKRs:
  Sum of person-weeks for items with Direct or Enabling OKR mapping
  (Partial mapping counts at 0.5×)
  (None mapping counts at 0×)

Interpretation:
  90–100: Fully aligned — roadmap is executing strategy
  75–89:  Mostly aligned — minor drift; review unmapped items
  60–74:  Partially aligned — significant capacity without strategic justification
  <60:    Drift — roadmap is not aligned to company strategy; escalation warranted

Note: Score <75 is a flag for the roadmap health check (skills/product/roadmap-health.md)
```

### Step 3 — Detect Strategy-Execution Gaps

Two types of gaps are equally important:

**Type 1: Roadmap items without OKR mapping (execution without strategy)**
```
Symptom: Team is spending capacity on work that doesn't connect to company goals
Risk: Capacity misallocation; lost opportunity cost
Action: For each unmapped item, decide: Remove / Reclassify / Accept (explicit exception)
```

**Type 2: OKRs without roadmap coverage (strategy without execution)**
```
Symptom: Company has a stated priority with no engineering work planned to support it
Risk: OKR will miss; executive trust erodes when commitments fail
Action: Identify the gap, estimate the required investment, surface to PM and leadership
Frame: "OKR '{{KR}}' has no roadmap items. Achieving it requires approximately
       {{N}} person-weeks of engineering work not currently planned."
```

### Step 4 — Auto-Flag Misalignment Patterns

| Pattern | Signal | Action |
|---|---|---|
| **Must item, no OKR** | Highest-priority items aren't connected to strategy | Flag immediately: "A Must item has no OKR mapping. Either the item is wrong (deprioritize) or the OKR is wrong (update OKRs)." |
| **OKR with no engineering coverage** | Key Result exists but no team is building toward it | Surface to PM: "This KR is unexecuted. Should engineering take this on? Estimated cost: {{N}} person-weeks." |
| **Item mapped to 3+ OKRs** | Appears to support everything, actually prioritized for nothing | Flag: "This item maps to {{N}} OKRs. Diluted mapping is a prioritization signal — which OKR does it primarily serve?" |
| **All capacity on one OKR** | >70% of engineering capacity supporting single objective | Flag: "{{N}}% of capacity supports OKR '{{X}}'. Other OKRs have no coverage. Intended?" |
| **Completed OKR, active roadmap items** | Items still building toward a KR that has already been achieved | Flag: "KR '{{X}}' is at {{N}}% — consider whether remaining items are still necessary." |
| **Stale OKR mapping** | Item was mapped to last quarter's OKR | Flag: "Item '{{X}}' maps to a prior quarter's OKR. Re-map to current quarter or remove." |

---

## Decision Tree

```
What does the OKR alignment check reveal?

├── ALIGNMENT SCORE < 60% (critical drift)
│   └── This is a leadership conversation — not a PM conversation
│       Calculate: How much capacity is funding work with no strategic justification?
│       Present: "{{N}}% of engineering capacity ({{N}} person-weeks) has no OKR mapping.
│       This is equivalent to ${{X}} in engineering investment without strategic direction."
│       → Invoke: skills/executive/quarterly-business-review.md — surface at QBR
│       → Invoke: skills/product/roadmap-health.md — OKR alignment check feeds score

├── ALIGNMENT SCORE 60–74% (significant drift)
│   └── Triage unmapped items with PM this sprint
│       For each unmapped item: Remove / Defer / Re-map
│       Target: Move score to >75% within 2 weeks
│       → Invoke: skills/product/moscow-prioritization.md to reclassify unmapped items

├── OKR WITHOUT ROADMAP COVERAGE
│   └── Escalation: This is a strategy-execution gap that must be named
│       Frame: "We have committed to '{{Objective}} — {{KR}}' with no engineering
│       work planned. To achieve this KR, we need {{N}} person-weeks.
│       Where does this capacity come from?"
│       Options: Add capacity / Defer another item / Acknowledge KR will miss
│       → Invoke: skills/product/opportunity-cost.md to calculate deferral cost

├── MUST ITEM WITHOUT OKR MAPPING
│   └── Two possibilities — investigate before acting:
│       A) Item is correctly Must but OKRs are outdated/incomplete → Update OKRs
│       B) Item was incorrectly classified as Must → Downgrade to Should
│       Do NOT: Leave a Must item without OKR traceability unresolved
│       → Invoke: skills/product/moscow-prioritization.md to re-test the Must classification

└── ALIGNMENT SCORE 75–89% (minor drift)
    └── Name the unmapped items explicitly
        Decide: exception (deliberate choice) or removal candidate
        Document exceptions as accepted risk with rationale
        Review monthly to prevent gradual drift
```

---

## Output

### OKR Alignment Report

```
OKR ALIGNMENT REPORT — {{Team}} — {{Quarter}} — {{date}}

ALIGNMENT SCORE: {{N}}/100 | {{Fully aligned 🟢 | Mostly aligned 🟡 | Partial 🟠 | Critical drift 🔴}}
Total committed capacity: {{N}} person-weeks
Aligned capacity (Direct + Enabling): {{N}} person-weeks ({{N}}%)
Partially aligned: {{N}} person-weeks (counted at 0.5×)
Unmapped capacity: {{N}} person-weeks ({{N}}%)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OKR COVERAGE MAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Objective 1: {{text}}
  KR 1.1: {{text}} | Engineering coverage: {{item names}} | Total: {{N}} person-weeks | {{Covered 🟢 | Partial 🟡 | No coverage 🔴}}
  KR 1.2: {{text}} | Engineering coverage: {{item names}} | Total: {{N}} person-weeks | {{...}}

Objective 2: {{text}}
  KR 2.1: {{text}} | Engineering coverage: {{item names}} | ...

OKRs with NO engineering coverage:
  ⚠️ {{OKR text}} — Est. {{N}} person-weeks required — currently unexecuted

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ROADMAP ALIGNMENT DETAIL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Item                  | Effort | OKR Mapping     | Contribution | Priority
{{item}}              | {{N}}w | {{OKR ref}}     | Direct       | Must
{{item}}              | {{N}}w | {{OKR ref}}     | Enabling     | Should
{{item}}              | {{N}}w | UNMAPPED        | None         | Could ← REVIEW

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
FLAGS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{item}}: Must item with no OKR mapping — investigate
⚠️ {{KR}}: OKR with no roadmap coverage — {{N}} person-weeks required
⚠️ {{item}}: Maps to 3+ OKRs — clarify primary mapping
🔴 Alignment score {{N}} — capacity reallocation recommended

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RECOMMENDATIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Specific action — item to remove/defer/remap}}
2. {{Specific action — OKR gap to surface to PM/leadership}}
3. {{Specific action — capacity reallocation}}
```

---

## Example

```
OKR ALIGNMENT REPORT — Platform Engineering — Q3 2025 — July 1, 2025

ALIGNMENT SCORE: 72/100 | Partial 🟠
Total committed capacity: 28 person-weeks
Aligned capacity: 18 person-weeks (64%)
Partially aligned: 4 person-weeks (7%, counted at 2× 0.5)
Unmapped capacity: 6 person-weeks (21%)

OKR COVERAGE MAP
Objective 1: Make enterprise customers successful within 30 days of onboarding
  KR 1.1: Reduce time-to-first-value to <7 days | Coverage: Onboarding wizard (4w), 
           Automated setup (3w) | Total: 7 person-weeks | Covered 🟢
  KR 1.2: Achieve 90% 30-day retention for enterprise cohort | Coverage: None 🔴

Objective 2: Reduce infrastructure cost by 20% by EOQ
  KR 2.1: Consolidate logging pipeline | Coverage: Log pipeline rebuild (3w) | Covered 🟢
  KR 2.2: Reduce cold start latency by 40% | Coverage: Lambda warmup (4w) | Covered 🟢

OKRs with NO engineering coverage:
  ⚠️ KR 1.2: 90% 30-day retention — Est. 3–5 person-weeks required (engagement nudges, 
             health score dashboard) — currently unexecuted

ROADMAP ALIGNMENT DETAIL
Item                     | Effort | OKR Mapping  | Contribution | Priority
Onboarding wizard        | 4w     | OKR 1.1      | Direct       | Must
Automated setup          | 3w     | OKR 1.1      | Direct       | Must
Log pipeline rebuild     | 3w     | OKR 2.1      | Direct       | Must
Lambda warmup            | 4w     | OKR 2.2      | Direct       | Should
Admin dashboard v2       | 4w     | UNMAPPED     | None         | Should ← REVIEW
Notification refactor    | 2w     | UNMAPPED     | None         | Could  ← REVIEW
Internal tooling update  | 4w     | UNMAPPED     | None         | Could  ← REVIEW
[Unmapped = 10w of 28w = 36% of capacity]

FLAGS
⚠️ KR 1.2: No engineering coverage — 90-day retention KR will miss without action
⚠️ Admin dashboard v2 (4w Should): Unmapped — confirm strategic justification or defer
⚠️ 36% of capacity (10w) is unmapped — Alignment Score below 75 threshold
🟠 Score 72 — requires PM discussion to reallocate or accept exceptions

RECOMMENDATIONS
1. Surface KR 1.2 coverage gap to PM this week — est. 3–5w needed; identify source
2. Review Admin dashboard v2 (4w): map to an OKR or move to next quarter
3. Defer Notification refactor + Internal tooling (6w) until OKR alignment is above 80%
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Alignment score calculated with capacity weighting | Base: 65% |
| All OKRs checked for roadmap coverage | +15% |
| Must items verified for OKR mapping | +10% |
| OKR gaps quantified in person-weeks | +10% |
| Specific reallocation recommendations produced | +5% |
| Mapping is binary (yes/no, not Direct/Enabling/Partial/None) | −15% |
| OKR coverage not checked (only roadmap → OKR direction) | −15% |
| Alignment score calculated but no action recommended | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **One-directional mapping** | Only checks if roadmap items have OKRs; doesn't check if OKRs have coverage | Always run both directions. Strategy-execution gap (OKR with no coverage) is as damaging as drift. |
| **Effort-unweighted score** | Counts items not capacity. 10 one-day items mapped = same as one 10-week item unmapped | Weight by person-weeks. Capacity is the finite resource — items aren't. |
| **Tech debt exemption** | "Tech debt doesn't need OKR mapping" | Tech debt is valid only if a KR calls for reliability improvement. Otherwise it's unmapped. |
| **Stale OKR mapping** | Roadmap items still reference last quarter's OKRs | Re-map at the start of every quarter. Stale mapping degrades score but looks fine in the system. |
| **OKR alignment report used retrospectively** | Report produced after QBR as documentation | OKR alignment is a planning tool, not a reporting tool. Run before sprint planning, not after. |

---

## References

- `skills/product/roadmap-health.md` — OKR alignment (Check 1) feeds directly into roadmap health score
- `skills/product/moscow-prioritization.md` — Must items must have OKR mapping; unmapped items downgrade to Could/Won't
- `skills/executive/quarterly-business-review.md` — Alignment score is a required QBR input
- `skills/executive/annual-planning.md` — Annual OKR mapping establishes the capacity allocation framework

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/roadmap-health.md` | OKR alignment is Health Check 1 (20 pts) |
| `skills/product/moscow-prioritization.md` | Must classification requires OKR justification |
| `skills/product/opportunity-cost.md` | Unmapped items consume capacity that could serve OKRs |
| `skills/executive/quarterly-business-review.md` | Alignment score presented at QBR |
| `skills/executive/annual-planning.md` | Annual OKR-to-capacity mapping starts here |
