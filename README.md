# credit-risk-portfolio-analysis
'End-to-end credit risk analysis on $435.7M loan portfolio | SQL + Power BI | 9 differentiated insights | McKinsey-style strategy deck
Credit Portfolio Intelligence — Strategic Risk & Profitability Analysis

> **Tools:** SQL Server · Power BI · Excel · DAX  
> **Dataset:** 38,576 loans · $435.7M funded · 24 variables  
> **Approach:** Diagnostic → segmentation → strategy recommendations  

---

## The Business Problem

A retail bank's credit portfolio generates a **headline net return of 8.56%** — but beneath
that number, **$28.2M in capital is permanently destroyed annually** by charge-off losses
that standard portfolio reporting does not isolate. The bank's credit committee lacks
the analytical infrastructure to identify which borrower segments, products, and
geographies are driving this destruction — and which are genuinely profitable.

**This is not a reporting problem. It is a capital allocation and credit strategy problem.**

---

## Objective

Build an end-to-end credit risk diagnostic that:
1. Quantifies the true economic return after default losses (not gross return)
2. Isolates the specific segments, products, and geographies driving defaults
3. Introduces a novel derived metric (Loan-to-Income ratio) as a predictive screen
4. Delivers three policy recommendations with quantified impact

---

## Dashboard — Three Pages

### Page 1: Executive Command Centre
![Executive Dashboard](05_screenshots/page1_executive_command_centre.png)
*Six KPI cards · Loan status donut chart · Default loss analysis table*

### Page 2: Risk Diagnostic Engine
![Risk Dashboard](05_screenshots/page2_risk_diagnostic_engine.png)
*Default rate by purpose, grade, DTI, geography · Employment length myth · Interactive slicers*

### Page 3: Profitability Lens
![Profitability Dashboard](05_screenshots/page3_profitability_lens.png)
*Net return by segment · Grade × Purpose heatmap · LTI cliff · Value destroyers*

---

## Key Insights (9 Non-Obvious Findings)

| # | Insight | Finding | Impact |
|---|---------|---------|--------|
| 1 | Grade Pricing | Net return rises A→G despite higher defaults | Pricing model works but portfolio is overweight Grade B |
| 2 | DTI Escalation | Every +5pp DTI adds ~1pp default rate | 36% relative default increase from 0–5% to 20–25% DTI |
| 3 | Verification Paradox | Verified borrowers default 3.46pp MORE | Verification tracks loan size, not creditworthiness |
| 4 | Small Biz Crisis | 60-month SB loans generate –4.42% net return | Only confirmed loss product in portfolio |
| 5 | Purpose×Term | 60-month term doubles default rate across all purposes | 60-month is a financial stress signal, not a term choice |
| 6 | Employment Myth | 10+ year employees default at 14.90% — HIGHEST rate | Employment length is a flat, unreliable predictor |
| 7 | LTI Cliff | LTI >30% of income → 18.74% default (+74% vs baseline) | Novel derived metric. Strongest actionable predictor found |
| 8 | Geo Concentration | California = 18% of portfolio at 15.33% default | Single-state concentration risk requiring cap |
| 9 | Value Destroyers | 5 grade-purpose combos generate negative returns | $396K destroyed on $16M funded |

---

## Strategic Recommendations

| Priority | Recommendation | Mechanism | Est. Annual Impact |
|----------|---------------|-----------|-------------------|
| IMMEDIATE | Suspend 60-month small business loans | Loss product: –4.42% net return | +~$450K recovery |
| 30 DAYS | Implement LTI hard cap at 35% | New derived metric in origination workflow | +$2–4M risk reduction |
| 60–90 DAYS | Redesign small business scorecard | Purpose-specific model, min. 2yrs in business | +$1–2M recovery |

---

## Tools & Methodology

| Layer | Tool | Purpose |
|-------|------|---------|
| Data Storage | SQL Server (MSSQL) | Raw data ingestion, 9 KPI queries, LTI derived column |
| Visualisation | Power BI | 3-page interactive dashboard, 7 custom DAX measures |
| Validation | Excel | Cross-validation of all SQL outputs, scenario stress-testing |
| Presentation | PowerPoint | 12-slide strategy deck |

---
