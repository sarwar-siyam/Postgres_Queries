
/*
	Create a table named data_science_jobs that will hold information about job postings. 
    Include the following columns: job_id (integer and primary key), job_title (text), company_name (text), and post_date (date).
*/


CREATE TABLE data_science_jobs(
    job_id INT PRIMARY KEY, 
    job_title TEXT, 
    company_name TEXT, 
    post_date DATE
) ;



/*
	Insert three job postings into the data_science_jobs table.
     Make sure each job posting has a unique job_id, a job_title, a company_name, and a post_date.
*/


INSERT INTO 
    data_science_jobs (job_id,job_title,company_name,post_date)
VALUES (1, 'Machine Learning Expert', 'Siyam AG', '2024-04-18'),
        (2, 'Data Analyst Expert', 'syscovery AG', '2024-04-19'),
        (3, 'Data Expert', 'Patryk AG', '2024-04-20');



/*
	Alter the data_science_jobs table to add a new Boolean column (uses True or False values) named remote.
*/


ALTER TABLE data_science_jobs add column
remote Boolean;



/*
	Rename the post_date column to posted_on from the data_science_job table.

*/


ALTER TABLE 
    data_science_jobs 
Rename 
    post_date 
TO 
    posted_on;


/*
    Modify the remote column so that it defaults to FALSE in the data_science_job table .


*/

-- this code sets all the current entry to false 
UPDATE 
    data_science_jobs
SET
    remote = FALSE;

-- this code sets all the entry so false that has no specify value


ALTER TABLE 
    data_science_jobs
ALTER COLUMN remote SET DEFAULT FALSE;

/*
	Drop the company_name column from the data_science_jobs table.

*/

ALTER TABLE data_science_jobs
Drop COLUMN company_name;


/*
	Update the job posting with the job_id = 2 . 
    Update the remote column for this job posting to TRUE in data_science_jobs.

*/

UPDATE 
    data_science_jobs
SET 
    remote = TRUE 
WHERE 
    job_id = 2 ;



/*
    Drop the data_science_jobs table 

*/


DROP TABLE data_science_jobs;
