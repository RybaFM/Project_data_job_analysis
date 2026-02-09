-- What are the top skills based on salary?

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
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
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25

/*
The highest-paying skills are business intelligence and cloud/data engineering tools 
like Looker, Databricks, Tableau, Spark, Snowflake, and Azure. Skills like R, Airflow, 
SQL, and Power BI also command strong salaries. Core programming and data manipulation 
tools such as Python, Pandas, Git/GitHub, and BigQuery are slightly lower but still essential. 
Deep learning frameworks like PyTorch and TensorFlow have the lowest average salaries in this list, 
suggesting that in Central Europe, cloud, BI, and big data expertise currently pay more than 
pure deep learning skills.

[
  {
    "skills": "looker",
    "average_salary": "158000"
  },
  {
    "skills": "databricks",
    "average_salary": "153964"
  },
  {
    "skills": "tableau",
    "average_salary": "153586"
  },
  {
    "skills": "spark",
    "average_salary": "151811"
  },
  {
    "skills": "windows",
    "average_salary": "145000"
  },
  {
    "skills": "snowflake",
    "average_salary": "144843"
  },
  {
    "skills": "azure",
    "average_salary": "143664"
  },
  {
    "skills": "r",
    "average_salary": "142228"
  },
  {
    "skills": "airflow",
    "average_salary": "139532"
  },
  {
    "skills": "sql",
    "average_salary": "137618"
  },
  {
    "skills": "power bi",
    "average_salary": "131900"
  },
  {
    "skills": "aws",
    "average_salary": "128464"
  },
  {
    "skills": "gcp",
    "average_salary": "123116"
  },
  {
    "skills": "mxnet",
    "average_salary": "123064"
  },
  {
    "skills": "theano",
    "average_salary": "123064"
  },
  {
    "skills": "scala",
    "average_salary": "123064"
  },
  {
    "skills": "python",
    "average_salary": "121514"
  },
  {
    "skills": "pandas",
    "average_salary": "121000"
  },
  {
    "skills": "github",
    "average_salary": "120564"
  },
  {
    "skills": "bigquery",
    "average_salary": "119988"
  },
  {
    "skills": "git",
    "average_salary": "116021"
  },
  {
    "skills": "go",
    "average_salary": "112932"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "104676"
  },
  {
    "skills": "pytorch",
    "average_salary": "87676"
  },
  {
    "skills": "tensorflow",
    "average_salary": "87676"
  }
]

*/