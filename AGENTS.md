# AGENTS.md

This file provides guidance to OpenAI Codex (and any OpenAI API-based tool) when working with code in this repository. It is the OpenAI-convention equivalent of `CLAUDE.md`.

**All operating directives live in `CLAUDE.md`.** Read that file first and treat every directive in it as authoritative for this repository. This file exists solely to ensure Codex picks up the same instructions that Claude Code reads automatically.

---

## How to Load the Operating Manual

When starting a session with this repository using Codex or any OpenAI-based tool, begin with:

```
Read CLAUDE.md and subagents/engineering-manager.md, then introduce yourself
as my engineering manager assistant and tell me what you can help with.
```

This loads:
- The 15 operating directives (mindset, reasoning, risk, output format)
- The DORA/SPACE/Accelerate metric frameworks
- The full repository architecture (15 layers, request lifecycle, key relationships)
- The content conventions governing every file

Do not skip this step. Without `CLAUDE.md`, you are operating without the EM OS context and will produce generic responses instead of structured EM OS outputs.

---

## Codex-Specific Notes

**File reading**: Codex does not automatically read repo files the way Claude Code does. You must explicitly reference files in your prompt (e.g., "Read `subagents/delivery-manager.md`") or paste their contents into the conversation. The `#File` or `@file` syntax varies by the tool wrapping the Codex API — use whatever your interface supports.

**Context window**: This repo has 240+ files. Do not attempt to load all of them. Load `CLAUDE.md` plus the specific subagent and skill files relevant to your current task. The routing logic in `subagents/engineering-manager.md` tells you which specialist and skill to load next.

**Statelessness**: Codex sessions do not persist memory between conversations. The `memory/` directory in this repo is the persistence layer — read the relevant domain file at the start of a session to restore context, and write new entries back to it when a session produces a pattern worth keeping.

**Tool use**: If you are using Codex via an agentic interface that supports tool calls (file read, shell exec), use those to load files on demand rather than asking the user to paste them. The repo has no build step — every file is plain Markdown and readable directly.

---

## Quick Capability Reference

| I want to... | Load these files |
|---|---|
| Start any session | `CLAUDE.md` + `subagents/engineering-manager.md` |
| Run daily standup triage | `commands/daily.md` → routes into `loops/daily-leadership-loop.md` |
| Review a sprint | `subagents/delivery-manager.md` + `skills/delivery/review-sprint.md` |
| Prepare a 1:1 | `subagents/engineering-coach.md` + `skills/people/one-on-one.md` |
| Build a promotion case | `subagents/engineering-coach.md` + `skills/career/promotion/promotion-evidence.md` |
| Draft an executive update | `subagents/executive-summary.md` + `commands/executive.md` |
| Assess leadership health | `skills/leadership-health/leadership-health-engine.md` |
| Check exec confidence | `confidence-engine/executive_confidence.md` |
| Detect org risk signals | `skills/organizational/political-intelligence.md` |
| Recall a past decision | `decision-memory/decision-memory.md` |
| Run weekly kaizen | `kaizen/weekly-review.md` |

---

## References

- `CLAUDE.md` — the authoritative operating manual; all directives live there
- `README.md` — system overview, 15-layer architecture table, quick start
- `BUILD.md` — how to configure this repo for your specific team and tooling
- `ONBOARDING.md` — practical "how do I actually use this" guide with worked examples
- `HOWTORUN.md` — full setup, API configuration, and copy-paste command examples
