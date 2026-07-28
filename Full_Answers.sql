USE SQL_QUIZ;

-- 1. Find the second highest salary from the Employees table.
SELECT DISTINCT salary FROM Employees ORDER BY salary DESC LIMIT 1 OFFSET 1;

-- 2. Find the duplicate records in a table.
SELECT first_name,last_name,COUNT(*) AS duplicates
FROM Employees
GROUP BY first_name,last_name
HAVING COUNT(*)>1;

-- 3. Remove duplicate records from a table.
DELETE e1
FROM Employees e1
JOIN Employees e2
ON e1.first_name=e2.first_name
AND e1.last_name=e2.last_name
AND e1.employee_id>e2.employee_id;

-- 4. Find the top 5 highest salaries.
SELECT * FROM Employees ORDER BY salary DESC LIMIT 5;

-- 5. Find the Nth highest salary (Example: 3rd highest).
SELECT DISTINCT salary FROM Employees ORDER BY salary DESC LIMIT 1 OFFSET 2;

-- 6. Fetch departments and their total salary expenditure.
SELECT d.department_name,SUM(e.salary) AS total_salary
FROM Employees e
JOIN Departments d ON e.department_id=d.department_id
GROUP BY d.department_name;

-- 7. Find employees who joined in the last 6 months.
SELECT * FROM Employees
WHERE hire_date>=DATE_SUB(CURDATE(),INTERVAL 6 MONTH);

-- 8. Find employees who are not in any department.
SELECT * FROM Employees WHERE department_id IS NULL;

-- 9. Find the total number of employees in each department.
SELECT d.department_name,COUNT(*) AS total_employees
FROM Employees e
JOIN Departments d ON e.department_id=d.department_id
GROUP BY d.department_name;

-- 10. Pivot data to show department-wise employee count.
SELECT
SUM(CASE WHEN department_id=1 THEN 1 ELSE 0 END) AS Human_Resources,
SUM(CASE WHEN department_id=2 THEN 1 ELSE 0 END) AS Finance,
SUM(CASE WHEN department_id=3 THEN 1 ELSE 0 END) AS IT,
SUM(CASE WHEN department_id=4 THEN 1 ELSE 0 END) AS Marketing,
SUM(CASE WHEN department_id=5 THEN 1 ELSE 0 END) AS Sales
FROM Employees;

-- 11. Unpivot data from a table.
SELECT 'Human Resources' AS department, Human_Resources AS employee_count FROM DepartmentSummary
UNION ALL
SELECT 'Finance',Finance FROM DepartmentSummary
UNION ALL
SELECT 'IT',IT FROM DepartmentSummary
UNION ALL
SELECT 'Marketing',Marketing FROM DepartmentSummary
UNION ALL
SELECT 'Sales',Sales FROM DepartmentSummary;

-- 12. Find month-over-month revenue growth.
SELECT YEAR(sale_date),MONTH(sale_date),SUM(amount) AS revenue,
SUM(amount)-LAG(SUM(amount)) OVER(ORDER BY YEAR(sale_date),MONTH(sale_date)) AS revenue_growth
FROM Sales
GROUP BY YEAR(sale_date),MONTH(sale_date);

-- 13. Find the running total of sales by date.
SELECT sale_date,amount,SUM(amount) OVER(ORDER BY sale_date) AS running_total
FROM Sales;

-- 14. Find gaps in a sequence of numbers.
SELECT number+1 AS missing_number
FROM Numbers n1
WHERE NOT EXISTS(SELECT 1 FROM Numbers n2 WHERE n2.number=n1.number+1);

-- 15. Find the longest streak of consecutive login days for a user.
SELECT user_id,COUNT(*) AS streak
FROM(
SELECT user_id,login_date,
DATE_SUB(login_date,INTERVAL ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY login_date) DAY) grp
FROM Logins)t
GROUP BY user_id,grp
ORDER BY streak DESC;

-- 16. Find the first login date of each user.
SELECT user_id,MIN(login_date) AS first_login FROM Logins GROUP BY user_id;

-- 17. Find the last purchase of each customer.
SELECT customer_id,MAX(purchase_date) AS last_purchase FROM Orders GROUP BY customer_id;

-- 18. Find customers who bought in all months.
SELECT customer_id FROM Orders GROUP BY customer_id HAVING COUNT(DISTINCT MONTH(order_date))=12;

-- 19. Find products that were never ordered.
SELECT * FROM Products WHERE product_id NOT IN(SELECT DISTINCT product_id FROM Orders);

