-- 1. Find the second highest salary from the Employees table.
SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- 2. Find the duplicate records in a table.
SELECT first_name, last_name, COUNT(*) AS duplicates
FROM Employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- 3. Remove duplicate records from a table.
DELETE e1
FROM Employees e1
JOIN Employees e2
ON e1.first_name = e2.first_name
AND e1.last_name = e2.last_name
AND e1.employee_id > e2.employee_id;

-- 4. Find the top 5 highest salaries.
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 5;

-- 5. Find the Nth highest salary (Example: 3rd highest).
SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- 6. Fetch departments and their total salary expenditure.
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM Employees e
JOIN Departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 7. Find employees who joined in the last 6 months.
SELECT *
FROM Employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 8. Find employees who are not in any department.
SELECT *
FROM Employees
WHERE department_id IS NULL;

-- 9. Find the total number of employees in each department.
SELECT d.department_name, COUNT(*) AS total_employees
FROM Employees e
JOIN Departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 10. Pivot data to show department-wise employee count.
SELECT
SUM(CASE WHEN department_id = 1 THEN 1 ELSE 0 END) AS Human_Resources,
SUM(CASE WHEN department_id = 2 THEN 1 ELSE 0 END) AS Finance,
SUM(CASE WHEN department_id = 3 THEN 1 ELSE 0 END) AS IT,
SUM(CASE WHEN department_id = 4 THEN 1 ELSE 0 END) AS Marketing,
SUM(CASE WHEN department_id = 5 THEN 1 ELSE 0 END) AS Sales
FROM Employees;
