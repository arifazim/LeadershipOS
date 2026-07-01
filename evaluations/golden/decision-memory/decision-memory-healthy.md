# Golden Output: Decision Memory — Healthy History

**Skill**: `decision-memory/decision-memory.md`
**Scenario**: `decision-memory/features/decision-memory.feature` → `@healthy` — "No patterns detected — healthy decision history"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `decision-memory.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

```
Decision context: New decision needed for vendor selection
Historical records loaded: 24 decisions from past 2 years
Domains represented: architecture (8), delivery (6), resource (5), process (3), stakeholder (2)
Decision record completeness: All 8 core fields populated for 22 of 24 records
Outcome documentation: 20 of 24 records have actual outcomes recorded
Pattern detection: No domain has 2+ failures with similar root causes
Recent failures: 1 isolated failure in last 2 years (vendor integration — unique context)
Confidence in historical data: High
```

---

## Golden Output

```
DECISION MEMORY STATUS: Green
CONFIDENCE: High — 91%

DECISION CONTEXT:
- Domain: Resource (vendor selection)
- Similar decisions found: 3 (all acceptable or better outcomes)
- Closest analog: DEC-2024-010 (vendor evaluation, Successful outcome, 14 months ago)

PATTERN DETECTION:
- Critical patterns: 0
- Warning patterns: 1 (underestimated vendor onboarding time — 2 instances, different contexts)
- Healthy status: Yes — no systemic failure patterns detected

RECALLED DECISIONS:
| Decision ID | Date | Domain | Similarity | Outcome | Pattern |
|---|---|---|---|---|---|
| DEC-2024-010 | 2024-04-15 | Resource | High | Successful | None |
| DEC-2024-008 | 2024-02-20 | Resource | Medium | Mixed | Underestimated complexity |
| DEC-2023-015 | 2023-10-01 | Architecture | Low | Successful | None |

QUALITY ASSESSMENT:
- Record completeness: 92% (22/24 records complete)
- Outcome documentation: 83% (20/24 outcomes recorded)
- Average quality score: 72/100 (Acceptable to Strong range)
- Records needing update: 2 (missing actual outcomes)

RECOMMENDATION:
- Proceed with current decision. Historical signal is positive.
- From DEC-2024-010: build in 2-week onboarding buffer (underestimated in that instance).
- Update 2 incomplete records with actual outcomes after this decision concludes.
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| Decision Memory Status | Exact | Must be "Green" |
| Confidence label | Exact | Must be "High" |
| Critical patterns count | Exact | Must be 0 |
| Closest analog | Semantic | Must reference a past vendor/software decision with Successful or Mixed outcome |
| Quality completeness | Numeric | Must be >= 85% |
| Recommendation content | Semantic | Must reference buffer/onboarding lesson from past decision |

**Hard failures** (output must be rejected if):
- Status is not Green
- Confidence is not High
- Critical patterns are detected when none exist
- No historical analogs are provided
- Quality completeness is < 85%

**Soft failures** (flag for review but do not reject):
- Exact decision IDs differ (content should match)
- Recommendation wording varies but captures buffer/onboarding insight
- Quality score is within +/- 10 points