-- 20. Find employees earning more than the average salary.
SELECT * FROM Employees WHERE salary>(SELECT AVG(salary) FROM Employees);

-- 21. Find employees earning more than their department average salary.
SELECT * FROM Employees e
WHERE salary>(SELECT AVG(salary) FROM Employees WHERE department_id=e.department_id);

-- 22. Rank employees within each department by salary.
SELECT employee_id,first_name,department_id,salary,
RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM Employees;

-- 23. Find the top 3 salaries in each department.
SELECT * FROM(
SELECT *,DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) salary_rank
FROM Employees)t
WHERE salary_rank<=3;

-- 24. Find common records between two tables.
SELECT * FROM TableA INTERSECT SELECT * FROM TableB;

-- 25. Find records that are in one table but not in another.
SELECT * FROM TableA WHERE id NOT IN(SELECT id FROM TableB);

-- 26. Split a full name into first and last name.
SELECT SUBSTRING_INDEX(full_name,' ',1),SUBSTRING_INDEX(full_name,' ',-1) FROM Employees;

-- 27. Concatenate first and last name.
SELECT CONCAT(first_name,' ',last_name) AS full_name FROM Employees;

-- 28. Extract year, month and day from hire date.
SELECT YEAR(hire_date),MONTH(hire_date),DAY(hire_date) FROM Employees;

-- 29. Calculate age.
SELECT first_name,TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) AS age FROM Employees;

-- 30. Find working days in current month.
SELECT DAY(LAST_DAY(CURDATE()))-(WEEK(LAST_DAY(CURDATE()))-WEEK(DATE_SUB(LAST_DAY(CURDATE()),INTERVAL DAY(LAST_DAY(CURDATE()))-1 DAY)))*2 AS working_days;

-- 31. Find employees hired this year.
SELECT * FROM Employees WHERE YEAR(hire_date)=YEAR(CURDATE());

-- 32. Find employees hired in last 30 days.
SELECT * FROM Employees WHERE hire_date>=CURDATE()-INTERVAL 30 DAY;

-- 33. Find the oldest employee.
SELECT * FROM Employees ORDER BY date_of_birth LIMIT 1;

-- 34. Find the youngest employee.
SELECT * FROM Employees ORDER BY date_of_birth DESC LIMIT 1;

-- 35. Find employees whose names start with 'A'.
SELECT * FROM Employees WHERE first_name LIKE 'A%';

-- 36. Find employees whose names end with 'n'.
SELECT * FROM Employees WHERE first_name LIKE '%n';

-- 37. Find employees whose names contain 'a'.
SELECT * FROM Employees WHERE first_name LIKE '%a%';

-- 38. Display full names in uppercase.
SELECT UPPER(CONCAT(first_name,' ',last_name)) FROM Employees;

-- 39. Display full names in lowercase.
SELECT LOWER(CONCAT(first_name,' ',last_name)) FROM Employees;

-- 40. Find length of first name.
SELECT first_name,LENGTH(first_name) FROM Employees;

-- 41. Find employees with the same salary.
SELECT salary,COUNT(*) FROM Employees GROUP BY salary HAVING COUNT(*)>1;

-- 42. Find the total number of employees.
SELECT COUNT(*) AS total_employees FROM Employees;

-- 43. Find employees without a manager.
SELECT * FROM Employees WHERE manager_id IS NULL;

-- 44. Find employees with a manager.
SELECT * FROM Employees WHERE manager_id IS NOT NULL;

-- 45. Find the highest-paid employee in each department.
SELECT * FROM Employees e
WHERE salary=(SELECT MAX(salary) FROM Employees WHERE department_id=e.department_id);

-- 46. Find the lowest-paid employee in each department.
SELECT * FROM Employees e
WHERE salary=(SELECT MIN(salary) FROM Employees WHERE department_id=e.department_id);

-- 47. Find the average salary of each department.
SELECT department_id,AVG(salary) AS average_salary FROM Employees GROUP BY department_id;

-- 48. Find the department with the highest average salary.
SELECT department_id,AVG(salary) AS average_salary
FROM Employees GROUP BY department_id
ORDER BY average_salary DESC LIMIT 1;

-- 49. Find the total salary paid by each department.
SELECT department_id,SUM(salary) AS total_salary
FROM Employees GROUP BY department_id;

-- 50. Find the employee(s) with the highest salary.
SELECT * FROM Employees
WHERE salary=(SELECT MAX(salary) FROM Employees);
