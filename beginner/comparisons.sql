/*
    In the job_postings_fact table get the job_id, job_title_short, job_location, job_via,
    and salary_year_avgcolumns. Order by job_id in ascending order. Only return rows where the job location is in ‘Tampa, FL’
*/


SELECT 
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE 
    job_location = 'Tampa, FL'
ORDER BY 
    job_id ASC;


/*
    In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, salary_year_avg, and job_schedule_type columns.
     Order by job_id in ascending order. Only return ‘Full-time’ jobs.
*/


SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg,
    job_schdule_type
FROM
    job_postings_fact
WHERE
    job_schdule_type = 'Full-time'
ORDER BY 
    job_id ASC;


/*
    In the job_postings_fact table get the job_id, job_title_short, job_location, job_via,  job_schedule_type, and salary_year_avg columns.
     Order by job_id in ascending order. Only look at jobs that are not ‘Part-time’ jobs.
*/

SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    job_schdule_type
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_schdule_type !='Part-time'
ORDER BY    
    job_id ASC;


/*
    In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns.
     Order by job_id in ascending order. Only look at jobs that are not posted ‘via LinkedIn’.
*/


SELECT 
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE 
    job_via!= 'via LinkedIn'
ORDER BY
    job_id ASC;



/*
    In the job_postings_fact table only get jobs that have an average yearly salary of $65,000 or greater.
    Also get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Order by job_id in ascending order.
*/


SELECT 
    job_id, 
    job_title_short, 
    job_location, job_via, 
    salary_year_avg
FROM 
    job_postings_fact
WHERE 
    salary_year_avg >= 65000
ORDER BY 
    job_id;


/*
    Return only Data Engineer’ jobs located within the ‘United States’ from the job_postings_fact table. 
    Also get the job_id, job_title_short, job_location, job_via and salary_year_avg columns. Order by job_id in ascending order.
*/



SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via ,
    salary_year_avg columns
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Engineer' and job_location = 'United States'
ORDER BY
    job_id ASC;


/*
    In the job_postings_fact table let’s look at jobs that are either ‘Full-Time’ or ‘Contractor’ jobs.
    And return the job_id, job_title_short, job_location, job_via, salary_year_avg, and job_schedule_type columns. Order by job_id in ascending order.
*/



SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via, 
    salary_year_avg, 
    job_schdule_type
FROM 
    job_postings_fact
WHERE
    job_schdule_type = 'Full-Time' OR job_schdule_type = 'Contractor'
ORDER BY 
    job_id;





/*
    Only return jobs with a salary between (inclusive) $50,000 and $70,000 from the job_postings_fact table.
     And get the job_id, job_title_short, job_location, job_via and salary_year_avg columns. Order by job_id in ascending order.
*/

SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    salary_year_avg >= 55000 AND salary_year_avg <= 70000
ORDER BY 
    job_id;



SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    salary_year_avg between 55000 AND  70000
ORDER BY 
    job_id;



/* 
    Return job_title_short that are ‘Data Analyst’, ‘Data Scientist’ or ‘Business Analyst’ roles from
     the job_postings_fact table using the IN operator. Also, return the job_id, job_title_short, job_location,
      job_via and salary_year_avg columns. Order by job_id in ascending order.
*/

SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    job_title_short in ('Data Analyst', 'Data Scientist', 'Business Analyst')
ORDER BY
    job_id;


/* 
  In the job_postings_fact table look at Data Analyst jobs whose average yearly salary range is between $50,000 and $75,000. 
  Return the job_id, job_title_short, job_location and salary_year_avg. Order by job_id in ascending order.
*/


SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg  BETWEEN 50000 AND 70000
ORDER BY 
        job_id;


/* 
  In the job_postings_fact table look at Data Analyst and Business Analyst jobs whose average yearly salary range is greater than $75,000. 
  Return the job_id, job_title_short, job_location, salary_year_avg, and job_schedule_type. Order by job_id in ascending order.
*/



SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via,
    salary_year_avg,
    job_schdule_type
FROM
    job_postings_fact
WHERE 
    job_title_short in('Data Analyst', 'Business Analyst')
    AND salary_year_avg > 75000
ORDER BY
    job_id;

