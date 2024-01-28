SELECT * FROM salaries;
SELECT * FROM v2salaries;

--  average salary for each year:
SELECT Year, AVG(Salary) AS average_salary
FROM salaries
GROUP BY Year;

-- average salary for different company sizes:
SELECT Company_Size, AVG(Salary) AS average_salary
FROM salaries
GROUP BY Company_Size;

-- top 5 highest paying companies:
SELECT Company_Location, MAX(Salary) AS highest_salary
FROM salaries
GROUP BY Company_Location
ORDER BY highest_salary DESC
LIMIT 5;


-- the total salary expenditure for each company location:
SELECT Company_Location, SUM(Salary) AS total_salary_expenditure
FROM salaries
GROUP BY Company_Location;

-- the average salary for each expertise level:
SELECT Expertise_Level, AVG(Salary) AS average_salary
FROM salaries
GROUP BY Expertise_Level;

-- the average salary for each experience level:
SELECT Experience_Level, AVG(Salary) AS average_salary
FROM salaries
GROUP BY Experience_Level;

-- the top 5 highest paying job titles:
SELECT Job_Title, MAX(Salary) AS highest_salary
FROM salaries
GROUP BY Job_Title
ORDER BY highest_salary DESC
LIMIT 5;

-- the total salary expenditure for each employment type:
SELECT Employment_Type, SUM(Salary) AS total_salary_expenditure
FROM salaries
GROUP BY Employment_Type;


-- the average salary for each job title:
SELECT Job_Title, AVG(Salary) AS average_salary
FROM salaries
GROUP BY Job_Title;


-- the total number of employees:
SELECT COUNT(*) AS total_employees FROM salaries;

-- Inner Join on Job Title:
SELECT e.*, d.*
FROM salaries e
INNER JOIN v2salaries d ON e.Job_Title = d.Job_Title;

-- Left Join to Include All Employees:
SELECT e.*, d.*
FROM salaries e
LEFT JOIN v2salaries d ON e.Job_Title = d.Job_Title;

-- Join on Multiple Conditions (Job Title and Company Location):
SELECT e.*, d.*
FROM salaries e
INNER JOIN v2salaries d ON e.Job_Title = d.Job_Title AND e.Company_Location = d.Company_Location;

-- Full Outer Join to Include All Rows from Both Tables:
SELECT e.*, d.*
FROM salaries e
FULL OUTER JOIN v2salaries d ON e.Job_Title = d.Job_Title;

-- Join with Aggregation (Average Salary for Each Job Title):
SELECT e.Job_Title, AVG(e.Salary) AS avg_salary_salaries, AVG(d.Salary) AS avg_salary_v2salaries
FROM salaries e
LEFT JOIN v2salaries d ON e.Job_Title = d.Job_Title
GROUP BY e.Job_Title;



-- UNION ALL
SELECT e.*, d.*
FROM salaries e
LEFT JOIN v2salaries d ON e.Job_Title = d.Job_Title
WHERE d.Job_Title IS NULL

UNION ALL

-- Records from v2salaries that don't have a match in salaries
SELECT e.*, d.*
FROM salaries e
RIGHT JOIN v2salaries d ON e.Job_Title = d.Job_Title
WHERE e.Job_Title IS NULL;


-- Records from v2salaries with matching records from salaries
SELECT e.*, d.*
FROM v2salaries d
LEFT JOIN salaries e ON e.Job_Title = d.Job_Title;


-- calculate average salary on expertires basis
select Expertise_Level, avg(salary) from salaries Group By Expertise_Level order by avg(salary) asc;
