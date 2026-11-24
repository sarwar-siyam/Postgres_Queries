/*
    Find the average salary both yearly (salary_year_avg) and hourly (salary_hour_avg) for job postings using the job_postings_fact table that were posted after June 1, 2023.
    Group the results by job schedule type. Order by the job_schedule_type in descending order.
*/


SELECT 
    job_schdule_type,
    avg(salary_hour_avg),
    avg(salary_year_avg)
FROM
    job_postings_fact
WHERE 
    job_posted_date > '2023-06-01'
GROUP BY
    job_schdule_type
ORDER BY   
    job_schdule_type DESC;


/*
   Count the number of job postings for each month in 2023, 
   Assume the job_posted_date is stored in UTC. Group by and order by the month.
*/


SELECT 
    count(job_id),
    EXTRACT (month FROM job_posted_date ) as month
FROM
    job_postings_fact
GROUP BY 
    MONTH
ORDER BY 
    MONTH;


/*
   Find companies (include company name) that have posted jobs offering health insurance, where these postings were made in the second quarter of 2023. 
   Use date extraction to filter by quarter. And order by the job postings count from highest to lowest.
*/


SELECT 
    company_dim.name,
    count(job_postings_fact.job_id)
FROM 
    job_postings_fact INNER JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_health_insurance = TRUE  AND 
    EXTRACT(quarter FROM job_posted_date ) = 2
GROUP BY 
    company_dim.name 
HAVING 
    COUNT(job_postings_fact.job_id) > 0
ORDER BY
    COUNT(job_postings_fact.job_id) DESC;




