# Skill: Detect Patterns

**Domain**: Decision Memory
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly review — analyze last 12 months of decisions; monthly spot check for high-stakes decisions

---

## Purpose

Scan decision history to identify repeated patterns, failure modes, and learning gaps that inform future decision-making and organizational improvement.

**What the EM does automatically**: When analyzing decision history, the EM:
1. Clusters decisions by domain and outcome
2. Identifies repeated failures in same domain with negative outcome
3. Detects optimism bias in outcome predictions
4. Identifies complexity underestimation patterns
5. Finds success blindness (successful decisions not replicated)
6. Uncovers reversibility traps

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Full decision history** | All decisions within specified time window |
| **Time window** | Analysis period: typically last 12 months, min 6 months |

### Optional
| Input | Description |
|---|---|
| **Pattern detection rules** | Custom thresholds for sensitivity adjustments |
| **Domain filter** | Focus analysis on specific domain if targeted |

---

## Analysis

### Step 1 — Cluster Decisions by Domain and Outcome

```
Clustering algorithm:
  Primary dimension: domain (delivery, architecture, hiring, resource, stakeholder, process, risk)
  Secondary dimension: outcome (Success, Failure, Mixed, No outcome)
  
  Cluster formation:
    - Group by domain
    - Within domain, group by outcome type
    - Calculate: Success rate = successes / total with outcome
    - Flag domains with < 50% success rate for deeper analysis
  
  Minimum cluster size: 3 decisions for statistical relevance
  Smaller clusters: "Insufficient data" warning, not pattern detection
```

### Step 2 — Identify Repeated Failures

```
Failure pattern detection:
  Conditions for pattern:
    Same domain
    Negative outcome (Failure or Mixed trending negative)
    Similarity score ≥ 0.6 between contexts
    Time gap ≥ 30 days (not same decision)

  Pattern thresholds:
    3+ similar failures in same domain → Critical pattern
    2 similar failures in same domain → Warning pattern
    No repeated failures → Healthy (for this dimension)

  Context similarity factors:
    Stakeholders overlap > 50%
    Constraints match (timeline, budget, resources)
    Scale/size comparable
```

### Step 3 — Identify Optimism Bias

```
Optimism bias detection:
  Look for:
    Confidence at time: High (but outcome: Failure)
    Confidence at time: Medium (but outcome: Failure with critical cause)

  Scoring:
    Optimism score = (High confidence + Failure outcome) / total decisions
    Bias detected if score > 0.3

  Red flags:
    Repeated statements: "We're confident this will work" followed by failure
    Missing risk assessment in "High confidence" decisions
    Systematic under-weighting of known constraints
```

### Step 4 — Identify Complexity Underestimation

```
Complexity underestimation detection:
  Look for:
    Expected timeline vs Actual timeline variance > 25%
    Metrics stating "straightforward" or "minimal effort" followed by delays
    >2 follow-up decisions required to complete original decision

  Pattern indicators:
    "Hidden effort" mentioned in Lessons Learned ≥2 times
    Timeline consistently pushed out by >30 days
    Resource requests increased by >50% during execution

  Complexity score:
    Count decisions with major timeline or resource variance / total completed
    Underestimation detected if score > 0.25
```

### Step 5 — Identify Success Blindness

```
Success blindness detection:
  Look for:
    Successful decisions (Success outcome) with no follow-up replication
    New decisions ignoring documented proven approaches
    Team asks about same problem space when solution exists

  Success gap analysis:
    For each success: Check if reused or referenced in later decisions
    Success blindness score = (Unused successes) / (Total successes)
    
  Red flags:
    Same stakeholder making different decisions on similar problems
    Successful patterns not mentioned in rationale of similar decisions
```

### Step 6 — Identify Reversibility Traps

```
Reversibility trap detection:
  Conditions to check:
    Reversibility: No or Partial
    Outcome: Failure or Mixed
    Actual reversal required (documented in outcome)

  Trap identification:
    Irreversible decision that failed → Critical process failure
    Pattern: Same domain, irreversible, repeated failures → Systemic issue
    
  Metrics:
    Trap rate = (Irreversible failures requiring reversal) / (Total irreversible)
    Trap detected if rate > 0.2
```

---

## Decision Tree

```
Any 3+ similar failures in same domain within time window?
├── YES → CRITICAL PATTERN
│   └── Immediate action required: Escalate to leadership
│   └── "Critical pattern detected: Architecture decisions made during Q4 freeze 
│   └── have failed 3 of 3 times in the last 12 months. Requires process change."
│   └── Document recommended actions and timeline
└── NO — Proceed to warning threshold

Any 2 similar failures in same domain?
├── YES → WARNING PATTERN
│   └── "Warning pattern detected: Hiring decisions for senior roles without 
│   └── panel interviews have failed 2 of 2 times. Recommend adding panel review."
└── NO — Proceed to health assessment

No repeated failures detected?
├── NO — HEALTHY
│   └── "Decision quality healthy. No repeated failure patterns in the last 12 months.
│   └── Continue current rigor level."
└── Check for other patterns

Success pattern identified (same approach succeeded ≥2 times)?
├── YES → REPLICATION RECOMMENDATION
│   └── "Success pattern: Cross-functional design reviews before architecture 
│   └── decisions have succeeded in DEC-2024-015 and DEC-2024-038. 
│   └── Consider making this standard practice."
└── NO — No replication pattern

Optimism bias or complexity underestimation detected?
├── YES → BEHAVIORAL INSIGHT
│   └── Recommend process improvements for future decisions
└── All checks complete
```

