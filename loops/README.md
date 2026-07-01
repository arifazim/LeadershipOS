# Loops

**Domain**: Reusable orchestration
**Owner**: none — that's the point. Loops are invoked by whichever subagent needs them.
**Cadence**: varies per loop (see each file's `Cadence` field)

---

## Purpose

A loop is a reusable, cadence-bound orchestration definition: which inputs to gather, which skills to invoke and in what order, which subagent(s) synthesize the result, which template produces the output, and where the outcome gets logged. Loops formalize the "Loop Engineering" layer between a request landing and a skill actually firing — previously this logic existed only informally, duplicated inside `subagents/engineering-manager.md`'s Routing Logic tree and never made reusable by other subagents.

## Why loops are distinct from commands, skills, and subagents

| Layer | Owned by | Reusable across subagents? | Cadence-bound? |
|---|---|---|---|
| `commands/` | One owning subagent, triggered by the user | No — a command belongs to whoever owns it | Sometimes |
| `skills/` | Invoked by any subagent for one unit of analysis | Yes, but produces one output, not an end-to-end cycle | No |
| `loops/` | No single owner | Yes — explicitly, via each loop's "Reusable by" field | Yes |
| `subagents/` | The persona that does the orchestrating | N/A | No |

A command file is a thin trigger that points at a loop (`Command entry point` field in each loop). The loop contains the actual sequence. Multiple subagents can invoke the same loop for the same cadence from different entry points — e.g. `sprint-loop.md` is invoked by `delivery-manager` on the normal cadence, but `engineering-manager` can also invoke it directly if a cross-domain situation requires a fresh sprint read.

## Standard Loop Structure

Every loop file follows this shape:

```markdown
# Loop: {{Name}}

**Cadence**: {{trigger — Daily / Weekly / Sprint boundary / On-demand}}
**Reusable by**: {{subagent1, subagent2, ...}}
**Command entry point**: `commands/{{file}}.md` (thin pointer into this loop, if one exists)

## Purpose
## Trigger Conditions
## Steps
1. Gather inputs
2. Invoke skills
3. Route to subagent(s)
4. Produce output
5. Log outcome
## Feature Reference
## Failure Modes
## Related Loops
```

## File Index

| Loop | Cadence | Primary subagent |
|---|---|---|
| `daily-leadership-loop.md` | Daily | `engineering-manager` |
| `sprint-loop.md` | Sprint boundary | `delivery-manager` |
| `delivery-loop.md` | Weekly, rolling | `delivery-manager` |
| `executive-loop.md` | Weekly/monthly, or on-demand | `executive-summary` |
| `incident-loop.md` | On-trigger (P1/P2) | `incident-manager` |
| `retrospective-loop.md` | Sprint end / post-incident | `delivery-manager`, `incident-manager` |
| `career-loop.md` | Ongoing, quarterly check-in | `engineering-coach` |
| `promotion-loop.md` | Promotion cycle | `engineering-coach` |
| `architecture-loop.md` | Per ADR / architecture review | `tech-lead` |
| `stakeholder-loop.md` | Per initiative, ongoing | `product-partner` |
| `prediction-loop.md` | Weekly/monthly, or before forecasts | `executive-summary` |

## Disambiguated Pairs

Two pairs of loops cover adjacent ground and are deliberately split rather than merged — each loop's `Related Loops` section names the boundary explicitly so the distinction doesn't erode over time:

- **sprint-loop vs. delivery-loop**: sprint-loop is the single-sprint ceremony (plan → execute → review); delivery-loop is the rolling, cross-sprint DORA/trend read.
- **career-loop vs. promotion-loop**: career-loop is the ongoing, multi-year development conversation; promotion-loop is the execution of one specific promotion cycle.

## Logging

Every loop's "Log outcome" step writes to `memory/` (lessons, incidents, coaching, or decisions, depending on what the loop surfaced) and, if the outcome reveals the OS itself should change, to `kaizen/continuous-improvement.md` per the normal kaizen process.
