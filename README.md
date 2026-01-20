# Delivery Delays & Customer Satisfaction Analysis

## Project Overview

This project analyses how delivery delays affect customer satisfaction in an e-commerce marketplace. Using order and customer review data, I compared review outcomes across different delivery delay groups to identify the point at which delays begin to significantly harm customer ratings.

The analysis shows that while most orders are delivered on time or only slightly late, a small proportion of severely late deliveries accounts for a disproportionate share of 1–2 star reviews. The dashboard focuses on highlighting this imbalance between delivery volume and customer impact to support better operational decision-making.

The key takeaway is that preventing severe delivery delays would deliver the greatest improvement in customer satisfaction.

## Executive Summary

Severe delivery delays disproportionately drive negative customer reviews.

Although most orders arrive on time or only slightly late, deliveries that arrive more than 3 days late account for a much higher share of 1–2 star ratings. This analysis identifies the delay threshold at which customer satisfaction drops sharply and highlights where operational focus would have the greatest impact.

## Business Questions

When do delivery delays begin to significantly harm customer satisfaction?

How common are severe delivery delays compared to their impact on reviews?

Where should the business focus to improve customer ratings most effectively?

## Data

This analysis uses the Brazilian E-Commerce Public Dataset (Olist) from Kaggle.

Key tables used:

Orders

Order Reviews

(Data was joined and prepared to create a single analysis-ready dataset.)

## Tools Used

SQLite & SQL – data cleaning, joins, and feature creation

Power BI – KPI design, segmentation, and executive-level dashboards

Data was prepared in SQLite and exported as CSV files for visualisation in Power BI.

## Analytical Approach

Compared actual delivery dates with estimated delivery dates

Calculated delivery delay in days

Classified deliveries into business-friendly groups:

Acceptable: On time to 3 days late

High risk: 4+ days late

Measured customer satisfaction using:

Average review score

Share of low ratings (1–2 stars)

Designed KPIs to highlight both scale (order volume) and impact (negative reviews)

## Key Insights

Customers are generally satisfied when deliveries arrive on time or up to 3 days late.

Once deliveries exceed 3 days late, customer satisfaction drops sharply.

Although severely late orders represent a small share of total orders, they generate a disproportionate share of low reviews.

## Why This Matters

Not all delivery delays cause the same level of damage.
A small number of severely late deliveries can significantly harm customer trust and overall brand perception.

Preventing these high-risk delays offers a much higher return on effort than marginally improving already acceptable delivery times.

## Recommendations

Prevent deliveries from exceeding 3 days late, as this is where customer satisfaction declines sharply.

Identify high-risk deliveries early to enable intervention before delays escalate.

Communicate proactively with customers when delays are unavoidable to reduce negative review impact.

## Deliverables

A Power BI dashboard showing:

Total order volume and delivery delay distribution

The sharp decline in review outcomes after 3 days late

The disproportionate impact of severe delays on negative reviews

Clear KPIs designed for non-technical decision-makers

A documented SQL data preparation workflow

## Limitations & Next Steps
Limitations

This analysis focuses on delivery timing and does not include other drivers of customer reviews such as product quality or customer expectations.

Findings are based on historical patterns and do not predict individual customer behaviour.

Seller-level and regional differences were not deeply segmented.

## Next Steps

Segment results by seller, region, or product category to identify where delays are most damaging.

Analyse the effect of proactive customer communication on review outcomes.

Use these insights to support early-warning dashboards for high-risk deliveries.