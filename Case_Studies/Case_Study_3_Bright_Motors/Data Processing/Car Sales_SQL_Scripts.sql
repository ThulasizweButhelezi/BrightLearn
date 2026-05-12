-- Databricks notebook source
-- =========================================
-- CAR SALES DATA PIPELINE
-- CLEANING + TRANSFORMATION + EDA
-- Databricks SQL Version
-- =========================================


-- =========================================
-- 1. VIEW RAW DATASET
-- =========================================
SELECT *
FROM brightlearn_case_studies.case_studies.car_sales_data;



-- =========================================
-- 2. DATA CLEANING
-- =========================================


-- 2.1 IDENTIFY MISSING VALUES
SELECT *
FROM brightlearn_case_studies.case_studies.car_sales_data
WHERE year IS NULL 
   OR make IS NULL 
   OR model IS NULL 
   OR trim IS NULL 
   OR body IS NULL 
   OR transmission IS NULL 
   OR vin IS NULL 
   OR state IS NULL 
   OR condition IS NULL 
   OR odometer IS NULL 
   OR color IS NULL 
   OR interior IS NULL 
   OR seller IS NULL 
   OR mmr IS NULL 
   OR sellingprice IS NULL 
   OR saledate IS NULL;



-- 2.2 CHECK DUPLICATES (VIN)
SELECT vin
FROM brightlearn_case_studies.case_studies.car_sales_data
GROUP BY vin
HAVING COUNT(*) > 1;



-- 2.3 CLEAN 'MAKE' COLUMN
UPDATE brightlearn_case_studies.case_studies.car_sales_data
SET make = CASE
    WHEN LOWER(TRIM(make)) LIKE 'ford%' THEN 'FORD'
    WHEN LOWER(TRIM(make)) LIKE 'mazda%' THEN 'MAZDA'
    WHEN LOWER(TRIM(make)) LIKE 'dodge%' THEN 'DODGE'
    WHEN LOWER(TRIM(make)) LIKE 'hyundai%' THEN 'HYUNDAI'
    WHEN LOWER(TRIM(make)) LIKE 'mercedes%' THEN 'MERCEDES-BENZ'
    WHEN LOWER(TRIM(make)) LIKE 'mercedes-b%' THEN 'MERCEDES-BENZ'
    WHEN LOWER(TRIM(make)) LIKE 'chev truck%' THEN 'CHEVROLET'
    WHEN LOWER(TRIM(make)) LIKE 'vw%' OR LOWER(TRIM(make)) LIKE 'volkswagen%' THEN 'VOLKSWAGEN'
    WHEN LOWER(TRIM(make)) LIKE 'gmc truck%' THEN 'GMC TRUCK'
    WHEN LOWER(TRIM(make)) LIKE 'landrover%' THEN 'LAND ROVER'
    ELSE UPPER(TRIM(make))
END;



-- 2.4 CLEAN SELLER
UPDATE brightlearn_case_studies.case_studies.car_sales_data
SET seller = CASE
    WHEN LOWER(TRIM(seller)) LIKE 'nissan-infiniti lt%' THEN 'nissan infiniti lt'
    ELSE UPPER(TRIM(seller))
END;



-- 2.5 STANDARDISE TEXT COLUMNS
UPDATE brightlearn_case_studies.case_studies.car_sales_data
SET model = UPPER(TRIM(model));

UPDATE brightlearn_case_studies.case_studies.car_sales_data
SET body = UPPER(TRIM(body));

UPDATE brightlearn_case_studies.case_studies.car_sales_data
SET transmission = UPPER(TRIM(transmission));

UPDATE brightlearn_case_studies.case_studies.car_sales_data
SET state = UPPER(TRIM(state));

UPDATE brightlearn_case_studies.case_studies.car_sales_data
SET color = UPPER(TRIM(color));

UPDATE brightlearn_case_studies.case_studies.car_sales_data
SET interior = UPPER(TRIM(interior));



