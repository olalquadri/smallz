/****** Script for SelectTopNRows command from SSMS  ******/
-- Partition By

SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM [SQL Tutor].dbo.EmployeeDemographics Dem
JOIN [SQL Tutor].dbo.EmployeeSalary Sal
	ON Dem.EmplyeeID = Sal.EmplyeeID

-- Compaered to GROUP BY Stement 
SELECT FirstName, LastName, Gender, Salary,COUNT(Gender)
FROM [SQL Tutor].dbo.EmployeeDemographics Dem
JOIN [SQL Tutor].dbo.EmployeeSalary Sal
	ON Dem.EmplyeeID = Sal.EmplyeeID
GROUP BY FirstName, LastName, Gender, Salary

--This will work but will not give all the colums as seen in partition 
SELECT Gender, COUNT(Gender) 
FROM [SQL Tutor].dbo.EmployeeDemographics Dem
JOIN [SQL Tutor].dbo.EmployeeSalary Sal
	ON Dem.EmplyeeID = Sal.EmplyeeID
GROUP BY Gender