"""Print due OS cadences. Exit 1 if em-growth is overdue."""

from __future__ import annotations

import json
import sys
from datetime import date
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CADENCE_PATH = ROOT / "memory" / "cadence.json"


def main() -> int:
    if not CADENCE_PATH.exists():
        print("No memory/cadence.json — run ./bin/em-os run em-growth once.")
        return 1
    data = json.loads(CADENCE_PATH.read_text(encoding="utf-8"))
    today = date.today()
    overdue = False
    for name, row in data.items():
        due = date.fromisoformat(row["next_due"])
        status = "DUE" if today >= due else "ok"
        if status == "DUE":
            overdue = True
        print(f"{name}: last {row.get('last_run')} next {row['next_due']} [{status}]")
    if overdue:
        print("\nRun: ./bin/em-os run em-growth")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
