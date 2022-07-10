USE pet_db;
 -- 1
SELECT Pet.Nick, Pet_Type.Name AS Pet_Type
FROM Pet, Pet_Type
WHERE Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID AND Nick = 'Partizan';

-- 2
SELECT Pet.Nick, Pet.Breed, Pet.Age
FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
WHERE Pet_Type.Name = 'DOG';

-- 3
SELECT AVG(convert(decimal,Pet.Age)) AS Avg_age
FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
WHERE Pet_Type.Name = 'Cat';

-- 4 
SELECT Order1.Time_Order, Person.Last_Name
FROM Order1 JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
			JOIN Person ON Employee.Employee_ID = Person.Person_ID
WHERE Is_Done = 0;

-- 5
SELECT Person.First_Name, Person.Last_Name, Person.Phone
FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
		 JOIN Owner ON Pet.Pet_ID = Owner.Owner_ID
		 JOIN Person ON Owner.Owner_ID = Person.Person_ID
WHERE Pet_Type.Name = 'Dog';

-- 6
SELECT Pet_Type.Name, Pet.Nick
FROM Pet RIGHT JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID;

-- 7
---- Имя и фамилия хозяев, а также кличка животных которые имеют вакцину с названием "first"
SELECT Person.First_Name, Person.Last_Name, Pet.Nick
FROM Pet JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
		 JOIN Vacctination ON Pet.Pet_Type_ID = Vacctination.Pet_ID
		 JOIN Vacctination_Type ON Vacctination.Vacctination_Type_ID = Vacctination_Type.Vacctination_Type_ID
		 JOIN Owner ON Pet.Owner_ID = Owner.Owner_ID
		 JOIN Person ON Owner.Person_ID = Person.Person_ID
WHERE Vacctination_Type.Name = 'first';