# Loop: Stakeholder

**Cadence**: Per initiative, ongoing
**Reusable by**: `product-partner` (primary), `engineering-manager`, `executive-summary`
**Command entry point**: none — invoked directly when a new initiative or stakeholder shift requires mapping

## Purpose

Map stakeholder influence/interest, track relationship health, and detect organizational risk signals before they surface as escalations or reversals.

## Trigger Conditions

- A new initiative starts and stakeholders need mapping
- A stakeholder relationship shows signs of strain (exclusion, reversal, ambiguity — see `political-signals/`)
- Pre-announcement decision-tree check before a major communication goes out

## Steps

1. **Gather inputs** — Meeting attendance and decision history (manual/organizational, no direct integration today)
2. **Invoke skills** — `skills/organizational/stakeholder-analysis.md` (canonical — absorbed `skills/executive/stakeholder-map.md`'s relationship-health axis and pre-announcement timing structure; the only stakeholder-mapping skill). Cross-check against `political-signals/political-signals.md` if a risk signal is present.
3. **Route to subagent(s)** — `product-partner`; escalate to `engineering-manager` if a political-signal risk score is elevated
4. **Produce output** — Stakeholder map + engagement plan (no dedicated template yet — output lives inline in the skill's own format)
5. **Log outcome** — `memory/stakeholders/` (exact domain match) always; cross-link to `memory/decision-history/` if a stakeholder-driven trade-off was made, and to `political-signals/` if a risk signal was the trigger

## Feature Reference

`features/roadmap.feature` (stakeholder-alignment scenarios)

## Failure Modes

- **Static mapping**: building the stakeholder map once and never revisiting it as influence/interest shifts over the initiative's life
- **Signal blindness**: treating a stakeholder relationship purely as a mapping exercise when an actual political-signal risk (reversal, exclusion) is present and should route through `political-signals/` first

## Related Loops

- **executive-loop**: if the "stakeholder" in question is really an executive-communication need, route there instead
