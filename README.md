## Delivery Delays & Customer Satisfaction Analysis

## Executive Summary

Deliveries that arrive more than 3 days late significantly increase the likelihood of negative customer reviews.

Although only 2.9% of orders are delivered 4+ days late, these orders are 7.7x more likely to receive a 1–2 star rating compared to on-time or slightly late deliveries.

The analysis identifies a clear satisfaction threshold at 3 days late and highlights severe delays as a high-leverage operational improvement opportunity.

## Business Problem

Customer reviews directly influence:

Marketplace trust

Seller reputation

Conversion rates

Repeat purchases

However, not all delivery delays impact customer satisfaction equally.

This project answers:

At what point do delivery delays significantly affect customer ratings?

How much higher is the risk of negative reviews for severe delays?

Where should operational focus be placed to improve overall customer satisfaction?

## Dataset

Source: Brazilian E-Commerce Public Dataset (Olist) – Kaggle

Scope after cleaning:

~95.7K delivered orders

One review per order

Extreme outliers removed (±60 days)

Key tables used:

Orders

Order Reviews

## Tools Used

SQLite / SQL – Data cleaning, joins, feature engineering

Power BI – KPI design and dashboard development

DAX – Custom measures for risk calculation and segmentation

## Data Preparation

To ensure analytical accuracy:

Filtered to delivered orders only

Removed cancelled and unavailable orders

De-duplicated order IDs

Calculated delivery delay:

delay_days = actual_delivery_date - estimated_delivery_date

Created business-friendly delay segments:

Acceptable: On time – 3 days late

High Risk: 4+ days late

Validated one review per order

Removed extreme delay outliers

## Analytical Approach

Customer dissatisfaction was measured using:

Low Review Rate (1–2 stars)

Average Review Score

The analysis compared:

Order volume by delay bucket

Low review rate by delay bucket

Average review score by exact delay days

A line analysis was conducted to identify the delay threshold at which customer satisfaction declines sharply.

## Key Insights

### Clear Threshold at 3 Days Late

Customer satisfaction remains relatively stable through 0–3 days late.

Beyond 3 days late, average ratings decline sharply.

### Severe Delays Dramatically Increase Risk

Deliveries 4+ days late:

Represent only 2.9% of total orders

Have a 74.78% low review rate

Compared to 9.73% for acceptable deliveries

Are 7.7x more likely to receive a 1–2 star rating

This indicates severe delays significantly increase the probability of negative reviews.

### High-Leverage Operational Opportunity

Although severe delays are rare, their impact on customer sentiment is substantial.

Targeting these high-risk deliveries offers significantly greater return on operational effort than marginally improving already on-time deliveries.

## Business Implications

Not all delays require equal operational focus.

Improving already on-time deliveries yields marginal benefit.

However, preventing deliveries from exceeding 3 days late can significantly reduce the likelihood of negative customer feedback.

Operational strategies should prioritise:

Early identification of high-risk shipments

Intervention before delays exceed 3 days

Proactive customer communication for unavoidable delays

## Limitations

Analysis isolates delivery timing and does not control for product quality or seller-level differences.

Findings are based on historical data and are not predictive.

No revenue impact modelling included.

## Future Improvements

Build a predictive model for late-delivery risk

Segment results by seller, region, and product category

Quantify projected improvement in overall rating if severe delays are reduced

## Dashboard Overview

The Power BI dashboard includes:

Executive KPI summary

Low review rate comparison by delay bucket

Order volume distribution

Line analysis showing the 3-day threshold

Clear visual segmentation for decision-makers

## What This Project Demonstrates

Translating raw transactional data into business insights

Identifying operational thresholds

Calculating risk ratios using DAX

Designing executive-level dashboards

Communicating analytical findings clearly
