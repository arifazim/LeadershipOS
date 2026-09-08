"""
Engineering Manager OS — v0.6 Dashboard Server
FastAPI backend serving metrics, team context, and agent execution to the dashboard UI.

Usage:
    cd /path/to/engineering-manager-os
    uvicorn dashboard.server:app --reload --port 8080
"""

import json
import os
import sys
import re
from datetime import datetime, timedelta
from pathlib import Path
from typing import Any

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse, JSONResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from dotenv import load_dotenv

# ---------------------------------------------------------------------------
# Bootstrap — ensure project root is on sys.path so core/ imports work
# ---------------------------------------------------------------------------
ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))
load_dotenv(ROOT / ".env")

from core.orchestrator import Orchestrator

# ---------------------------------------------------------------------------
# App setup
# ---------------------------------------------------------------------------
app = FastAPI(
    title="Engineering Manager OS",
    description="v0.6 Dashboard API",
    version="0.6.0",
    docs_url="/api/docs",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# Serve dashboard static files
DASHBOARD_DIR = Path(__file__).parent
app.mount("/static", StaticFiles(directory=str(DASHBOARD_DIR)), name="static")

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------
METRICS_PATH = ROOT / "memory" / "current_metrics.json"
TEAM_PATH = ROOT / "config" / "team.json"
MEMORY_DIR = ROOT / "memory"
KAIZEN_DIR = ROOT / "kaizen"


# ---------------------------------------------------------------------------
# Data helpers
# ---------------------------------------------------------------------------

def _read_json(path: Path) -> dict:
    if path.exists():
        return json.loads(path.read_text(encoding="utf-8"))
    return {}


def _parse_percentage(value: str) -> float:
    """Convert '88%' → 88.0"""
    if isinstance(value, (int, float)):
        return float(value)
    return float(str(value).replace("%", "").strip())


def _parse_hours(value: str) -> float:
    """Convert '18 hours' → 18.0, '42 minutes' → 0.7"""
    s = str(value).strip().lower()
    if "minute" in s:
        return round(float(re.sub(r"[^\d.]", "", s)) / 60, 2)
    if "hour" in s:
        return float(re.sub(r"[^\d.]", "", s))
    if "day" in s:
        return round(float(re.sub(r"[^\d.]", "", s)) * 24, 2)
    try:
        return float(re.sub(r"[^\d.]", "", s))
    except ValueError:
        return 0.0


def _parse_days(value: str) -> float:
    """Convert '1.2 days' → 1.2"""
    s = str(value).strip().lower()
    if "hour" in s:
        return round(float(re.sub(r"[^\d.]", "", s)) / 24, 2)
    try:
        return float(re.sub(r"[^\d.]", "", s))
    except ValueError:
        return 0.0


def _dora_band(metric: str, value: float) -> str:
    """Return Elite / High / Medium / Low for a given DORA metric."""
    bands = {
        "deployment_frequency_per_day": [(1, "Elite"), (0.14, "High"), (0.033, "Medium")],
        "lead_time_days": [(1, "Elite"), (7, "High"), (30, "Medium")],
        "change_failure_rate_pct": [(5, "Elite"), (10, "High"), (15, "Medium")],
        "mttr_hours": [(1, "Elite"), (24, "High"), (168, "Medium")],
    }
    thresholds = bands.get(metric, [])
    for threshold, label in thresholds:
        if metric in ("deployment_frequency_per_day",):
            if value >= threshold:
                return label
        else:
            if value <= threshold:
                return label
    return "Low"


def _status_color(band: str) -> str:
    return {"Elite": "green", "High": "green", "Medium": "yellow", "Low": "red"}.get(band, "neutral")


def _compute_confidence_score(metrics: dict) -> int:
    """Compute a 0–100 Executive Confidence composite from available metrics."""
    score = 0
    weight_total = 0

    raw_github = metrics.get("github", {})
    raw_jira = metrics.get("jira", {})
    raw_pagerduty = metrics.get("pagerduty", {})

    # Deployment frequency (20 pts)
    df = raw_github.get("deployment_frequency", "")
    df_map = {"daily": 20, "weekly": 14, "monthly": 8, "": 0}
    score += df_map.get(str(df).lower(), 10)
    weight_total += 20

    # Lead time (20 pts)
    lt = _parse_days(raw_github.get("lead_time_for_changes", "7 days"))
    if lt <= 1:
        score += 20
    elif lt <= 7:
        score += 14
    elif lt <= 30:
        score += 8
    else:
        score += 2
    weight_total += 20

    # Change failure rate (20 pts)
    cfr = _parse_percentage(raw_pagerduty.get("change_failure_rate", "15%"))
    if cfr <= 5:
        score += 20
    elif cfr <= 10:
        score += 14
    elif cfr <= 15:
        score += 8
    else:
        score += 2
    weight_total += 20

    # MTTR (20 pts)
    mttr = _parse_hours(raw_pagerduty.get("mttr", "24 hours"))
    if mttr <= 1:
        score += 20
    elif mttr <= 24:
        score += 14
    elif mttr <= 168:
        score += 8
    else:
        score += 2
    weight_total += 20

    # Commitment accuracy (20 pts)
    ca = _parse_percentage(raw_jira.get("commitment_accuracy", "50%"))
    if ca >= 90:
        score += 20
    elif ca >= 80:
        score += 14
    elif ca >= 70:
        score += 8
    else:
        score += 2
    weight_total += 20

    return round((score / weight_total) * 100) if weight_total else 0


def _trend_indicator(current: float, baseline: float) -> str:
    """Return 'up', 'down', or 'flat' for a given metric."""
    if baseline == 0:
        return "flat"
    delta = (current - baseline) / baseline
    if delta > 0.05:
        return "up"
    if delta < -0.05:
        return "down"
    return "flat"


# ---------------------------------------------------------------------------
# Simulated historical baseline (4-week average) — fills in until real
# historical data is accumulated in memory/
# ---------------------------------------------------------------------------
def _baseline_metrics() -> dict:
    return {
        "github": {
            "pr_cycle_time_hours": 22.0,
            "lead_time_days": 1.8,
            "deployment_frequency": "daily",
        },
        "jira": {
            "sprint_velocity": 41,
            "commitment_accuracy": 83.0,
            "unplanned_work_rate": 15.0,
        },
        "pagerduty": {
            "mttr_hours": 0.9,
            "incident_count_last_30d": 5,
            "change_failure_rate_pct": 6.0,
        },
    }


# ---------------------------------------------------------------------------
# Routes
# ---------------------------------------------------------------------------

@app.get("/")
def serve_dashboard():
    html_path = DASHBOARD_DIR / "dashboard.html"
    if html_path.exists():
        return FileResponse(str(html_path), media_type="text/html")
    raise HTTPException(status_code=404, detail="dashboard.html not found")


@app.get("/api/team")
def get_team() -> dict:
    data = _read_json(TEAM_PATH)
    if not data:
        raise HTTPException(status_code=404, detail="config/team.json not found")
    return data


@app.get("/api/metrics/raw")
def get_raw_metrics() -> dict:
    data = _read_json(METRICS_PATH)
    if not data:
        raise HTTPException(status_code=404, detail="memory/current_metrics.json not found")
    return data


@app.get("/api/metrics")
def get_metrics() -> dict:
    """
    Returns normalized, computed metrics ready for the dashboard.
    Parses all string values to floats, computes DORA bands, confidence score,
    and trend indicators vs. 4-week baseline.
    """
    raw = _read_json(METRICS_PATH)
    baseline = _baseline_metrics()

    if not raw:
        raise HTTPException(status_code=404, detail="memory/current_metrics.json not found")

    raw_gh = raw.get("github", {})
    raw_jira = raw.get("jira", {})
    raw_pd = raw.get("pagerduty", {})

    # --- Normalize ---
    pr_cycle_hours = _parse_hours(raw_gh.get("pr_cycle_time", "0 hours"))
    lead_time_days = _parse_days(raw_gh.get("lead_time_for_changes", "0 days"))
    deploy_freq_raw = str(raw_gh.get("deployment_frequency", "")).lower()
    deploy_freq_per_day = {"daily": 1.0, "weekly": 1 / 7, "monthly": 1 / 30, "quarterly": 1 / 90}.get(
        deploy_freq_raw, 0.0
    )

    sprint_velocity = int(raw_jira.get("sprint_velocity", 0))
    commitment_pct = _parse_percentage(raw_jira.get("commitment_accuracy", "0%"))
    unplanned_pct = _parse_percentage(raw_jira.get("unplanned_work_rate", "0%"))

    mttr_hours = _parse_hours(raw_pd.get("mttr", "0 hours"))
    incident_count = int(raw_pd.get("incident_count_last_30d", 0))
    cfr_pct = _parse_percentage(raw_pd.get("change_failure_rate", "0%"))

    # --- DORA bands ---
    deploy_band = _dora_band("deployment_frequency_per_day", deploy_freq_per_day)
    lt_band = _dora_band("lead_time_days", lead_time_days)
    cfr_band = _dora_band("change_failure_rate_pct", cfr_pct)
    mttr_band = _dora_band("mttr_hours", mttr_hours)

    overall_dora_score = sum(
        {"Elite": 4, "High": 3, "Medium": 2, "Low": 1}.get(b, 0)
        for b in [deploy_band, lt_band, cfr_band, mttr_band]
    )
    dora_labels = {16: "Elite", 12: "High", 8: "Medium"}
    dora_overall = next((v for k, v in sorted(dora_labels.items(), reverse=True) if overall_dora_score >= k), "Low")

    # --- Confidence score ---
    confidence = _compute_confidence_score(raw)

    # --- Trends ---
    b_gh = baseline["github"]
    b_jira = baseline["jira"]
    b_pd = baseline["pagerduty"]

    return {
        "timestamp": raw.get("timestamp"),
        "confidence_score": confidence,
        "confidence_band": "Green" if confidence >= 80 else "Yellow" if confidence >= 60 else "At Risk" if confidence >= 40 else "Critical",
        "dora": {
            "overall": dora_overall,
            "deployment_frequency": {
                "value": deploy_freq_raw,
                "band": deploy_band,
                "color": _status_color(deploy_band),
                "trend": _trend_indicator(deploy_freq_per_day, b_gh.get("deployment_frequency", "daily") and 1.0),
            },
            "lead_time": {
                "value": f"{lead_time_days}d",
                "value_raw": lead_time_days,
                "band": lt_band,
                "color": _status_color(lt_band),
                "trend": _trend_indicator(lead_time_days, b_gh.get("lead_time_days", lead_time_days)),
                "better": "lower",
            },
            "change_failure_rate": {
                "value": f"{cfr_pct}%",
                "value_raw": cfr_pct,
                "band": cfr_band,
                "color": _status_color(cfr_band),
                "trend": _trend_indicator(cfr_pct, b_pd.get("change_failure_rate_pct", cfr_pct)),
                "better": "lower",
            },
            "mttr": {
                "value": f"{mttr_hours:.1f}h",
                "value_raw": mttr_hours,
                "band": mttr_band,
                "color": _status_color(mttr_band),
                "trend": _trend_indicator(mttr_hours, b_pd.get("mttr_hours", mttr_hours)),
                "better": "lower",
            },
        },
        "delivery": {
            "sprint_velocity": {
                "value": sprint_velocity,
                "baseline": b_jira.get("sprint_velocity", sprint_velocity),
                "trend": _trend_indicator(sprint_velocity, b_jira.get("sprint_velocity", sprint_velocity)),
            },
            "commitment_accuracy": {
                "value": commitment_pct,
                "value_display": f"{commitment_pct:.0f}%",
                "baseline": b_jira.get("commitment_accuracy", commitment_pct),
                "trend": _trend_indicator(commitment_pct, b_jira.get("commitment_accuracy", commitment_pct)),
                "band": "Green" if commitment_pct >= 85 else "Yellow" if commitment_pct >= 70 else "Red",
            },
            "unplanned_work": {
                "value": unplanned_pct,
                "value_display": f"{unplanned_pct:.0f}%",
                "baseline": b_jira.get("unplanned_work_rate", unplanned_pct),
                "trend": _trend_indicator(unplanned_pct, b_jira.get("unplanned_work_rate", unplanned_pct)),
                "band": "Green" if unplanned_pct <= 10 else "Yellow" if unplanned_pct <= 20 else "Red",
                "better": "lower",
            },
            "pr_cycle_time": {
                "value": f"{pr_cycle_hours:.0f}h",
                "value_raw": pr_cycle_hours,
                "baseline": b_gh.get("pr_cycle_time_hours", pr_cycle_hours),
                "trend": _trend_indicator(pr_cycle_hours, b_gh.get("pr_cycle_time_hours", pr_cycle_hours)),
                "band": "Green" if pr_cycle_hours <= 12 else "Yellow" if pr_cycle_hours <= 24 else "Red",
                "better": "lower",
            },
        },
        "incidents": {
            "count_30d": incident_count,
            "mttr_hours": mttr_hours,
            "change_failure_rate_pct": cfr_pct,
            "trend_count": _trend_indicator(incident_count, b_pd.get("incident_count_last_30d", incident_count)),
            "band": "Green" if incident_count == 0 else "Yellow" if incident_count <= 3 else "Red",
        },
    }


@app.get("/api/health")
def health_check() -> dict:
    metrics_ok = METRICS_PATH.exists()
    team_ok = TEAM_PATH.exists()
    return {
        "status": "ok" if (metrics_ok and team_ok) else "degraded",
        "metrics_file": metrics_ok,
        "team_file": team_ok,
        "timestamp": datetime.utcnow().isoformat() + "Z",
    }


@app.post("/api/ingest")
def trigger_ingest() -> dict:
    """Re-run the metrics ingestor and return the refreshed metrics."""
    import importlib.util

    ingest_path = ROOT / "scripts" / "ingest_metrics.py"
    spec = importlib.util.spec_from_file_location("ingest_metrics", str(ingest_path))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    ingestor = mod.MetricsIngestor(mock=True)
    ingestor.run()
    return {"status": "ok", "message": "Metrics refreshed", "timestamp": datetime.utcnow().isoformat() + "Z"}


class RunRequest(BaseModel):
    situation: str


@app.post("/api/run")
def run_agent(req: RunRequest) -> dict:
    """Pass a free-text situation to the orchestrator and return the AI response."""
    try:
        orchestrator = Orchestrator()
        result = orchestrator.run(req.situation)
        return {"status": "ok", "result": result}
    except Exception as exc:
        raise HTTPException(status_code=500, detail=str(exc))


# ---------------------------------------------------------------------------
# Entry point for direct execution: python dashboard/server.py
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    import uvicorn

    uvicorn.run("dashboard.server:app", host="0.0.0.0", port=8080, reload=True)
