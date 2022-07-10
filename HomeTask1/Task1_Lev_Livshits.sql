
CREATE TABLE Vacctination(
Pet_ID INTEGER NOT NULL,
Vacctination_Type_ID INTEGER NOT NULL,
Vacctination_Date DATETIME DEFAULT GETDATE()    NOT NULL,
CONSTRAINT FK_Pet_ID 
FOREIGN KEY (Pet_ID)
REFERENCES Pet(Pet_ID)
)
;

CREATE TABLE Vacctination_Type(
Vacctination_Type_ID INTEGER NOT NULL,
Name VARCHAR(40) NOT NULL,
CONSTRAINT PK_Vacctination_Type_ID PRIMARY KEY(Vacctination_Type_ID)
)
;

ALTER TABLE Vacctination ADD CONSTRAINT FK_Vacctination_Type_ID
FOREIGN KEY (Vacctination_Type_ID)
REFERENCES Vacctination_Type(Vacctination_Type_ID)
;


---     ---
INSERT INTO Vacctination_Type(Vacctination_Type_ID, Name) VALUES (1, 'first')
;
INSERT INTO Vacctination_Type(Vacctination_Type_ID, Name) VALUES (2, 'second')
;
INSERT INTO Vacctination(Pet_ID, Vacctination_Type_ID) VALUES (1, 1)
;
INSERT INTO Vacctination(Pet_ID, Vacctination_Type_ID) VALUES (1, 2)
;
INSERT INTO Vacctination(Pet_ID, Vacctination_Type_ID) VALUES (3, 2)
;
---     ---
DROP TABLE Vacctination
;

DROP TABLE Vacctination_Type
;
