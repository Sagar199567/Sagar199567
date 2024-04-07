create database employee
create table employeedetails(empid int, fullname varchar(25), managerid int, dateofjoining date, city varchar(25))
create table employeesalary(empid int, project varchar(25), salary int, variable int)
select * from employeedetails
select * from employeesalary
insert into employeedetails values(121, 'john snow',321, '01/31/2019','toronto')
insert into employeesalary values(121, 'P1',8000,500)

select employeedetails
from employeedetails
Left Join employeesalary on employeedetails.empid = employeesalary.empid

SELECT employeedetails.*
FROM employeedetails
LEFT JOIN employeesalary ON employeedetails.empid = employeesalary.empid
WHERE employeesalary.empid IS NULL;

SELECT employeedetails.*
FROM employeedetails
LEFT JOIN employeesalary ON employeedetails.empid = employeesalary.project
WHERE employeesalary.project IS NULL;

SELECT *
FROM EmployeeDetails
WHERE year(dateofjoining) = 2020;

SELECT EmployeeDetails.*
FROM EmployeeDetails
JOIN EmployeeSalary ON Empl	oyeeDetails.empid = EmployeeSalary.empid;

SELECT Project, COUNT(EmpID) AS EmployeeCount
FROM Employeesalary
GROUP BY Project;

SELECT *
FROM EmployeeDetails
WHERE is_manager = 1;

SELECT ed.FullName, COALESCE(es.Salary, 'N/A') AS Salary
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId

SELECT EmpId, FullName, ManagerId, DateOfJoining, City, COUNT(*) AS DuplicateCount
FROM EmployeeDetails
GROUP BY EmpId, FullName, ManagerId, DateOfJoining, City
HAVING COUNT(*) > 1;

SELECT Salary
FROM EmployeeSalary
WHERE Salary < (
    SELECT MAX(Salary)
    FROM EmployeeSalary
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM EmployeeSalary
    )
)
ORDER BY Salary DESC
LIMIT 1;

SELECT EmpId, FullName
    FROM Employeedetails
    WHERE Managerid = 986;

SELECT DISTINCT(Project)
from employeesalary;

SELECT Count(*)
    FROM EmployeeSalary
    WHERE Project = 'P1';

SELECT Max(Salary), 
MIN(Salary),
AVG(Salary)
FROM EmployeeSalary;

SELECT Empid, Salary
    FROM EmployeeSalary
    WHERE Salary between 9000 and 15000 ;

	SELECT Empid, FullName, City, ManagerId
    FROM EmployeeDetails
    WHERE City = 'California' OR ManagerId = '321';
SELECT * 
    FROM EmployeeSalary;
	 SELECT Empid, Project
FROM EmployeeSalary
WHERE NOT Project = 'P1';
    
SELECT Empid, Project
FROM EmployeeSalary
WHERE Project <> 'P1';

SELECT Empid,
Salary + Variable AS TotalSalary
FROM EmployeeSalary; 

SELECT Empid, FullName
FROM EmployeeDetails
WHERE FullName LIKE '__hn%';

select EmpID from EmployeeDetails
union
select EmpID from EmployeeSalary

select * from EmployeeSalary
intersect
select * from EmployeeSalary;

select * from EmployeeSalary
minus
select * from EmployeeDetails;

select EmpID from EmployeeDetails
where EmpID in(select EmpID from EmployeeSalary);

select EmpID from EmployeeDetails 
where EmpID not in(select EmpID from EmployeeSalary);

SELECT INSTR(full_name,'J')
FROM EmployeeDetails;

SELECT CONCAT(EmpID,ManagerId) as NewID 
from EmployeeDetails;

SELECT (full_name,'%') 
from EmployeeDetails;

SELECT UPPER(fullname) AS UppercaseName, LOWER(city) AS LowercaseCity
FROM EmployeeDetails;

SELECT FullName, 
LENGTH(FullName) - LENGTH(REPLACE(FullName, 'n', ''))
FROM EmployeeDetails;

SELECT FullName, 
LENGTH(FullName) - LENGTH(REPLACE(FullName, 'n', ''))
FROM EmployeeDetails;

UPDATE EmployeeDetails 
SET FullName = LTRIM(RTRIM(FullName));

SELECT EmpId 
FROM EmployeeSalary 
WHERE Project IS NULL;

SELECT EmpId FROM EmployeeSalary 
WHERE Salary BETWEEN 5000 AND 10000;

SELECT NOW();

SELECT * FROM EmployeeDetails 
WHERE YEAR(DateOfJoining) = '2020';

SELECT * FROM EmployeeDetails E
WHERE EXISTS
(SELECT * FROM EmployeeSalary S 
WHERE  E.EmpId = S.EmpId);


SELECT Project, count(EmpId) EmpProjectCount
FROM EmployeeSalary
GROUP BY Project
ORDER BY EmpProjectCount DESC;

SELECT E.FullName, S.Salary 
FROM EmployeeDetails E 
LEFT JOIN 
EmployeeSalary S
ON E.EmpId = S.EmpId

SELECT empid, fullname
FROM employeedetails
JOIN employeesalary ON employeedetails.managerid = employeesalary.salary
JOIN TableC ON TableA.Column4 = TableC.Column4;