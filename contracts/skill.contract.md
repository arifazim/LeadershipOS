# Contract Template: Skill

**Applies to**: every file under `skills/`, `leadership-health/`, `confidence-engine/` (dimension files), `political-signals/` (via `skills/political-signals/`), `decision-memory/` (via `skills/decision-memory/`)

Every skill must be describable by this contract. If a skill's own file doesn't state these fields explicitly (most existing skills express them narratively across Purpose/Inputs/Output/Confidence Score/Failure Modes sections), the contract is derived from those sections — see `skill.contract.md#worked-example` below for how `skills/delivery/review-sprint.md` maps onto it.

## Schema

```
Contract
  Name:                {{skill name}}
  Owner:                {{subagent that owns this skill}}
  Inputs:
    Required:          {{list — the skill must not proceed if any are MISSING}}
    Optional:           {{list — improves output quality if present, not blocking}}
  Required Outputs:      {{every artifact/section this skill's output must contain}}
  Failure Conditions:    {{states that mean the skill cannot run at all — distinct from a bad score}}
  Quality Checks:        {{post-hoc validation applied to the output before it's returned}}
  Version:               {{semantic version — bump on any Analysis/Decision Tree/Output change}}
```

## Field Definitions

- **Failure Conditions** are preconditions, not outcomes. "Missing Jira data" is a failure condition (the skill cannot run). "Sprint completion rate is 40%" is not — that's a valid, if unhealthy, output.
- **Quality Checks** run after the analysis produces a result, before it's handed back. They check the *output's* integrity (evidence cited, confidence stated, recommendations ranked) — not the underlying situation's health.
- **Version** changes whenever the contract's Required Outputs, Failure Conditions, or Quality Checks change. A skill's prose (wording, examples) can change without a version bump; its contract cannot.

## Worked Example — `skills/delivery/review-sprint.md`

```
Contract
  Name:                Sprint Health
  Owner:                subagents/delivery-manager.md
  Inputs:
    Required:          Sprint goal, committed story points, completed story points,
                        stories committed/completed/carried-over, blockers reported,
                        unplanned work added
    Optional:           Deployment frequency, change failure rate, PR cycle time (P50),
                        team satisfaction signal, on-call burden, prior sprint velocity
  Required Outputs:      Executive Summary (3-5 sentences), Sprint Scorecard, Root Cause
                        (if variance exists), Recommendations, Confidence level
  Failure Conditions:    Missing Jira data | Missing GitHub data | Missing sprint goal
  Quality Checks:        Evidence cited for root cause | Confidence stated | Recommendations
                        ranked by priority | Details do not precede the summary
  Version:               1.0
```

This is the exact shape from the original "Sprint Health" example that motivated this contract layer — `skills/delivery/review-sprint.md` already implements every field, just expressed narratively rather than as a structured block. The file has been updated with a pointer to this contract rather than duplicating it.

## Relationship to Existing Skill Sections

| Existing section | Contract field |
|---|---|
| Purpose / "Invoke this skill when" / "Do not invoke for" | Not part of the contract — routing guidance lives in the skill file itself |
| Inputs (Required/Optional tables) | Inputs |
| Output / Output Template | Required Outputs |
| Confidence Score table | Partially — the ">80%" style thresholds are Quality Checks; the modifier table itself stays in the skill |
| Failure Modes table | Distinct from Failure Conditions — Failure Modes describe how the skill can go wrong *while running*; Failure Conditions describe when it can't run *at all* |
