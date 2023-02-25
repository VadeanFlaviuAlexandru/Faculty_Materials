-----------------------------------------------------------------------------
delete from PizzaTypes
delete from SodaTypes
delete from tablee				--ca sa incep de la zero
delete from Rezervare

select*
from Rezervare, tablee, SodaTypes, PizzaTypes
-----------------------------------------------------------------------------



use Restaurant		--first step, since the database its already created
go					

-----------------------------------------INSERT

SET IDENTITY_INSERT Rezervare ON	--kinda needed this one before
insert into Rezervare(ID, Nume, Prenume, NumarTelefon, LunaRezervare, Vaccinati) VALUES (1, 'Vadean','Alex','0757482795',4,1)--some
insert into Rezervare(ID, Nume, Prenume, NumarTelefon, LunaRezervare, Vaccinati) VALUES (2, 'Moe','Eagle','0757534646',7,1)--values
insert into Rezervare(ID, Nume, Prenume, NumarTelefon, LunaRezervare, Vaccinati) VALUES (3, 'Obama','ObamaLastName','0757983933',1,1)--inserted
insert into Rezervare(ID, Nume, Prenume, NumarTelefon, LunaRezervare, Vaccinati) VALUES (4, 'Token','WallStreet','0757371123',12,1)
insert into Rezervare(ID, Nume, Prenume, NumarTelefon, LunaRezervare, Vaccinati) VALUES (5, 'Jack','Black','0757371987',3,1)
insert into Rezervare(ID, Nume, Prenume, NumarTelefon, LunaRezervare, Vaccinati) VALUES (6, 'Mihala','Ela','0757372987',9,0)
SET IDENTITY_INSERT Rezervare OFF

select * from Rezervare				-- too see the values in the table

SET IDENTITY_INSERT tablee ON
INSERT INTO tablee(TableNumber, NumberOfChairs, BigTable, EventTable,  id_table) VALUES (1,5,0,0,1)
INSERT INTO tablee(TableNumber, NumberOfChairs, BigTable, EventTable,  id_table) VALUES (2,2,0,0,2)
INSERT INTO tablee(TableNumber, NumberOfChairs, BigTable, EventTable,  id_table) VALUES (3,10,1,1,3)
INSERT INTO tablee(TableNumber, NumberOfChairs, BigTable, EventTable,  id_table) VALUES (4,4,0,0,4)
INSERT INTO tablee(TableNumber, NumberOfChairs, BigTable, EventTable,  id_table) VALUES (5,7,1,0,5)
INSERT INTO tablee(TableNumber, NumberOfChairs, BigTable, EventTable,  id_table) VALUES (6,15,0,0,6)
SET IDENTITY_INSERT tablee OFF

select * from tablee				-- too see the values in the table

SET IDENTITY_INSERT SodaTypes ON
INSERT INTO SodaTypes(SodaID, Cola, Sprite, Fanta, MountainDew, id_soda_types) VALUES (1,1,0,0,1,1)
INSERT INTO SodaTypes(SodaID, Cola, Sprite, Fanta, MountainDew, id_soda_types) VALUES (2,1,1,0,0,2)
INSERT INTO SodaTypes(SodaID, Cola, Sprite, Fanta, MountainDew, id_soda_types) VALUES (3,1,1,1,1,3)
INSERT INTO SodaTypes(SodaID, Cola, Sprite, Fanta, MountainDew, id_soda_types) VALUES (4,0,0,1,0,4)
INSERT INTO SodaTypes(SodaID, Cola, Sprite, Fanta, MountainDew, id_soda_types) VALUES (5,0,0,0,0,5)
SET IDENTITY_INSERT SodaTypes OFF

select * from SodaTypes				-- too see the values in the table

INSERT INTO PizzaTypes(PizzaID,Diavola,Pepperoni,California,Supreme,[Quattro Stagioni],Mexicana,Balado,id_pizza_type) VALUES (1,1,0,0,0,0,0,0,1)
INSERT INTO PizzaTypes(PizzaID,Diavola,Pepperoni,California,Supreme,[Quattro Stagioni],Mexicana,Balado,id_pizza_type) VALUES (2,1,1,0,0,0,0,0,2)
INSERT INTO PizzaTypes(PizzaID,Diavola,Pepperoni,California,Supreme,[Quattro Stagioni],Mexicana,Balado,id_pizza_type) VALUES (3,0,0,0,0,1,1,1,3)
INSERT INTO PizzaTypes(PizzaID,Diavola,Pepperoni,California,Supreme,[Quattro Stagioni],Mexicana,Balado,id_pizza_type) VALUES (4,0,0,0,1,0,0,0,4)
INSERT INTO PizzaTypes(PizzaID,Diavola,Pepperoni,California,Supreme,[Quattro Stagioni],Mexicana,Balado,id_pizza_type) VALUES (5,0,0,0,0,0,0,0,5)

