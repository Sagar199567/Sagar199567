create database EmployeeDetail

create table employeedetails(EmployeeID int, firstname varchar(25), lastname varchar(25), salary bigint, joiningdate date, department varchar(25), Gender varchar(55))

select * from employeedetails

insert into employeedetails values (1, 'vikas','ahlawat',600000,'2-12-2023 11:16','IT','Male')
insert into employeedetails values (2, 'nikita','Jain',530000,'2-14-2023 11:16','HR','Female')
insert into employeedetails values (3, 'Ashish','Kumar',1000000,'2-14-2023 11:16','IT','Male')
insert into employeedetails values (4, 'Nikhil','Sharma',480000,'2-15-2023 11:16','HR','Male')
insert into employeedetails values (5, 'anish','Kadian',600000,'2-16-2023 11:16','Paroll','Male')

select firstname from employeedetails

select upper(Firstname) as uppercase
from employeedetails

SELECT CONCAT(FirstName, ' ', LastName) AS Name
FROM employeedetails;

select * from employeedetails
where firstname ='vikas'

SELECT *
FROM EmployeeDetails
WHERE FirstName LIKE 'a%';

SELECT *
FROM EmployeeDetails
WHERE FirstName LIKE '[a-p]%';

SELECT *
FROM EmployeeDetails
WHERE FirstName LIKE '%h';

SELECT *
FROM EmployeeDetails
WHERE FirstName  not LIKE '[a-p]%';

SELECT *
FROM EmployeeDetails
WHERE Gender LIKE '_le' AND LEN(Gender) = 4;

Select * from employeedetails
where firstname like 'a%' and Len(Gender) = 5;

SELECT *
FROM EmployeeDetails
WHERE FirstName LIKE '%\%%';

Select Distinct(Department) from employeeDetails

Select max(salary) from employeedetails

Select min(salary) from employeedetails

SELECT CONVERT(VARCHAR(20),JoiningDate,106) from employeedetails

SELECT CONVERT(VARCHAR(20),JoiningDate,111) FROM EmployeeDetails

SELECT CONVERT(VARCHAR(20),JoiningDate,108) from employeedetails

SELECT DATEPART(YEAR, JoiningDate) FROM employeedetails

SELECT DATEPART(Month, JoiningDate) FROM employeedetails

Select GetDate()

SELECT GETUTCDATE()

SELECT FirstName, GETDATE() [Current Date], JoiningDate, DATEDIFF(MM,JoiningDate,GETDATE()) AS [Total Months] FROM EmployeeDetails

SELECT FirstName, GETDATE() [Current Date], JoiningDate, DATEDIFF(DD,JoiningDate,GETDATE()) AS [Total Months] FROM EmployeeDetails

SELECT * FROM 
Employeedetails 
where datepart(yyyy, joiningdate) = 2023

SELECT * FROM 
Employeedetails 
where datepart(mm, joiningdate) = 1

select count(*) from employeedetails

select top 1 * from employeedetails

select * from 
employeedetails where firstname IN('vikas','ashish','Nikhil')

select * from 
employeedetails where firstname not IN('vikas','ashish','Nikhil')

select rtrim(firstname) from employeedetails

select ltrim(firstname) from employeedetails

SELECT FirstName, case WHEN Gender = 'Male' THEN 'M' WHEN Gender = 'Female' THEN 'F' END AS [Gender]
from EmployeeDetails

SELECT 'Hello ' + FirstName FROM EmployeeDetails

SELECT * FROM EmployeeDetails WHERE Salary > 600000

SELECT * FROM EmployeeDetails WHERE Salary < 700000

SELECT * FROM EmployeeDetails WHERE Salary between 500000 and 600000

create table projectdetailtable(ProjectDetailsid int, employeedetailid int, projectname varchar(25))

insert into projectdetailtable values (1,1,'Task_Track')
insert into projectdetailtable values (2,1,'CLP')
insert into projectdetailtable values (3,1,'Surevey Management')
insert into projectdetailtable values (4,2,'HR Management')
insert into projectdetailtable values (5,3,'task track')
insert into projectdetailtable values (6,3,'GRS')
insert into projectdetailtable values (7,3,'DDS')
insert into projectdetailtable values (8,4,'HR Management')
insert into projectdetailtable values (9,6,'GL Management')

select * from projectdetailtable

SELECT Department, SUM(Salary) FROM EmployeeDetails
GROUP BY Department 

SELECT Department, SUM(Salary) FROM EmployeeDetails GROUP BY Department 
ORDER BY SUM(Salary) ASC

SELECT Department, SUM(Salary) FROM EmployeeDetails GROUP BY Department 
ORDER BY SUM(Salary) Desc

SELECT Department, SUM(Salary) AS [Total Salary] FROM EmployeeDetails GROUP BY Department ORDER BY SUM(Salary) DESC

SELECT Department, AVG(Salary) AS [Average Salary] FROM [EmployeeDetails] GROUP BY Department ORDER BY AVG(Salary) ASC

SELECT Department, MAX(Salary) AS [Average Salary] FROM [EmployeeDetails] GROUP BY Department ORDER BY MAX(Salary) ASC

SELECT Department, MIN(Salary) AS [Average Salary] FROM [EmployeeDetails] GROUP BY Department ORDER BY MIN(Salary) ASC

SELECT *
FROM Employeedetails
JOIN ProjectDetailtable ON Employeedetails.employeeid = ProjectDetailtable.employeedetailid;

SELECT FirstName,ProjectName FROM [EmployeeDetails] A INNER JOIN [ProjectDetailtable]B ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName

SELECT FirstName,ProjectName FROM [EmployeeDetails] A LEFT OUTER JOIN[ProjectDetailtable] B ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName 

SELECT FirstName, ISNULL(ProjectName,'-No Project Assigned') FROM[EmployeeDetails] A LEFT OUTER JOIN [ProjectDetailtable] B ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName 

SELECT FirstName,ProjectName FROM [EmployeeDetails] A RIGHT OUTER JOIN[ProjectDetailtable] B ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName

SELECT FirstName,ProjectName FROM [EmployeeDetails] A FULL OUTER JOIN[ProjectDetailtable] B ON A.EmployeeID = B.EmployeeDetailID ORDER BY FirstName 

Select EmployeeID, FirstName, ProjectName from [EmployeeDetails] E INNER JOIN[projectdetailtable]
P ON E.EmployeeID = P.EmployeeDetailID WHERE EmployeeID IN (SELECT EmployeeDetailID FROM [ProjectDetailtable] 
GROUP BY EmployeeDetailID HAVING COUNT(*) >1 ) 

SELECT *
FROM Employeedetails
CROSS JOIN ProjectDetailtable;
