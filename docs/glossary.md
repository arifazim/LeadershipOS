# Glossary

Shared definitions referenced by multiple skills, so a scoring method or term is defined once and pointed to — not restated (and silently drifted) in each file that uses it.

---

## Risk Scoring: Probability × Impact

**Used by**: `skills/product/product-risk.md`, `skills/strategy/risk-planning.md`, `skills/organizational/political-risk.md` — and any future risk-assessment skill should reuse this rubric rather than defining its own probability/impact/severity scale.

### Probability

| Value | Label | Meaning |
|---|---|---|
| 0.1 | Rare | Few precedents, strong controls in place |
| 0.3 | Possible | Could occur; limited controls |
| 0.5 | Likely | Has occurred before; conditions present |
| 0.7 | Probable | Conditions strongly present; pattern established |
| 0.9 | Near-certain | Expected to occur without intervention |

### Impact

A 1-5 scale. **The specific meaning of each level is domain-dependent** — a "3" for a single feature's adoption risk is not the same magnitude as a "3" for a portfolio-level strategic risk or an organizational political risk. Each consuming skill defines its own domain-specific impact descriptions (dollar bands, scope of consequence, etc.) using this same 1-5 scale so scores stay comparable in shape even when the underlying stakes differ. See each skill's own Impact table for its domain-specific definitions.

### Formula and Severity Bands

```
Expected loss = Probability × Impact

0.1–1.0:  Low       — monitor
1.1–2.5:  Medium    — mitigation recommended
2.6–4.0:  High      — mitigation required
4.1–5.0:  Critical  — immediate action / escalate
```

These bands are the shared standard across all three consuming skills. A skill may escalate a severity level based on domain-specific context (e.g., `skills/strategy/risk-planning.md` escalates any risk threatening a "Must" roadmap item by one severity level) — but the underlying score bands themselves should not diverge between skills without updating this entry first.
