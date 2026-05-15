-- Databricks notebook source
-- ============================================================
-- PROJECT  : Bright Coffee Shop Analysis
-- DATABASE : brightlearn_case_studies.case_studies
-- PURPOSE  : Exploratory Data Analysis (EDA) & Time Intelligence
-- ============================================================

-- ------------------------------------------------------------
-- RAW DATA PREVIEW
-- ------------------------------------------------------------
SELECT *
FROM brightlearn_case_studies.case_studies.bright_coffee_shop_analysis_case_study_1;




-- ============================================================
-- SECTION 1 : EXPLORATORY DATA ANALYSIS (EDA)
-- ============================================================

SELECT

    -- --------------------------------------------------------
    -- 1.1 DIMENSIONS
    -- --------------------------------------------------------
    store_location,
    product_category,
    product_type,
    product_detail,

    -- --------------------------------------------------------
    -- 1.2 AGGREGATE METRICS
    -- --------------------------------------------------------
    SUM(transaction_qty)               AS total_qty_of_product_sold,   -- Result: 214,470
    SUM(transaction_qty * unit_price)  AS total_revenue,               -- Result: $698,812.33
    ---COUNT(DISTINCT product_type)       AS number_of_product_types,     -- Result: 29
    --COUNT(DISTINCT product_detail)     AS number_of_product_details,   -- Result: 80

    -- --------------------------------------------------------
    -- 1.3 DATE & TIME DIMENSIONS
    -- Data period: 6 months | MIN/MAX dates commented out below
    -- --------------------------------------------------------
    -- MIN(transaction_date)            AS first_date_of_transaction,
    -- MAX(transaction_date)            AS last_date_of_transaction,
    ----transaction_date,
    DAYNAME(transaction_date)          AS day_of_transaction,
    DAYOFWEEK(transaction_date)        AS day_number,
    MONTHNAME(transaction_date)        AS month_of_transaction,
    MONTH(transaction_date)            AS month_number,
    QUARTER(transaction_date)          AS transaction_quarter,
    DATE_FORMAT(transaction_time, 'HH:mm:ss') AS time_of_transaction,

    -- --------------------------------------------------------
    -- 1.4 TIME INTELLIGENCE : DAY CLASSIFICATION
    -- --------------------------------------------------------
    CASE
    WHEN LOWER(DAYNAME(transaction_date)) IN ('sat','sun') 
        THEN 'Weekend'
    ELSE 'Weekday'
    END AS days_classification,
    -- --------------------------------------------------------
    -- 1.5 TIME INTELLIGENCE : TIME-OF-DAY CLASSIFICATION
    -- --------------------------------------------------------
    CASE
        WHEN DATE_FORMAT(transaction_time, 'HH:mm') BETWEEN '07:00' AND '08:59' THEN 'Early Morning'
        WHEN DATE_FORMAT(transaction_time, 'HH:mm') BETWEEN '09:00' AND '11:59' THEN 'Morning'
        WHEN DATE_FORMAT(transaction_time, 'HH:mm') BETWEEN '12:00' AND '13:59' THEN 'Midday / Lunch'
        WHEN DATE_FORMAT(transaction_time, 'HH:mm') BETWEEN '14:00' AND '17:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_classification

-- ============================================================
-- SOURCE TABLE
-- ============================================================
FROM brightlearn_case_studies.case_studies.bright_coffee_shop_analysis_case_study_1

-- ============================================================
-- GROUPING
-- ============================================================
GROUP BY
    store_location,
    product_category,
    product_type,
    product_detail,
    transaction_date,
    day_of_transaction,
    month_of_transaction,
    transaction_time,
    month_number,
    time_of_transaction;
