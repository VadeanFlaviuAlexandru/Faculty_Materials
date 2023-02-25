create database Lab2MIE
go
USE Lab2MIE
go
CREATE TABLE Groups(
Gid int primary key,
NoOfStudents int)
CREATE TABLE Students(
Sid int primary key,
Name varchar(50),
Mark float,
Gid int foreign key references Groups(Gid))
-- INSERT
insert into Groups(Gid, NoOfStudents) VALUES (821, 37)
insert into Groups VALUES (821, 37)
-- Msg 2627, Level 14, State 1, Line 17
-- Violation of PRIMARY KEY constraint 'PK__Groups__C51E13368CCF9C89'. 
Cannot insert duplicate key in object 'dbo.Groups'. The duplicate key 
value is (821).
-- The statement has been terminated.
insert into Groups VALUES (822, 23)
insert into Students(Sid, Name, Mark, Gid) values (1, 'Paul', 10, 921)
-- Msg 547, Level 16, State 0, Line 23
-- The INSERT statement conflicted with the FOREIGN KEY constraint 
"FK__Students__Gid__25869641". The conflict occurred in database 
"Lab2MIE", table "dbo.Groups", column 'Gid'.
-- The statement has been terminated.
insert into Students(Sid, Name, Mark, Gid) values (1, 'Paul', 10, 821),
(2, 'Cristi', 9, 821), (3, 'Tania', 8, 821)
insert into Groups values(823, 27) -- (1 row(s) affected)
insert into Students values (4, 'Mihai', 9,822)
select * from Groups
select * from Students
