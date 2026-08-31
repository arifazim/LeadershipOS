# Skill: Legacy Migration Tracker

**Domain**: Delivery Management & Technical Leadership
**Owner**: `subagents/tech-lead.md`
**Cadence**: Monthly Strategic Review

---

## Purpose

Track and communicate the health of long-term (12-24 month) legacy system migrations. This skill prevents "Migration Limbo" where a team is forced to support two systems indefinitely, doubling their maintenance burden and slowing roadmap delivery.

---

## The Migration Maturity Model

1. **Discovery & Shadowing**: New system exists; parity being built.
2. **Read-Only Migration**: New system handles reads; Legacy still owns writes.
3. **Primary Migration**: New system is the source of truth; Legacy is in "Deprecation Mode."
4. **Decommissioning**: Legacy system is turned off; all dependencies migrated.

---

## Analysis & Detection Signals

### 1. Parity Lag
- **Signal**: % of Legacy features not yet implemented in the new system.
- **Metric**: If parity lag > 6 months of the original plan, flag for "Migration Drift."

### 2. Dual-Support Tax
- **Signal**: % of sprint capacity spent on "Legacy Maintenance" vs. "Migration Work."
- **Metric**: If Dual-Support Tax > 40% of team capacity, flag for "Strategic Stagnation."

### 3. The Long-Tail Dependency
- **Signal**: List of external teams still calling the Legacy API.
- **Metric**: If the "Consumer Count" is not declining monthly, flag for "Coordination Failure."

---

## Output Template

```markdown
### LEGACY MIGRATION STATUS: [System Name]
**Project Health**: [On Track | Stalled | At Risk]

#### 1. MATURITY STAGE
**Current**: [e.g., Read-Only Migration]
**Target (End of Q)**: [e.g., Primary Migration]

#### 2. THE "DUAL-SUPPORT TAX"
- **Legacy Maintenance**: [% capacity]
- **Migration Execution**: [% capacity]
- **Roadmap Impact**: [N days delayed per sprint]

#### 3. BLOCKERS & DEPENDENCIES
- **Technical**: [e.g., Missing parity on Feature X]
- **External**: [e.g., Team B hasn't migrated their consumer]

#### 4. RECOMMENDATION
- [ ] **Accelerate**: Re-allocate 2 devs from roadmap to decommissioning.
- [ ] **Sunset**: Explicitly deprecate Feature Y to speed up migration.
- [ ] **Halt**: New system is failing; re-evaluate the migration strategy.
```
