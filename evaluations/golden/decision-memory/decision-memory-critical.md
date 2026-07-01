# Golden Output: Decision Memory — Critical Pattern Detected

**Skill**: `decision-memory/decision-memory.md`
**Scenario**: `decision-memory/features/decision-memory.feature` → `@critical` — "Repeated failure pattern detected"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `decision-memory.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

```
Decision context: Should we commit to a new architecture migration during Q4?
Historical records loaded: 30 decisions from past 2 years
Domains represented: architecture (10), delivery (8), resource (6), process (4), stakeholder (2)
Decision record completeness: All 8 core fields populated for 28 of 30 records
Outcome documentation: 26 of 30 records have actual outcomes recorded
Pattern detection: 3 architecture decisions made during Q4 freeze all failed with similar root causes
- DEC-2023-008: Q4 migration, Failed, underestimated integration complexity
- DEC-2023-012: Q4 refactor, Failed, insufficient QA capacity
- DEC-2024-003: Q4 migration, Failed, underestimated engineering capacity
Confidence in historical data: High
```

---

## Golden Output

```
DECISION MEMORY STATUS: Red
CONFIDENCE: High — 94%

DECISION CONTEXT:
- Domain: Architecture (migration during Q4)
- Similar decisions found: 3 (all with Failed outcomes during Q4)
- Closest analog: DEC-2024-003 (Q4 migration, Failed, 15 months ago)

CRITICAL PATTERN DETECTED:
- Pattern Type: Similar failure
- Severity: Critical
- Frequency: 3 of 3 decisions (100% failure rate)
- Description: Architecture migrations committed during Q4 freeze have failed 100% of the time
- Root cause: Underestimated integration complexity, insufficient QA capacity, underestimated engineering capacity
- Affected decisions: DEC-2023-008, DEC-2023-012, DEC-2024-003

PATTERN DETAILS:
| Decision ID | Date | Domain | Decision | Outcome | Root Cause |
|---|---|---|---|---|---|
| DEC-2023-008 | 2023-11-15 | Architecture | Q4 API migration | Failed | Underestimated integration complexity |
| DEC-2023-012 | 2023-12-01 | Architecture | Q4 code refactor | Failed | Insufficient QA capacity |
| DEC-2024-003 | 2024-11-20 | Architecture | Q4 service migration | Failed | Underestimated engineering capacity |

RECALLED DECISIONS:
- DEC-2024-003: Same Q4 context, same domain, Failed outcome 15 months ago
- DEC-2023-012: Same Q4 context, Failed outcome 18 months ago
- DEC-2023-008: Same Q4 context, Failed outcome 19 months ago

QUALITY ASSESSMENT:
- Record completeness: 93% (28/30 records complete)
- Outcome documentation: 87% (26/30 outcomes recorded)
- Average quality score: 75/100 (Acceptable to Strong range)
- Records needing update: Updated 3 records with lessons learned after pattern detection

RECOMMENDATION:
- DO NOT COMMIT to Q4 architecture migration without addressing documented failure root causes.
- Required mitigation: (1) Validate engineering capacity with 30% buffer, (2) Confirm QA capacity for full regression, (3) Defer non-critical migration components.
- Alternative: Execute migration in Q1 when capacity constraints are resolved.
- Update decision-memory schema to flag Q4 decisions as high-risk.
- Escalate to skip-level: "We have a repeatable failure pattern that requires organizational awareness."
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| Decision Memory Status | Exact | Must be "Red" |
| Confidence label | Exact | Must be "High" |
| Pattern severity | Exact | Must be "Critical" |
| Pattern frequency | Numeric | Must be 3 of 3 (100%) |
| Pattern type | Semantic | Must be "Similar failure" or equivalent |
| Root cause themes | Semantic | Must mention capacity, complexity, or QA constraints |
| Affected decisions | Count | Must include 3 specific decision IDs |
| Recommendation | Semantic | Must include DO NOT COMMIT or equivalent strong warning |

**Hard failures** (output must be rejected if):
- Status is not Red
- Confidence is not High
- Pattern severity is not Critical
- Less than 3 affected decisions are identified
- No strong warning is issued

**Soft failures** (flag for review but do not reject):
- Exact decision IDs differ (content should match)
- Root cause wording varies but captures capacity/complexity themes
- Specific mitigation steps vary but address the same constraints
