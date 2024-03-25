/* 
    In the company_dim table find all company names that include ‘Tech’ immediately followed by any single character.
     Return the name column and return in ascending order by the company name.
*/



SELECT 
    name
FROM 
    company_dim
WHERE 
    name like ('%Tech_')
ORDER BY 
    name;



/* 
   Identify job postings in the job_postings_fact table where the job_title contains the pattern "a_a" anywhere in the title.
   Return the job_id and job_title columns. Order by job_id in ascending order.
*/



SELECT 
    job_id , 
    job_title
FROM
    job_postings_fact
WHERE
    job_title LIKE ('%a_a%')
ORDER BY
    job_id;




