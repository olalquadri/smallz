/****** Script for SelectTopNRows command from SSMS  ******/
-- Sub Queries ( inner query / nexted query) 

-- used to return data that will be used in the main query 

-- can be used in SELECT , UPDATE , FROM , WHERE , INSERT UPDATE and  DELETE


SELECT *
FROM EmployeeSalary

-- Subquery in SELECT

SELECT EmplyeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

 -- using partition by

SELECT EmplyeeID, Salary,  AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary


-- Group by does not work 

 SELECT EmplyeeID, Salary,  AVG(Salary) AS AllAvgSalary
FROM EmployeeSalary
GROUP BY EmplyeeID, Salary
ORDER BY 1,2

-- Subquery in from 
SELECT a.EmplyeeID, AllAvgSalary
FROM (SELECT EmplyeeID, Salary,  AVG(Salary) OVER () AS AllAvgSalary
	FROM EmployeeSalary) a

-- Subquery in Where 

SELECT EmplyeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmplyeeID in (
		SELECT EmplyeeID
		FROM EmployeeDemographics
		WHERE Age = 30)