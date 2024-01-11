-- Application of Temp (temporary) tables

CREATE temp TABLE temp_employee (
Employeeid int,
Job_title VARCHAR (100),
Salary INT
)

SELECT *
FROM temp_employee
ORDER BY employeeid ASC

INSERT INTO temp_employee VALUES
(1001, 'HR', 45000 )

INSERT INTO temp_employee
SELECT *
FROM employeesalary

DELETE 
FROM temp_employee
WHERE employeeid IS NULL

-- Creation of another temporary table

CREATE temp TABLE temp_employee2 (
jobtitle VARCHAR (50),
Employeeperjob INT,
Avgage INT,
Avgsalary INT);

SELECT *
FROM temp_employee2

INSERT INTO temp_employee2
SELECT job_title, COUNT(job_title), AVG(age), AVG(salary)
FROM employeedemographics AS demo JOIN employeesalary AS sal
ON demo.employeeid = sal.employeeid
GROUP BY job_title


SELECT *
FROM temp_employee2


-- Application of String Functions- TRIM, LTRIM, RTRIM, Replace, substring, upper, lower

CREATE TABLE employeeerrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

INSERT INTO employeeerrors VALUES 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

SELECT *
FROM employeeerrors

-- Using Trim

SELECT employeeid, TRIM(employeeid)AS IDTRIM
FROM employeeerrors

-- Using LTRIM & RTRIM

SELECT employeeid, LTRIM(employeeid)AS IDTRIM
FROM employeeerrors
UNION ALL
SELECT employeeid, RTRIM(employeeid)AS IDTRIM
FROM employeeerrors

-- Using Replace function

SELECT lastname, REPLACE (lastname, '- Fired', '') AS LastNameFixed
FROM employeeerrors

-- Using Substring function

SELECT firstname, SUBSTRING (firstname, 1, 3)
FROM employeeerrors

SELECT firstname, SUBSTRING (firstname, 3, 3)
FROM employeeerrors

-- Application of Fuzzy matching

SELECT err.firstname, SUBSTRING(err.firstname,1,3), demo.first_name,SUBSTRING(demo.first_name,1,3)
FROM employeeerrors AS err JOIN employeedemographics AS demo
ON SUBSTRING(err.firstname,1,3) = SUBSTRING(demo.first_name,1,3)

-- Using upper and lower functions

SELECT firstname, LOWER(firstname)
FROM employeeerrors

SELECT firstname, UPPER(firstname)
FROM employeeerrors

SELECT firstname, UPPER(firstname)
FROM employeeerrors
WHERE firstname IN ('Jimbo', 'TOby', 'Pamela')





