# Product outcomes

**Data read**: customer activation rate, customer retention (logo/revenue), North Star current value. Written to `memory/current_metrics.json` → `product`.

These are **not** DORA metrics and are **not** folded into Executive Confidence until `_source` is `live`.

**Definition** (name, unit, owner) lives in `config/team.json` → `north_star`. Owner should be Product, not the EM.

**Optional env** (any one set marks the block live)
- `PRODUCT_ACTIVATION_RATE` — e.g. `24%`
- `PRODUCT_RETENTION_RATE` — e.g. `91%` (customer retention, not engineer attrition)
- `PRODUCT_NORTH_STAR_VALUE` — e.g. `142`

**Actions taken**: none (read-only / env overlay).

**Fallback**: mock values with `"_source": "mock"` if all three env vars are blank.

Amplitude, Mixpanel, or a warehouse export can replace the env overlay later. Do not map this to `skills/performance/retention-risk.md`.
