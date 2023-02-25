/*PRINT 2
DECLARE @A INT = 2
SET @A = 34
PRINT @A

IF @A<10 BEGIN --this is basically acolade
	PRINT 'OK'
	PRINT 'OK2'
END

ELSE
	PRINT 'NOT OK'

WHILE @A< 10 BEGIN
	PRINT @A
	SET @A=@A+1
END
*/
USE MASTER 
IF EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME = 'test_822_2')
	DROP DATABASE test_822_2
CREATE DATABASE test_822_2;
go

USE test_822_2
GO

CREATE TABLE carti(
	Id INT PRIMARY KEY,
	Titlu varchar(50),
	Editura varchar(50)
);
go

CREATE TABLE autori(
	Id SMALLINT PRIMARY KEY,
	Nume NVARCHAR(30),
	Prenume NVARCHAR(30)
)
go

CREATE TABLE telefoane(
	Id int PRIMARY KEY,
	Nr_Telefon char(30),
	Id_autori smallint foreign key references autori(Id) on update no action on delete no action,
)
go

CREATE TABLE carti_autori(
	Id_autor smallint foreign key references autori(Id),
	Id_carte int foreign key references carti(Id),
	Primary key(Id_autor, Id_carte)
)
go