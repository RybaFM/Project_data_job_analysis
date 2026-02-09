# Introduction
In this prject I will be exploring Data Science job market in Central Europe. I will dive into top-paying roles, in-demand skills and the most optimal skills for Data Scientists.
SQL queries here: [poject_sql folder](/project_sql/)
# Background
The Data Science field continues to evolve rapidly, with new tools, cloud platforms, and machine learning frameworks emerging every year. Central Europe has become an increasingly competitive region for tech talent, making it important to understand which skills provide the greatest career advantage.
## This project aims to identify:
- The top-paying Data Science roles
- What skills do they require
- The most frequently requested skills
- The highest-paying skills
- The most optimal skills
# Tools I Used
- **SQL** – for data querying and aggregation.
- **PostgreSQL** - chosen database management system.
- **VS Code** – as the primary development environment for writing and testing queries.
- **Git & GitHub** – for version control and project tracking.
- **Python** – for data visualization and presenting insights in a clear and structured way.
# The Analysis
Each query in this section investigates a specific aspect of the Data Science job market in Central Europe — from identifying the highest-paying roles to analyzing the most demanded and most valuable skills.
### 1. Top Paying Data Scientist Jobs
To identify highest-paying roles I filtered data by position(Data Scientist) by location(Countries of Central Europe) and ordered by average yearly salary. This query shows the highest-paying positions in Central Europe market. 
```sql
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
```
The salary distribution ranges from approximately $120,000 to $187,000 per year, with most roles concentrated between $120,000 and $160,000, and one clear top position significantly above the rest (State Street in Poland). This indicates a relatively tight high-paying band, with executive-level roles pushing compensation higher.

Geographically, Poland dominates the list, hosting the majority of the top-paying roles. Germany appears twice, and Slovakia once, suggesting that Poland is currently the strongest market for high-compensation Data Science roles in Central Europe.

The companies offering these positions are primarily large international corporations and established tech firms, such as State Street, Stripe, SentinelOne, EY, and Delivery Hero, highlighting that global organizations lead the region in salary competitiveness.

![Top Paying Jobs](project_sql\plots\top_paying_jobs_plot.png)
*This chart shows the highest-paying Data Scientist jobs in Central Europe, with each bar representing a job title and its corresponding average annual salary in USD.*

### 2. Top Paying Data Scientist Jobs With Skills
### 3. Top Demanded Data Scientist Skills
### 4. Top Paying Data Scientist Skills
### 5. The Most Optimal Data Scientist Skills
# What I Learned
# Conclusions
