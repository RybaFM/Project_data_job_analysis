-- What skills are required for these top paying DS jobs?
-- That will help us to understand which skills we must have to get hign-paying jobs in DS

WITH top_paying_jobs_in_CE AS (
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
)
SELECT
    top_paying_jobs_in_CE.*,
    skills
FROM top_paying_jobs_in_CE
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs_in_CE.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC

/*
The most common skills required across these top Central Europe jobs are Python and SQL, 
which appear almost everywhere. Many roles also expect knowledge of R, Spark, and big data/cloud platforms 
like AWS, Azure, GCP, Databricks, and Snowflake. Tableau, Power BI, and Looker are frequently mentioned for 
visualization, and Airflow, Git, and GitHub are common for workflow and version control. For more advanced roles, 
familiarity with machine learning and deep learning frameworks like scikit-learn, TensorFlow, PyTorch, MXNet, and 
Theano is often expected.

[
  {
    "job_id": 287425,
    "job_title": "Corporate Audit, AVP – Full Stack Data Scientist",
    "company_name": "State Street",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186928.0",
    "job_posted_date": "2023-11-16 14:16:23",
    "skills": "sql"
  },
  {
    "job_id": 287425,
    "job_title": "Corporate Audit, AVP – Full Stack Data Scientist",
    "company_name": "State Street",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186928.0",
    "job_posted_date": "2023-11-16 14:16:23",
    "skills": "azure"
  },
  {
    "job_id": 287425,
    "job_title": "Corporate Audit, AVP – Full Stack Data Scientist",
    "company_name": "State Street",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186928.0",
    "job_posted_date": "2023-11-16 14:16:23",
    "skills": "databricks"
  },
  {
    "job_id": 287425,
    "job_title": "Corporate Audit, AVP – Full Stack Data Scientist",
    "company_name": "State Street",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186928.0",
    "job_posted_date": "2023-11-16 14:16:23",
    "skills": "aws"
  },
  {
    "job_id": 287425,
    "job_title": "Corporate Audit, AVP – Full Stack Data Scientist",
    "company_name": "State Street",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186928.0",
    "job_posted_date": "2023-11-16 14:16:23",
    "skills": "snowflake"
  },
  {
    "job_id": 287425,
    "job_title": "Corporate Audit, AVP – Full Stack Data Scientist",
    "company_name": "State Street",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186928.0",
    "job_posted_date": "2023-11-16 14:16:23",
    "skills": "tableau"
  },
  {
    "job_id": 103329,
    "job_title": "Data Scientist, Global Selling",
    "company_name": "Stripe",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "171121.0",
    "job_posted_date": "2023-10-20 18:18:47",
    "skills": "sql"
  },
  {
    "job_id": 103329,
    "job_title": "Data Scientist, Global Selling",
    "company_name": "Stripe",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "171121.0",
    "job_posted_date": "2023-10-20 18:18:47",
    "skills": "python"
  },
  {
    "job_id": 103329,
    "job_title": "Data Scientist, Global Selling",
    "company_name": "Stripe",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "171121.0",
    "job_posted_date": "2023-10-20 18:18:47",
    "skills": "r"
  },
  {
    "job_id": 103329,
    "job_title": "Data Scientist, Global Selling",
    "company_name": "Stripe",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "171121.0",
    "job_posted_date": "2023-10-20 18:18:47",
    "skills": "spark"
  },
  {
    "job_id": 437705,
    "job_title": "Analytics Engineer",
    "company_name": "Palta",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "158500.0",
    "job_posted_date": "2023-12-17 01:11:25",
    "skills": "sql"
  },
  {
    "job_id": 437705,
    "job_title": "Analytics Engineer",
    "company_name": "Palta",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "158500.0",
    "job_posted_date": "2023-12-17 01:11:25",
    "skills": "python"
  },
  {
    "job_id": 437705,
    "job_title": "Analytics Engineer",
    "company_name": "Palta",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "158500.0",
    "job_posted_date": "2023-12-17 01:11:25",
    "skills": "snowflake"
  },
  {
    "job_id": 437705,
    "job_title": "Analytics Engineer",
    "company_name": "Palta",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "158500.0",
    "job_posted_date": "2023-12-17 01:11:25",
    "skills": "airflow"
  },
  {
    "job_id": 437705,
    "job_title": "Analytics Engineer",
    "company_name": "Palta",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "158500.0",
    "job_posted_date": "2023-12-17 01:11:25",
    "skills": "tableau"
  },
  {
    "job_id": 437705,
    "job_title": "Analytics Engineer",
    "company_name": "Palta",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "158500.0",
    "job_posted_date": "2023-12-17 01:11:25",
    "skills": "power bi"
  },
  {
    "job_id": 437705,
    "job_title": "Analytics Engineer",
    "company_name": "Palta",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "158500.0",
    "job_posted_date": "2023-12-17 01:11:25",
    "skills": "looker"
  },
  {
    "job_id": 47351,
    "job_title": "Data Scientist (Senior or Staff) - Data, Analytics and Governance",
    "company_name": "SentinelOne",
    "job_location": "Slovakia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-09-06 12:50:58",
    "skills": "sql"
  },
  {
    "job_id": 47351,
    "job_title": "Data Scientist (Senior or Staff) - Data, Analytics and Governance",
    "company_name": "SentinelOne",
    "job_location": "Slovakia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-09-06 12:50:58",
    "skills": "python"
  },
  {
    "job_id": 47351,
    "job_title": "Data Scientist (Senior or Staff) - Data, Analytics and Governance",
    "company_name": "SentinelOne",
    "job_location": "Slovakia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-09-06 12:50:58",
    "skills": "bigquery"
  },
  {
    "job_id": 47351,
    "job_title": "Data Scientist (Senior or Staff) - Data, Analytics and Governance",
    "company_name": "SentinelOne",
    "job_location": "Slovakia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-09-06 12:50:58",
    "skills": "gcp"
  },
  {
    "job_id": 47351,
    "job_title": "Data Scientist (Senior or Staff) - Data, Analytics and Governance",
    "company_name": "SentinelOne",
    "job_location": "Slovakia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-09-06 12:50:58",
    "skills": "windows"
  },
  {
    "job_id": 47351,
    "job_title": "Data Scientist (Senior or Staff) - Data, Analytics and Governance",
    "company_name": "SentinelOne",
    "job_location": "Slovakia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-09-06 12:50:58",
    "skills": "tableau"
  },
  {
    "job_id": 47351,
    "job_title": "Data Scientist (Senior or Staff) - Data, Analytics and Governance",
    "company_name": "SentinelOne",
    "job_location": "Slovakia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-09-06 12:50:58",
    "skills": "looker"
  },
  {
    "job_id": 741194,
    "job_title": "Data Scientist",
    "company_name": "Opera",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-04-07 07:36:12",
    "skills": "sql"
  },
  {
    "job_id": 741194,
    "job_title": "Data Scientist",
    "company_name": "Opera",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "157500.0",
    "job_posted_date": "2023-04-07 07:36:12",
    "skills": "git"
  },
  {
    "job_id": 236936,
    "job_title": "Data Scientist (Data Science Hub)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-08 10:37:36",
    "skills": "sql"
  },
  {
    "job_id": 236936,
    "job_title": "Data Scientist (Data Science Hub)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-08 10:37:36",
    "skills": "python"
  },
  {
    "job_id": 236936,
    "job_title": "Data Scientist (Data Science Hub)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-08 10:37:36",
    "skills": "bigquery"
  },
  {
    "job_id": 236936,
    "job_title": "Data Scientist (Data Science Hub)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-08 10:37:36",
    "skills": "gcp"
  },
  {
    "job_id": 236936,
    "job_title": "Data Scientist (Data Science Hub)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-08 10:37:36",
    "skills": "windows"
  },
  {
    "job_id": 236936,
    "job_title": "Data Scientist (Data Science Hub)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-08 10:37:36",
    "skills": "tableau"
  },
  {
    "job_id": 28648,
    "job_title": "Data Scientist (S&OP)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-06 11:18:21",
    "skills": "sql"
  },
  {
    "job_id": 28648,
    "job_title": "Data Scientist (S&OP)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-06 11:18:21",
    "skills": "r"
  },
  {
    "job_id": 28648,
    "job_title": "Data Scientist (S&OP)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-06 11:18:21",
    "skills": "gcp"
  },
  {
    "job_id": 28648,
    "job_title": "Data Scientist (S&OP)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-06 11:18:21",
    "skills": "spark"
  },
  {
    "job_id": 28648,
    "job_title": "Data Scientist (S&OP)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "132500.0",
    "job_posted_date": "2023-06-06 11:18:21",
    "skills": "tableau"
  },
  {
    "job_id": 713351,
    "job_title": "Data Scientist",
    "company_name": "EY",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "123064.0",
    "job_posted_date": "2023-12-24 08:08:55",
    "skills": "python"
  },
  {
    "job_id": 713351,
    "job_title": "Data Scientist",
    "company_name": "EY",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "123064.0",
    "job_posted_date": "2023-12-24 08:08:55",
    "skills": "scala"
  },
  {
    "job_id": 713351,
    "job_title": "Data Scientist",
    "company_name": "EY",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "123064.0",
    "job_posted_date": "2023-12-24 08:08:55",
    "skills": "r"
  },
  {
    "job_id": 713351,
    "job_title": "Data Scientist",
    "company_name": "EY",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "123064.0",
    "job_posted_date": "2023-12-24 08:08:55",
    "skills": "azure"
  },
  {
    "job_id": 713351,
    "job_title": "Data Scientist",
    "company_name": "EY",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "123064.0",
    "job_posted_date": "2023-12-24 08:08:55",
    "skills": "tensorflow"
  },
  {
    "job_id": 713351,
    "job_title": "Data Scientist",
    "company_name": "EY",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "123064.0",
    "job_posted_date": "2023-12-24 08:08:55",
    "skills": "pytorch"
  },
  {
    "job_id": 713351,
    "job_title": "Data Scientist",
    "company_name": "EY",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "123064.0",
    "job_posted_date": "2023-12-24 08:08:55",
    "skills": "scikit-learn"
  },
  {
    "job_id": 713351,
    "job_title": "Data Scientist",
    "company_name": "EY",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "123064.0",
    "job_posted_date": "2023-12-24 08:08:55",
    "skills": "mxnet"
  },
  {
    "job_id": 713351,
    "job_title": "Data Scientist",
    "company_name": "EY",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "123064.0",
    "job_posted_date": "2023-12-24 08:08:55",
    "skills": "theano"
  },
  {
    "job_id": 797241,
    "job_title": "Data Scientist",
    "company_name": "HEINEKEN",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "121000.0",
    "job_posted_date": "2023-12-10 10:14:22",
    "skills": "python"
  },
  {
    "job_id": 797241,
    "job_title": "Data Scientist",
    "company_name": "HEINEKEN",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "121000.0",
    "job_posted_date": "2023-12-10 10:14:22",
    "skills": "azure"
  },
  {
    "job_id": 797241,
    "job_title": "Data Scientist",
    "company_name": "HEINEKEN",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "121000.0",
    "job_posted_date": "2023-12-10 10:14:22",
    "skills": "databricks"
  },
  {
    "job_id": 797241,
    "job_title": "Data Scientist",
    "company_name": "HEINEKEN",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "121000.0",
    "job_posted_date": "2023-12-10 10:14:22",
    "skills": "pandas"
  },
  {
    "job_id": 797241,
    "job_title": "Data Scientist",
    "company_name": "HEINEKEN",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "121000.0",
    "job_posted_date": "2023-12-10 10:14:22",
    "skills": "scikit-learn"
  },
  {
    "job_id": 643906,
    "job_title": "Data Scientist (all genders)",
    "company_name": "Delivery Hero",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "120564.0",
    "job_posted_date": "2023-11-10 15:35:24",
    "skills": "sql"
  },
  {
    "job_id": 643906,
    "job_title": "Data Scientist (all genders)",
    "company_name": "Delivery Hero",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "120564.0",
    "job_posted_date": "2023-11-10 15:35:24",
    "skills": "python"
  },
  {
    "job_id": 643906,
    "job_title": "Data Scientist (all genders)",
    "company_name": "Delivery Hero",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "120564.0",
    "job_posted_date": "2023-11-10 15:35:24",
    "skills": "go"
  },
  {
    "job_id": 643906,
    "job_title": "Data Scientist (all genders)",
    "company_name": "Delivery Hero",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "120564.0",
    "job_posted_date": "2023-11-10 15:35:24",
    "skills": "airflow"
  },
  {
    "job_id": 643906,
    "job_title": "Data Scientist (all genders)",
    "company_name": "Delivery Hero",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "120564.0",
    "job_posted_date": "2023-11-10 15:35:24",
    "skills": "git"
  },
  {
    "job_id": 643906,
    "job_title": "Data Scientist (all genders)",
    "company_name": "Delivery Hero",
    "job_location": "Germany",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "120564.0",
    "job_posted_date": "2023-11-10 15:35:24",
    "skills": "github"
  }
]

*/