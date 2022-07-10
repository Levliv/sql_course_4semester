USE pet_db;

-- 1 Все оценки по выполненным заказам, исполнителями которых являлись студенты.
SELECT Order1.Mark
FROM Order1
WHERE Order1.Is_Done = 1 AND Order1.Employee_ID IN
(
SELECT Employee.Employee_ID
FROM Employee
);

-- 2 Фамилии исполнителей, не получивших еще ни одного заказа.
SELECT Person.Last_Name
FROM Person RIGHT JOIN Employee ON Person.Person_ID = Employee.Person_ID
WHERE Employee.Person_ID NOT IN
(SELECT Order1.Employee_ID
FROM Order1
GROUP BY Order1.Employee_ID);

-- 3 Список заказов (вид услуги, время, фамилия исполнителя, кличка питомца, фамилия владельца).
SELECT Service.Name, Order1.Time_Order, p1.Last_Name, Pet.Nick, Person.Last_Name
FROM Order1 LEFT JOIN Service ON Order1.Service_ID = Service.Service_ID
			LEFT JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
			LEFT JOIN Person as p1 ON Employee.Person_ID = p1.Person_ID
			LEFT JOIN Pet ON Order1.Pet_ID = Pet.Pet_ID
			LEFT JOIN Owner ON Order1.Owner_ID = Owner.Owner_ID
			LEFT JOIN Person ON Owner.Person_ID = Person.Person_ID;

-- 4 Общий список комментариев, имеющихся в базе.
SELECT Comments
FROM Order1
WHERE Comments <> ''
UNION
SELECT Description
FROM Owner
WHERE Description <> ''
UNION
SELECT Description
FROM Pet
WHERE Description <> '';

-- 5 Имена и фамилии сотрудников, хотя бы раз получивших пятерку за выполнение заказа.
SELECT Person.First_Name, Person.Last_Name
FROM Employee LEFT JOIN Person ON Employee.Person_ID = Person.Person_ID
WHERE EXISTS(
SELECT *
FROM Order1
WHERE Mark = 5 AND Employee.Employee_ID = Order1.Employee_ID
);