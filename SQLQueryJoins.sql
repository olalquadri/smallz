/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT *
--FROM [SQL Tutor].dbo.EmployeeDemographics

--SELECT *
--FROM [SQL Tutor].dbo.EmployeeSalary

--SELECT *
--FROM [SQL Tutor].dbo.EmployeeDemographics
--JOIN [SQL Tutor].dbo.EmployeeSalary
--	ON EmployeeDemographics.EmplyeeID = EmployeeSalary.EmplyeeID

--SELECT * 
--FROM [SQL Tutor].dbo.EmployeeDemographics
--FULL OUTER JOIN [SQL Tutor].dbo.EmployeeSalary
--	ON EmployeeDemographics.EmplyeeID = EmployeeSalary.EmplyeeID

--Insert into [SQL Tutor].dbo.EmployeeDemographics VALUES
--(1011, 'Tom', 'Hanks', 35, 'Male'),
--(1012, 'Kam', 'Keasley', 31, 'Female')   

--SELECT EmployeeDemographics.EmplyeeID, FirstName, LastName, Salary
--FROM [SQL Tutor].dbo.EmployeeDemographics
--INNER JOIN [SQL Tutor].dbo.EmployeeSalary
-- ON EmployeeDemographics.EmplyeeID = EmployeeSalary.EmplyeeID
--WHERE FirstName <> 'Micheal'
--ORDER BY Salary DESC


--SELECT Jobtitle, AVG(Salary)
--FROM [SQL Tutor].dbo.EmployeeDemographics
--INNER JOIN [SQL Tutor].dbo.EmployeeSalary
--	ON EmployeeDemographics.EmplyeeID = EmployeeSalary.EmplyeeID
--WHERE Jobtitle = 'Salesman'
--GROUP BY Jobtitle

--DELETE 
--FROM [SQL Tutor].dbo.EmployeeDemographics 
--WHERE FirstName = 'Kam'

--SELECT *
--FROM [SQL Tutor].dbo.EmployeeDemographics
--UNION ALL
--SELECT *
--FROM [SQL Tutor].dbo.WareHouseEmployeeDemographics

