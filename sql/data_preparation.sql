-- =====================================================
-- Data Preparation: Delivery Delays & Customer Reviews
-- Dataset: Olist Brazilian E-Commerce (Kaggle)
-- Database: SQLite
-- Purpose:
--   Create a clean, analysis-ready table for Power BI by:
--   - Joining delivered orders to one review per order
--   - Calculating delivery delay (days early/late)
--   - Removing extreme outliers (±60 days)
--   - Creating detailed and executive delay segments
-- =====================================================

DROP TABLE IF EXISTS order_delivery_reviews;

CREATE TABLE order_delivery_reviews AS
WITH reviews_dedup AS (
    SELECT
        r.order_id,
        r.review_score,
        r.review_creation_date,
        ROW_NUMBER() OVER (
            PARTITION BY r.order_id
            ORDER BY r.review_creation_date DESC
        ) AS rn
    FROM olist_order_reviews r
    WHERE r.review_score IS NOT NULL
),
base AS (
    SELECT
        o.order_id,
        o.order_purchase_timestamp,
        o.order_delivered_customer_date AS actual_delivery,
        o.order_estimated_delivery_date AS estimated_delivery,
        rd.review_score,
        CAST(
            julianday(o.order_delivered_customer_date) -
            julianday(o.order_estimated_delivery_date)
            AS INTEGER
        ) AS delay_days
    FROM olist_orders o
    JOIN reviews_dedup rd
        ON o.order_id = rd.order_id
       AND rd.rn = 1
    WHERE o.order_status = 'delivered'
      AND o.order_delivered_customer_date IS NOT NULL
      AND o.order_estimated_delivery_date IS NOT NULL
)
SELECT
    order_id,
    order_purchase_timestamp,
    actual_delivery,
    estimated_delivery,
    review_score,
    delay_days,

    CASE
        WHEN review_score <= 2 THEN 1
        ELSE 0
    END AS low_review,

    CASE
        WHEN delay_days <= 0 THEN 'On time / Early'
        WHEN delay_days BETWEEN 1 AND 3 THEN '1-3 days late'
        WHEN delay_days BETWEEN 4 AND 7 THEN '4-7 days late'
        ELSE '8+ days late'
    END AS delay_bucket,

    CASE
        WHEN delay_days <= 3 THEN 'Acceptable (On time - 3 days late)'
        ELSE 'High risk (4+ days late)'
    END AS delay_bucket_executive

FROM base
WHERE delay_days BETWEEN -60 AND 60;

-- =====================================================
-- Output:
-- Table: order_delivery_reviews
-- =====================================================