-- 2.6 HANDLE NULLS / MISSING VALUES
UPDATE brightlearn_case_studies.case_studies.car_sales_data
SET make = IFNULL(make, 'Unknown'),
    model = IFNULL(model, 'Unknown'),
    body = IFNULL(body, 'Unknown'),
    transmission = IFNULL(transmission, 'Unknown'),
    state = IFNULL(state, 'Unknown'),
    color = REPLACE(TRIM(IFNULL(color, 'Unknown')), '—', 'Unknown'),
    interior = REPLACE(TRIM(IFNULL(interior, 'Unknown')), '—', 'Unknown'),
    seller = IFNULL(seller, 'Unknown');



-- =========================================
-- 3. EXPLORATORY DATA ANALYSIS (EDA)
-- =========================================

SELECT  
    year,
    make,
    model,
    body,
    transmission,
    color,
    interior,
    seller,
    odometer,
    vin,
    state,

    -- =========================================
    -- VEHICLE CONDITION
    -- =========================================
    CASE
        WHEN odometer < 30000 THEN 'New (<30000km)'
        WHEN odometer BETWEEN 30000 AND 99000 THEN 'Good (30000-99000km)'
        WHEN odometer BETWEEN 100000 AND 199000 THEN 'High Mileage (100000-199000km)'
        ELSE 'Old (200000+km)'
    END AS Car_Condition,

    -- =========================================
    -- MMR CATEGORY
    -- =========================================
    CASE
        WHEN mmr < 5000 THEN 'Very Low'
        WHEN mmr BETWEEN 5000 AND 10000 THEN 'Low'
        WHEN mmr BETWEEN 10001 AND 20000 THEN 'Medium'
        ELSE 'High'
    END AS MMR_Category,

    -- =========================================
    -- SELLING PRICE CATEGORY
    -- =========================================
    CASE
        WHEN sellingprice < 5000 THEN 'Very Low (<5000)'
        WHEN sellingprice BETWEEN 5000 AND 10000 THEN 'Low (5000-10000)'
        WHEN sellingprice BETWEEN 10001 AND 20000 THEN 'Medium (10001-20000)'
        ELSE 'High (>20000)'
    END AS SellingPrice_Category,

    -- =========================================
    -- DATE FEATURES
    -- =========================================
    date_format(to_timestamp(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss'), 'EEEE') AS Day_name,
    date_format(to_timestamp(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss'), 'MMMM') AS Month_name,
    CAST(date_format(to_timestamp(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss'),'MM') AS INT) AS Month_number,
    date_format(to_timestamp(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss'),'yyyy-MM-dd') AS Selling_date,
    date_format(to_timestamp(substring(saledate, 5), 'MMM dd yyyy HH:mm:ss'), 'yyyy') AS Selling_year,

    -- =========================================
    -- TIME SEGMENTATION
    -- =========================================
    CASE
        WHEN hour(to_timestamp(substr(saledate, 5), 'MMM dd yyyy HH:mm:ss')) BETWEEN 5 AND 11 
            THEN 'Morning (5-11 AM)'
        WHEN hour(to_timestamp(substr(saledate, 5), 'MMM dd yyyy HH:mm:ss')) BETWEEN 12 AND 17 
            THEN 'Afternoon (12-17 PM)'
        WHEN hour(to_timestamp(substr(saledate, 5), 'MMM dd yyyy HH:mm:ss')) BETWEEN 18 AND 23 
            THEN 'Evening (18-23 PM)'
        ELSE 'Midnight/Dawn'
    END AS Time_Bucket,

    -- =========================================
    -- BUSINESS METRICS
    -- =========================================
    SUM(sellingprice) AS Total_Revenue,

    ROUND(
        AVG(((sellingprice - mmr) / sellingprice) * 100),
        1
    ) AS Avg_Profit_Margin

FROM brightlearn_case_studies.case_studies.car_sales_data

GROUP BY 
    year,
    make,
    model,
    body,
    transmission,
    color,
    interior,
    seller,
    odometer,
    vin,
    state,
    Car_Condition,
    MMR_Category,
    SellingPrice_Category,
    Day_name,
    Month_name,
    Selling_date,
    Selling_year,
    Time_Bucket,
    saledate;

