# Skill: Generate Leadership Health Dashboard

**Domain**: Leadership
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly, quarterly, or on-demand

---

## Purpose

Transform a completed `master-leadership-health.md` assessment into a scannable, visual dashboard. The dashboard is designed for quick consumption by the EM and their manager — it surfaces the overall health score, dimensional breakdowns, trend signals, and top development priorities in a format that can be read in under 30 seconds.

This skill answers three questions:
1. What is the overall leadership health score and status?
2. Which dimensions are improving, stable, or declining?
3. What are the top 3 development priorities for the next quarter?

**Invoke this skill when**: A `master-leadership-health.md` assessment has been completed and you need to share the results with the EM, their manager, or a coach.

**Do not invoke this skill for**: Raw dimension assessments (use individual skill files), executive communication (use `skills/executive/executive-communication.md`), or development plan creation (use `skills/people/develop-growth-plan.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Master assessment output | `master-leadership-health.md` | Full output artifact |
| 13 dimension scores | Individual skill outputs | Score 0–100 + label + confidence |
| Trend data | Previous quarter comparison | Improving / Stable / Declining per dimension |

### Supplementary

| Input | Source | Format |
|---|---|---|
| EM name | User context | Text |
| Assessment period | Calendar | e.g., "Q2 2026" |
| Development priorities | Master assessment output | Top 3 dimensions |

---

## Analysis

Execute in sequence.

### Step 1 — Overall Score Computation

Compute the holistic score using the weights defined in `master-leadership-health.md`:

| Pillar | Dimensions | Weight |
|---|---|---|
| Trust & Relationships | executive_trust, stakeholder_alignment, org_clarity, political_awareness | 65% |
| Communication & Influence | communication, influence, meeting_quality | 30% |
| Execution & Ownership | delegation, decision_quality, ownership, execution_clarity | 72% |
| Team Development | coaching, team_autonomy | 20% |

Classification:
- **Green**: ≥ 80
- **Yellow**: 60–79
- **Red**: < 60

### Step 2 — Trend Classification

For each dimension, compare current score to previous quarter:
- **↑ Improving**: +10 or more points
- **→ Stable**: within ±10 points
- **↓ Declining**: −10 or more points

### Step 3 — Visualization Generation

Produce two visualizations:
1. **Overall score bar** — horizontal bar showing score out of 100 with status color
2. **Dimensional heatmap** — 13-row grid showing each dimension as a progress bar with trend arrow

### Step 4 — Priority Extraction

Extract the top 3 development priorities from the master assessment output. If not present, compute using the priority ranking algorithm from `master-leadership-health.md`.

---

## Decision Tree

```
Is the overall score Green (≥ 80)?
├── YES
│   Are there ≥ 2 declining dimensions?
│   ├── YES → Highlight declining dimensions prominently. Flag "Green but fragile" in dashboard header.
│   └── NO  → Standard healthy dashboard. Focus on development priorities.
│
├── YES (Yellow, 60–79)
│   Are there ≥ 3 Yellow/Red dimensions?
│   ├── YES → Flag "Multiple gaps" in dashboard header. Prioritize top 3 dimensions.
│   └── NO  → Standard warning dashboard. Focus on targeted development.
│
└── NO (Red, < 60)
    → Flag "Immediate action required" in dashboard header.
    → List all Red dimensions first.
    → Executive summary required before full dashboard.
```

---

## Output

### 1. Dashboard Header
```
╔══════════════════════════════════════════╗
║   LEADERSHIP HEALTH DASHBOARD            ║
║   Period: {{period}} | EM: {{name}}      ║
║   Overall: {{score}}/100 — {{status}}    ║
╚══════════════════════════════════════════╝
```

### 2. Overall Score Visualization
```
{{overall_bar_visualization}}
```

### 3. Dimensional Grid
Grouped by pillar. Each dimension rendered as:
```
{{dimension_name}}: [████████░░] {{score}}/100 {{trend_arrow}} {{status_label}}
```

### 4. Trend Summary
- **Improving** (↑): {{list}}
- **Stable** (→): {{list}}
- **Declining** (↓): {{list}}

### 5. Development Priorities
1. {{priority_1}}
2. {{priority_2}}
3. {{priority_3}}

### 6. Next Actions
- **This week**: {{immediate_action}}
- **Next quarter**: {{quarterly_focus}}

---

## Examples

### Example A — Healthy Dashboard

**Input**:
- Overall score: 86.4/100 (Green)
- Improving: Coaching (+12), Team Autonomy (+8), Delegation (+6)
- Stable: 10 dimensions
- Declining: none
- Top priority: Influence Score (83, Yellow, Medium confidence)

**Output** (abbreviated):
```
╔══════════════════════════════════════════╗
║   LEADERSHIP HEALTH DASHBOARD            ║
║   Period: Q2 2026 | EM: Jane Doe        ║
║   Overall: 86/100 — Healthy              ║
╚══════════════════════════════════════════╝

████████████████████████████████████████░░░░  86/100

TRUST & RELATIONSHIPS
Executive Trust Score:    [████████████████████░░] 85/100 → Stable
Stakeholder Alignment:    [██████████████████████░] 88/100 → Stable
Organizational Clarity:   [███████████████████████] 90/100 → Stable
Political Awareness:      [████████████████████░░░] 80/100 → Stable

COMMUNICATION & INFLUENCE
Communication Effectiveness: [█████████████████████░] 87/100 → Stable
Influence Score:            [████████████████████░░] 83/100 → Stable
Meeting Quality:            [████████████████████░░░] 85/100 → Stable

EXECUTION & OWNERSHIP
Delegation Score:       [████████████████████░░░] 82/100 ↑ Improving
Decision Quality:       [█████████████████████░] 86/100 → Stable
Ownership Index:        [██████████████████████░] 89/100 → Stable
Execution Clarity:      [███████████████████████] 90/100 → Stable

TEAM DEVELOPMENT
Coaching Score:         [███████████████████████] 91/100 ↑ Improving
Team Autonomy:          [█████████████████████░░] 84/100 → Stable

Improving ↑: Coaching, Team Autonomy, Delegation Score
Stable →: 10 dimensions
Declining ↓: None

Top Development Priorities:
1. Influence Score (83) — Build cross-team coalition and peer visibility
2. Delegation Score (82) — Review decision ownership matrix for bottlenecks
3. Political Awareness (80) — Strengthen organizational navigation skills
```

---

### Example B — At-Risk Dashboard

**Input**:
- Overall score: 58/100 (Red)
- Improving: Coaching (+5)
- Stable: 2 dimensions
- Declining: Delegation (-18), Executive Trust (-15), Communication (-12)
- Patterns: Micromanagement signal, Trust deficit

**Output** (abbreviated):
```
╚══════════════════════════════════════════╗
║   ⚠️  IMMEDIATE ACTION REQUIRED          ║
║   Overall: 58/100 — At Risk              ║
╚══════════════════════════════════════════╝

██████████████████████████████████░░░░░░░░░░░░░░░░░░  58/100

TRUST & RELATIONSHIPS
Executive Trust Score:    [███████████░░░░░░░░░░░] 45/100 ↓ Critical
Stakeholder Alignment:    [█████████████░░░░░░░░░] 52/100 ↓ At Risk
Organizational Clarity:   [██████████████░░░░░░░░] 58/100 ↓ At Risk
Political Awareness:      [████████████░░░░░░░░░░] 50/100 ↓ At Risk

COMMUNICATION & INFLUENCE
Communication Effectiveness: [███████████░░░░░░░░░] 48/100 ↓ Critical
Influence Score:            [██████████░░░░░░░░░░░] 35/100 ↓ Critical
Meeting Quality:            [██████████░░░░░░░░░░░] 38/100 ↓ Critical

EXECUTION & OWNERSHIP
Delegation Score:       [██████████░░░░░░░░░░░] 40/100 ↓ Critical
Decision Quality:       [████████████░░░░░░░░░] 50/100 ↓ At Risk
Ownership Index:        [███████████░░░░░░░░░░░] 45/100 ↓ Critical
Execution Clarity:      [█████████████░░░░░░░░░] 55/100 ↓ At Risk

TEAM DEVELOPMENT
Coaching Score:         [██████████████░░░░░░░] 55/100 → Stable
Team Autonomy:          [███████████░░░░░░░░░░░] 42/100 ↓ Critical

⚠️ Cross-Dimensional Patterns Detected:
  • Micromanagement Signal: Delegation Score + Team Autonomy both Critical
  • Trust Deficit: Executive Trust + Stakeholder Alignment both declining

Improving ↑: Coaching
Stable →: Coaching, Decision Quality
Declining ↓: Delegation, Executive Trust, Communication, Influence, Team Autonomy, Ownership, Meeting Quality, Political Awareness, Execution Clarity, Stakeholder Alignment, Organizational Clarity

Top Development Priorities:
1. Executive Trust Score (45) — Trust recovery is prerequisite for all other improvements
2. Delegation Score (40) — Stop overriding team decisions immediately
3. Communication Effectiveness (48) — Restore clarity and transparency in all communications

Immediate Actions:
1. Schedule skip-level with manager within 48 hours
2. Pause new commitments until trust stabilizes
3. Write and publish 30-day improvement commitment
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All 13 dimension scores available | +10% |
| Previous quarter data available for trend calculation | +5% |
| Cross-dimensional patterns computed from skill output | +5% |
| Development priorities extracted from master assessment | +5% |
| One or more dimensions missing or Speculative confidence | −10% each |
| No previous quarter data (first assessment) | −5% |

**Base**: 80%

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Score mismatch** | Dashboard score does not match master assessment holistic score | Compare computed score to master output | Use master assessment score as source of truth; regenerate dashboard |
| **Missing trend data** | Previous quarter scores not available | Trend column shows "Unknown" for all dimensions | State explicitly: "First assessment — trend data unavailable" |
| **Visual misalignment** | Bar lengths or colors do not correspond to score ranges | Spot-check 2–3 dimensions against score | Recompute visualization using defined thresholds |
| **Priority extraction failure** | Master assessment output does not include development priorities | Priority section is empty or generic | Compute priorities using the ranking algorithm from master-leadership-health.md |
| **False stability** | A dimension is labeled "Stable" but has moved +9/−9 (borderline) | Compare scores: difference is 9 points | Label borderline cases as "≈ Stable" with note |

---

## References

- `leadership-health/master-leadership-health.md` — Source of dimension scores, weights, and patterns
- `templates/leadership-health-dashboard.md` — Dashboard template with placeholder fields
- `CLAUDE.md` — Confidence scoring and output format directives
- `docs/principles.md` — Principle 5: Data over Opinions; Principle 12: Measure Outcomes

---

## Related Skills

| Skill | Relationship |
|---|---|
| `leadership-health/master-leadership-health.md` | Provides the dimension scores and analysis this dashboard visualizes |
| `skills/executive/executive-communication.md` | Use when sharing this dashboard with executives |
| `skills/people/develop-growth-plan.md` | Uses development priorities from this dashboard as input |
| `skills/executive/vp-one-on-one.md` | Dashboard is a primary input for skip-level preparation |
