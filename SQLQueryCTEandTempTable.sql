/****** Script for SelectTopNRows command from SSMS  ******/
-- CTE (Common Table expression) and Temp table

WITH CTE_Employee AS
(SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary 
FROM [SQL Tutor].dbo.EmployeeDemographics emp
JOIN [SQL Tutor].dbo.EmployeeSalary sal
	ON emp.EmplyeeID = sal.EmplyeeID
WHERE Salary > '45000'
)

SELECT *
FROM CTE_Employee                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

-- Temp Table

CREATE TABLE #Temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

SELECT *
FROM #Temp_Employee

INSERT INTO #Temp_Employee
SELECT *
FROM [SQL Tutor].dbo.EmployeeSalary

-- examples
DROP TABLE IF EXISTS #temp_employee2
Create table #temp_employee2 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)


Insert into #temp_employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM [SQL Tutor].dbo.EmployeeDemographics emp
JOIN [SQL Tutor].dbo.EmployeeSalary sal
	ON emp.EmplyeeID = sal.EmplyeeID
group by JobTitle

Select * 
From #temp_employee2

SELECT AvgAge * AvgSalary
from #temp_employee2