---

## Output

### Pattern Analysis Report

```
PATTERN DETECTION — {{Analysis period}} — {{Date}}

PATTERN INVENTORY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Critical patterns: {{N}} | Warning patterns: {{N}} | Healthy domains: {{N}}

CRITICAL PATTERN — Domain: Architecture
  Description: Architecture decisions made during Q4 freeze period have failed 3 of 3 times
  Frequency: 3 occurrences
  Affected decisions: DEC-2023-087, DEC-2022-112, DEC-2021-045
  Common factors: Holiday resourcing constraints, reduced QA availability, incomplete specs
  Context similarity: 0.72 average
  Recommended action: Ban architecture decisions during Q4 (Nov-Dec) except for P0 incidents

WARNING PATTERN — Domain: Hiring
  Description: Hiring decisions for senior roles without panel interviews have failed 2 of 2 times
  Frequency: 2 occurrences
  Affected decisions: DEC-2023-067, DEC-2022-034
  Common factor: Single interviewer made final call despite conflicting signals
  Recommended action: Implement mandatory 3-person panel for senior+ roles

OPTIMISM BIAS DETECTED
  Rate: 35% of High-confidence decisions ended in failure
  Average overconfidence: 0.6x expected variance
  Recommendation: Add structured risk assessment to High-confidence decisions

SUCCESS BLINDNESS DETECTED
  Unused successes: 7 successful decisions never referenced in subsequent similar contexts
  Highest impact: DEC-2024-042 (Kafka migration) approach never applied to logging system
  Recommendation: Create "Proven Approaches" reference summary for quarterly planning
```

---

## Examples

### Healthy Pattern Detection

```
PATTERN DETECTION — Last 12 months (2024-06-30)

NO PATTERNS DETECTED — Healthy decision-making

Summary:
- Total decisions analyzed: 28
- Domains: Architecture (8), Delivery (12), Hiring (4), Resource (4)
- Success rate by domain: Architecture 75%, Delivery 83%, Hiring 75%, Resource 100%
- Repeated failures: 0
- Success blindness: 0
- Reversibility traps: 0
- Optimism bias: Within normal range (18%)

All domains showing good health. No immediate process changes required.
Continue quarterly review cadence.
```

### Critical Pattern Detection

```
PATTERN DETECTION — Last 12 months (2024-06-30)

CRITICAL PATTERN — Domain: Architecture
  Description: Architecture decisions made during Q4 freeze period have failed 3 of 3 times
  Frequency: 3 occurrences
  Affected decisions: DEC-2023-087, DEC-2022-112, DEC-2021-045
  
  Common context factors:
    - All decided in November-December period
    - All involved cross-team coordination
    - All had "High" confidence at time
    - All failed due to resourcing constraints during holiday period
  
  Pattern classification: Seasonal constraint ignored
  Severity: Critical
  Frequency: Repeated (3x+)
  
  Recommended actions:
    1. Add Q4 decision checklist item: "Is this urgent enough for reduced-support period?"
    2. Require pre-approval from skip-level for non-P0 architecture in Q4
    3. Update decision-network.md with Q4 constraint
    4. Communicate pattern to team leads before next Q4 planning cycle
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Minimum 10 decisions analyzed | Base: 55% |
| Time window ≥ 12 months | +15% |
| ≥3 decisions per domain cluster | +10% |
| Full outcome documentation available | +10% |
| Pattern matches include context analysis | +10% |
| < 6 months data | -25% |
| < 10 total decisions | -20% |
| Outcomes poorly documented | -15% |
| Pattern count < 2 (statistical noise) | -10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Pattern overfitting** | Seeing patterns in noise (2 failures treated as trend) | Enforce minimum 3 occurrences for Critical, require statistical significance |
| **False positives** | Treating context differences as irrelevant | Require explicit context similarity scoring; document differences |
| **Severity inflation** | Labeling every repeat as critical | Use domain-specific thresholds; distinguish warning from critical |
| **Learning theater** | Patterns identified but no action taken | Link to specific follow-up actions; track in quarterly planning |
| **Confirmation bias in patterns** | Only detecting patterns that confirm existing beliefs | Systematic domain-by-domain analysis; require full history scan |

---

## References

- `decision-memory/schema.md` — Decision format and quality metrics
- `decision-memory/records/` — Source data for pattern analysis
- `skills/conflict/blameless-retrospectives.md` — Root cause analysis for failures
- `skills/organizational/change-resistance.md` — Implementation of pattern-derived changes

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/decision-memory/record-decision.md` | Creates records analyzed for patterns |
| `skills/decision-memory/recall-decisions.md` | Uses pattern data to weight recall results |
| `skills/conflict/blameless-retrospectives.md` | Root cause analysis for detected failures |
| `skills/strategy/quarterly-planning.md` | Implements process changes from patterns |