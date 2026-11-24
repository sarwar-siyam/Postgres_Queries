/*
    From the job_postings_fact table, categorize the salaries from job postings that are data analyst jobs and who have a yearly salary information. 
    Put salary into 3 different categories:

    If the salary_year_avg is greater than $100,000 then return ‘high salary’.
    If the salary_year_avg is between $60,000 and $99,000 return ‘Standard salary’.
    If the salary_year_avg is below $60,000 return ‘Low salary’.
*/


SELECT 
    job_title_short, 
    salary_year_avg,
    CASE
        WHEN salary_year_avg > 100000 THEN 'high salary'
        WHEN salary_year_avg BETWEEN 60000 AND 99000 THEN 'Standard salary'
        WHEN salary_year_avg < 60000 THEN 'Low salary'
    END AS salary_category
From 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;


/*
   Count the number of unique companies that offer work from home (WFH) versus those requiring work to be on-site. 
   Use the job_postings_fact table to count and compare the distinct companies based on their WFH policy (job_work_from_home).
*/


SELECT 
    COUNT(DISTINCT CASE WHEN job_work_from_home = TRUE THEN company_id END) AS WFH_COMPANIES,
    COUNT(DISTINCT CASE WHEN job_work_from_home = FALSE THEN company_id END) AS NON_WFH_COMPANIES
FROM
    job_postings_fact;


/*
   Write a query that lists all job postings with their job_id, salary_year_avg, and two additional columns using CASE WHEN statements called: 
   experience_level and remote_option. Use the job_postings_fact table.

1.For experience_level, 
categorize jobs based on keywords found in their titles (job_title) as 'Senior', 'Lead/Manager', 'Junior/Entry', or 'Not Specified'. 
Assume that certain keywords in job titles (like "Senior", "Manager", "Lead", "Junior", or "Entry") can indicate the level of experience required. 
ILIKE should be used in place of LIKE for this.

2.For remote_option, specify whether a job offers a remote option as either 'Yes' or 'No', based on job_work_from_home column.
*/


SELECT
    job_id,
    salary_year_avg,
    CASE 
        WHEN job_title_short ILIKE '%Senior%' then 'Senior' 
        WHEN job_title_short ILIKE '%Manager%' then 'Manager' 
        WHEN job_title_short ILIKE '%Lead%' then 'Lead' 
        WHEN job_title_short ILIKE '%Juniorr%' then 'Junior' 
        WHEN job_title_short ILIKE '%Entry%' then 'Entry' 
        ELSE 'Not Specified'
    END AS experience_level,
    CASE 
        WHEN job_work_from_home = TRUE THEN 'YES'
        ELSE    'NO'
    END AS remot_option
From 
    job_postings_fact
WHERE 
    salary_year_avg IS NOT NULL
ORDER BY
    job_id;

