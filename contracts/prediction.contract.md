# Contract: Prediction

**Flagship skill**: `confidence-engine/prediction_confidence.md`
**Category**: forecasting/estimation-accuracy skills — also governs the other five `confidence-engine/` dimension files and `loops/prediction-loop.md`

```
Contract
  Name:                Prediction Confidence
  Owner:                subagents/engineering-manager.md
  Inputs:
    Required:          Sprint velocity history (last 6-8 sprints, committed vs. completed),
                        sprint goal achievement rate, estimation accuracy log
    Optional:           Capacity planning accuracy, story point distribution, estimation
                        revision rate, blockers during planning, cross-team dependency accuracy
  Required Outputs:      Dimension Score (0-100), Label (Green/Yellow/Red), Confidence
                        (High/Medium/Low/Speculative), estimation-drift pattern diagnosis
  Failure Conditions:    Missing sprint velocity history | Fewer than 3 sprints of data
                        (insufficient to distinguish trend from noise, per delivery-loop's
                        "always require at least 3 data points" rule)
  Quality Checks:        Confidence stated with explicit evidence trail | No single input
                        contributes more than the weighting defined in executive_confidence.md
                        | Pattern diagnosis names a primary cause, not a list of possibilities
  Version:               1.0
```

## Relationship to `loops/prediction-loop.md`

The loop's Step 2 ("Invoke skills") calls this contract's flagship skill. The loop is what makes this contract callable on its own cadence rather than only as a sub-step of `confidence-engine/executive_confidence.md`'s six-dimension assessment — the contract itself is unchanged by that; it defines what the skill needs and produces regardless of who invokes it.

## Applies Also To

The other five `confidence-engine/` dimension files (`data_quality.md`, `risk_confidence.md`, `delivery_confidence.md`, `roadmap_confidence.md`, `architecture_confidence.md`) share this contract's shape — same Required Outputs pattern (Dimension Score / Label / Confidence), different Inputs per dimension. Each should eventually get its own filled contract if drift between them becomes a problem; until then, this file is the reference shape.
