-- counting total number of employees
SELECT COUNT(*) AS total_employees FROM  employee_records;

-- EMPLOYEES PER DEPARTMENT
SELECT Department, COUNT(*) AS department_count
FROM employee_records
GROUP BY Department;

-- MONTHLY HIRING TREND
SELECT MONTH(Joining_Date) AS month, COUNT(*) AS hires
FROM employee_records
GROUP BY MONTH
ORDER BY MONTH;

-- distinct position by country 
CREATE OR REPLACE VIEW position_by_country AS
SELECT DISTINCT Position, Country
FROM employee_records
ORDER BY Position, Country;

-- avg salary by position
CREATE OR REPLACE VIEW avg_salary_by_position AS
SELECT Position, AVG(Salary) AS average_salary
FROM employee_records
GROUP BY Position;

-- total salary by country
CREATE OR REPLACE VIEW total_salary_by_country AS
SELECT Country, SUM(Salary) AS total_salary
FROM employee_records
GROUP BY Country;

-- developer in India
CREATE OR REPLACE VIEW Developers_In_India AS
SELECT *
FROM employee_records
WHERE Position = 'Developer' AND Country = 'India';

-- recent joiners
-- CREATE OR REPLACE VIEW recent_joiners AS
SELECT *
FROM employee_records
WHERE Joining_Date >= CURDATE() - INTERVAL 30 DAY;
