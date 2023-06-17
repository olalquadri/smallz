/****** Script for SelectTopNRows command from SSMS  ******/
-- UPDATE

SELECT *
FROM [SQL Tutor].dbo.EmployeeDemographics

UPDATE [SQL Tutor].dbo.EmployeeDemographics
SET EmplyeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax' 


UPDATE [SQL Tutor].dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax' 

-- DELETE

DELETE FROM [SQL Tutor].dbo.EmployeeDemographics
WHERE EmplyeeID = 1005

-- Do this before delete
SELECT *
FROM [SQL Tutor].dbo.EmployeeDemographics
WHERE EmplyeeID = 1005




