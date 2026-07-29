/*
==================================================
Project: NHS Falls Service Performance Analysis
File: 04_follow_up_analysis.sql

Purpose:
Document additional analyses that should be carried
out before making operational recommendations.

Business Questions:
1. Is workload distributed fairly?
2. Does referral complexity explain waiting times?
3. Is clinic capacity sufficient?
4. How does performance change over time?
==================================================
*/

--------------------------------------------------
-- 1. Referral Allocation by Clinician
--------------------------------------------------

SELECT
    clinician_name,
    COUNT(referral_id) AS referrals
FROM referrals
GROUP BY clinician_name
ORDER BY referrals DESC;

--------------------------------------------------
-- 2. Referral Complexity
--------------------------------------------------

-- Example analysis if complexity data becomes available

SELECT
    complexity_level,
    COUNT(*) AS referrals
FROM referrals
GROUP BY complexity_level;

--------------------------------------------------
-- 3. Clinic Capacity
--------------------------------------------------

SELECT
    clinic_name,
    COUNT(appointment_id) AS appointments
FROM appointments
GROUP BY clinic_name
ORDER BY appointments DESC;

--------------------------------------------------
-- 4. Monthly Performance Trend
--------------------------------------------------

SELECT
    MONTH(appointment_date) AS month,
    COUNT(*) AS appointments
FROM appointments
GROUP BY MONTH(appointment_date)
ORDER BY month;

/*
==================================================
Analyst Notes

This analysis suggests that increasing waiting
times may be associated with rising demand and
uneven clinician workload.

However, the available data does not include
referral complexity, staff absence or clinic
capacity.

Further investigation is recommended before
implementing operational changes.

==================================================
*/
