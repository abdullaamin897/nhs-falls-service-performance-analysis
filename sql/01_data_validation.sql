/*
==================================================
Project: NHS Falls Service Performance Analysis
File: 01_data_validation.sql

Purpose:
Validate and clean the operational dataset before
performing KPI analysis.

Checks Performed:
1. Duplicate referral IDs
2. Missing values
3. Invalid NHS numbers
4. Service name consistency
5. Referral date validation
6. Data cleaning
==================================================
*/

--------------------------------------------------
-- 1. Check for duplicate Referral IDs
--------------------------------------------------

-- Compare total referral IDs with distinct referral IDs
-- If these numbers differ, duplicate referral IDs exist.

SELECT
    COUNT(referral_id) AS total_referrals,
    COUNT(DISTINCT referral_id) AS unique_referrals
FROM referrals;

-- Identify duplicate referral IDs

SELECT
    referral_id,
    COUNT(*) AS duplicate_count
FROM referrals
GROUP BY referral_id
HAVING COUNT(*) > 1;



--------------------------------------------------
-- 2. Check for missing values
--------------------------------------------------

SELECT
    SUM(CASE WHEN referral_id IS NULL THEN 1 ELSE 0 END) AS missing_referral_id,
    SUM(CASE WHEN patient_id IS NULL THEN 1 ELSE 0 END) AS missing_patient_id,
    SUM(CASE WHEN nhs_number IS NULL THEN 1 ELSE 0 END) AS missing_nhs_number,
    SUM(CASE WHEN service IS NULL THEN 1 ELSE 0 END) AS missing_service,
    SUM(CASE WHEN referral_date IS NULL THEN 1 ELSE 0 END) AS missing_referral_date
FROM referrals;



--------------------------------------------------
-- 3. Validate NHS Numbers
--------------------------------------------------

-- NHS numbers should contain 10 digits

SELECT *
FROM referrals
WHERE LENGTH(nhs_number) <> 10;



--------------------------------------------------
-- 4. Standardise Service Names
--------------------------------------------------

SELECT
    service,
    COUNT(*) AS total_records
FROM referrals
GROUP BY service
ORDER BY total_records DESC;



--------------------------------------------------
-- 5. Validate Referral Dates
--------------------------------------------------

SELECT *
FROM referrals
WHERE referral_date IS NULL;

SELECT
    MIN(referral_date) AS earliest_referral,
    MAX(referral_date) AS latest_referral
FROM referrals;



--------------------------------------------------
-- 6. Create Clean Dataset
--------------------------------------------------

WITH cleaned_referrals AS (

    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY referral_id
            ORDER BY referral_date
        ) AS row_num

    FROM referrals

)

SELECT *
FROM cleaned_referrals
WHERE row_num = 1;
