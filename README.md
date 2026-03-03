# Project: Operationalising Delivery Latency & Customer Sentiment
## Executive Summary
This analysis investigates the critical relationship between delivery latency and customer satisfaction in an e-commerce ecosystem. By moving beyond descriptive reporting, this project establishes a definitive "Criticality Threshold" at 3 days. The findings provide a data-driven framework for logistics teams to transition from reactive support to proactive exception management, protecting brand reputation and customer lifetime value.
## Business Impact & Results
•	The 3-Day Rule: Identified that customer sentiment remains stable up to 3 days post-estimated delivery. Once this threshold is crossed, the risk of a negative review spikes.

•	Risk Quantification: Deliveries delayed by 4+ days are 7.7x more likely to trigger a 1–2 star review compared to on-time deliveries.

•	High-Leverage Efficiency: Severe delays (4+ days) represent only 2.9% of total volume. By focusing operational resources on this small subset, the business can prevent the vast majority of negative sentiment with minimal overhead.
## Strategic Recommendations
To shift from reactive troubleshooting to proactive logistics, the following tiered strategy is proposed:
1.	Monitor (0–1 day late): Standard automated tracking; no intervention required.
2.	Warn (2 days late): The "At-Risk" phase. Trigger an automated, proactive notification to the customer to set expectations.
3.	Resolve (3+ days late): The "Critical" phase. Immediate escalation to support for direct intervention to preserve the customer relationship.
## Methodology & Technical Approach
•	Data Engineering (SQL/SQLite): Engineered complex delay features and managed data integrity through rigorous deduplication and outlier handling (±60 days) to ensure analysis reflects standard operational cycles.

•	Analytical Modeling (DAX/Power BI): Developed a performance-optimised Star Schema model. Custom DAX measures were implemented to calculate segment-specific risk ratios and performance trends.

•	Sensitivity Analysis: Performed comparative analysis across multiple time buckets (1, 3, and 5-day intervals) to pinpoint the exact inflection point where customer sentiment declines.
## Project Roadmap
•	Phase 1 (Predictive Modeling): Transitioning from historical analysis to a predictive classification model (e.g., Random Forest) to score shipment risk at the time of purchase.

•	Phase 2 (Segmentation Strategy): Refining thresholds by seller, product category, and regional logistics providers to create hyper-localised delivery promises.

•	Phase 3 (Economic Modeling): Establishing a direct correlation between delivery-driven churn and net revenue to calculate the ROI of logistics process improvements.
