"""Persist CLI runs that belong in memory (v0.7 Second Brain)."""

from __future__ import annotations

import json
from datetime import datetime, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CADENCE_PATH = ROOT / "memory" / "cadence.json"


def persist_cli_run(command_name: str, result: str) -> None:
    if command_name == "em-growth":
        runs = ROOT / "memory" / "em-self-development" / "runs"
        runs.mkdir(parents=True, exist_ok=True)
        stamp = datetime.now().strftime("%Y-%m-%d")
        (runs / f"{stamp}.md").write_text(result, encoding="utf-8")
        _touch_cadence("em-growth", 30)
    elif command_name == "crisis":
        runs = ROOT / "memory" / "conflicts"
        runs.mkdir(parents=True, exist_ok=True)
        stamp = datetime.now().strftime("%Y-%m-%d")
        note = runs / f"crisis-run-{stamp}.md"
        note.write_text(result, encoding="utf-8")


def _touch_cadence(name: str, days: int) -> None:
    data = {}
    if CADENCE_PATH.exists():
        data = json.loads(CADENCE_PATH.read_text(encoding="utf-8"))
    today = datetime.now().date()
    nxt = today + timedelta(days=days)
    data[name] = {
        "cadence_days": days,
        "last_run": today.isoformat(),
        "next_due": nxt.isoformat(),
    }
    CADENCE_PATH.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
