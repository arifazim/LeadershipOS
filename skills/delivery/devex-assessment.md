# Skill: Developer Experience (DevEx) Assessment

**Domain**: Delivery & Engineering Excellence
**Owner**: `subagents/delivery-manager.md`
**Cadence**: Quarterly Survey + Monthly Tooling Audit

---

## Purpose

Measure the qualitative and quantitative friction in the engineering lifecycle. While DORA metrics track *what* is delivered, DevEx tracks *how* it feels to deliver. High DevEx correlates with high retention, lower burnout, and sustained velocity.

---

## The Three Pillars of DevEx

### 1. Feedback Loops
- **Speed**: How long does it take to run tests, get a code review, or deploy to staging?
- **Accuracy**: How reliable are the feedback signals? (e.g., Flaky tests, cryptic build errors).
- **Metric**: CI/CD duration, PR review lag, local build time.

### 2. Cognitive Load
- **Complexity**: How much domain knowledge is required to complete a simple task?
- **Tooling Friction**: Are tools helping or hindering (e.g., Fragmented docs, complex local setup)?
- **Metric**: Onboarding time-to-first-commit, documentation freshness score.

### 3. Flow State
- **Deep Work**: How much of the day is spent in meetings vs. coding?
- **Autonomy**: Do engineers have the tools and permissions to solve their own problems?
- **Metric**: Meeting-to-coding ratio, developer sentiment survey.

---

## Analysis

### Step 1: Tooling Friction Audit
- Identify the top 3 bottlenecks in the local development environment.
- Measure the "wait time" in the PR process.

### Step 2: Cognitive Load Mapping
- Assess the complexity of the team's primary services.
- Identify "tribal knowledge" silos where only one person knows how to fix something.

### Step 3: Developer Sentiment
- Conduct anonymous pulse surveys: "On a scale of 1-5, how easy is it to ship a change today?"

---

## Output Template

### 1. DevEx Scorecard
| Pillar | Score (1-5) | Primary Friction Point |
|---|---|---|
| Feedback Loops | | |
| Cognitive Load | | |
| Flow State | | |

### 2. Intervention Plan
- **Immediate**: [e.g., Fix flaky test suite X]
- **Quarterly**: [e.g., Automate staging environment setup]

### 3. Predicted Impact
- **Velocity**: [e.g., +15% PR throughput]
- **Retention**: [e.g., Reduced burnout risk in high-performers]
