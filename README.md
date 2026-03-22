# Delivery Latency & Customer Sentiment Analysis
**Establishing a data-driven criticality threshold to shift logistics teams from reactive support to proactive exception management**

![SQL](https://img.shields.io/badge/SQL-blue) ![Power BI](https://img.shields.io/badge/Power%20BI-yellow) ![DAX](https://img.shields.io/badge/DAX-orange) ![Domain: CX & Logistics](https://img.shields.io/badge/Domain-CX%20%26%20Logistics-purple)

---

## The Problem

E-commerce logistics teams typically respond to delivery complaints after negative reviews have already been posted. By that point, the damage to customer sentiment and lifetime value is done.

This analysis investigates the relationship between delivery latency and customer satisfaction to answer a more actionable question: **at what point does a delay stop being a minor inconvenience and start destroying trust?**

---

## Key Findings

> **The 3-Day Rule:** Customer sentiment remains stable up to 3 days post-estimated delivery. Cross that threshold, and the risk of a negative review spikes sharply.

| Metric | Finding |
|---|---|
| Criticality threshold | 3 days post-estimated delivery |
| Risk multiplier (4+ day delays) | **7.7x** more likely to trigger a 1-2 star review vs. on-time delivery |
| Share of total volume (4+ day delays) | Only **2.9%** of all deliveries |
| Operational implication | Targeting this 2.9% prevents the vast majority of negative sentiment with minimal overhead |

---

## Business Questions

- At what point does delivery latency begin to damage customer sentiment?
- How does review score distribution shift across different delay windows?
- Is the relationship between delay and dissatisfaction linear, or is there a specific inflection point?
- What proportion of total volume is driving the most severe sentiment damage?

---

## Dataset

- **Source:** [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (public, Kaggle)
- **Scope:** ~100,000 orders, 2016-2018
- **Integrity filters:** Outliers beyond +/-60 days removed to reflect standard operational cycles; deduplication applied throughout

---

## Methodology

### Data engineering (SQL / SQLite)
Engineered delay features by calculating the gap between actual delivery date and estimated delivery date at the order level. Rigorous deduplication and outlier handling (+/-60 day filter) ensured the analysis reflects normal operations rather than edge cases that would distort thresholds.

### Analytical modelling (DAX / Power BI)
Built a performance-optimised Star Schema model in Power BI. Custom DAX measures calculated segment-specific risk ratios and review score distributions across delay buckets, enabling clean comparisons across cohorts.

### Sensitivity analysis
Ran comparative analysis across 1-day, 3-day, and 5-day interval bucketing strategies to pinpoint the exact inflection point where customer sentiment transitions from stable to at-risk. The 3-day threshold was validated as consistent across all bucketing approaches.

---

## Tiered Intervention Framework

Based on the criticality threshold, a three-tier escalation model was designed for operational use:

| Tier | Delay Window | Status | Recommended Action |
|---|---|---|---|
| Monitor | 0-1 day late | Stable | Standard automated tracking; no intervention required |
| Warn | 2 days late | At-Risk | Trigger proactive customer notification to manage expectations |
| Resolve | 3+ days late | Critical | Immediate escalation to support for direct relationship intervention |

---

## Strategic Recommendations

**1. Implement the tiered alert system**
The Monitor, Warn, and Resolve framework can be operationalised directly from existing order tracking data. Starting with automated notifications at day 2 requires no new infrastructure.

**2. Focus resources on the 2.9%**
Severe delays (4+ days) are rare but disproportionately damaging. A targeted intervention programme for this cohort protects brand reputation without scaling support costs across the full order volume.

**3. Use this threshold as a contractual baseline**
The 3-day rule provides a defensible, data-backed standard for seller SLAs and logistics partner agreements, moving beyond anecdotal targets to evidence-based expectations.

---

## Project Roadmap

**Phase 1 - Predictive modelling**
Transition from historical analysis to a predictive classification model (e.g. Random Forest) to score individual shipment risk at the point of purchase, enabling pre-emptive intervention before delays occur.

**Phase 2 - Segmentation strategy**
Refine thresholds by seller, product category, and regional logistics provider to create hyper-localised delivery promises that reflect the operational reality of each supply chain node.

**Phase 3 - Economic modelling**
Establish a direct correlation between delivery-driven churn and net revenue to quantify the ROI of logistics improvements and build the business case for further investment.

---

## Files

| File | Description |
|---|---|
| `delivery_latency_analysis.sql` | SQL logic for delay feature engineering, deduplication, and outlier handling |
| `delivery_sentiment_model.pbix` | Power BI file containing Star Schema model and DAX measures |
| `latency_vs_sentiment.png` | Visual showing review score distribution across delay buckets |

## Skills Demonstrated

`SQL` `DAX` `Power BI` `Feature engineering` `Sensitivity analysis` `Data modelling` `Threshold identification` `Business communication`
