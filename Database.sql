CREATE DATABASE SQL_QUIZ;
USE SQL_QUIZ;

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    manager_id INT,
    date_of_birth DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
