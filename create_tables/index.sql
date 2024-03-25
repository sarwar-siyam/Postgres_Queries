/*
    Create indexes for better performance (speed) for my queries 
    !! DO NOR INDEY ALL COLUMNS

    Create indexes on FK columns 

*/

CREATE INDEX idx_company_id ON public.job_postings_fact (company_id);
CREATE INDEX idx_job_id ON public.skills_job_dim (job_id);
CREATE INDEX idx_skilL_id ON public.skills_job_dim (skill_id);