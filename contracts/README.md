# Contracts

**Domain**: Specification contracts
**Owner**: none — contracts constrain behavior, they don't execute it

---

## Purpose

Most skills and subagents in this repo already have rich Purpose/Inputs/Output/Confidence Score/Failure Modes sections — but that structure is narrative, and it varies slightly file to file. A contract is the same information reduced to a strict, versioned schema: Name, Inputs (Required/Optional), Required Outputs, Failure Conditions, Quality Checks, Version. This is the layer the original Request Lifecycle mapping flagged as a gap — nothing previously scoped a request's inputs/outputs *before* it was routed to a skill; `features/*.feature` only validates behavior *after* the fact.

## Why a contract is not the same as a skill's Output section

- A skill's **Output** section describes the shape of one specific output template.
- A contract's **Failure Conditions** describe when the skill must refuse to run at all — a state check, not an output.
- A contract's **Quality Checks** describe what must be true about *any* valid output, independent of which template rendered it — this is where "confidence must be stated," "evidence must be cited," and "recommendations must be ranked" live as enforceable rules rather than prose reminders.
- A contract's **Version** makes drift visible: if a skill's Required Outputs change, its contract version bumps, and anything depending on the old shape has a concrete signal to re-check.

## File Index

| File | Type | Scope |
|---|---|---|
| `skill.contract.md` | Universal template | Every file under `skills/`, `leadership-health/`, `confidence-engine/` |
| `subagent.contract.md` | Universal template | Every file under `subagents/` |
| `prediction.contract.md` | Filled | `skills/confidence-engine/prediction_confidence.md` + `loops/prediction-loop.md` |
| `dashboard.contract.md` | Filled | `skills/leadership-health/generate-dashboard.md` + `analytics/*.md` |
| `meeting.contract.md` | Filled | `skills/meetings/*.md` |
| `executive.contract.md` | Filled | `skills/executive/*.md` (board-level-summary.md's deck variant is governed by `presentation.contract.md` instead) |
| `presentation.contract.md` | Filled | `skills/presentation/*.md` + `skills/executive/board-level-summary.md` |

## How This Relates to `loops/`

A loop's Step 2 ("Invoke skills") calls a skill that has a contract. The loop defines *when and in what sequence* a skill fires; the contract defines *what that skill needs and must produce* regardless of who's calling it. Neither replaces the other.

## Extending Contracts

Only two files here are universal templates (`skill.contract.md`, `subagent.contract.md`) — the other five are worked examples for specific domains, not exhaustive coverage. When a new domain needs a contract, follow the same extraction pattern: find the flagship file, map its existing Inputs/Output/Confidence Score/Failure Modes sections onto the schema, add a pointer in the flagship file back to its new contract. Do not write a contract from scratch without grounding it in a real, existing skill file.
