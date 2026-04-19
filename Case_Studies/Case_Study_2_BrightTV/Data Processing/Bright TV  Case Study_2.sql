-- Databricks notebook source
---1. Data ingestion from excel sheets into DataBrick

---VIEWERSHIP DATA

SELECT *
FROM brightlearn_case_studies.case_studies.bright_tv_viewership;



---USER PROFILE DATA

SELECT *
FROM brightlearn_case_studies.case_studies.bright_tv_user_profile;




---DATA CLEANING (CHECKING BLANK OR MISSING DATA ON BOTH TABLES)
UPDATE brightlearn_case_studies.case_studies.bright_tv_viewership
SET Channel2=
            CASE 
              WHEN Channel2 ='' THEN 'unknown'
              WHEN Channel2='None' THEN 'unknown'
              ELSE Channel2 
              END;



SELECT *
FROM brightlearn_case_studies.case_studies.bright_tv_viewership;

              

UPDATE brightlearn_case_studies.case_studies.bright_tv_user_profile
SET Gender=
           CASE   
              WHEN Gender ='' THEN 'unknown'
              WHEN Gender='None' THEN 'unknown'
              ELSE Gender 
              END,
    Race=
           CASE   
              WHEN Race ='' THEN 'unknown'
              WHEN Race='None' THEN 'unknown'
              ELSE Race 
              END,
    Province=
           CASE   
              WHEN Province ='' THEN 'unknown'
              WHEN Province='None' THEN 'unknown'
              ELSE Province 
              END;


SELECT *
FROM brightlearn_case_studies.case_studies.bright_tv_user_profile;

              

---- JOINING THE VIEWSHIP AND USER PROFILE DATA USING THE FULL OUT JOIN TO GET ALL THE DATA FROM BOTH TABLES AND CONDUCT DATA MANUPULATION 

SELECT B.Province,
       B.Gender,
       B.Race,
       A.Channel2,
       COUNT (DISTINCT A.Channel2) AS Number_of_Channels,
       DATE_FORMAT(FROM_UTC_TIMESTAMP(A.RecordDate2,'Africa/Johannesburg'),'dd-MM-yyyy') AS Record_Date,
       DATE_FORMAT(FROM_UTC_TIMESTAMP(A.RecordDate2,'Africa/Johannesburg'),'EEEE') AS Record_Day_Name,
       DATE_FORMAT(FROM_UTC_TIMESTAMP(A.RecordDate2,'Africa/Johannesburg'),'MMMM') AS Record_Month_Name,
    CASE 
       WHEN Record_Day_Name IN ('Monday','Tuesday','Wednesday','Thursday','Friday') THEN 'Week Days'
       ELSE 'Weekend'
      END AS Week_Category,
       CASE
         WHEN HOUR(FROM_UTC_TIMESTAMP(A.RecordDate2,'Africa/Johannesburg')) BETWEEN 5 AND 11 THEN 'Morning (Daytime Start)'
         WHEN HOUR(FROM_UTC_TIMESTAMP(A.RecordDate2,'Africa/Johannesburg')) BETWEEN 12 AND 16 THEN 'Afternoon (Daytime)'
         WHEN HOUR(FROM_UTC_TIMESTAMP(A.RecordDate2,'Africa/Johannesburg')) BETWEEN 17 AND 20 THEN 'Prime Time (Early Evening)'
         WHEN HOUR(FROM_UTC_TIMESTAMP(A.RecordDate2,'Africa/Johannesburg')) BETWEEN 21 AND 23 THEN 'Late Prime (Early Night)'
         ELSE 'Late Night'
         END AS Viewing_time_category,

      AVG (HOUR(A.`Duration 2`) * 60 + MINUTE(A.`Duration 2`)) AS Average_watching_time_in_minutes,
         
      CASE 
       WHEN (HOUR(A.`Duration 2`) * 60 + MINUTE(A.`Duration 2`)) =0 THEN 'No Viewing'
       WHEN (HOUR(A.`Duration 2`) * 60 + MINUTE(A.`Duration 2`)) BETWEEN 1 AND 30 THEN 'Less 30 minutes'
       WHEN (HOUR(A.`Duration 2`) * 60 + MINUTE(A.`Duration 2`)) BETWEEN 30 AND 59 THEN '30-59 minutes'
       WHEN (HOUR(A.`Duration 2`) * 60 + MINUTE(A.`Duration 2`)) BETWEEN 60 AND 119 THEN '1-2 hours'
       ELSE 'more than 2 hours'
       END AS Viewing_Duration,
   
   CASE 
    WHEN Average_watching_time_in_minutes <= 60 THEN 'Short (0-60 minutes)'
    WHEN Average_watching_time_in_minutes <= 120 THEN 'Medium (61-120 minutes)'
    ELSE 'Long (120+ minutes)'
   END AS View_Time_Bucket,

      CASE 
        WHEN B.Age BETWEEN 0 AND 12 THEN 'Children (0-12 years)'
        WHEN B.Age BETWEEN 13 AND 17 THEN 'Teenagers (13-17 years)'
        WHEN B.Age BETWEEN 18 AND 34 THEN 'Young Adults (18-34 years)'
        WHEN B.Age BETWEEN 35 AND 49 THEN 'Adults (35-49 years)'
        ELSE 'Older Adults (50+)'
        END AS Age_Category
FROM brightlearn_case_studies.case_studies.bright_tv_viewership AS A
LEFT JOIN brightlearn_case_studies.case_studies.bright_tv_user_profile AS B
ON A.UserID0=B.UserID
WHERE A.UserID0 IS NOT NULL OR B.USERID IS NOT NULL
GROUP BY B.Province,B.Gender,B.Race,A.RecordDate2,A.Channel2,A.`Duration 2`,B.Age;
