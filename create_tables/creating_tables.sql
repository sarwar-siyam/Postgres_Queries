
-- CREATING THE TABLES THAT I NEED FOR MY QUERIES 

CREATE TABLE public.company_dim(
    company_id INT PRIMARY KEY,
    name TEXT, 
    link TEXT, 
    link_google TEXT,
    thumbnail TEXT
)

CREATE TABLE public.skills_dim(
    skill_id INT PRIMARY KEY,
    skils TEXT,
    type TEXT
)


CREATE TABLE public.job_postings_fact (
    job_id INT PRIMARY KEY,
    company_id INT , 
    job_title_short VARCHAR(255), 
    job_title TEXT, 
    job_location TEXT,
    job_via TEXT,
    job_schdule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT, 
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate NUMERIC,
    salary_year_avg NUMERIC,   -- I DID A MISTAKE, DATATYPE SHOULD BE TEXT SO I CHANGED IT ALTER TABLE job_postings_fact ALTER COLUMN salary_rate TYPE TEXT;

    salary_hour_avg NUMERIC,
    FOREIGN KEY (company_id) REFERENCES public.company_dim (company_id)

)


CREATE TABLE public.skills_job_dim (
    job_id INT ,
    skill_id INT
    PRIMARY KEY(job_id, skill_id)
    FOREIGN KEY (job_id) REFERENCES public.job_postings_fact (job_id)
    FOREIGN KEY (skill_id) REFERENCES public.skills_dim (skill_id)

)

