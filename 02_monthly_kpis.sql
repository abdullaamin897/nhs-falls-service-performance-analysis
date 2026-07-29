/*
==================================================
Project: NHS Falls Service Performance Analysis
File: 02_monthly_kpis.sql

Purpose:
Calculate monthly Key Performance Indicators (KPIs)
to assess service performance between January and
June 2025.

KPIs:
1. Referral Count
2. Appointment Count
3. Average Waiting Time
4. Completion Rate
5. DNA Rate
==================================================
*/

--------------------------------------------------
-- 1. Monthly Referral Count
--------------------------------------------------

SELECT
    MONTH(referral_date) AS month,
    COUNT(referral_id) AS referral_count
FROM referrals
GROUP BY MONTH(referral_date)
ORDER BY month;



--------------------------------------------------
-- 2. Monthly Appointment Count
--------------------------------------------------

SELECT
    MONTH(appointment_date) AS month,
    COUNT(appointment_id) AS appointment_count
FROM appointments
GROUP BY MONTH(appointment_date)
ORDER BY month;



--------------------------------------------------
-- 3. Average Waiting Time
--------------------------------------------------

SELECT
    MONTH(referral_date) AS month,
    AVG(waiting_days) AS average_waiting_days
FROM referrals
GROUP BY MONTH(referral_date)
ORDER BY month; 



--------------------------------------------------
-- 4. Completion Rate
--------------------------------------------------

SELECT
    MONTH(appointment_date) AS month,
    ROUND(
        SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS completion_rate
FROM appointments
GROUP BY MONTH(appointment_date)
ORDER BY month;



--------------------------------------------------
-- 5. DNA Rate
--------------------------------------------------

SELECT
    MONTH(appointment_date) AS month,
    ROUND(
        SUM(CASE WHEN status = 'DNA' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),
        2
    ) AS dna_rate
FROM appointments
GROUP BY MONTH(appointment_date)
ORDER BY month;
