USE pet_db;

-- --1--
CREATE VIEW v_dogs 
	AS SELECT Nick, Breed, Age, Last_name, First_name
	FROM Pet JOIN Owner ON Pet.Owner_ID = Owner.Owner_ID
			 JOIN Person ON Owner.Person_ID = Person.Person_ID
	WHERE Pet_Type_ID IN 
	(SELECT Pet_Type_ID 
	FROM Pet_Type
	WHERE Name = 'DOG')
	;
SELECT Nick, Last_Name FROM v_dogs
WHERE Breed = 'poodle';
DROP VIEW v_dogs;

-- --2--
CREATE VIEW v_employee_ranking
	AS SELECT Last_name, First_name, Done_tasks, Mark
	FROM Person JOIN Employee ON Person.Person_ID = Employee.Person_ID
	JOIN (SELECT Employee_ID, COUNT(*) AS Done_tasks, AVG(CAST(Mark AS real)) AS Mark
			FROM Order1
			WHERE Is_Done = 1
			GROUP BY Employee_ID) AS p1 ON Employee.Employee_ID = p1.Employee_ID
			;
SELECT * FROM v_employee_ranking
ORDER BY Mark DESC;
DROP VIEW v_employee_ranking;

-- --3--
CREATE VIEW v_customers
AS SELECT Last_name, First_name, Phone, Address
FROM Person RIGHT JOIN Owner ON Person.Person_ID = Owner.Person_ID;

UPDATE v_customers SET Address = '?'
WHERE Address = '';
SELECT * FROM v_customers;
DROP VIEW v_customers;