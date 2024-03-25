/*
	Retrieve a list of job titles (job_title from the job_posting_fact table) with their corresponding company names (name from the company_dim table). 
	Also, get the job_id, job_location, and job_posted_date. 
	Only return job postings that have the ‘Data Scientist' as the job title (job_title_short). Order by the job posted date in descending order.
*/


SELECT 
	job_id, 
	job_location, 
	job_posted_date,
	job_title,
	name
FROM 
	job_postings_fact  
INNER JOIN 
	company_dim 
ON job_postings_fact.company_id = company_dim.company_id
WHERE
	job_title_short = 'Data Scientist'
ORDER BY
	job_posted_date DESC;



/*
	Fetch all job postings, including their job_id, job_title and the names of the skills required (skills); even if no skills are listed for a job. 
	Ensure that the job is located in ‘New York’ and offers health insurance. Use the job_postings_fact, skills_job_dim, and skills_dim tables. 
	Order by job_id in descending order.
*/


SELECT 
	job_postings_fact.job_id,
	job_postings_fact.job_title, 
	skills_dim.skils
FROM 
	job_postings_fact
	LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
	LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
	job_postings_fact.job_location = 'New York' 
	AND job_postings_fact.job_health_insurance = TRUE
ORDER BY 
	job_postings_fact.job_id ASC;



/*
	Identify the top skills required for jobs that offer remote work and have an average yearly salary above $100,000. 
	Return the skill name (skills) and the number of job postings that mention each skill, ordered by the number of job postings in descending order.
*/




SELECT 
    skills_dim.skils,
    COUNT(job_postings_fact.job_id) AS count_of_jobs
FROM 
    job_postings_fact
	LEFT JOIN
	    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
	LEFT JOIN
	    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_work_from_home = TRUE 
    AND job_postings_fact.salary_year_avg > 100000
GROUP BY 
    skills_dim.skils
ORDER BY 
    count_of_jobs DESC;

