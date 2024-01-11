SELECT gender, age, COUNT(gender) 
FROM employeedemographics
GROUP BY gender, age

--2. Counting the number of Gender above the age of 30

SELECT Gender, COUNT (Gender)
FROM employeedemographics
WHERE Age> 31
GROUP BY Gender

--3 Arranging in descending order the gender and ages in the dataset

SELECT *
FROM Employeedemographics
ORDER BY Age DESC, Gender DESC

SELECT *
FROM Employeedemographics
ORDER BY 3 DESC, 4 DESC

--4 Joining the employeedemographics and employeesalary table

SELECT *
FROM employeedemographics
JOIN employeesalary 
ON employeedemographics.employeeid = employeesalary.employeeid

--5 Inserting additional values to both datasets

INSERT INTO employeedemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male');

INSERT INTO Employeesalary VALUES
(1010, NULL, 47000),
(NULL, 'salesman', 43000);


--6 Applying full outer join to both datasets

SELECT *
FROM employeedemographics
FULL OUTER JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid

--7  Applying left outer join to both datasets

SELECT *
FROM employeedemographics
LEFT OUTER JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid

--8 Applying right outer join to both datasets

SELECT *
FROM employeedemographics
RIGHT OUTER JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid

--9 sorting out various column headings and applying various joins

SELECT employeedemographics.employeeid, first_name, last_name, job_title, salary
FROM employeedemographics
JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid

SELECT employeesalary.employeeid, first_name, last_name, job_title, salary
FROM employeedemographics
RIGHT OUTER JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid

SELECT employeedemographics.employeeid, first_name, last_name, job_title, salary
FROM employeedemographics
RIGHT OUTER JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid

SELECT employeedemographics.employeeid, first_name, last_name, job_title, salary
FROM employeedemographics
LEFT OUTER JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid

SELECT employeesalary.employeeid, first_name, last_name, job_title, salary
FROM employeedemographics
LEFT OUTER JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid

--8 Assuming Michael Scott what to deduct from the salry of his highest paid employee to offset a debt.

SELECT employeedemographics.employeeid, first_name, last_name, salary
FROM employeedemographics JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid
WHERE first_name <> 'Michael'
ORDER BY salary DESC

--9 Calculating the average salary of a salesman

SELECT job_title, ROUND (AVG(salary), 2)
FROM employeedemographics JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid
WHERE job_title = 'salesman'
GROUP BY job_title

-- Inserting new table called warehouse_employeedemographics

CREATE TABLE warehouse_employeedemographics(
EmployeeID INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
age int,
gender VARCHAR(50)
);

INSERT INTO warehouse_employeedemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female');

SELECT *
FROM warehouse_employeedemographics













