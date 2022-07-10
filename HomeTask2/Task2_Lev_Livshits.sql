USE pet_db;

SELECT * FROM Pet
WHERE Nick = 'Bobik';

SELECT Nick, Breed FROM Pet
ORDER BY Age;

SELECT Nick, Description FROM Pet
WHERE Description IS NOT NULL;

SELECT AVG(Age) AS avg_age FROM Pet
WHERE Breed = 'poodle';

SELECT COUNT( DISTINCT Owner_ID) AS number_of_owners FROM Pet;

--Nick � Age ��������, ������� �� 4 �� 10 ���
SELECT Nick, Age FROM Pet
WHERE Age BETWEEN 4 and 10;

-- �������� ��� ���������� � ��������, � ������� ������ ����� Nick - a
SELECT * FROM Pet
WHERE Nick LIKE '_a%';

-- ��� ������ � �������� ����� poodle ��� Siamese
SELECT * FROM Pet
WHERE Breed IN ('poodle', 'Siamese');

SELECT * FROM Pet;

/*
SELECT AVG(Age) AS avg_age, Owner_ID, COUNT(*) AS number_of_owners FROM Pet
GROUP BY Owner_ID
HAVING COUNT(*) > (SELECT AVG(COUNT(*)) FROM Pet)
ORDER BY number_of_owners;
*/