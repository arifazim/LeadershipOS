# Skill: Visualization Recommendations

**Domain**: Presentation
**Owner**: `subagents/executive-summary.md`
**Cadence**: When building slides with data

---

## Purpose

Recommend the right visualization for the right message — so that data in a presentation lands immediately, without explanation, for an executive audience that will not study a chart.

The wrong chart destroys a good data point. The right chart makes it self-evident. An executive should be able to understand a slide's chart in under five seconds without reading the body text.

**The five-second rule**: If an executive has to spend more than five seconds understanding what a chart is showing, the visualization is wrong. Either the chart type is wrong, the labels are insufficient, or there is too much data in one visual.

**The 15-minute VP constraint:**
> "I have 15 minutes with the VP. What are the three slides that matter most?"
>
> Each of those three slides has one chart. One message. One visualization.
> No slide in a 15-minute executive presentation should have more than one chart.
> No chart should require a legend with more than three items.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The message** | What do you want the audience to conclude from this data? |
| **The data** | The actual numbers, categories, or trends you have |
| **The audience** | Who is reading this — technical / business / board |
| **Number of data series** | How many dimensions of data you're showing |

### Optional
| Input | Description |
|---|---|
| **Trend direction** | Is the trend improving, worsening, or neutral? |
| **Comparison type** | Comparing to target, prior period, or competitor |
| **Time range** | How many time periods are being shown |

---

## Analysis

### Step 1 — Identify the Message Type

Choose the visualization from the message, not the data type:

| Message | Chart type | Why |
|---|---|---|
| **"We are on track"** | Single number (big, bold) + directional arrow | Status doesn't need a chart — it needs a signal |
| **"Trend is improving / declining"** | Line chart | Shows direction over time clearly |
| **"We missed / hit a target"** | Bar chart with target line overlaid | Comparison to target is the most common exec message |
| **"This item dominates"** | Bar chart sorted descending | Makes the biggest item visually obvious |
| **"Distribution across categories"** | Horizontal bar chart | Easier to read labels; better for longer category names |
| **"Change over two periods"** | Side-by-side bars or "before/after" callout | Avoids time-series complexity when only two points matter |
| **"Parts of a whole"** | Donut chart (3 items max) or 100% stacked bar | Pie chart only if audience expects it; donut is more readable |
| **"Correlation / relationship"** | Scatter plot (for technical audiences only) | Too abstract for most executive audiences |
| **"Risk level by category"** | Heat map or traffic light table | Pattern recognition beats chart for multi-dimensional status |
| **"Funnel / conversion"** | Waterfall or funnel chart | Shows progressive reduction |

### Step 2 — Apply Audience Simplification Rules

| Audience | Maximum series | Preferred chart types | Avoid |
|---|---|---|---|
| **Board** | 1 | Big number, simple bar, traffic light table | Scatter, multi-line, stacked bars, pie |
| **C-Suite / VP** | 2–3 | Line + target line, grouped bar, heat map | 3D charts, dual-axis, radar |
| **Director / EM** | 3–4 | Multi-line, stacked bar, scatter | 3D, radar, bubble |
| **Engineering team** | 5+ | Any — technical audience can parse complexity | None banned |

### Step 3 — Apply the Five-Second Test

Before finalizing a visualization, answer:
1. Does the chart have a title that states the conclusion? (Not the topic — the conclusion)
2. Are there more than 3 items in any legend?
3. Is there a "so what" annotation on the most important data point?
4. Can someone read the key numbers without squinting?

**Title convention for executive slides:**
- Wrong: "Q3 Delivery Metrics"
- Right: "Q3 Delivery: 94% of committed work shipped"

The title tells you what to conclude. The chart shows you the evidence.

### Step 4 — Add the "So What" Annotation

Every executive chart needs one annotation: an arrow or callout pointing to the most important moment and one sentence explaining what it means.

Without the annotation, executives interpret the chart themselves — which means they may draw the wrong conclusion.

---

## Decision Tree

