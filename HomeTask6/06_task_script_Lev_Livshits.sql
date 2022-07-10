USE pet_db;

-- --1--
 -- �������� ��������, ����������� � ������� PERSON ����� ���������� ���� � ����������� ���������������� ��������� ������� 
 -- (����������� ��������� select � �max(�) + 1�).
 -- �������� ���� ����� ������ (��������, ���� :)). 

 INSERT INTO Person (Person_ID, Last_Name, First_Name, Phone, Address)
	SELECT max(Person_ID) + 1, 'Ivanov', 'Ivan', '8-800-555-35-35', 'Universitetskaia nab, 3'
	FROM Person; 

SELECT * FROM Person;

-- DELETE
DELETE FROM Person 
WHERE Person_ID IN (SELECT max(Person_ID) FROM Person);
-- --2--
-- �������� ��������, ����������� ������� �(s)� � ������ ����������� �� ������� ������, 
-- ����������� �������� � �������. ��������� ���� ��������
UPDATE Order1
	SET Comments = '(s)' + Comments
	WHERE Employee_ID IN
	(SELECT Employee_ID FROM Employee WHERE Spec = 'student')
	;
SELECT * FROM Order1;


-- --3--
-- �������� � ���� ����� ������� ��� �������� ������ � ���������� ���.��� (��� � ����� ���������). 
-- ��� �������� ����� �� ��� � ������� PERSON ������� �������� ����������� ��������.
-- �������� ���� ���������� ��� ������ ���.���� (�� ������� ������). 
-- ���������, ��� ������ �������� � ��� �������� ���.���� ������������� ��������� ��� ���������.  

DECLARE @TransactionName VARCHAR(20) = 'Transaction1';
BEGIN TRAN Transaction1
CREATE TABLE Document(
	Document_ID INTEGER IDENTITY(1, 1),
	Person_ID INTEGER NOT NULL,
	Document_Type INTEGER NOT NULL,
	Document_Number VARCHAR(30),
	CONSTRAINT Document_PK PRIMARY KEY (Document_ID),
	CONSTRAINT Person_FK FOREIGN KEY(Person_ID) 
		REFERENCES Person(Person_ID) 
		ON DELETE CASCADE
);
ALTER TABLE Employee DROP CONSTRAINT FK_Employee_Person;
ALTER TABLE Owner DROP CONSTRAINT FK_Owner_Person;
INSERT INTO Document (Person_ID, Document_Type, Document_Number)
			VALUES (9, 1, '1AF3S');
INSERT INTO Document (Person_ID, Document_Type, Document_Number)
			VALUES (9, 2, 'DL123');			
INSERT INTO Document (Person_ID, Document_Type, Document_Number)
			VALUES (10, 1, '3HDE4DE');
INSERT INTO Document (Person_ID, Document_Type, Document_Number)
			VALUES (10, 2, 'DL1244');
SELECT * FROM Document;
DELETE FROM Person WHERE Person_ID = 9;
SELECT * FROM Document;
ROLLBACK TRAN Transaction1;