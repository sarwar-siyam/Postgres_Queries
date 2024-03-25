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


