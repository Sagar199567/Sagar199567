create database studentsss
create table students (studentid int, name varchar(25), surname varchar(25),birthdate date, gender varchar(25), class varchar(25), point int)
select * from students
insert into students values (1, 'sagar', 'juneja','1-1-01', 'M', 'science', 125)
insert into students values (2, 'Sam', 'abc','2-1-01', 'M', 'Maths', 126)
insert into students values (3, 'Son', 'der','3-1-01', 'M', 'science', 127)
insert into students values (4, 'Moon', 'rrr','4-1-01', 'M', 'SST', 128)
insert into students values (5, 'Sun', 'ttt','5-1-01', 'M', 'SSS', 129)
insert into students values (6, 'Soon', 'yyyy','6-1-01', 'M', 'MIT', 130)
insert into students values (7, 'Soon', 'yyyy','6-1-01', 'F', 'MIT', 130)
select surname, class
from students

select *
from students
where gender ='F'

Select Distinct class
from students

select * from students
where gender ='f' and class='10math'

SELECT name, surname, class
FROM students
WHERE class = '10Math' OR class = '10Sci';

SELECT name, surname, school
FROM students;

SELECT CONCAT(name, ' ', surname)
FROM students

SELECT *
FROM students
WHERE name LIKE 'A%';

SELECT *
FROM students
WHERE name LIKE 'E%' OR name LIKE 'S%' OR name LIKE 'R%';
