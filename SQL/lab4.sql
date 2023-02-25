use Restaurant
go






----------------------------------------------------------------------------------------------a
create or alter function checkInt(@number int)
returns int as
begin
	declare @check int = 0
	if @number>=0 and @number<=100
		set @check=1
	else
		set @check=0
	return @check
end
go


create or alter function checkVarchar(@word varchar(50))
returns bit as
begin
	declare @check bit
	if @word like '[a-z]%[a-z]'
		set @check=1
	else
		set @check=0
	return @check
end
go



create or alter procedure addRezervare @a int, @b varchar(50), @c varchar(50), @d int, @e tinyint, @f bit
AS
	Begin
		if dbo.checkInt(@d)=1 and dbo.checkVarchar(@c)=1 
--		dbo = data base owner server-level principal that has full access to the owned database
		begin
			INSERT INTO Rezervare(ID, Nume, Prenume, NumarTelefon, LunaRezervare, Vaccinati) Values (@a, @b, @c, @d, @e, @f)
			print 'value added'
			select * from Rezervare
		end
		else
		begin
			print 'the parameters are not correct'
			select * from Rezervare
		end
	end
go

----------------------------------------------------------------------------------------------b
create view vAll
as
	SELECT t.NumberOfChairs, sp.Spaghetti, p.Diavola, s.Tomato
	from tablee t inner join SpaghettiTypes sp on t.TableNumber=sp.SpaghettiID
	inner join PizzaTypes p on p.PizzaID=t.TableNumber
	inner join SoupTypes s on p.PizzaID=s.SoupID
	where NumberOfChairs>5
go
select * from vAll


----------------------------------------------------------------------------------------------c
create table LogTable (
logID int primary key identity,
TriggerDate Date,
TriggerType varchar(50),
AffectedTable varchar(50),
nrRecordsModified int
)
go

create trigger InsertSpaghetti on SpaghettiTypes for insert 
as
begin
	insert into LogTable values(getdate(), 'INSERT', 'SpaghettiTypes', @@ROWCOUNT)
end
go

create trigger UpdateSpaghetti on SpaghettiTypes for update 
as
begin
	insert into LogTable values(getdate(), 'UPDATE', 'SpaghettiTypes', @@ROWCOUNT)
end
go

create trigger DeleteSpaghetti on SpaghettiTypes for delete 
as
begin
	insert into LogTable values(getdate(), 'DELETE', 'SpaghettiTypes', @@ROWCOUNT)
end
go
----------------------------------------------------------------------------------------------d
if exists (select name from sys.indexes where name='NonClusteredIndex')
	drop index NonClusteredIndex on Rezervare
go
create nonclustered index NonClusteredIndex on Rezervare(ID,Nume,Prenume,NumarTelefon,LunaRezervare,Vaccinati)
go

if exists (select name from sys.indexes where name='NonClusteredIndexOnPK')
	drop index NonClusteredIndexOnPK on Jewels
go
create nonclustered index NonClusteredIndexOnPK on Rezervare(ID,Nume,Prenume,NumarTelefon,LunaRezervare,Vaccinati)
go

select * from sys.indexes	