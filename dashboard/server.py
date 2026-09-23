"""
Engineering Manager OS — v0.6 Dashboard Server
FastAPI backend serving metrics, team context, and agent execution to the dashboard UI.

Usage:
    cd /path/to/engineering-manager-os
    uvicorn dashboard.server:app --reload --port 8080
"""

import json
import sys
from datetime import datetime
from pathlib import Path

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from dotenv import load_dotenv

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))
load_dotenv(ROOT / ".env")

from dashboard.metrics import build_dashboard_metrics, load_history
from core.orchestrator import Orchestrator

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

DASHBOARD_DIR = Path(__file__).parent
app.mount("/static", StaticFiles(directory=str(DASHBOARD_DIR)), name="static")

METRICS_PATH = ROOT / "memory" / "current_metrics.json"
HISTORY_PATH = ROOT / "memory" / "metrics_history.jsonl"
TEAM_PATH = ROOT / "config" / "team.json"


def _read_json(path: Path) -> dict:
    if path.exists():
        return json.loads(path.read_text(encoding="utf-8"))
    return {}


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
    """Normalized DORA/SPACE/roadmap payload for the UI."""
    raw = _read_json(METRICS_PATH)
    if not raw:
        raise HTTPException(status_code=404, detail="memory/current_metrics.json not found")
    return build_dashboard_metrics(raw, load_history(HISTORY_PATH))


@app.get("/api/health")
def health_check() -> dict:
    metrics_ok = METRICS_PATH.exists()
    team_ok = TEAM_PATH.exists()
    raw = _read_json(METRICS_PATH)
    sources = {
        k: (raw.get(k) or {}).get("_source", "missing")
        for k in ("github", "jira", "pagerduty", "slack", "datadog")
    }
    return {
        "status": "ok" if (metrics_ok and team_ok) else "degraded",
        "metrics_file": metrics_ok,
        "team_file": team_ok,
        "sources": sources,
        "timestamp": datetime.utcnow().isoformat() + "Z",
    }


@app.post("/api/ingest")
def trigger_ingest() -> dict:
    import importlib.util

    ingest_path = ROOT / "scripts" / "ingest_metrics.py"
    spec = importlib.util.spec_from_file_location("ingest_metrics", str(ingest_path))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    ingestor = mod.MetricsIngestor()
    ingestor.run()
    return {"status": "ok", "message": "Metrics refreshed", "timestamp": datetime.utcnow().isoformat() + "Z"}


class RunRequest(BaseModel):
    situation: str


@app.post("/api/run")
def run_agent(req: RunRequest) -> dict:
    try:
        orchestrator = Orchestrator()
        result = orchestrator.run(req.situation)
        return {"status": "ok", "result": result}
    except Exception as exc:
        raise HTTPException(status_code=500, detail=str(exc))


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("dashboard.server:app", host="0.0.0.0", port=8080, reload=True)
