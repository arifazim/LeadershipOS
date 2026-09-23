"""Normalize current_metrics.json into the dashboard payload (no FastAPI)."""

from __future__ import annotations

import json
import re
from pathlib import Path
from typing import List, Optional


DEFAULT_BASELINE = {
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


def parse_percentage(value) -> float:
    if isinstance(value, (int, float)):
        return float(value)
    return float(str(value).replace("%", "").strip() or 0)


def parse_hours(value) -> float:
    s = str(value).strip().lower()
    if "minute" in s:
        return round(float(re.sub(r"[^\d.]", "", s) or 0) / 60, 2)
    if "hour" in s:
        return float(re.sub(r"[^\d.]", "", s) or 0)
    if "day" in s:
        return round(float(re.sub(r"[^\d.]", "", s) or 0) * 24, 2)
    try:
        return float(re.sub(r"[^\d.]", "", s) or 0)
    except ValueError:
        return 0.0


def parse_days(value) -> float:
    s = str(value).strip().lower()
    if "hour" in s:
        return round(float(re.sub(r"[^\d.]", "", s) or 0) / 24, 2)
    try:
        return float(re.sub(r"[^\d.]", "", s) or 0)
    except ValueError:
        return 0.0


def dora_band(metric: str, value: float) -> str:
    bands = {
        "deployment_frequency_per_day": [(1, "Elite"), (0.14, "High"), (0.033, "Medium")],
        "lead_time_days": [(1, "Elite"), (7, "High"), (30, "Medium")],
        "change_failure_rate_pct": [(5, "Elite"), (10, "High"), (15, "Medium")],
        "mttr_hours": [(1, "Elite"), (24, "High"), (168, "Medium")],
    }
    for threshold, label in bands.get(metric, []):
        if metric == "deployment_frequency_per_day":
            if value >= threshold:
                return label
        elif value <= threshold:
            return label
    return "Low"


def status_color(band: str) -> str:
    return {"Elite": "green", "High": "green", "Medium": "yellow", "Low": "red"}.get(band, "neutral")


def trend_indicator(current: float, baseline: float) -> str:
    if baseline == 0:
        return "flat"
    delta = (current - baseline) / baseline
    if delta > 0.05:
        return "up"
    if delta < -0.05:
        return "down"
    return "flat"


def compute_confidence_score(metrics: dict) -> int:
    score = 0
    weight_total = 0
    raw_github = metrics.get("github", {})
    raw_jira = metrics.get("jira", {})
    raw_pagerduty = metrics.get("pagerduty", {})

    df = raw_github.get("deployment_frequency", "")
    df_map = {"daily": 20, "weekly": 14, "monthly": 8, "": 0}
    score += df_map.get(str(df).lower(), 10)
    weight_total += 20

    lt = parse_days(raw_github.get("lead_time_for_changes", "7 days"))
    if lt <= 1:
        score += 20
    elif lt <= 7:
        score += 14
    elif lt <= 30:
        score += 8
    else:
        score += 2
    weight_total += 20

    cfr = parse_percentage(raw_pagerduty.get("change_failure_rate", "15%"))
    if cfr <= 5:
        score += 20
    elif cfr <= 10:
        score += 14
    elif cfr <= 15:
        score += 8
    else:
        score += 2
    weight_total += 20

    mttr = parse_hours(raw_pagerduty.get("mttr", "24 hours"))
    if mttr <= 1:
        score += 20
    elif mttr <= 24:
        score += 14
    elif mttr <= 168:
        score += 8
    else:
        score += 2
    weight_total += 20

    ca = parse_percentage(raw_jira.get("commitment_accuracy", "50%"))
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


def load_history(path: Path) -> List[dict]:
    if not path.exists():
        return []
    rows = []
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line:
            continue
        try:
            rows.append(json.loads(line))
        except json.JSONDecodeError:
            continue
    return rows


def baseline_from_history(rows: List[dict]) -> dict:
    if len(rows) < 2:
        return DEFAULT_BASELINE
    recent = rows[-4:]
    def avg(values):
        vals = [v for v in values if v is not None]
        return sum(vals) / len(vals) if vals else 0.0

    prs, lts, vels, cas, uns, mttrs, incs, cfrs = [], [], [], [], [], [], [], []
    for raw in recent:
        gh, jira, pd = raw.get("github", {}), raw.get("jira", {}), raw.get("pagerduty", {})
        prs.append(parse_hours(gh.get("pr_cycle_time", "0")))
        lts.append(parse_days(gh.get("lead_time_for_changes", "0")))
        vels.append(float(jira.get("sprint_velocity") or 0))
        cas.append(parse_percentage(jira.get("commitment_accuracy", "0")))
        uns.append(parse_percentage(jira.get("unplanned_work_rate", "0")))
        mttrs.append(parse_hours(pd.get("mttr", "0")))
        incs.append(float(pd.get("incident_count_last_30d") or 0))
        cfrs.append(parse_percentage(pd.get("change_failure_rate", "0")))
    return {
        "github": {
            "pr_cycle_time_hours": avg(prs),
            "lead_time_days": avg(lts),
            "deployment_frequency": "daily",
        },
        "jira": {
            "sprint_velocity": avg(vels),
            "commitment_accuracy": avg(cas),
            "unplanned_work_rate": avg(uns),
        },
        "pagerduty": {
            "mttr_hours": avg(mttrs),
            "incident_count_last_30d": avg(incs),
            "change_failure_rate_pct": avg(cfrs),
        },
    }


def build_dashboard_metrics(raw: dict, history: Optional[List[dict]] = None) -> dict:
    baseline = baseline_from_history(history or [])
    raw_gh = raw.get("github", {})
    raw_jira = raw.get("jira", {})
    raw_pd = raw.get("pagerduty", {})
    raw_slack = raw.get("slack", {})
    raw_dd = raw.get("datadog", {})

    pr_cycle_hours = parse_hours(raw_gh.get("pr_cycle_time", "0 hours"))
    lead_time_days = parse_days(raw_gh.get("lead_time_for_changes", "0 days"))
    deploy_freq_raw = str(raw_gh.get("deployment_frequency", "")).lower()
    deploy_freq_per_day = {"daily": 1.0, "weekly": 1 / 7, "monthly": 1 / 30, "quarterly": 1 / 90}.get(
        deploy_freq_raw, 0.0
    )

    sprint_velocity = int(raw_jira.get("sprint_velocity", 0) or 0)
    commitment_pct = parse_percentage(raw_jira.get("commitment_accuracy", "0%"))
    unplanned_pct = parse_percentage(raw_jira.get("unplanned_work_rate", "0%"))
    scope_inflation_pct = parse_percentage(raw_jira.get("scope_inflation", "0%"))
    commitments_hit_pct = parse_percentage(raw_jira.get("roadmap_commitments_hit", str(commitment_pct)))
    milestone_name = raw_jira.get("current_milestone", "Unspecified")
    milestone_status = raw_jira.get("milestone_status", "Unknown")

    mttr_hours = parse_hours(raw_pd.get("mttr", "0 hours"))
    incident_count = int(raw_pd.get("incident_count_last_30d", 0) or 0)
    cfr_pct = parse_percentage(raw_pd.get("change_failure_rate", "0%"))

    deploy_band = dora_band("deployment_frequency_per_day", deploy_freq_per_day)
    lt_band = dora_band("lead_time_days", lead_time_days)
    cfr_band = dora_band("change_failure_rate_pct", cfr_pct)
    mttr_band = dora_band("mttr_hours", mttr_hours)

    overall_dora_score = sum(
        {"Elite": 4, "High": 3, "Medium": 2, "Low": 1}.get(b, 0)
        for b in [deploy_band, lt_band, cfr_band, mttr_band]
    )
    dora_labels = {16: "Elite", 12: "High", 8: "Medium"}
    dora_overall = next((v for k, v in sorted(dora_labels.items(), reverse=True) if overall_dora_score >= k), "Low")

    confidence = compute_confidence_score(raw)
    b_gh, b_jira, b_pd = baseline["github"], baseline["jira"], baseline["pagerduty"]

    def _clamp(n: float) -> int:
        return max(0, min(100, round(n)))

    def _health_band(score: int) -> str:
        if score >= 80:
            return "Green"
        if score >= 60:
            return "Yellow"
        if score >= 40:
            return "At Risk"
        return "Red"

    vel_baseline = b_jira.get("sprint_velocity", sprint_velocity) or 1
    satisfaction = _clamp(100 - unplanned_pct - incident_count * 4)
    performance = _clamp(commitment_pct)
    activity = _clamp((sprint_velocity / vel_baseline) * 80)
    communication = _clamp(100 - min(50.0, pr_cycle_hours * 1.5))
    efficiency = _clamp(100 - unplanned_pct - lead_time_days * 8)
    space_scores = [satisfaction, performance, activity, communication, efficiency]
    space_overall = round(sum(space_scores) / len(space_scores))

    roadmap_band = (
        "Green" if scope_inflation_pct <= 10 and commitments_hit_pct >= 80
        else "Yellow" if scope_inflation_pct <= 20 and commitments_hit_pct >= 70
        else "Red"
    )

    sources = {
        "github": raw_gh.get("_source", "unknown"),
        "jira": raw_jira.get("_source", "unknown"),
        "pagerduty": raw_pd.get("_source", "unknown"),
        "slack": raw_slack.get("_source", "unknown"),
        "datadog": raw_dd.get("_source", "unknown"),
    }
    live_count = sum(1 for v in sources.values() if str(v).startswith("live"))

    return {
        "timestamp": raw.get("timestamp"),
        "confidence_score": confidence,
        "confidence_band": "Green" if confidence >= 80 else "Yellow" if confidence >= 60 else "At Risk" if confidence >= 40 else "Critical",
        "sources": sources,
        "live_source_count": live_count,
        "dora": {
            "overall": dora_overall,
            "deployment_frequency": {
                "value": deploy_freq_raw,
                "band": deploy_band,
                "color": status_color(deploy_band),
                "trend": trend_indicator(deploy_freq_per_day, 1.0 if b_gh.get("deployment_frequency") == "daily" else 1 / 7),
            },
            "lead_time": {
                "value": f"{lead_time_days}d",
                "value_raw": lead_time_days,
                "band": lt_band,
                "color": status_color(lt_band),
                "trend": trend_indicator(lead_time_days, b_gh.get("lead_time_days", lead_time_days)),
                "better": "lower",
            },
            "change_failure_rate": {
                "value": f"{cfr_pct}%",
                "value_raw": cfr_pct,
                "band": cfr_band,
                "color": status_color(cfr_band),
                "trend": trend_indicator(cfr_pct, b_pd.get("change_failure_rate_pct", cfr_pct)),
                "better": "lower",
            },
            "mttr": {
                "value": f"{mttr_hours:.1f}h",
                "value_raw": mttr_hours,
                "band": mttr_band,
                "color": status_color(mttr_band),
                "trend": trend_indicator(mttr_hours, b_pd.get("mttr_hours", mttr_hours)),
                "better": "lower",
            },
        },
        "delivery": {
            "sprint_velocity": {
                "value": sprint_velocity,
                "baseline": b_jira.get("sprint_velocity", sprint_velocity),
                "trend": trend_indicator(sprint_velocity, b_jira.get("sprint_velocity", sprint_velocity)),
            },
            "commitment_accuracy": {
                "value": commitment_pct,
                "value_display": f"{commitment_pct:.0f}%",
                "baseline": b_jira.get("commitment_accuracy", commitment_pct),
                "trend": trend_indicator(commitment_pct, b_jira.get("commitment_accuracy", commitment_pct)),
                "band": "Green" if commitment_pct >= 85 else "Yellow" if commitment_pct >= 70 else "Red",
            },
            "unplanned_work": {
                "value": unplanned_pct,
                "value_display": f"{unplanned_pct:.0f}%",
                "baseline": b_jira.get("unplanned_work_rate", unplanned_pct),
                "trend": trend_indicator(unplanned_pct, b_jira.get("unplanned_work_rate", unplanned_pct)),
                "band": "Green" if unplanned_pct <= 10 else "Yellow" if unplanned_pct <= 20 else "Red",
                "better": "lower",
            },
            "pr_cycle_time": {
                "value": f"{pr_cycle_hours:.0f}h",
                "value_raw": pr_cycle_hours,
                "baseline": b_gh.get("pr_cycle_time_hours", pr_cycle_hours),
                "trend": trend_indicator(pr_cycle_hours, b_gh.get("pr_cycle_time_hours", pr_cycle_hours)),
                "band": "Green" if pr_cycle_hours <= 12 else "Yellow" if pr_cycle_hours <= 24 else "Red",
                "better": "lower",
            },
        },
        "incidents": {
            "count_30d": incident_count,
            "mttr_hours": mttr_hours,
            "change_failure_rate_pct": cfr_pct,
            "trend_count": trend_indicator(incident_count, b_pd.get("incident_count_last_30d", incident_count)),
            "band": "Green" if incident_count == 0 else "Yellow" if incident_count <= 3 else "Red",
        },
        "space": {
            "source": "derived",
            "confidence": "Low",
            "note": "Proxies from DORA/delivery until 4+ weeks of 1:1 and retro memory exist",
            "overall": space_overall,
            "overall_band": _health_band(space_overall),
            "satisfaction": {"score": satisfaction, "band": _health_band(satisfaction), "proxy": "Inverse of unplanned work + incident load"},
            "performance": {"score": performance, "band": _health_band(performance), "proxy": "Sprint commitment accuracy"},
            "activity": {"score": activity, "band": _health_band(activity), "proxy": "Velocity vs 4-week baseline"},
            "communication": {"score": communication, "band": _health_band(communication), "proxy": "Inverse of PR cycle time"},
            "efficiency": {"score": efficiency, "band": _health_band(efficiency), "proxy": "Lead time + unplanned work"},
        },
        "roadmap": {
            "source": raw_jira.get("_source", "mock"),
            "confidence": "Low" if not str(raw_jira.get("_source", "")).startswith("live") else "Medium",
            "milestone": milestone_name,
            "status": milestone_status,
            "scope_inflation_pct": scope_inflation_pct,
            "commitments_hit_pct": commitments_hit_pct,
            "band": roadmap_band,
            "scope_flag": scope_inflation_pct > 10,
        },
        "integrations": {
            "slack": {"configured": bool(raw_slack.get("configured")), "team": raw_slack.get("team", ""), "channel_count": raw_slack.get("channel_count", 0)},
            "datadog": {"configured": bool(raw_dd.get("configured")), "monitor_count": raw_dd.get("monitor_count", 0)},
        },
    }
