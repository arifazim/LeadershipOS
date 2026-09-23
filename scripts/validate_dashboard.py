"""Compare mock dashboard bands against the v0.6 golden fixture (≥90% field agreement)."""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))

from dashboard.metrics import build_dashboard_metrics

EXPECTED_PATH = ROOT / "evaluations" / "golden" / "dashboard" / "mock-expected.json"
FIXTURE_PATH = ROOT / "evaluations" / "golden" / "dashboard" / "mock-current-metrics.json"


def _flatten(obj, prefix=""):
    rows = {}
    if isinstance(obj, dict):
        for k, v in obj.items():
            rows.update(_flatten(v, f"{prefix}.{k}" if prefix else k))
    else:
        rows[prefix] = obj
    return rows


def main() -> int:
    raw = json.loads(FIXTURE_PATH.read_text(encoding="utf-8"))
    expected = json.loads(EXPECTED_PATH.read_text(encoding="utf-8"))
    actual = build_dashboard_metrics(raw, [])
    exp_flat = _flatten(expected)
    act_flat = _flatten(actual)
    checked = 0
    matched = 0
    misses = []
    for key, want in exp_flat.items():
        if key not in act_flat:
            misses.append(f"missing {key}")
            checked += 1
            continue
        checked += 1
        got = act_flat[key]
        if got == want:
            matched += 1
        else:
            misses.append(f"{key}: want {want!r} got {got!r}")
    pct = (matched / checked * 100) if checked else 0
    print(f"Dashboard golden agreement: {matched}/{checked} ({pct:.1f}%)")
    if pct < 90:
        print("\n".join(misses[:20]))
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
