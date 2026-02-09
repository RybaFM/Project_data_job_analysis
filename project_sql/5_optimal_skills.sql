-- What are the most optimal skills to learn?
-- Skills with high demand and high average salary

-- solution using solutions of 3 and 4
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE 
        job_title_short = 'Data Scientist' AND
        salary_year_avg IS NOT NULL AND
        job_location IN ('Germany', 
                        'Poland', 
                        'Czechia', 
                        'Austria', 
                        'Hungary', 
                        'Slovakia', 
                        'Slovenia', 
                        'Switzerland', 
                        'Liechtenstein')
    GROUP BY skills_dim.skill_id
), average_salary AS (
    SELECT 
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE 
        job_title_short = 'Data Scientist' AND
        salary_year_avg IS NOT NULL AND
        job_location IN ('Germany', 
                        'Poland', 
                        'Czechia', 
                        'Austria', 
                        'Hungary', 
                        'Slovakia', 
                        'Slovenia', 
                        'Switzerland', 
                        'Liechtenstein')
    GROUP BY skills_dim.skill_id
)
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM skills_demand
INNER JOIN average_salary ON average_salary.skill_id = skills_demand.skill_id 
WHERE demand_count > 2
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 10;

-- solution rewrited more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL AND
    job_location IN ('Germany', 
                    'Poland', 
                    'Czechia', 
                    'Austria', 
                    'Hungary', 
                    'Slovakia', 
                    'Slovenia', 
                    'Switzerland', 
                    'Liechtenstein')
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 2
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 10;