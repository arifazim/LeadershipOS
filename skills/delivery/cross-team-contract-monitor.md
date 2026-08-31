# Skill: Cross-Team Contract Monitor

**Domain**: Delivery Management & Technical Leadership
**Owner**: `subagents/tech-lead.md`
**Cadence**: Continuous (via CI/CD integration) + Weekly Review

---

## Purpose

Detect "Intent Divergence" in cross-team dependencies before they become production incidents. While standard CI catches *interface* breakages (schema changes), this skill identifies when Team A's *assumptions* about an API's behavior silently diverge from Team B's *usage* or *implementation intent*.

---

## The Divergence Model

Contract drift occurs when:
1. **The Ghost Constraint**: Team B starts relying on a side-effect (e.g., latency, sort order) that Team A never formally guaranteed.
2. **Semantic Drift**: A field named `status` meant "Payment Status" to Team A, but Team B starts using it for "Inventory Status."
3. **The Silent Deprecation**: Team A stops updating a field, but Team B still uses it as a primary signal.

---

## Analysis & Detection Signals

### 1. Intent vs. Interface Diff
- **Signal**: Compare the "Consumer-Driven Contract" (what the consumer expects) against the "Provider Intent" (comments, ADRs, and tests).
- **Metric**: If a consumer's test suite relies on a property not explicitly defined as "Public/Stable" in the provider's ADR, flag for "Assumption Drift."

### 2. Usage Pattern Shift
- **Signal**: Analyze logs/traces for how Team B calls Team A's API.
- **Metric**: A 2x increase in "Retry" logic or "Validation Error" rates without a schema change indicates a semantic misunderstanding.

### 3. Contract Stale-ness
- **Signal**: Check the last time the "Dependency Mapping" was reviewed by both EMs.
- **Metric**: If a cross-team contract is > 6 months old and the underlying code has changed > 40%, flag for "Re-validation Required."

---

## Output Template

```markdown
### CROSS-TEAM CONTRACT MONITOR: [Provider Team] -> [Consumer Team]
**Date**: YYYY-MM-DD
**Status**: [Aligned | Diverging | Critical]

#### 1. DIVERGENCE DETECTED
- **Interface**: [e.g., "Schema matches"]
- **Intent/Semantic**: [e.g., "Consumer expects 'latency < 50ms' which is not a provider invariant"]
- **Stale-ness**: [e.g., "Last reviewed 7 months ago"]

#### 2. INCIDENT PREDICTION
- **Likelihood**: [Low | Medium | High]
- **Failure Mode**: [e.g., "Timeout in Consumer service during peak load"]
- **Impact**: [e.g., "Checkout flow failure"]

#### 3. COORDINATION ACTION
- **Immediate**: [e.g., EM Sync between Team A and Team B]
- **Technical**: [e.g., Add 'latency invariant' to Provider's test suite]
- **Governance**: [e.g., Update the Cross-Team ADR]
```

---

## Tooling Integration
This skill is designed to be fed by a "Contract Bot" that diffs OpenAPI specs, consumer-driven tests (Pact), and trace metadata.
