use Restaurant
go







create or alter procedure addingColumn						--ADDING A COLUMN
as
	alter table SpaghettiTypes
	add NumberOfNapkins int
	print 'Column has been added!'
go

create or alter procedure DeletingColumn					--DELETING A COLUMN
as
	alter table SpaghettiTypes
	drop column NumberOfNapkins
	print 'Column has been deleted! boom!'
go

create or alter procedure addingDefaultConstraint			--ADDING A CONSTAINT
as
	alter table SpaghettiTypes
	add constraint df_Garlicky default 'implicit' for Garlicky
	print 'Constraint has been created no problems!'
go

create or alter procedure DeletingDefaultConstraint				--DELETING A CONSTRAINT
as
	alter table SpaghettiTypes
	drop constraint df_Garlicky
	print 'Constraint has been created! sad face'
go

create or alter procedure CreatingTable							--CREATING TABLE
as
	create table SpecialDishOnTheHouse (
	IDassociated int primary key identity,
	Name varchar(50) default 'VIPname',
	Type varchar(50) default 'Special dish instructions',
	);
	print 'The tables has been succesfully created!'
go

create or alter procedure DeletingTable							--DELETING TABLE
as 
	drop table SpecialDishOnTheHouse 
	print 'The tables has been terminated!'
go

create or alter procedure CreateForeignKey						--CREATE FOREIGNKEY
as
	alter table SpecialDishOnTheHouse
	add constraint fk_TableAssociation foreign key(IDassociated) references tablee(TableNumber)
	print 'Foreign key created! fancy'
go

create or alter procedure RemoveForeignKey						--DELETE FOREIGNKEY
as
	alter table SpecialDishOnTheHouse
	drop constraint fk_TableAssociation
	print 'Foreign key deleted! must have been the wind'
go



								
								--Also, create a new table in which will be hold the current version of the database. 
								--For simplicity, the version of the database is assumed to be an integer number.




create table DataBaseVersion (
VersionNumber int							--table so we can keep track of the version
)
go
---------------------------------	
drop table DataBaseVersion					--in case we have to delete it
go
---------------------------------
create or alter procedure UpdateVersion							--table to update it
@newVersion int
as
	--update Versions set VersionNumber = @newVersion

	delete from DataBaseVersion
	insert into DataBaseVersion values (@newVersion)
	print 'Everything updated!'
go
insert into DataBaseVersion values (0)
---------------------------------
create or alter procedure DataBaseVersionModifier
@version int
as
	if(isnumeric(@version) = 0)
	begin
		raiserror('You did not enter an integer!', 16, 1)	
--It is the severity level of the error. The levels are from 11 - 20 which throw an error in SQL. The higher the level, the more severe the level and the transaction should be aborted.
--1 would be the state
		return -1
	end
	else if(@version < 0)
	begin
		raiserror('You did not enter a positive number!', 16, 1)
		return -1
	end
	else if(@version > 4)
	begin
		raiserror('You did not enter a valid version! It must be between 0 and 4!', 16, 1)
		return -1
	end
	else
	begin
		declare @current int = (select top 1 VersionNumber from DataBaseVersion)--check current version 
		if (@version = @current)--compare the versions
		begin
			print 'What do you want me to do? its the same version!'
			return -1
		end
		else
		begin
			while(@version != @current) --not the same, so we upgrade or downgrade
			begin 
				if (@version > @current)
				begin--updating
					set @current = @current + 1  --we must, because @current may be equal to 0

					if (@current = 1)
					begin
						exec addingColumn
					end

					if (@current = 2)
					begin
						exec addingDefaultConstraint
					end
					 
					if (@current = 3)
					begin
						exec CreatingTable
					end

					if (@current = 4)
					begin
						exec CreateForeignKey
					end
				
				if (@version < @current)
				begin --downgrading
					set @current = @current - 1
					if (@current = 1)
					begin 
						exec DeletingColumn
					end
					
					if (@current = 2)
					begin
						exec DeletingDefaultConstraint
					end
					
					if (@current = 3)
					begin
						exec DeletingTable
					end

					if (@current = 4)
					begin
						exec RemoveForeignKey
					end

					
				end
			end
		end
		exec UpdateVersion @version
		print 'Database has been updated! '
		print @version
		end
	end
go
