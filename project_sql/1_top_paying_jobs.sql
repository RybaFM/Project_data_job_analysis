-- What are top-paying data scientist jobs in Central Europe?

SELECT  
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE 
    job_title_short = 'Data Scientist' AND
    job_location IN ('Germany', 
                    'Poland', 
                    'Czechia', 
                    'Austria', 
                    'Hungary', 
                    'Slovakia', 
                    'Slovenia', 
                    'Switzerland', 
                    'Liechtenstein') AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10