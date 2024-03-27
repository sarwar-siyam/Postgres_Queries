
/*
    Create a unified query that categorizes job postings into two groups: those with salary information (salary_year_avg or salary_hour_avg is not null) and those without it. 
    Each job posting should be listed with its job_id, job_title, and an indicator of whether salary information is provided.
*/

-- without Union 
SELECT 
    job_id, 
    job_title, 
    CASE 
        WHEN salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL THEN 'With Salary Info'
        ELSE 'No Salary Info'
    END AS salary_info
FROM 
    job_postings_fact
ORDER BY job_id


-- with union 
(
    SELECT 
            job_id, 
            job_title, 
            'With Salary Info' AS salary_info  -- Custom field indicating salary info presence
        FROM 
            job_postings_fact
        WHERE 
            salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL
            )
UNION ALL
(   SELECT
        job_id,
        job_title,
        'With Salary Info' AS salary_info  -- Custom field indicating salary info presence
    FROM
        job_postings_fact
    WHERE
        salary_year_avg IS NULL AND salary_hour_avg IS NULL

)
ORDER BY 
    job_id


