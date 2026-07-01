# Contract: Executive

**Flagship skill**: `skills/executive/executive-status-report.md`
**Category**: executive-facing written communication — also governs `executive-risk-report.md`, `executive-storytelling.md`, `quarterly-business-review.md`, `investment-proposal.md`, `headcount-justification.md`

```
Contract
  Name:                Executive Status Report
  Owner:                subagents/executive-summary.md
  Inputs:
    Required:          Delivery status, period, audience level, top risk
    Optional:           Team health signal, roadmap signal, incident summary, ask, prior
                        period context
  Required Outputs:      Status signal (Green/Yellow/Red), 2-3 sentence summary, Delivery
                        section, Team section, Risks section, Next Week section, Ask (or
                        explicit "No action needed")
  Failure Conditions:    Status signal cannot be honestly determined from available data |
                        No top risk identified when risks are known to exist (do not produce
                        a report that omits a known risk) | Red status not sent same-day
  Quality Checks:        Status signal defaults to the more cautious label when in doubt
                        (Yellow over Green, Red over Yellow) | Every quantity is specific,
                        not approximate | Report ends with an explicit ask or explicit
                        "no action needed" | Jargon audit passed for the target audience level
  Version:               1.0
```

## Applies Also To

`executive-risk-report.md`, `executive-storytelling.md`, and the other `skills/executive/*.md` files share this contract's core discipline (honest status signal, quantified claims, explicit ask) with different output shapes for their specific artifact. `board-level-summary.md` is a stricter variant — see `contracts/presentation.contract.md`.