```
What is the message you want the audience to take away?

├── MESSAGE: "WE ARE [STATUS]" (single status signal)
│   └── Visualization: Large bold text — "🟢 Green" or "94% / 38 of 40 stories"
│       No chart needed. A chart adds complexity to a simple signal.
│       Add: One-sentence headline confirming the signal.

├── MESSAGE: "TREND IS [DIRECTION]"
│   └── Visualization: Line chart
│       X-axis: Time (quarters, months, sprints)
│       Y-axis: The metric
│       Add: Target line (dashed). Annotate: "Target" label on the line.
│       Add: Arrow + one-sentence callout at the most recent point.
│       Maximum: 3 lines. If more, combine into "Other" or use separate charts.

├── MESSAGE: "WE HIT / MISSED A TARGET"
│   └── Visualization: Bar chart with target line
│       Each bar = one period or category
│       Overlay: Horizontal dashed line at the target value
│       Color: Green bars = above target; Red bars = below target
│       Annotate: The miss (or hit) that matters most.

├── MESSAGE: "ITEM X IS THE BIGGEST [RISK / CONTRIBUTOR / COST]"
│   └── Visualization: Horizontal bar chart, sorted descending
│       The most important item is at the top.
│       Color the top item differently (highlight).
│       Label: Show the value on each bar — don't make them read the axis.

├── MESSAGE: "STATUS ACROSS MULTIPLE DIMENSIONS"
│   └── Visualization: Traffic light table (heat map)
│       Rows = items (teams, initiatives, services)
│       Columns = dimensions (delivery, quality, team health)
│       Cells = 🟢 / 🟡 / 🔴 with one-word label
│       No numbers needed. The pattern is the message.
│       Maximum: 5 rows × 4 columns before it becomes a spreadsheet.

└── MESSAGE: "BEFORE / AFTER"
    └── Visualization: Two large numbers side by side
        Before (gray) → After (green or red depending on direction)
        Add: Arrow between them. Percentage change. One-sentence headline.
        Example: [2.1 hrs] → [0.7 hrs] ↓67% "Time to recovery dropped 3x after the reliability sprint"
```

---

## Output

### Visualization Recommendation

```
VISUALIZATION RECOMMENDATION — {{Slide title}}
Message: {{One sentence — what the audience should conclude}}
Audience: {{level}}
Data: {{What data you have}}

RECOMMENDED CHART: {{type}}

WHY: {{One sentence connecting the chart type to the message}}

CONFIGURATION:
• Title (conclusion): "{{Title that states the message, not the topic}}"
• X-axis: {{what it represents}}
• Y-axis: {{what it represents}}
• Colors: {{Green = positive / Red = negative / Gray = neutral — specify}}
• Target line: {{value and label}}
• Annotation: "{{The 'so what' callout — where and what it says}}"
• Legend items: {{N items — list them}}

FIVE-SECOND TEST:
□ Title states conclusion (not topic)
□ Legend has ≤ 3 items
□ "So what" annotation present
□ Key numbers readable without squinting
□ A non-technical executive can understand it in 5 seconds

WHAT TO AVOID:
• {{Specific mistake this data is prone to}} — do this instead: {{alternative}}
```

---

## Example

```
VISUALIZATION RECOMMENDATION — Deployment reliability slide
Message: "Change failure rate dropped from 12% to 2% after the reliability sprint"
Audience: VP Engineering
Data: Monthly change failure rate for 8 months; reliability sprint happened Month 6

RECOMMENDED CHART: Line chart with event annotation

WHY: Shows trend over time and makes the sprint's impact obvious at a specific point.

CONFIGURATION:
• Title: "Reliability sprint cut deployment failures by 83%"
• X-axis: Month (Jan–Aug)
• Y-axis: Change failure rate (%)
• Colors: Line = blue; shaded area below target = light green
• Target line: 3% (dashed, labeled "Target")
• Annotation: Vertical dashed line at Month 6 labeled "Reliability sprint" +
  callout: "12% → 2% failure rate"
• Legend: 2 items (Actual, Target)

FIVE-SECOND TEST:
✓ Title states conclusion
✓ 2-item legend
✓ Annotation names the cause of the improvement
✓ Numbers labeled at Month 1 and Month 8
✓ 5-second readable

WHAT TO AVOID:
• Don't show individual deployment failures as data points — too granular for VP
• Don't use a bar chart — bars don't show trend or the event moment clearly
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Message is named before chart type is chosen | Base: 70% |
| Chart type matches message type from table | +10% |
| Title states conclusion, not topic | +10% |
| "So what" annotation present | +10% |
| Five-second test passes | +10% |
| Chart type chosen before message is defined | −20% |
| Legend has > 3 items | −10% |
| Title is topic-based, not conclusion-based | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Topic title** | "Q3 Delivery Metrics" | Rewrite: "Q3 delivery exceeded target by 4%" — states the conclusion |
| **No annotation** | Chart presented without callout explaining the key moment | Add one arrow + one sentence to the most important data point |
| **Too many series** | 6 lines on one chart | Reduce to 2–3. Combine others into "Other" or separate chart. |
| **Wrong chart for message** | Pie chart for a trend message | Choose from the message type table, not from what looks interesting |
| **Missing target line** | Bar chart without showing what success looks like | Always show the target when the message involves hitting or missing one |

---

## References

- `skills/presentation/kpi-storytelling.md` — When the visualization is a KPI narrative
- `skills/presentation/executive-slide-review.md` — Reviews visualization choices in context

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/presentation/kpi-storytelling.md` | Applies visualization choices to KPI narrative |
| `skills/presentation/executive-slide-review.md` | Validates visualization in the full deck context |
| `skills/presentation/board-deck.md` | Board-level visualization rules (stricter) |
| `skills/presentation/engineering-review.md` | Internal review allows richer visualizations |
