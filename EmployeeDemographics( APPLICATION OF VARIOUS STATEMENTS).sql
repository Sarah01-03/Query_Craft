--1 Applying union to employeedemographics and warehouse_employeedemographics datasets

SELECT *
FROM employeedemographics
UNION ALL
SELECT *
FROM warehouse_employeedemographics
ORDER BY employeeid

--2 Applying union to employeedemographics and employeesalary datasets

SELECT employeeid, first_name, Age
FROM employeedemographics
UNION 
SELECT employeeid, job_title, salary
FROM employeesalary
ORDER BY employeeid

--3 Application of Case statements

SELECT first_name, last_name, Age
FROM employeedemographics
WHERE AGE IS NOT NULL
ORDER BY age

SELECT 
	first_name, 
	last_name, 
	Age,
	CASE
		WHEN age > 30 THEN 'old'
		ELSE 'young'
	END AS age_category
FROM employeedemographics
WHERE AGE IS NOT NULL
ORDER BY age

SELECT 
	first_name, 
	last_name, 
	Age,
	CASE
		WHEN age > 30 THEN 'old'
		WHEN age BETWEEN 27 AND 30 THEN 'young'
		ELSE 'baby'
	END AS age_category
FROM employeedemographics
WHERE AGE IS NOT NULL
ORDER BY age

--2 Application of Case statement for calculation

SELECT 
	first_name, 
	last_name, 
	job_title, 
	salary,
	CASE
		WHEN job_title = 'salesman' THEN salary + (salary * 0.10)
		WHEN job_title = 'Accountant' THEN salary + (salary * 0.05) 
		WHEN job_title = 'HR' THEN salary + (salary * 0.000001)
		ELSE salary + (salary * 0.03)
	END	AS salary_after_raise
FROM employeedemographics JOIN employeesalary 
ON employeedemographics.employeeid = employeesalary.employeeid

--3 Application of the "having" satatement

SELECT job_title, COUNT(job_title)
FROM employeedemographics JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY job_title
HAVING COUNT(job_title) > 1

SELECT job_title, AVG(salary)
FROM employeedemographics JOIN employeesalary
ON employeedemographics.employeeid = employeesalary.employeeid
GROUP BY job_title
HAVING AVG(salary) > 45000
ORDER BY AVG(salary)

--4 Application of the "Update" and "Delete" statement

SELECT *
FROM employeedemographics

UPDATE employeedemographics
SET Age = 31, gender = 'Female'
WHERE first_name = 'Holly' AND Last_name = 'Flax' 

UPDATE employeedemographics
SET Age = 31, gender = 'Female'
WHERE employeeid = 1012 

DELETE FROM employeedemographics
WHERE employeeid = 1005

-- Application of Aliasing on Columns (headings)

SELECT first_name AS Fname
FROM employeedemographics

SELECT CONCAT (first_name, ' ', last_name) AS Full_name
FROM employeedemographics

SELECT AVG(Age) AS average_age
FROM employeedemographics

-- Application of Aliasing on tables

SELECT demo.employeeid, sal.salary
FROM employeedemographics AS demo JOIN employeesalary AS sal
ON demo.employeeid = sal.employeeid

SELECT demo.employeeid, demo.first_name, demo.last_name
FROM employeedemographics AS demo LEFT JOIN employeesalary AS sal
ON demo.employeeid = sal.employeeid
LEFT JOIN warehouse_employeedemographics AS ware
ON ware.employeeid = demo.employeeid

-- Application of the "partition by" Statement

SELECT *
FROM employeedemographics AS demo JOIN employeesalary AS sal
ON demo.employeeid = sal.employeeid

SELECT first_name, last_name, gender, salary,
COUNT (gender) OVER (PARTITION BY gender) AS total_gender
FROM employeedemographics AS demo JOIN employeesalary AS sal
ON demo.employeeid = sal.employeeid

-- in comparison with the "group by" statement

SELECT first_name, last_name, gender, salary, COUNT (gender) 
FROM employeedemographics AS demo JOIN employeesalary AS sal
ON demo.employeeid = sal.employeeid
GROUP BY first_name, last_name, gender, salary

SELECT gender, COUNT (gender) 
FROM employeedemographics AS demo JOIN employeesalary AS sal
ON demo.employeeid = sal.employeeid
GROUP BY gender







