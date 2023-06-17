/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT *
--FROM [SQL Tutor].dbo.EmployeeDemographics

--SELECT *
--FROM [SQL Tutor].dbo.EmployeeSalary


SELECT Jobtitle, COUNT (Jobtitle)
FROM [SQL Tutor].dbo.EmployeeDemographics
JOIN [SQL Tutor].dbo.EmployeeSalary
	ON EmployeeDemographics.EmplyeeID = EmployeeSalary.EmplyeeID
GROUP BY Jobtitle
HAVING COUNT (Jobtitle) > 1
	
	
SELECT Jobtitle, AVG(Salary)
FROM [SQL Tutor].dbo.EmployeeDemographics
JOIN [SQL Tutor].dbo.EmployeeSalary
	ON EmployeeDemographics.EmplyeeID = EmployeeSalary.EmplyeeID
GROUP BY Jobtitle
HAVING AVG (Salary) > 45000
ORDER BY AVG(Salary)
