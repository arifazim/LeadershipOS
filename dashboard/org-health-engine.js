/**
 * Practical Engineering Intelligence engine.
 * Scored metrics are instrumentable. Controls/product are displayed, not averaged.
 */
(function (root, factory) {
  if (typeof module === "object" && module.exports) {
    module.exports = factory();
  } else {
    root.OrgHealthEngine = factory();
  }
})(typeof self !== "undefined" ? self : this, function () {
  "use strict";

  var MIN_TCO_USD = 100;
  var REALIZATION = 1;

  var BAND = {
    green: { key: "green", label: "Green", className: "green" },
    amber: { key: "amber", label: "Amber", className: "amber" },
    red: { key: "red", label: "Red", className: "red" },
    na: { key: "na", label: "n/a", className: "na" },
  };

  var PRACTICAL_RADAR = {
    fer: 40,
    innovation: 42,
    meetingLoad: 50,
    cfr: 95,
    der: 75,
    mttr: 87.5,
    goalHit: 85,
    estimateAccuracy: 80,
    aiRoi: 50,
  };

  var SCORED_IDS = [
    "fer",
    "innovation",
    "meetingLoad",
    "cfr",
    "der",
    "mttr",
    "goalHit",
    "estimateAccuracy",
    "aiRoi",
  ];

  var MATURITY = [
    { level: 1, key: "l1", label: "Level 1 Ad-Hoc", min: 0, max: 5 },
    { level: 2, key: "l2", label: "Level 2 Enabled", min: 6, max: 10 },
    { level: 3, key: "l3", label: "Level 3 Governed", min: 11, max: 14 },
    { level: 4, key: "l4", label: "Level 4 Intelligent", min: 15, max: 18 },
  ];

  var PRESETS = {
    l1: {
      id: "l1",
      label: "Level 1 Ad-Hoc",
      inputs: {
        activeDevHours: 6,
        totalCycleHours: 40,
        featurePrs: 12,
        totalPrs: 100,
        weeklySyncHoursPerDev: 12,
        timezoneHandoffCount: 8,
        failedDeployments: 12,
        totalDeployments: 40,
        productionDefects: 18,
        totalDefectsFound: 100,
        defectsAutoRemediated: 8,
        totalDefectsDetected: 100,
        totalDowntimeHours: 80,
        incidentCount: 5,
        aiPrsPassingGuardrails: 70,
        totalAiAssistedPrs: 100,
        teamSize: 40,
        avgAnnualComp: 165000,
        monthlyInferenceCost: 8000,
        monthlyLicenseFee: 30,
        remediationToilPct: 25,
        monthlyIncrementalRevenue: 5000,
        activeUsersNewFeature30d: 400,
        totalTargetUserBase: 10000,
        baselineCycleTimeHours: 24,
        currentCycleTimeHours: 28,
        surveyTimeSavedPct: 8,
        sprintGoalHitPct: 52,
        estimateAccuracyPct: 165,
      },
    },
    l2: {
      id: "l2",
      label: "Level 2 Enabled",
      inputs: {
        activeDevHours: 10,
        totalCycleHours: 40,
        featurePrs: 26,
        totalPrs: 100,
        weeklySyncHoursPerDev: 7,
        timezoneHandoffCount: 4,
        failedDeployments: 5,
        totalDeployments: 40,
        productionDefects: 8,
        totalDefectsFound: 100,
        defectsAutoRemediated: 18,
        totalDefectsDetected: 100,
        totalDowntimeHours: 18,
        incidentCount: 3,
        aiPrsPassingGuardrails: 85,
        totalAiAssistedPrs: 100,
        teamSize: 40,
        avgAnnualComp: 175000,
        monthlyInferenceCost: 14000,
        monthlyLicenseFee: 35,
        remediationToilPct: 16,
        monthlyIncrementalRevenue: 18000,
        activeUsersNewFeature30d: 900,
        totalTargetUserBase: 10000,
        baselineCycleTimeHours: 24,
        currentCycleTimeHours: 22,
        surveyTimeSavedPct: 18,
        sprintGoalHitPct: 74,
        estimateAccuracyPct: 122,
      },
    },
    l3: {
      id: "l3",
      label: "Level 3 Governed",
      inputs: {
        activeDevHours: 16,
        totalCycleHours: 40,
        featurePrs: 40,
        totalPrs: 100,
        weeklySyncHoursPerDev: 5,
        timezoneHandoffCount: 2,
        failedDeployments: 4,
        totalDeployments: 50,
        productionDefects: 5,
        totalDefectsFound: 100,
        defectsAutoRemediated: 30,
        totalDefectsDetected: 100,
        totalDowntimeHours: 8,
        incidentCount: 3,
        aiPrsPassingGuardrails: 96,
        totalAiAssistedPrs: 100,
        teamSize: 40,
        avgAnnualComp: 180000,
        monthlyInferenceCost: 20000,
        monthlyLicenseFee: 40,
        remediationToilPct: 11,
        monthlyIncrementalRevenue: 40000,
        activeUsersNewFeature30d: 1400,
        totalTargetUserBase: 10000,
        baselineCycleTimeHours: 24,
        currentCycleTimeHours: 18,
        surveyTimeSavedPct: 28,
        sprintGoalHitPct: 82,
        estimateAccuracyPct: 118,
      },
    },
    l4: {
      id: "l4",
      label: "Level 4 Intelligent",
      inputs: {
        activeDevHours: 18,
        totalCycleHours: 40,
        featurePrs: 42,
        totalPrs: 100,
        weeklySyncHoursPerDev: 3,
        timezoneHandoffCount: 1,
        failedDeployments: 2,
        totalDeployments: 50,
        productionDefects: 3,
        totalDefectsFound: 100,
        defectsAutoRemediated: 45,
        totalDefectsDetected: 100,
        totalDowntimeHours: 2.4,
        incidentCount: 3,
        aiPrsPassingGuardrails: 97,
        totalAiAssistedPrs: 100,
        teamSize: 40,
        avgAnnualComp: 185000,
        monthlyInferenceCost: 25000,
        monthlyLicenseFee: 40,
        remediationToilPct: 8,
        monthlyIncrementalRevenue: 55000,
        activeUsersNewFeature30d: 2200,
        totalTargetUserBase: 10000,
        baselineCycleTimeHours: 24,
        currentCycleTimeHours: 15.6,
        surveyTimeSavedPct: 35,
        sprintGoalHitPct: 90,
        estimateAccuracyPct: 102,
      },
    },
  };

  function clamp(n, lo, hi) {
    return Math.max(lo, Math.min(hi, n));
  }

  function safeDiv(num, den, fallback) {
    if (!isFinite(num) || !isFinite(den) || den === 0) return fallback;
    return num / den;
  }

  function higherBetter(value, greenMin, amberMin) {
    if (value >= greenMin) return BAND.green;
    if (value >= amberMin) return BAND.amber;
    return BAND.red;
  }

  function lowerBetter(value, greenMax, amberMax) {
    if (value <= greenMax) return BAND.green;
    if (value <= amberMax) return BAND.amber;
    return BAND.red;
  }

  function bandFer(v) {
    return higherBetter(v, 40, 20);
  }
  function bandInnovation(v) {
    if (v >= 30 && v <= 55) return BAND.green;
    if ((v >= 20 && v < 30) || (v > 55 && v <= 70)) return BAND.amber;
    return BAND.red;
  }
  function bandMeeting(v) {
    return lowerBetter(v, 5, 8);
  }
  function bandCfr(v) {
    return lowerBetter(v, 5, 15);
  }
  function bandDer(v) {
    return lowerBetter(v, 5, 10);
  }
  function bandArr(v) {
    return higherBetter(v, 35, 15);
  }
  function bandMttr(v) {
    return lowerBetter(v, 1, 24);
  }
  function bandAgcs(v) {
    return higherBetter(v, 95, 80);
  }
  function bandRoi(v) {
    return higherBetter(v, 1.5, 1.0);
  }
  function bandFar(v) {
    return higherBetter(v, 10, 5);
  }
  function bandGoalHit(v) {
    return higherBetter(v, 85, 70);
  }
  function bandEstimate(v) {
    var err = Math.abs(v - 100);
    if (err <= 10) return BAND.green;
    if (err <= 25) return BAND.amber;
    return BAND.red;
  }

  function bandPoints(band) {
    if (!band || band.key === "na" || band.key === "red") return 0;
    if (band.key === "green") return 2;
    if (band.key === "amber") return 1;
    return 0;
  }

  function observedSavedPct(i) {
    if (!(i.baselineCycleTimeHours > 0)) return null;
    var delta = (i.baselineCycleTimeHours - i.currentCycleTimeHours) / i.baselineCycleTimeHours;
    return clamp(delta * 100, 0, 80);
  }

  function computeRoi(i) {
    var monthlyEngCost = i.teamSize * (i.avgAnnualComp / 12);
    var observed = observedSavedPct(i);
    var savingsSource = observed == null ? "survey" : "observed";
    var savedPct = observed == null ? i.surveyTimeSavedPct : observed;
    var capacityValue = monthlyEngCost * (savedPct / 100) * REALIZATION;
    var remediationToilCost = monthlyEngCost * (i.remediationToilPct / 100);
    var licenseCost = i.teamSize * i.monthlyLicenseFee;
    var totalAiMonthlyCost = i.monthlyInferenceCost + licenseCost + remediationToilCost;
    var roi = totalAiMonthlyCost < MIN_TCO_USD
      ? null
      : safeDiv(capacityValue, totalAiMonthlyCost, 0);
    return {
      monthlyEngCost: monthlyEngCost,
      capacityValue: capacityValue,
      remediationToilCost: remediationToilCost,
      licenseCost: licenseCost,
      inferenceCost: i.monthlyInferenceCost,
      incrementalRevenue: i.monthlyIncrementalRevenue,
      totalAiMonthlyCost: totalAiMonthlyCost,
      savedPct: savedPct,
      observedSavedPct: observed,
      savingsSource: savingsSource,
      roi: roi,
      scored: savingsSource === "observed" && roi != null,
    };
  }

  function metric(id, name, value, unit, band, target, role, note) {
    return {
      id: id,
      name: name,
      value: value,
      unit: unit,
      band: band,
      target: target,
      role: role,
      note: note || "",
      scored: role === "scored" && band.key !== "na",
    };
  }

  function radarScore(metrics, econ) {
    var meet = metrics.meetingLoad.value;
    var est = metrics.estimateAccuracy.value;
    var estScore = clamp(100 - Math.abs(est - 100) * 2, 0, 100);
    var roi = econ.roi == null ? 0 : clamp((econ.roi / 3) * 100, 0, 100);
    return {
      fer: clamp(metrics.fer.value, 0, 100),
      innovation: clamp(metrics.innovation.value, 0, 100),
      meetingLoad: clamp(100 - meet * 10, 0, 100),
      cfr: clamp(100 - metrics.cfr.value, 0, 100),
      der: clamp(100 - metrics.der.value * 5, 0, 100),
      mttr: metrics.mttr.band.key === "na" ? 0 : clamp(100 - metrics.mttr.value * 4.17, 0, 100),
      goalHit: clamp(metrics.goalHit.value, 0, 100),
      estimateAccuracy: estScore,
      aiRoi: roi,
    };
  }

  function maturityFromPoints(points) {
    var i;
    var maxPoints = SCORED_IDS.length * 2;
    for (i = 0; i < MATURITY.length; i++) {
      if (points >= MATURITY[i].min && points <= MATURITY[i].max) {
        return Object.assign({ points: points, maxPoints: maxPoints }, MATURITY[i]);
      }
    }
    if (points > MATURITY[3].max) {
      return Object.assign({ points: points, maxPoints: maxPoints }, MATURITY[3]);
    }
    return Object.assign({ points: points, maxPoints: maxPoints }, MATURITY[0]);
  }

  function compute(raw) {
    var i = Object.assign({}, PRESETS.l2.inputs, raw || {});
    var fer = i.totalCycleHours === 0 ? 0 : (i.activeDevHours / i.totalCycleHours) * 100;
    var innovation = i.totalPrs === 0 ? null : (i.featurePrs / i.totalPrs) * 100;
    var meeting = i.weeklySyncHoursPerDev;
    var cfr = i.totalDeployments === 0 ? 0 : (i.failedDeployments / i.totalDeployments) * 100;
    var der = i.totalDefectsFound === 0 ? 0 : (i.productionDefects / i.totalDefectsFound) * 100;
    var arr = i.totalDefectsDetected === 0 ? 0 : (i.defectsAutoRemediated / i.totalDefectsDetected) * 100;
    var mttr = i.incidentCount === 0 ? null : i.totalDowntimeHours / i.incidentCount;
    var agcs = i.totalAiAssistedPrs === 0 ? null : (i.aiPrsPassingGuardrails / i.totalAiAssistedPrs) * 100;
    var far = i.totalTargetUserBase === 0 ? 0 : (i.activeUsersNewFeature30d / i.totalTargetUserBase) * 100;
    var econ = computeRoi(i);

    var roiBand = BAND.na;
    if (econ.roi != null) {
      roiBand = bandRoi(econ.roi);
      if (econ.savingsSource === "survey" && roiBand.key === "green") roiBand = BAND.amber;
    }

    var metrics = {
      fer: metric("fer", "Flow Efficiency Ratio", fer, "%", bandFer(fer), "≥ 40% (knowledge work)", "scored",
        "Touch time / calendar cycle. 70% is factory-grade; 40% is a strong software target."),
      innovation: metric(
        "innovation",
        "Innovation ratio",
        innovation == null ? 0 : innovation,
        "%",
        innovation == null ? BAND.na : bandInnovation(innovation),
        "30–55% of PRs on new capability",
        "scored",
        "DX Core 4 impact. Too high means no maintenance; too low means the org is only firefighting."
      ),
      meetingLoad: metric("meetingLoad", "Meeting load", meeting, "h", bandMeeting(meeting), "≤ 5 h / eng / week", "scored",
        "Timezone handoffs shown as context only — not multiplied into an index."),
      cfr: metric("cfr", "Change Failure Rate", cfr, "%", bandCfr(cfr), "≤ 5% Elite (DORA)", "scored",
        "Failed = outage or hotfix after deploy. Aligned with v0.6 DORA Elite, not a 15% “green.”"),
      der: metric("der", "Defect Escape Rate", der, "%", bandDer(der), "≤ 5%", "scored",
        "Only valid with a written prod-vs-caught taxonomy. Otherwise use % fix PRs."),
      arr: metric("arr", "Automated Remediation Rate", arr, "%", bandArr(arr), "Control — not a health grade", "control",
        "Policy signal. Lint auto-fixes must not count as production remediation."),
      mttr: metric(
        "mttr",
        "Mean Time to Recovery",
        mttr == null ? 0 : mttr,
        "h",
        mttr == null ? BAND.na : bandMttr(mttr),
        "≤ 1 h Elite; ≤ 24 h High (DORA)",
        "scored",
        "n/a when incident count is 0 — that is not Elite."
      ),
      agcs: metric(
        "agcs",
        "AI Governance Compliance",
        agcs == null ? 0 : agcs,
        "%",
        agcs == null ? BAND.na : bandAgcs(agcs),
        "≥ 95% SLO; n/a if no AI PRs",
        "control",
        "Pass rate of real gates (SCA, secrets, arch). Not in the health total."
      ),
      aiRoi: metric(
        "aiRoi",
        "AI efficiency ROI",
        econ.roi == null ? 0 : econ.roi,
        "×",
        econ.scored || (econ.roi != null && econ.savingsSource === "survey") ? roiBand : BAND.na,
        "≥ 1.50× from observed cycle-time delta",
        econ.scored ? "scored" : "control",
        econ.savingsSource === "survey"
          ? "Survey time-saved cannot go Green. Add a pre-AI cycle-time baseline."
          : "Capacity value only. Incremental revenue is shown separately and is not in this ratio."
      ),
      far: metric("far", "Feature adoption (30d)", far, "%", bandFar(far), "Feature-specific; 10% = weak traction", "product",
        "Not an engineering KPI. Prefer North Star + retention on the operational dashboard."),
      goalHit: metric("goalHit", "Sprint / milestone goal hit", i.sprintGoalHitPct, "%", bandGoalHit(i.sprintGoalHitPct),
        "≥ 85%", "scored", "From prediction_confidence.md. This is the forecast card."),
      estimateAccuracy: metric(
        "estimateAccuracy",
        "Estimate accuracy",
        i.estimateAccuracyPct,
        "%",
        bandEstimate(i.estimateAccuracyPct),
        "90–110% of actual ÷ estimate",
        "scored",
        ">100% means under-estimation (optimism). <100% means padding."
      ),
    };

    if (!econ.scored) metrics.aiRoi.scored = false;

    var points = 0;
    SCORED_IDS.forEach(function (id) {
      if (id === "aiRoi" && !econ.scored) return;
      points += bandPoints(metrics[id].band);
    });

    var alerts = [];
    if (metrics.fer.value < 20 && metrics.cfr.value > 15) {
      alerts.push({
        id: "velocity-trap",
        title: "Throughput vs stability",
        message: "Flow efficiency is in the knowledge-work red band and CFR is above 15%. Fix wait states and release gates before adding AI volume.",
      });
    }
    if (metrics.der.value > 10) {
      alerts.push({
        id: "quality-escape",
        title: "Defects escaping to production",
        message: "More than 10% of found defects are reaching production. Do not treat this as an AI-ROI problem until the defect taxonomy is clean.",
      });
    }
    if (econ.scored && econ.roi < 1) {
      alerts.push({
        id: "negative-yield",
        title: "Negative AI efficiency yield",
        message: "Observed cycle-time capacity value is below AI TCO (licenses + inference + toil). Cut toil or inference before buying more seats.",
      });
    }
    if (mttr != null && mttr > 24 && arr < 15) {
      alerts.push({
        id: "black-box",
        title: "Slow recovery with weak auto-remediation",
        message: "Restore time is worse than DORA High and almost nothing is auto-remediated. Confirm with AI-PR revert rate before blaming comprehension.",
      });
    }
    if (metrics.fer.value >= 40 && metrics.far.value < 10) {
      alerts.push({
        id: "no-adoption",
        title: "Delivery without traction",
        message: "Flow is in the practical green band but 30-day feature adoption is under 10%. Stop accelerating; check North Star and the target-user denominator.",
      });
    }

    return {
      inputs: i,
      metrics: metrics,
      economics: econ,
      alerts: alerts,
      maturity: maturityFromPoints(points),
      radar: radarScore(metrics, econ),
      goldRadar: PRACTICAL_RADAR,
      scoredIds: SCORED_IDS,
      points: points,
    };
  }

  return {
    BAND: BAND,
    GOLD_RADAR: PRACTICAL_RADAR,
    PRESETS: PRESETS,
    SCORED_IDS: SCORED_IDS,
    MIN_TCO_USD: MIN_TCO_USD,
    compute: compute,
    bands: {
      fer: bandFer,
      innovation: bandInnovation,
      meetingLoad: bandMeeting,
      cfr: bandCfr,
      der: bandDer,
      arr: bandArr,
      mttr: bandMttr,
      agcs: bandAgcs,
      aiRoi: bandRoi,
      far: bandFar,
      goalHit: bandGoalHit,
      estimateAccuracy: bandEstimate,
    },
  };
});