select * from PizzaTypes			-- too see the values in the table


-----------------------------------------UPDATE


UPDATE Rezervare
SET Nume='REDACTED', Prenume='REDACTED',NumarTelefon=0000000000
WHERE Vaccinati=0

UPDATE tablee
Set BigTable=1,EventTable=1
WHERE NumberOfChairs>11 OR NumberOfChairs IS NOT NULL

UPDATE tablee
Set BigTable=1,EventTable=1
WHERE NumberOfChairs BETWEEN 10 AND 100

UPDATE Rezervare
SET Nume='Jackquin'
WHERE Nume LIKE 'J__%'

DELETE FROM Rezervare
WHERE Vaccinati = 0

----------------------------------------- SELECT QUERIES
SELECT *			--Shows name that start with V and has 3 characters or more. if not, then same thing with the letter O
FROM Rezervare
WHERE Nume like 'V__%'
UNION--OR
SELECT *
FROM Rezervare
WHERE Nume like 'O__%'

SELECT *			--Shows name that start with V and has 3 characters or more but also same thing with the letter T
FROM Rezervare
WHERE Nume like 'V__%'
INTERSECT--AND
SELECT *
FROM Rezervare
WHERE Nume like 'T__%'

SELECT *			--Shows name that start with M and has 3 characters or more but not showing if he/she is vaccinated
FROM Rezervare
WHERE Nume like 'M__%'
EXCEPT--in first, but not in second
SELECT *
FROM Rezervare
WHERE Vaccinati=0

SELECT *		--basically showing all the tuples if ID from rezervare = ID from SodaTypes,ordered by sodatypes.ID
FROM Rezervare INNER JOIN SodaTypes ON Rezervare.ID=SodaTypes.id_soda_types
ORDER BY SodaTypes.id_soda_types

SELECT *		--showing all the tuples on the left outer join if ID from rezervare = ID from SodaTypes
FROM Rezervare LEFT OUTER JOIN SodaTypes ON Rezervare.ID=SodaTypes.id_soda_types
ORDER BY SodaTypes.id_soda_types

SELECT DISTINCT *--showing all the tuples on the RIGHT outer join if ID from rezervare = ID from SodaTypes
FROM Rezervare RIGHT OUTER JOIN SodaTypes ON Rezervare.ID=SodaTypes.id_soda_types

SELECT TOP 3 Nume--showing all the tuples on the FULL outer join if ID from rezervare = ID from SodaTypes
FROM Rezervare FULL OUTER JOIN SodaTypes ON Rezervare.ID=SodaTypes.id_soda_types

SELECT r.ID, r.Nume, r.Prenume
FROM Rezervare r	--showing ID,Nume and Prenume if the person is not vaccinated OR if the ID is equal to the table
WHERE Vaccinati=0 OR r.ID in (SELECT t.id_table FROM tablee t)

SELECT r.ID, r.Nume, r.Prenume
FROM Rezervare r	--showing ID,Nume and Prenume if the person is vaccinated and if it exists the ID is equal to the table
WHERE Vaccinati=1 and EXISTS (SELECT *
							  FROM tablee t
							  WHERE r.ID=t.id_table)	

SELECT Rezervare.ID	-- showing all the tuples if ID from rezervare = ID from SodaTypes,groubed by sodatypes.ID
FROM Rezervare INNER JOIN SodaTypes ON Rezervare.ID=SodaTypes.id_soda_types
GROUP BY Rezervare.ID

SELECT tablee.NumberOfChairs -- showing all the tuples if ID from table = ID from SodaTypes,grouped by NumberOfChairs from the table but also it must have a specific average
FROM tablee INNER JOIN SodaTypes ON tablee.id_table=SodaTypes.id_soda_types
GROUP BY tablee.NumberOfChairs
HAVING AVG(tablee.NumberOfChairs)>4

SELECT tablee.NumberOfChairs	---- showing all the tuples if ID from table = ID from SodaTypes,grouped by NumberOfChairs from the table but also it must have a specific average
FROM tablee INNER JOIN SodaTypes ON tablee.id_table=SodaTypes.id_soda_types
GROUP BY tablee.NumberOfChairs
HAVING AVG(tablee.NumberOfChairs)>1+(
	SELECT AVG(Rezervare.ID)
	FROM Rezervare
)

SELECT * 
FROM (SELECT ID 
	FROM Rezervare
	WHERE Rezervare.ID=2) AS rezervare
