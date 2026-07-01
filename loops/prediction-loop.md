# Loop: Prediction

**Cadence**: Weekly/monthly, or before any forecast-dependent commitment
**Reusable by**: `executive-summary` (primary), `engineering-manager`, `delivery-manager`
**Command entry point**: none — invoked directly before forecasts are made or reviewed

## Purpose

`confidence-engine/prediction_confidence.md` exists only as one of six dimensions feeding `executive_confidence.md` — it has no reusable, cadence-bound way to be invoked on its own. This loop elevates it into a standalone engine: track forecast accuracy and estimation calibration over time, independent of whether a full six-dimension executive confidence assessment is being run.

## Trigger Conditions

- Weekly/monthly forecast-accuracy check
- Before committing to a forecast-dependent deadline or roadmap date
- `kaizen/weekly-review.md` Q1 ("What prediction was wrong?") identifies a pattern worth tracking structurally rather than one-off

## Steps

1. **Gather inputs** — Historical estimate-vs-actual data from `delivery-loop`'s trend output; sprint goal hit-rate via `integrations/jira.md`
2. **Invoke skills** — `confidence-engine/prediction_confidence.md`, invoked standalone rather than only as a sub-step of `executive_confidence.md`
3. **Route to subagent(s)** — `executive-summary` if the output feeds a confidence narrative; `delivery-manager` if the output feeds a re-estimation decision
4. **Produce output** — Forecast-accuracy score feeding either `executive-loop` (as evidence) or a direct re-calibration of estimation practice
5. **Log outcome** — `memory/roadmaps/` (delivery/estimation-risk domain, per `memory/memory.md`'s own purpose statement linking "roadmap estimation failures" to this domain) and `kaizen/prediction-review.md`'s weekly log — a wrong prediction logged here should be checked before the next forecast is made, not just recorded after the fact

## Feature Reference

`confidence-engine/features/confidence-engine.feature` (prediction-confidence scenarios)

## Failure Modes

- **One-shot forecasting**: treating every forecast as independent instead of checking `memory/roadmaps/` and `kaizen/prediction-review.md` for a prior miscalibration on the same type of estimate
- **Six-dimension dependency**: waiting for a full executive confidence assessment to ever look at prediction accuracy, instead of running this loop on its own lighter cadence

## Related Loops

- **delivery-loop**: supplies the historical estimate-vs-actual data this loop trends
- **executive-loop**: consumes this loop's output as evidence when the executive ask involves trusting a forecast
