create database userdetail
use userdetail

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50)
);
CREATE TABLE QuestionMarks (
    UserID INT,
    QuestionID INT,
    QuestionNumber INT,
    Marks INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
CREATE TABLE StudentDetails (
    UserID INT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
INSERT INTO Users (UserID, Username, Password)
VALUES (1, 'student1', 'password1'),
       (2, 'student2', 'password2'),
	   (3, 'student3', 'password3'),
	   (4, 'student4', 'password4'),
	   (5, 'student5', 'password5')


INSERT INTO QuestionMarks (UserID, QuestionID, QuestionNumber, Marks)
VALUES (1, 101, 1, 2),(1, 101, 2, 0), (1, 101, 3, 2),(1, 101, 4, 0),(1, 101, 5, 2),
  (2, 102, 1, 0),(1, 102, 2, 02), (2, 102, 3, 2),(2, 102, 4, 0),(2, 102, 5, 2),
  (3, 103, 1, 2),(3, 103, 2, 0), (3, 103, 3, 2),(3, 103, 4, 0),(3, 103, 5, 2),
  (4, 101, 1, 0),(4, 101, 2, 0), (4, 101, 3, 0),(4, 104, 4, 0),(4, 104, 5, 0),
  (5, 104, 1, 2),(5, 104, 2, 2), (5, 104, 3, 2),(5, 104, 4, 2),(5, 104, 5, 2)

iNSERT INTO StudentDetails (UserID, Name, Email, Phone)
VALUES (1, 'dhiraj salunkhe', 'd@d.com', '8637730249'),
       (2, 'vasudha sawant', 's@v.com', '7620631597'),
       (3, 'farin jakate', 'f@j.com', '9604386919'),
       (4, 'kishore more', 'k@m.com', '8788095710'),
       (5, 'ganesh pawar', 'g@g.com', '9011542578');


SELECT sd.Name AS StudentName, sd.Email, qm.QuestionID, qm.QuestionNumber, qm.Marks
FROM StudentDetails sd
INNER JOIN QuestionMarks qm ON sd.UserID = qm.UserID
ORDER BY sd.Name, qm.QuestionNumber;


