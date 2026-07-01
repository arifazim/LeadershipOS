# Memory

**Domain**: Persistent institutional memory
**Owner**: `kaizen/weekly-review.md` (Update Cascade, Step 1) and `kaizen/monthly-review.md`
**Written by**: any loop or kaizen review that surfaces a lesson, incident pattern, coaching insight, or decision outcome worth recalling later

---

## Purpose

Memory is where the OS keeps what it has learned, separate from where it keeps *how to act* (`skills/`, `subagents/`) and *what actually happened* (`evaluations/`, `kaizen/continuous-improvement.md`).

This directory previously existed only as a reference — `kaizen/weekly-review.md`'s Update Cascade (Step 1) and `kaizen/continuous-improvement.md`'s `memory-added` change tag both pointed here, but the directory itself was never created. Every loop in `loops/` that logs an outcome writes here.

## Subdirectories

| Directory | Contents | Written by |
|---|---|---|
| `lessons/` | Dated lesson entries (`{{YYYY-MM-DD}}-lessons.md`) — a prediction that was wrong, a recommendation that worked or failed, anything worth not re-learning | `kaizen/weekly-review.md` Q1/Q3/Q4; any loop's "Log outcome" step |
| `incidents/` | Recurring incident patterns — root cause, prior occurrence, whether it repeated | `kaizen/weekly-review.md` Q6; `loops/incident-loop.md` |
| `coaching/` | Engineer growth patterns — what enabled growth, so it can be repeated deliberately | `kaizen/weekly-review.md` Q5; `loops/career-loop.md`, `loops/promotion-loop.md` |
| `decisions/` | Decision outcomes tracked over time (distinct from the full `decision-memory/` module — this is the lightweight cross-reference kaizen and loops write during routine review, not the structured `DEC-YYYY-NNN` record) | `kaizen/weekly-review.md`; any loop that logs a scope or trade-off decision |

## Relationship to `decision-memory/`

`decision-memory/` is the structured, schema-driven institutional learning module (full decision records, pattern detection, recall). `memory/decisions/` is a lighter-weight log written during routine kaizen/loop execution. When a `memory/decisions/` entry represents a decision significant enough to warrant the full schema, promote it into `decision-memory/` via `skills/decision-memory/record-decision.md` — don't duplicate it in both places.

## File Naming

Each entry file is named `{{YYYY-MM-DD}}-{{short-topic}}.md`. There is no master index file — recall is done by reading recent entries or grepping for a topic, consistent with how `kaizen/continuous-improvement.md` is read as a changelog rather than a database.
