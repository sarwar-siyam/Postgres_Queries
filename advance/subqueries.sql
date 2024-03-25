/*
    Identify the top 5 skills that are most frequently mentioned in job postings.
    Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table and then join this result with the skills_dim table to get the skill names.
*/


SELECT 
    skills_dim.skils 
FROM 
    skills_dim
        INNER JOIN(
        SELECT 
            skill_id
        FROM 
            skills_job_dim
        GROUP BY 
            skill_id
        ORDER BY 
            COUNT(job_id) DESC
        LIMIT 5) AS best_skills ON skills_dim.skill_id = best_skills.skill_id;


/*
    Determine the size category ('Small', 'Medium', or 'Large') for each company by first identifying the number of job postings they have.
    Use a subquery to calculate the total job postings per company. 
    A company is considered 'Small' if it has less than 10 job postings, 
    'Medium' if the number of job postings is between 10 and 50, 
    and 'Large' if it has more than 50 job postings. Implement a subquery to aggregate job counts per company before classifying them based on size.
*/


-- SUBQUERIE

/*

SELECT 
    company_dim.company_id,
    company_dim.name,
    count(job_id) as Anzahl
FROM 
    job_postings_fact
    INNER JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
GROUP BY 
    company_dim.name,
    company_dim.company_id

*/


SELECT 
    company_id, 
    name,
    CASE
        WHEN Anzahl < 10 THEN 'Small'
        WHEN Anzahl BETWEEN 10 and 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM 
    (
    SELECT 
        company_dim.company_id,
        company_dim.name,
        count(job_id) AS Anzahl
    FROM 
        job_postings_fact
    INNER JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    GROUP BY 
        company_dim.name,
        company_dim.company_id) ;


/*

  Find companies that offer an average salary above the overall average yearly salary of all job postings. 
  Use subqueries to select companies with an average salary higher than the overall average salary (which is another subquery).

*/


-- SUBQUERIE ALLGEMEINER DURCHSCHNITT
/*
SELECT 
    AVG(salary_year_avg) AS average_salary
FROM 
    job_postings_fact
*/ 


SELECT 
    company_dim.name
FROM 
    company_dim
INNER JOIN (
    -- Subquery to calculate average salary per company
    SELECT 
			company_id, 
			AVG(salary_year_avg) AS avg_salary
    FROM job_postings_fact
    GROUP BY company_id
    ) AS company_salaries ON company_dim.company_id = company_salaries.company_id
-- Filter for companies with an average salary greater than the overall average
WHERE company_salaries.avg_salary > (
    -- Subquery to calculate the overall average salary
    SELECT AVG(salary_year_avg)
    FROM job_postings_fact
);
