/*
	We’re going to check that all skills that do not have a category assigned to it. 
	Get all skills from the skills_dim table that don’t have a type (aka this type column is null). Return the skill_id and skills.
*/

SELECT 
	skill_id, 
	skils
FROM 
	skills_dim 
Where
	type is null;


/*
	Identify all job postings that have neither an annual average salary (salary_year_avg) nor an hourly average salary (salary_hour_avg) in the job_postings_fact table. 
	Return the job_id, job_title, salary_year_avg, salary_hour_avg This can be useful to look at postings where there’s no compensation. Order by job_id in ascending order.
*/


SELECT
	job_id,
	job_title,
	salary_hour_avg,
	salary_year_avg
FROM 
	job_postings_fact
WHERE
	salary_year_avg IS NULL AND salary_year_avg IS NULL
ORDER BY job_id;

