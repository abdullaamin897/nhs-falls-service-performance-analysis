# NHS Falls Service Performance Analysis

## Business Problem

The Head of Community Services requested an analysis of the Falls service after observing a potential decline in operational performance between January and June. The objective of this project was to determine whether the available data supported this concern by analysing key operational performance indicators before recommending further investigation.

## Objectives

- Assess whether the Falls service experienced a decline in operational performance.
- Analyse referral count, appointment count, average waiting time, completion rate and DNA rate.
- Investigate factors contributing to increasing waiting times.
- Assess clinician workload allocation.
- Identify limitations within the available dataset.
- Provide evidence-based recommendations for further investigation.

## Dataset

This project uses a simplified NHS operational dataset consisting of five related tables to analyse service performance and operational efficiency.

| Table | Description |
|--------|-------------|
| Referrals | Stores referral information including referral ID, patient ID, clinician ID, service, referral date and referral status. |
| Appointments | Stores appointment activity including appointment date, waiting days and appointment outcome (Completed, DNA or Cancelled). |
| Clinicians | Contains clinician information including clinician ID, clinician name, role and Whole Time Equivalent (WTE). |
| Patients | Stores patient identifiers used to link referrals to individual patients. |
| Clinics | Contains clinic information used to identify where appointments were delivered. |

### Relationships

- Patient ID links Patients to Referrals.
- Referral ID links Referrals to Appointments.
- Clinician ID links Referrals to Clinicians.
- Clinic ID links Appointments to Clinics.

This relational structure enables service performance to be analysed across patients, clinicians and services.
## Data Validation

Before analysis, the dataset was validated to improve data quality and ensure reliable reporting.

### Validation checks

- Checked for duplicate referral IDs.
- Validated NHS numbers contained 10 digits.
- Identified missing Patient IDs.
- Checked for missing clinician assignments.
- Identified missing referral dates.
- Checked referral dates for invalid values and anomalies.
- Standardised text values (e.g. `MSK`, `Accepted`).
- Reviewed referral status values for consistency.
- Verified services contained expected values.
### Why validation was important

These checks ensured KPI calculations were based on reliable data and reduced the risk of inaccurate reporting caused by duplicate, incomplete or inconsistent records.

## KPIs

## SQL Techniques Used

## Analysis Process

## Key Findings

## Limitations

## Recommendations

## Dashboard

## Skills Demonstrated

## Future Improvements
