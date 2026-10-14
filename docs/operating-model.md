# Operating Model — The Five-Loop Leadership System

**Who must know this:** EM, Senior EM, Director, Senior Director, VP Engineering.  
**Why it exists:** Predictability. This is the system that lets a leader scale from **10 → 100 → 500** engineers without replacing judgment with chaos or heroics.

This is not a dashboard. It is the **#1 practice every senior leader in this OS must run**. Metrics (DORA, North Star, SPACE) feed it. They do not replace it.

---

## The five loops

| Loop | Job | Cadence | If you skip it |
|---|---|---|---|
| **1. Clear goals** | One North Star, one team/sprint goal, named owners | Set quarterly; confirm weekly | Activity without a finish line. Vanessa/Jeff cannot tell if you won. |
| **2. Written communication** | Decisions, status, and risks exist in writing before the meeting | Weekly + after any irreversible call | Oral-only leadership. Context dies in Slack. Scale stops at ~15 people. |
| **3. Weekly operating rhythm** | Same meetings, same artifacts, same Monday→Friday path | Weekly, non-negotiable | Firefighting as culture. No one knows when truth gets said. |
| **4. Risk reviews** | Named risks, owners, next review date — not a slide of greens | Weekly at team; monthly at Director+ | Surprise misses. Trust burns faster than MTTR. |
| **5. Accountability loops** | Commitments close or get explicitly dropped | Weekly actions; monthly self + 1:1 | Theater: lists grow, nothing finishes, no one is on the hook. |

```
Clear goals
    → Written communication (what we are doing, why, who owns it)
        → Weekly operating rhythm (when we inspect)
            → Risk reviews (what can kill the goal)
                → Accountability loops (did we do what we said?)
                    → update goals
```

Predictability is the output. Speed without this stack is a sprint; scale without it is an org chart.

---

## How this maps onto EM-OS

| Loop | Run this | Artifact |
|---|---|---|
| Clear goals | North Star in `config/team.json`; sprint goal in `commands/weekly.md` / `loops/sprint-loop.md` | Dashboard Summary hero; `templates/roadmap.md` |
| Written communication | `./bin/em-os run executive`; 1:1 notes; ADRs via `decision-memory/` | `templates/executive-status.md`, `templates/one-on-one.md` |
| Weekly operating rhythm | HOWTORUN §4; `./bin/em-os run daily` / `dashboard` / `weekly` | `commands/daily.md`, `commands/dashboard.md`, `commands/weekly.md` |
| Risk reviews | Dashboard Risk Register; `skills/strategy/risk-planning.md`; `./bin/em-os run incident` / `crisis` when live | Risk view; `templates/incident-review.md` |
| Accountability loops | Retro actions; `kaizen/weekly-review.md`; `./bin/em-os run em-growth`; 1:1 follow-through | `memory/`, `kaizen/failures.md`, EMG pad |

Do not invent a sixth weekly meeting. Use the existing commands. The failure is skipping the loop, not missing a new tool.

---

## What “good” looks like (observable)

**Clear goals**
- North Star has a Product owner, a unit, and a current value (even if `_source` is mock — then say so).
- This week’s engineering goal is one sentence. If it takes a paragraph, it is not a goal.

**Written communication**
- Status is written *before* the exec meeting. The meeting is for decisions, not discovery.
- Every significant decision has a record (decision-memory or a 5-line note): decision, why, who, expected outcome.

**Weekly operating rhythm**
- Monday: ingest + dashboard + one priority action.
- Daily: standup triage (`daily`).
- Sprint boundary: `weekly` + `retrospective`.
- Before KSheeraj/Vanessa/Jeff: `executive`.
- Same calendar every week. Canceling “just this once” is how the rhythm dies.

**Risk reviews**
- Top 3–5 risks have owner + next date. Unowned risk is not a risk; it is a hope.
- Engineering risks (CFR, MTTR, cycle time) and product/org risks are listed separately. Do not smear customer retention into engineer attrition.

**Accountability loops**
- Last week’s actions: done, dropped (with reason), or slipped (with new date). Never silently stale.
- The EM’s own growth edge (`em-growth`) is in the same loop — you do not get a pass the team does not get.

---

## How it scales (10 → 100 → 500)

| Span | Leader | What changes | What must not change |
|---|---|---|---|
| ~10 | EM | You still see every ticket. Goals are sprint-sized. Writing is Slack + 1:1 notes. | All five loops, weekly. |
| ~30–80 | Senior EM / Director | You inspect *systems* (DORA, NSM, risk register), not every PR. Written comms go up as well as down. | Same Friday accountability. You do not skip 1:1s to “make time for strategy.” |
| ~100–250 | Senior Director | Portfolio goals. Staff-meeting risk review. Skip-levels as a sensor. | Written decisions. One North Star per product surface, not seventeen OKRs. |
| ~500 | VP | Narrative + capital allocation + org health. Rhythm is the leadership team’s, not your calendar trivia. | You still have a weekly OS. Chaos at the top becomes chaos at 500. |

**Tradeoff:** A rigid weekly OS costs calendar time and can become ceremony. The alternative — ad-hoc leadership — does not scale past a single team. If a loop produces no decision two weeks in a row, shorten it; do not delete it.

**Hidden risk:** Directors who run a beautiful rhythm *for their skip-level* and none *for their EMs* create two operating systems. One org, one rhythm. Cascade the same five loops; change only altitude.

---

## Failure modes

| Pattern | Signal | Fix |
|---|---|---|
| Goal soup | More than three “priorities” | Kill or sequence. North Star is one. |
| Meeting as memory | “We talked about this” with no note | Write the 5 lines before you leave. |
| Rhythm optional | Monday dashboard skipped three weeks | Put ingest + `run dashboard` on the calendar as work, not admin. |
| Green risk theater | Register exists, no owners, all Green | Force one Yellow. If everything is Green, the review is fake. |
| Accountability without authority | Named owner cannot say no | Change the owner or change the mandate. |

---

## Related

- `docs/principles.md` — Predictability over speed
- `docs/vision.md` — Second Brain, not a reporting tool
- `docs/engineering-playbook.md` — ceremony-level how
- `HOWTORUN.md` — copy-paste weekly commands
- `config/team.json` — North Star definition (Product-owned)
- `analytics/master-leadership-dashboard.md` — audience views once the loops have data
