/****** Script for SelectTopNRows command from SSMS  ******/
-- Stored Procedure

 CREATE PROCEDURE TEST
 AS
 Select *
 from EmployeeDemographics

EXEC TEST

CREATE PROCEDURE temp_employee
AS
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmplyeeID = sal.EmplyeeID
group by JobTitle

Select * 
From #temp_employee

EXEC temp_employee

--modifying stored procedures
-- you can put parameters anywhere in a query
-- you can use as amany parameteras you like

ALTER PROCEDURE temp_employee
@JobTitle nvarchar(100)
AS
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmplyeeID = sal.EmplyeeID
where Jobtitle = @JobTitle
group by JobTitle

Select *
From #temp_employee

EXEC temp_employee @JobTitle = 'Salesman'