-- =====================================================
-- Data Preparation: Delivery Delays & Customer Reviews
-- Dataset: Olist Brazilian E-Commerce (Kaggle)
-- Database: SQLite
-- Purpose:
--   Create a clean, analysis-ready table for Power BI
--   by combining orders and reviews, calculating
--   delivery delays, and grouping them into
--   business-friendly categories.
-- =====================================================


-- 1. Create base analysis table
DROP TABLE IF EXISTS order_delivery_reviews;

CREATE TABLE order_delivery_reviews AS
SELECT
    o.order_id,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date AS actual_delivery,
    o.order_estimated_delivery_date AS estimated_delivery,
    r.review_score,

    -- Calculate delivery delay in days
    CAST(
        julianday(o.order_delivered_customer_date)
        - julianday(o.order_estimated_delivery_date)
        AS INTEGER
    ) AS delay_days,

    -- Flag low reviews (1–2 stars)
    CASE
        WHEN r.review_score <= 2 THEN 1
        ELSE 0
    END AS low_review

FROM olist_orders o
JOIN olist_order_reviews r
    ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL;


-- 2. Create detailed delivery delay buckets
ALTER TABLE order_delivery_reviews
ADD COLUMN delay_bucket TEXT;

UPDATE order_delivery_reviews
SET delay_bucket =
    CASE
        WHEN delay_days <= 0 THEN 'On time'
        WHEN delay_days BETWEEN 1 AND 3 THEN '1–3 days late'
        WHEN delay_days BETWEEN 4 AND 7 THEN '4–7 days late'
        ELSE '8+ days late'
    END;


-- 3. Create executive-level delivery buckets
ALTER TABLE order_delivery_reviews
ADD COLUMN delay_bucket_executive TEXT;

UPDATE order_delivery_reviews
SET delay_bucket_executive =
    CASE
        WHEN delay_days <= 3 THEN 'Acceptable (On time – 3 days late)'
        ELSE 'High risk (4+ days late)'
    END;


-- =====================================================
-- Final output:
-- Table: order_delivery_reviews
-- Used as the single source for Power BI reporting
-- =====================================================
