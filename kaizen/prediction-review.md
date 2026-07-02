# Prediction Review

**Cadence**: Weekly (quick log) + Monthly (calibration analysis)
**Extracted from**: `weekly-review.md` Q1 + `monthly-review.md` Part 3
**Feeds**: `loops/prediction-loop.md` Step 5 ("Log outcome") logs here; `skills/confidence-engine/prediction_confidence.md` and `contracts/prediction.contract.md` define what a well-formed prediction record looks like

This is the standalone home for tracking whether the OS's confidence system is calibrated — previously buried inside the monthly review as Part 3. It exists on its own because prediction accuracy is now checkable on its own cadence via `loops/prediction-loop.md`, not only during the full monthly review.

---

## Weekly Log Entry

Fill this in every time the OS or an EM made a significant prediction this week.

```
PREDICTION LOG — Week of {{YYYY-MM-DD}}

Prediction made: {{what the OS, a subagent, or the EM predicted would happen}}
Confidence stated at time of prediction: {{High / Medium / Low / Speculative}}
What actually happened: {{the real outcome}}
Correct? {{Yes / No / Partial}}
Root cause if wrong: {{one category from kaizen/root-cause.md}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: {{which file, which section, what specifically}}
```

## Monthly Calibration Analysis

For each significant prediction made this month, record the outcome:

```
| Prediction | Confidence Stated | Actual Outcome | Calibration |
|---|---|---|---|
| {{description}} | {{High/Medium/Low}} | {{what happened}} | {{Accurate / Overconfident / Underconfident}} |
```

Calibration summary:
- High confidence predictions that were correct: {{N of N stated as High}}
- Medium confidence predictions that were correct: {{N of N stated as Medium}}
- Low confidence predictions that were correct: {{N of N stated as Low}}

**If High confidence predictions are wrong more than 20% of the time**: the confidence scoring in those skills is overconfident. Adjust positive modifiers down.

**If Low confidence predictions are consistently right**: the scoring is underconfident. Adjust negative modifiers up.

Update the Confidence Score section of any skill where calibration is off by > 20%.

## Worked Example

```
Week 1
Prediction made: AI predicts "Delay Release"
What actually happened: Leadership shipped anyway; a production incident occurred
Correct? Yes (the prediction was right; it was overridden)
Confidence stated: 72%
Root cause: Ignored signal — QA signal was present but under-weighted in the release skill
OS UPDATE NEEDED? Yes
  → Increase QA-signal weight in the release-readiness skill
  → Update prediction thresholds in skills/confidence-engine/prediction_confidence.md
  → Log to memory/roadmaps/ (estimation/forecast-risk domain)
```

This example is the canonical illustration of why prediction review exists as its own file: the prediction itself was correct — the gap was that the OS's confidence in a correct, ignored prediction didn't translate into a strong enough recommendation to block the ship decision. That's a calibration problem between "predicted correctly" and "influenced the outcome," which only shows up when predictions are tracked over time, not sprint by sprint.

## Update Cascade (on OS update needed)

Follows the same reordered cascade as `weekly-review.md`: Playbook → Prompt → Skill → Memory. A prediction miscalibration almost always resolves at the Skill step (adjusting `confidence-engine/*.md` weights) with a Memory entry logged last.

## Archive

Add a one-line summary to `kaizen/continuous-improvement.md` when a calibration change is made, tagged `threshold-tightened` or `threshold-relaxed` as appropriate.
