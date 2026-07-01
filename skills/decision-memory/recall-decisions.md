# Skill: Recall Decisions

**Domain**: Decision Memory
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand — invoked when making a new decision, conducting planning, or resolving conflict

---

## Purpose

Retrieve relevant past decisions based on current context to inform new decisions, prevent repeated mistakes, and identify proven approaches.

**What the EM does automatically**: When decision context is provided, the EM:
1. Searches decision history by domain and context tags
2. Assesses temporal relevance for each match
3. Evaluates outcome relevance (success vs failure patterns)
4. Identifies stakeholder overlap and power dynamics
5. Ranks results by confidence-weighted relevance score

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current decision context** | Problem statement, constraints, stakeholders involved |
| **Similarity threshold** | Minimum match quality: 0.7 for strict, 0.5 for moderate, 0.3 for loose |

### Optional
| Input | Description |
|---|---|
| **Time window** | How far back to search: default 12 months, max 24 months |
| **Domain filter** | Narrow search to specific domain if known |
| **Stakeholder filter** | Search for decisions involving same people or teams |

---

## Analysis

### Step 1 — Index Search by Domain and Context Tags

```
Search strategy:
  Exact domain match: Filter to matching domain first
  Context keyword extraction:
    - Extract nouns: technology, team, system, process
    - Extract constraints: timeline, budget, headcount, compliance
    - Extract stakeholders: roles, teams, individuals
  
  Tag matching algorithm:
    Primary tags: domain, core constraint type, stakeholder type
    Secondary tags: timeframe, team size, scope impact
    Similarity score = (matching_tags / total_unique_tags) * 2
```

**Threshold**: Only return decisions with similarity score ≥ 0.3.

### Step 2 — Temporal Relevance Assessment

```
Time decay scoring:
  Within 90 days: 1.0 (full weight)
  91-180 days: 0.8 (high relevance)
  181-270 days: 0.6 (moderate relevance)
  271-365 days: 0.4 (low relevance)
  Over 365 days: 0.2 (historical only)

Temporal modifier applied to final ranking score.
Seasonal adjustments: Q4 decisions weighted 0.8x due to holiday/freeze patterns.
```

### Step 3 — Outcome Relevance Evaluation

```
Outcome quality scoring:
  Success: +1.0 to ranking
  Mixed: 0.0 to ranking
  Failure: -0.5 to ranking (anti-pattern to avoid)

Outcome completeness factor:
  Full metrics + variance documented: +0.2
  Outcome confidence High: +0.1
  No outcome documented: -0.3
```

### Step 4 — Stakeholder Overlap Analysis

```
Stakeholder similarity:
  Same decision maker: +0.3
  Same consulted party: +0.2
  Same affected team: +0.1
  Same stakeholder constellation: +0.4 (all three above)

Power dynamic alignment:
  Check decision-reversals.md for same stakeholder combinations
  Conflict history with same parties: -0.2 penalty for unresolved conflicts
```

### Step 5 — Confidence-Weighted Ranking

```
Final ranking formula:
  Score = (context_similarity * 0.4) + (temporal_relevance * 0.2) 
          + (outcome_quality * 0.2) + (stakeholder_overlap * 0.2)

Ranking tiers:
  High relevance: Score ≥ 0.7
  Medium relevance: 0.4 ≤ Score < 0.7
  Low relevance: 0.3 ≤ Score < 0.4
  Below threshold: Score < 0.3 (excluded)
```

---

## Decision Tree

```
Exact match found (similarity ≥ 0.8)?
├── YES
│   └── SURFACE IMMEDIATELY: "Exact precedent exists: DEC-2024-042"
│   └── Include outcome, stakeholder analysis, and any pattern alerts
│   └── Recommend: Adapt previous solution or justify divergence
└── NO — Proceed to similarity scoring

Similar match found (similarity ≥ 0.3)?
├── Score ≥ 0.7 (High relevance)
│   └── Rank by outcome success, present top 3 candidates
│   └── Include variance analysis and context differences
├── Score 0.4-0.7 (Medium relevance)
│   └── Rank and present with confidence warnings
│   └── Highlight pattern signals (repeated failures, success themes)
└── Score < 0.3
    └── NO RELEVANT HISTORY found
    └── Return explicit message: "No relevant history for this decision type"
```

---

## Output

### Decision Retrieval Results

