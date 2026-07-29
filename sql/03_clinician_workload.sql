/*
==================================================
Project: NHS Falls Service Performance Analysis
File: 03_clinician_workload.sql

Purpose:
Investigate clinician workload to determine whether
work allocation may have contributed to declining
service performance.

Measures:
1. Referrals per Clinician
2. Appointments per Clinician
3. Average Waiting Time
4. Workload by WTE
==================================================
*/

--------------------------------------------------
-- 1. Referrals per Clinician
--------------------------------------------------

SELECT
    clinician_name,
    COUNT(referral_id) AS referrals
FROM referrals
GROUP BY clinician_name
ORDER BY referrals DESC;



--------------------------------------------------
-- 2. Appointments per Clinician
--------------------------------------------------

SELECT
    clinician_name,
    COUNT(appointment_id) AS appointments
FROM appointments
GROUP BY clinician_name
ORDER BY appointments DESC;



--------------------------------------------------
-- 3. Average Waiting Time by Clinician
--------------------------------------------------

SELECT
    clinician_name,
    AVG(waiting_days) AS average_waiting_days
FROM referrals
GROUP BY clinician_name
ORDER BY average_waiting_days DESC;



--------------------------------------------------
-- 4. Workload Relative to WTE
--------------------------------------------------

SELECT
    clinician_name,
    wte,
    COUNT(referral_id) AS referrals,
    ROUND(COUNT(referral_id) / wte, 2) AS referrals_per_wte
FROM referrals
GROUP BY clinician_name, wte
ORDER BY referrals_per_wte DESC;
