# Contract: Presentation

**Flagship skill**: `skills/executive/board-level-summary.md`
**Category**: deck/board-facing presentation output — also governs the rest of `skills/presentation/*.md` (executive-slide-review, storyline-generator, visualization-recommendations, kpi-storytelling, engineering-review, architecture-review-deck, roadmap-presentation)

```
Contract
  Name:                Board-Level Summary
  Owner:                subagents/executive-summary.md
  Inputs:
    Required:          Quarter's delivery (business outcome terms), engineering investment,
                        engineering health signal, strategic outlook
    Optional:           Reliability record, competitive context, hiring/team growth, top risk
  Required Outputs:      Performance section, Investment section, Outlook section, Ask
                        (or explicit omission if none) — maximum 1 page / 3 slides
  Failure Conditions:    Any term from the engineering-jargon ban list survives (sprint,
                        velocity, deployment, CI/CD, tech debt, PR, ticket, story point,
                        etc.) | No risk disclosed when a material risk exists | More than
                        one ask in the summary
  Quality Checks:        Every claim tied to a business metric, not an engineering one |
                        Every deliverable states its business outcome, not its description |
                        Length is <= 1 page | All three board questions answered (build
                        credibility, spending wisely, hidden risks)
  Version:               1.0
```

## Relationship to `contracts/executive.contract.md`

This contract is a stricter subtype of the executive contract — same discipline (honest signal, quantified claims, explicit ask), plus a hard jargon ban and a hard length cap that the general executive contract doesn't impose. Per the consolidation plan, `skills/presentation/board-deck.md` is being merged into this flagship file as an output-variant rather than kept as a separate near-duplicate; once that merge lands, this contract governs both the memo and deck output shapes.

## Applies Also To

The rest of `skills/presentation/*.md` share this contract's discipline for board/executive-facing decks specifically; internal-audience presentation skills (e.g. `engineering-review.md` for peer engineering audiences) may relax the jargon ban since the audience has the technical context — but the "one ask maximum" and "every claim tied to an outcome" checks still apply.
