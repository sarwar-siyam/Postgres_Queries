/*
    In the job_postings_fact table count the total number of job postings that offer health insurance.
*/

SELECT 
  activity_id,
  hours_spent + hours_rate AS added_value
FROM 
  invoices_fact 
ORDER BY
	activity_id;



/*
    In the job_postings_fact table count the number of job postings available for each country. Return job_country and the job count. Order by job_country in ascending order.
*/


SELECT 
	job_country, 
	COUNT(*) AS job_count
FROM 
	job_postings_fact
GROUP BY 
	job_country
ORDER BY
	job_country;



/*
	In the job_postings_fact table calculate the total sum of the average yearly salary (salary_year_avg)
	 for all job postings that are marked as fully remote and divide it by the total count of salary_year_avg. 
	 To get the total average yearly salary for fully remote jobs. Ensure to only include job postings where a yearly salary is specified (salary_year_avg IS NOT NULL).
*/


SELECT 
	SUM(salary_year_avg) / COUNT(salary_year_avg) AS total_yearly_salary_remote
FROM 
	job_postings_fact
WHERE 
	job_work_from_home = TRUE
	AND salary_year_avg IS NOT NULL;


/*
	In the job_postings_fact table find the minimum and maximum yearly salaries (salary_year_avg) offered for job postings in locations that include ‘San Francisco’ in the location title.
	 The query should return two columns: one for the minimum yearly salary and one for the maximum yearly salary,
	considering only job postings that specify a yearly salary (salary_year_avg IS NOT NULL).
*/



SELECT min(salary_year_avg) as minimum_yearly_salary,
max(salary_year_avg) as maximum_yearly_salary
FROM job_postings_fact
WHERE job_location like ('%San Francisco%') and salary_year_avg IS NOT NULL;


/*
	In the job_postings_fact table determine the average yearly salaries (salary_year_avg) for ‘Data Scientist’ job postings. 
	Your query should return one columns for the average yearly salary. Only include jobs that have a yearly salary (salary_year_avg IS NOT NULL).
*/



SELECT 
	AVG(salary_year_avg)
FROM 
	job_postings_fact
WHERE
	
	salary_year_avg IS NOT NULL
	AND job_title = 'Data Scientist';



/*
	Using the job_postings_fact table find the average, minimum, and maximum salary range for each job_title_short.
	Only include job titles with more than 5 postings and group data by job_title_short . Order by job_title_short in ascending order.
*/


SELECT 
	job_title_short,
	avg(salary_year_avg),
	min(salary_year_avg),
	max(salary_year_avg)
FROM
	job_postings_fact
GROUP BY
	job_title_short
HAVING 
	COUNT(job_id) >=5;

/*
	In the job_postings_fact table list countries along with their average yearly salary (salary_year_avg) for job postings,
	 where the average yearly salary exceeds $100,000.
	  Group the results by job_country. Only get job postings where there is an average yearly salary included (salary_year_avg IS NOT NULL).
*/


SELECT 
	job_country,
	avg(salary_year_avg) AS DURCHSCHN
FROM
	job_postings_fact
WHERE
	salary_year_avg IS NOT NULL
GROUP BY
	job_country 
HAVING 
	AVG(salary_year_avg) > 100000;


/*
	In the job_postings_fact table count the number of job postings for each location (job_location) that do NOT offer remote work. 
	Display the location and the count of non-remote job postings, and order the results by the count in descending order. 
	Show locations where the average salary for non-remote jobs is above $70,000.
*/


SELECT
	job_location,
	count(job_id)
FROM 
	job_postings_fact
WHERE 
	job_work_from_home = FALSE
GROUP BY
	job_location
HAVING 
	AVG(salary_year_avg) > 70000
ORDER BY
	count(job_id) DESC;
	



