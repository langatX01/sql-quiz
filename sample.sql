USE SQL_QUIZ;

INSERT INTO Departments (department_name)
VALUES
('Human Resources'),
('Finance'),
('IT'),
('Marketing'),
('Sales');

INSERT INTO Employees
(first_name, last_name, department_id, salary, hire_date, manager_id, date_of_birth)
VALUES
('John', 'Kamau', 3, 85000.00, '2021-01-15', NULL, '1990-05-10'),
('Mary', 'Wanjiku', 2, 72000.00, '2020-03-20', 1, '1992-08-12'),
('David', 'Otieno', 3, 95000.00, '2019-07-01', 1, '1988-11-30'),
('Sarah', 'Njeri', 1, 60000.00, '2022-02-10', 2, '1995-04-18'),
('Peter', 'Kiptoo', 5, 50000.00, '2023-01-05', 5, '1997-01-22'),
('Grace', 'Achieng', 4, 78000.00, '2021-06-14', 4, '1991-09-09'),
('Brian', 'Mutiso', 3, 90000.00, '2018-09-17', 1, '1987-02-25'),
('Faith', 'Chebet', 2, 67000.00, '2020-11-11', 2, '1993-12-15'),
('James', 'Mwangi', 5, 55000.00, '2022-08-01', 5, '1996-07-07'),
('Lucy', 'Atieno', 1, 62000.00, '2021-10-21', 2, '1994-10-03'),
('Kevin', 'Cheruiyot', 3, 99000.00, '2017-05-30', 1, '1986-03-14'),
('Ann', 'Koech', 4, 81000.00, '2019-12-09', 4, '1990-06-20'),
('Samuel', 'Maina', 2, 73000.00, '2023-04-12', 2, '1998-01-18'),
('Diana', 'Muthoni', 5, 58000.00, '2022-06-25', 5, '1995-02-11'),
('Victor', 'Omondi', 3, 88000.00, '2020-09-08', 1, '1991-11-05');
