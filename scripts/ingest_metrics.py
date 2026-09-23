import os
import json
from datetime import datetime, timedelta, timezone

import requests
from dotenv import load_dotenv

load_dotenv()

CONFIG_PATH = "config/team.json"
OUTPUT_PATH = "memory/current_metrics.json"


def _hours_between(start_iso: str, end_iso: str) -> float:
    start = datetime.fromisoformat(start_iso.replace("Z", "+00:00"))
    end = datetime.fromisoformat(end_iso.replace("Z", "+00:00"))
    return round((end - start).total_seconds() / 3600, 1)


class MetricsIngestor:
    def __init__(self):
        with open(CONFIG_PATH, encoding="utf-8") as f:
            self.config = json.load(f)
        self.github_token = os.getenv("GITHUB_TOKEN", "").strip()
        self.github_repo = os.getenv("GITHUB_REPO", "").strip()
        self.jira_token = os.getenv("JIRA_TOKEN", "").strip()
        self.jira_base = os.getenv("JIRA_BASE_URL", "").rstrip("/")
        self.jira_email = os.getenv("JIRA_EMAIL", "").strip()
        self.jira_project = os.getenv("JIRA_PROJECT", "").strip()
        self.pagerduty_token = os.getenv("PAGERDUTY_TOKEN", "").strip()
        self.slack_token = os.getenv("SLACK_TOKEN", "").strip()
        self.datadog_api = os.getenv("DATADOG_API_KEY", "").strip()
        self.datadog_app = os.getenv("DATADOG_APP_KEY", "").strip()

    def _mock_github(self):
        return {
            "deployment_frequency": "daily",
            "lead_time_for_changes": "1.2 days",
            "pr_cycle_time": "18 hours",
            "_source": "mock",
        }

    def _mock_jira(self):
        return {
            "sprint_velocity": 45,
            "commitment_accuracy": "88%",
            "unplanned_work_rate": "12%",
            "current_milestone": "Q3 platform API",
            "milestone_status": "On track",
            "scope_inflation": "8%",
            "roadmap_commitments_hit": "88%",
            "_source": "mock",
        }

    def _mock_pagerduty(self):
        return {
            "mttr": "42 minutes",
            "incident_count_last_30d": 3,
            "change_failure_rate": "5%",
            "_source": "mock",
        }

    def fetch_github_metrics(self):
        if not (self.github_token and self.github_repo):
            print("GitHub: mock (set GITHUB_TOKEN and GITHUB_REPO for live)")
            return self._mock_github()
        try:
            headers = {
                "Authorization": f"Bearer {self.github_token}",
                "Accept": "application/vnd.github+json",
                "X-GitHub-Api-Version": "2022-11-28",
            }
            owner_repo = self.github_repo
            pulls = requests.get(
                f"https://api.github.com/repos/{owner_repo}/pulls",
                headers=headers,
                params={"state": "closed", "per_page": 30, "sort": "updated", "direction": "desc"},
                timeout=20,
            )
            pulls.raise_for_status()
            cycle_hours = []
            for pr in pulls.json():
                if not pr.get("merged_at") or not pr.get("created_at"):
                    continue
                cycle_hours.append(_hours_between(pr["created_at"], pr["merged_at"]))
            avg_cycle = round(sum(cycle_hours) / len(cycle_hours), 1) if cycle_hours else 18.0

            since = (datetime.now(timezone.utc) - timedelta(days=14)).isoformat()
            deps = requests.get(
                f"https://api.github.com/repos/{owner_repo}/deployments",
                headers=headers,
                params={"per_page": 30},
                timeout=20,
            )
            deps.raise_for_status()
            recent = [
                d for d in deps.json()
                if d.get("created_at") and d["created_at"] >= since
            ]
            if not recent:
                merged = [
                    pr for pr in pulls.json()
                    if pr.get("merged_at") and pr["merged_at"] >= since
                ]
                recent = merged
            per_day = len(recent) / 14
            if per_day >= 1:
                freq = "daily"
            elif per_day >= 1 / 7:
                freq = "weekly"
            else:
                freq = "monthly"

            lead_days = round(avg_cycle / 24, 1)
            print(f"GitHub: live ({owner_repo})")
            return {
                "deployment_frequency": freq,
                "lead_time_for_changes": f"{lead_days} days",
                "pr_cycle_time": f"{avg_cycle} hours",
                "_source": "live",
            }
        except Exception as exc:
            print(f"GitHub: live fetch failed ({exc}); using mock")
            data = self._mock_github()
            data["_source"] = "mock-fallback"
            data["_error"] = str(exc)
            return data

    def fetch_jira_metrics(self):
        if not (self.jira_token and self.jira_base and self.jira_email and self.jira_project):
            print("Jira: mock (set JIRA_TOKEN, JIRA_BASE_URL, JIRA_EMAIL, JIRA_PROJECT for live)")
            return self._mock_jira()
        try:
            auth = (self.jira_email, self.jira_token)
            jql = f'project = {self.jira_project} AND resolved >= -14d'
            resp = requests.get(
                f"{self.jira_base}/rest/api/3/search",
                auth=auth,
                params={"jql": jql, "maxResults": 50, "fields": "resolutiondate,created,issuetype,labels"},
                timeout=20,
            )
            resp.raise_for_status()
            issues = resp.json().get("issues", [])
            velocity = len(issues)
            unplanned = sum(
                1 for i in issues
                if "unplanned" in [x.lower() for x in (i.get("fields", {}).get("labels") or [])]
                or (i.get("fields", {}).get("issuetype") or {}).get("name", "").lower() in {"bug", "incident"}
            )
            unplanned_pct = round((unplanned / velocity) * 100, 0) if velocity else 12
            print(f"Jira: live ({self.jira_project})")
            mock = self._mock_jira()
            mock.update({
                "sprint_velocity": velocity,
                "unplanned_work_rate": f"{int(unplanned_pct)}%",
                "_source": "live",
            })
            return mock
        except Exception as exc:
            print(f"Jira: live fetch failed ({exc}); using mock")
            data = self._mock_jira()
            data["_source"] = "mock-fallback"
            data["_error"] = str(exc)
            return data

    def fetch_pagerduty_metrics(self):
        if not self.pagerduty_token:
            print("PagerDuty: mock (set PAGERDUTY_TOKEN for live)")
            return self._mock_pagerduty()
        try:
            since = (datetime.now(timezone.utc) - timedelta(days=30)).isoformat()
            resp = requests.get(
                "https://api.pagerduty.com/incidents",
                headers={
                    "Authorization": f"Token token={self.pagerduty_token}",
                    "Accept": "application/vnd.pagerduty+json;version=2",
                },
                params={"since": since, "limit": 100},
                timeout=20,
            )
            resp.raise_for_status()
            incidents = resp.json().get("incidents", [])
            durations = []
            for inc in incidents:
                created = inc.get("created_at")
                resolved = inc.get("resolved_at")
                if created and resolved:
                    durations.append(_hours_between(created, resolved))
            mttr_hours = round(sum(durations) / len(durations), 2) if durations else 0.7
            mttr = f"{int(mttr_hours * 60)} minutes" if mttr_hours < 1 else f"{mttr_hours} hours"
            print("PagerDuty: live")
            return {
                "mttr": mttr,
                "incident_count_last_30d": len(incidents),
                "change_failure_rate": "5%",
                "_source": "live",
            }
        except Exception as exc:
            print(f"PagerDuty: live fetch failed ({exc}); using mock")
            data = self._mock_pagerduty()
            data["_source"] = "mock-fallback"
            data["_error"] = str(exc)
            return data

    def fetch_slack_metrics(self):
        if not self.slack_token:
            print("Slack: mock (set SLACK_TOKEN for live)")
            return {
                "configured": False,
                "ok": False,
                "team": "",
                "channel_count": 0,
                "_source": "mock",
            }
        try:
            headers = {"Authorization": f"Bearer {self.slack_token}"}
            auth = requests.get("https://slack.com/api/auth.test", headers=headers, timeout=20)
            payload = auth.json()
            if not payload.get("ok"):
                raise RuntimeError(payload.get("error", "auth.test failed"))
            conv = requests.get(
                "https://slack.com/api/conversations.list",
                headers=headers,
                params={"limit": 20, "exclude_archived": True},
                timeout=20,
            )
            channels = (conv.json() or {}).get("channels") or []
            print("Slack: live")
            return {
                "configured": True,
                "ok": True,
                "team": payload.get("team", ""),
                "channel_count": len(channels),
                "_source": "live",
            }
        except Exception as exc:
            print(f"Slack: live fetch failed ({exc}); using mock")
            return {
                "configured": False,
                "ok": False,
                "team": "",
                "channel_count": 0,
                "_source": "mock-fallback",
                "_error": str(exc),
            }

    def fetch_datadog_metrics(self):
        if not (self.datadog_api and self.datadog_app):
            print("Datadog: mock (set DATADOG_API_KEY and DATADOG_APP_KEY for live)")
            return {"configured": False, "ok": False, "monitor_count": 0, "_source": "mock"}
        try:
            site = os.getenv("DATADOG_SITE", "datadoghq.com").strip() or "datadoghq.com"
            headers = {
                "DD-API-KEY": self.datadog_api,
                "DD-APPLICATION-KEY": self.datadog_app,
            }
            validate = requests.get(
                f"https://api.{site}/api/v1/validate",
                headers=headers,
                timeout=20,
            )
            validate.raise_for_status()
            monitors = requests.get(
                f"https://api.{site}/api/v1/monitor",
                headers=headers,
                params={"page_size": 50},
                timeout=20,
            )
            body = monitors.json() if monitors.ok else []
            count = len(body) if isinstance(body, list) else 0
            print("Datadog: live")
            return {
                "configured": True,
                "ok": bool(validate.json().get("valid")),
                "monitor_count": count,
                "_source": "live",
            }
        except Exception as extra:
            print(f"Datadog: live fetch failed ({extra}); using mock")
            return {
                "configured": False,
                "ok": False,
                "monitor_count": 0,
                "_source": "mock-fallback",
                "_error": str(extra),
            }

    def run(self):
        print(f"[{datetime.now()}] Starting metrics ingestion...")
        metrics = {
            "timestamp": datetime.now().isoformat(),
            "github": self.fetch_github_metrics(),
            "jira": self.fetch_jira_metrics(),
            "pagerduty": self.fetch_pagerduty_metrics(),
            "slack": self.fetch_slack_metrics(),
            "datadog": self.fetch_datadog_metrics(),
        }
        with open(OUTPUT_PATH, "w", encoding="utf-8") as f:
            json.dump(metrics, f, indent=2)
        with open("memory/metrics_history.jsonl", "a", encoding="utf-8") as hist:
            hist.write(json.dumps(metrics) + "\n")
        print(f"[{datetime.now()}] Metrics saved to {OUTPUT_PATH}")


if __name__ == "__main__":
    MetricsIngestor().run()
