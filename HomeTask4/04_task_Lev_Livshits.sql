USE pet_db;

-- Сколько имеется питомцев в возрасте 1 год, 2 года, и т.д.
SELECT Age, COUNT(*) AS Numbet_of_pets_aged FROM Pet
GROUP BY Age;

-- Сколько имеется котов, собак и т.д. в возрасте 1 год, 2 года, и т.д.
SELECT Age, Pet_Type.Name, COUNT(*) AS Number_of_pets
FROM Pet LEFT JOIN Pet_Type ON Pet_Type.Pet_Type_ID = Pet.Pet_Type_ID
GROUP BY Age, Pet_Type.Name;

-- Виды питомцев, средний возраст которых меньше шести лет
SELECT Pet_Type.Name, AVG(CAST (Age AS real)) AS Avg_age_in_pet_type
FROM Pet LEFT JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
GROUP BY Pet_Type.Name
HAVING AVG (Age) < 6;

-- Фамилии сотрудников, выполнивших более пяти заказов
SELECT Person.Last_Name, COUNT(*) AS Orders_completed
FROM Person RIGHT JOIN Employee ON Person.Person_ID = Employee.Person_ID
			RIGHT JOIN Order1 ON Employee.Employee_ID = Order1.Employee_ID
GROUP BY Person.Last_Name
HAVING COUNT(*) > 5;

-- Вариант 2 Фамилии сотрудников, выполнивших более пяти заказов
SELECT Person.Last_Name
FROM Person
WHERE Person.Person_ID IN
(SELECT Employee.Person_ID
FROM Order1 LEFT JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
GROUP BY Order1.Employee_ID, Employee.Person_ID
HAVING COUNT(*) > 5);

--
-- Transact-SQL tasks
--

-- TOP func -- 10 первых заказов
SELECT TOP (10) *
FROM Order1
ORDER BY Time_Order DESC;

-- Информация о человеке и заказе, выполненным первым в 2020 году
SELECT TOP (1) Person.Last_Name, Order1.*
FROM Order1 LEFT JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
			LEFT JOIN Person ON Employee.Person_ID = Person.Person_ID
WHERE Year(Order1.Time_Order) = 2020
AND Order1.Is_Done = 1
ORDER BY Time_Order ASC;