```
DECISION RECALL — {{Query context}} — {{Date}}

SEARCH RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Threshold used: {{0.3/0.5/0.7}} | Time window: {{months}} | Matches found: {{N}}

MATCH #1 — DEC-2024-042 (Score: 0.85)
  Domain: Architecture | Date: 2024-06-15 | Outcome: Success
  Similarity: {{High/Medium/Low}} | Temporal relevance: {{days}} old
  Stakeholder overlap: {{None/Same decision maker/Same constellation}}
  Pattern connection: {{None/Anti-pattern: failed repeat/Benchmarking success}}
  
  Key insight: Similar decision succeeded when done during stable period, 
  failed in 3 of 4 cases during reorganization. Context: You are currently 
  in Q2 2025 (stable) — strong precedent.

MATCH #2 — DEC-2023-087 (Score: 0.62)
  Domain: Architecture | Date: 2023-09-22 | Outcome: Failure
  Similarity: {{High/Medium/Low}} | Temporal relevance: {{days}} old
  Stakeholder overlap: {{None/Same decision maker/Same constellation}}
  
  Key insight: This approach failed due to underestimated QA overhead.
  See "Lessons Learned" section for mitigation strategies.

RECOMMENDED ACTION:
  Consider DEC-2024-042 approach with QA resource addition.
  Explicitly document why DEC-2023-087 failure won't repeat.
```

---

## Examples

### Exact Match Example

```
Current context: Migrating user notifications from RabbitMQ to Kafka
Threshold: 0.7 | Time window: 12 months

EXACT MATCH FOUND — DEC-2024-042

"We made this exact decision 8 months ago. Outcome: Success.
RabbitMQ-to-Kafka migration completed on schedule with 52% latency reduction.
Key factor: We dedicated 1 extra engineer for 2 weeks to handle edge cases.
QA capacity was underestimated in that decision — we had to pull in Mike Torres
from SRE for an extra week. Recommend budgeting for this upfront."

Similarity score: 0.92 | Temporal relevance: 0.6 | Outcome: +1.0
Final ranking: 0.85 (High relevance)
```

### Partial Match Example

```
Current context: Reorganizing frontend team structure during Q2 planning
Threshold: 0.5 | Time window: 24 months

PARTIAL MATCHES FOUND — 3 candidates

DEC-2023-034 (Score: 0.71 — High relevance): Team reorganization in stable period, Success
DEC-2022-112 (Score: 0.68 — High relevance): Team reorganization during freeze, Failure  
DEC-2023-078 (Score: 0.54 — Medium relevance): Team restructuring during reorg, Mixed

Pattern insight: Team reorganizations have succeeded when done during stable periods 
(Q1/Q2) with 4-month lead time before product launch. They have failed 3 of 3 times 
when done during Q4 freeze or concurrent reorganization. Current period: Q2 planning — 
favorable conditions for this decision type.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Search returned relevant results (score ≥ 0.3) | Base: 50% |
| High-relevance matches (score ≥ 0.7) | +25% |
| Outcome successfully documented in matches | +15% |
| Stakeholder overlap identified correctly | +10% |
| Pattern insights extracted | +10% |
| No relevant history found but search comprehensive | Base: 80% (high confidence in negative result) |
| Search only partial (time window < 12 months) | -20% |
| Outcomes poorly documented in matches | -15% |
| Recency bias detected (only showing recent) | -25% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Recency bias** | Only surfacing recent decisions, missing older relevant history | Extend time window to maximum 24 months; check for pattern repeats |
| **Confirmation bias** | Only matching decisions that confirm desired outcome | Search for both successful and failed precedents; require failure review |
| **Overfitting** | Treating unique contexts as identical | Document context differences; require explicit variance justification |
| **Phantom relevance** | Matching surface keywords without semantic similarity | Use stakeholder and constraint analysis; reject context-only matches |

---

## References

- `decision-memory/schema.md` — Record format for parsing decision content
- `decision-memory/records/` — Source decision archive
- `skills/political-signals/decision_reversals.md` — Stakeholder conflict history
- `skills/conflict/mediation.md` — Stakeholder dynamics from past conflicts

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/decision-memory/record-decision.md` | Creates records that this skill retrieves |
| `skills/decision-memory/detect-patterns.md` | Uses similar matching logic for pattern detection |
| `skills/organizational/decision-network.md` — Source of stakeholder context |
| `skills/conflict/conflict-diagnosis.md` | May reveal stakeholder considerations for recall |