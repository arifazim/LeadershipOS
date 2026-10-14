#!/usr/bin/env node
"use strict";

const assert = require("assert");
const path = require("path");
const E = require(path.join(__dirname, "..", "dashboard", "org-health-engine.js"));

function almost(actual, expected, eps) {
  eps = eps || 0.05;
  assert.ok(
    Math.abs(actual - expected) <= eps,
    "expected " + expected + " got " + actual
  );
}

function testFormulas() {
  const m = E.compute({
    activeDevHours: 16,
    totalCycleHours: 40,
    featurePrs: 40,
    totalPrs: 100,
    weeklySyncHoursPerDev: 4,
    failedDeployments: 2,
    totalDeployments: 50,
    productionDefects: 4,
    totalDefectsFound: 80,
    defectsAutoRemediated: 10,
    totalDefectsDetected: 40,
    totalDowntimeHours: 2,
    incidentCount: 2,
    aiPrsPassingGuardrails: 96,
    totalAiAssistedPrs: 100,
    teamSize: 10,
    avgAnnualComp: 120000,
    monthlyInferenceCost: 1000,
    monthlyLicenseFee: 40,
    remediationToilPct: 10,
    monthlyIncrementalRevenue: 50000,
    activeUsersNewFeature30d: 80,
    totalTargetUserBase: 1000,
    baselineCycleTimeHours: 20,
    currentCycleTimeHours: 16,
    surveyTimeSavedPct: 90,
    sprintGoalHitPct: 88,
    estimateAccuracyPct: 105,
  });

  almost(m.metrics.fer.value, 40);
  almost(m.metrics.innovation.value, 40);
  almost(m.metrics.meetingLoad.value, 4);
  almost(m.metrics.cfr.value, 4);
  almost(m.metrics.der.value, 5);
  almost(m.metrics.arr.value, 25);
  almost(m.metrics.mttr.value, 1);
  almost(m.metrics.agcs.value, 96);
  almost(m.metrics.far.value, 8);
  almost(m.economics.observedSavedPct, 20);
  assert.strictEqual(m.economics.savingsSource, "observed");
  const monthlyEng = 10 * (120000 / 12);
  const capacity = monthlyEng * 0.2;
  const toil = monthlyEng * 0.1;
  const tco = 1000 + 400 + toil;
  almost(m.economics.capacityValue, capacity);
  almost(m.economics.roi, capacity / tco);
  assert.ok(m.economics.roi !== (capacity + 50000) / tco, "revenue must not sit in ROI numerator");
}

function testBands() {
  assert.strictEqual(E.bands.fer(40).key, "green");
  assert.strictEqual(E.bands.fer(39.9).key, "amber");
  assert.strictEqual(E.bands.fer(19.9).key, "red");
  assert.strictEqual(E.bands.cfr(5).key, "green");
  assert.strictEqual(E.bands.cfr(5.1).key, "amber");
  assert.strictEqual(E.bands.cfr(15.1).key, "red");
  assert.strictEqual(E.bands.mttr(1).key, "green");
  assert.strictEqual(E.bands.mttr(24).key, "amber");
  assert.strictEqual(E.bands.mttr(24.1).key, "red");
  assert.strictEqual(E.bands.innovation(42).key, "green");
  assert.strictEqual(E.bands.innovation(12).key, "red");
  assert.strictEqual(E.bands.innovation(80).key, "red");
  assert.strictEqual(E.bands.meetingLoad(5).key, "green");
  assert.strictEqual(E.bands.goalHit(85).key, "green");
  assert.strictEqual(E.bands.estimateAccuracy(90).key, "green");
  assert.strictEqual(E.bands.estimateAccuracy(111).key, "amber");
  assert.strictEqual(E.bands.estimateAccuracy(130).key, "red");
}

function testPracticalGuards() {
  const noIncidents = E.compute(Object.assign({}, E.PRESETS.l4.inputs, { incidentCount: 0 }));
  assert.strictEqual(noIncidents.metrics.mttr.band.key, "na");

  const noAiPrs = E.compute(Object.assign({}, E.PRESETS.l4.inputs, { totalAiAssistedPrs: 0 }));
  assert.strictEqual(noAiPrs.metrics.agcs.band.key, "na");

  const surveyOnly = E.compute(Object.assign({}, E.PRESETS.l4.inputs, {
    baselineCycleTimeHours: 0,
    currentCycleTimeHours: 0,
    surveyTimeSavedPct: 80,
  }));
  assert.strictEqual(surveyOnly.economics.savingsSource, "survey");
  assert.notStrictEqual(surveyOnly.metrics.aiRoi.band.key, "green");
  assert.strictEqual(surveyOnly.metrics.aiRoi.role, "control");

  const tinyTco = E.compute(Object.assign({}, E.PRESETS.l4.inputs, {
    monthlyInferenceCost: 0,
    monthlyLicenseFee: 0,
    remediationToilPct: 0,
  }));
  assert.strictEqual(tinyTco.economics.roi, null);

  assert.ok(!E.compute(E.PRESETS.l4.inputs).metrics.arr.scored);
  assert.ok(!E.compute(E.PRESETS.l4.inputs).metrics.far.scored);
  assert.ok(!E.compute(E.PRESETS.l4.inputs).metrics.agcs.scored);
}

function testAlerts() {
  const trap = E.compute(Object.assign({}, E.PRESETS.l4.inputs, {
    activeDevHours: 4,
    totalCycleHours: 40,
    failedDeployments: 10,
    totalDeployments: 40,
  }));
  assert.ok(trap.alerts.some((a) => a.id === "velocity-trap"));

  const escape = E.compute(Object.assign({}, E.PRESETS.l4.inputs, {
    productionDefects: 20,
    totalDefectsFound: 100,
  }));
  assert.ok(escape.alerts.some((a) => a.id === "quality-escape"));
  assert.ok(!escape.alerts.some((a) => a.id === "tech-debt-spiral"));

  const ghost = E.compute(Object.assign({}, E.PRESETS.l4.inputs, {
    activeUsersNewFeature30d: 50,
    totalTargetUserBase: 10000,
  }));
  assert.ok(ghost.alerts.some((a) => a.id === "no-adoption"));
}

function testPresets() {
  assert.strictEqual(E.compute(E.PRESETS.l1.inputs).maturity.level, 1);
  assert.strictEqual(E.compute(E.PRESETS.l2.inputs).maturity.level, 2);
  assert.strictEqual(E.compute(E.PRESETS.l3.inputs).maturity.level, 3);
  assert.strictEqual(E.compute(E.PRESETS.l4.inputs).maturity.level, 4);
}

function testNoDlfAov() {
  const m = E.compute(E.PRESETS.l4.inputs);
  assert.ok(!m.metrics.dlf);
  assert.ok(!m.metrics.aov);
}

testFormulas();
testBands();
testPracticalGuards();
testAlerts();
testPresets();
testNoDlfAov();
console.log("org-health-engine: ok");
