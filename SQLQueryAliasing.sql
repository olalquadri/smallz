/****** Script for SelectTopNRows command from SSMS  ******/
-- Aliasing

SELECT FirstName + ' ' + LastName AS FullName
FROM [SQL Tutor].dbo.EmployeeDemographics


SELECT AVG(Age) AS AverageAge
FROM [SQL Tutor].dbo.EmployeeDemographics

SELECT Demo.EmplyeeID, Sal.Salary
FROM [SQL Tutor].dbo.EmployeeDemographics AS Demo
JOIN [SQL Tutor].dbo.EmployeeSalary AS Sal
	ON Demo.EmplyeeID = Sal.EmplyeeID

SELECT Demo.EmplyeeID, Demo.FirstName, Demo.LastName, Sal.Salary, Sal.Jobtitle, Ware.Age
FROM [SQL Tutor].dbo.EmployeeDemographics AS Demo
LEFT JOIN [SQL Tutor].dbo.EmployeeSalary AS Sal
	ON Demo.EmplyeeID = Sal.EmplyeeID
LEFT JOIN [SQL Tutor].dbo.WareHouseEmployeeDemographics AS Ware
	ON Demo.EmplyeeID = Ware.EmployeeID