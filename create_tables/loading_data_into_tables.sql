
-- GETTING THE DATA INSIDE MY TABLES THROUGHT PSQL TOOL 

\COPY company_dim FROM '/Users/siyamaghbar/Entwicklung/Postgres_Porject/csv_files/company_dim.csv' DELIMITER ',' CSV HEADER 

\COPY job_postings_fact FROM '/Users/siyamaghbar/Entwicklung/Postgres_Porject/csv_files/job_postings_fact.csv' DELIMITER ',' CSV HEADER 


\COPY skills_dim FROM '/Users/siyamaghbar/Entwicklung/Postgres_Porject/csv_files/skills_dim.csv' DELIMITER ',' CSV HEADER 


\COPY skills_job_dim FROM '/Users/siyamaghbar/Entwicklung/Postgres_Porject/csv_files/skills_job_dim.csv' DELIMITER ',' CSV HEADER 

