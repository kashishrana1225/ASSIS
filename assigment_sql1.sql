-- Company Table
create database pk;
use pk;
CREATE TABLE Company (
  CompanyID INT PRIMARY KEY,
  CompanyName VARCHAR(100)
);

-- Contact Table
CREATE TABLE Contact (
  ContactID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Phone VARCHAR(15),
  Email VARCHAR(100)
);

-- Employee Table
CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Phone VARCHAR(15),
  Email VARCHAR(100),
  JobTitle VARCHAR(50)
);

-- ContactEmployee Table
CREATE TABLE ContactEmployee (
  ContactID INT,
  EmployeeID INT,
  AssociationDate DATE,
  PRIMARY KEY (ContactID, EmployeeID),
  FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Insert into Company
INSERT INTO Company VALUES
(1, 'Urban Outfitters, Inc.'),
(2, 'H&M'),
(3, 'Zara'),
(4, 'Nike'),
(5, 'Adidas'),
(6, 'Puma'),
(7, 'Levis'),
(8, 'Gap'),
(9, 'Reebok'),
(10, 'Uniqlo');

-- Insert into Contact
INSERT INTO Contact VALUES
(1, 'Dianne', 'Connor', '111-222-3333', 'dianne.connor@example.com'),
(2, 'Raj', 'Sharma', '111-222-4444', 'raj.sharma@example.com'),
(3, 'Maya', 'Patel', '111-222-5555', 'maya.patel@example.com'),
(4, 'John', 'Smith', '111-222-6666', 'john.smith@example.com'),
(5, 'Sara', 'Khan', '111-222-7777', 'sara.khan@example.com'),
(6, 'Karan', 'Desai', '111-222-8888', 'karan.desai@example.com'),
(7, 'Anita', 'Nair', '111-222-9999', 'anita.nair@example.com'),
(8, 'Neha', 'Joshi', '111-333-4444', 'neha.joshi@example.com'),
(9, 'Rohan', 'Kapoor', '111-333-5555', 'rohan.kapoor@example.com'),
(10, 'Lesley', 'Bland', '111-333-6666', 'lesley.bland@example.com');

-- Insert into Employee
INSERT INTO Employee VALUES
(1, 'Lesley', 'Bland', '999-999-9999', 'lesley.bland@example.com', 'Manager'),
(2, 'Amit', 'Shah', '9876543210', 'amit.shah@example.com', 'HR'),
(3, 'Neha', 'Joshi', '9876512345', 'neha.joshi@example.com', 'Developer'),
(4, 'Rohan', 'Kapoor', '9876545678', 'rohan.kapoor@example.com', 'Designer'),
(5, 'Anita', 'Nair', '9876578901', 'anita.nair@example.com', 'Support'),
(6, 'Karan', 'Desai', '9876523456', 'karan.desai@example.com', 'Team Lead'),
(7, 'Sara', 'Khan', '9876534567', 'sara.khan@example.com', 'Analyst'),
(8, 'John', 'Smith', '9876541234', 'john.smith@example.com', 'Developer'),
(9, 'Maya', 'Patel', '9876556789', 'maya.patel@example.com', 'Tester'),
(10,'Raj', 'Sharma', '9876567890', 'raj.sharma@example.com', 'HR');

-- Insert into ContactEmployee
INSERT INTO ContactEmployee VALUES
(1, 1, '2020-03-12'),
(2, 2, '2021-05-10'),
(3, 3, '2021-07-15'),
(4, 4, '2022-01-20'),
(5, 5, '2022-03-18'),
(6, 6, '2022-05-12'),
(7, 7, '2022-08-25'),
(8, 8, '2023-01-01'),
(9, 9, '2023-02-15'),
(10,10,'2023-03-05');
use pk;
#4) Update Lesley Bland’s phone number
UPDATE Employee
SET Phone = '215-555-3800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

#5) Update Company name
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

#6) Delete Dianne Connor’s contact event
DELETE FROM ContactEmployee
WHERE ContactID = (
  SELECT ContactID FROM Contact
  WHERE FirstName = 'Dianne' AND LastName = 'Connor'
);

#7) Show Employees with their Contacts
SELECT e.FirstName AS EmployeeFirst, e.LastName AS EmployeeLast,
       c.FirstName AS ContactFirst, c.LastName AS ContactLast
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON c.ContactID = ce.ContactID;

#8) What is % and _ in LIKE?
-- % = many characters
SELECT * FROM Employee WHERE FirstName LIKE 'N%';

-- _ = one character
SELECT * FROM Employee WHERE FirstName LIKE 'R_han';

#9) Explain Normalization (short note)

#👉 Normalization = organizing data to reduce duplication and dependency.

1NF → no repeating groups.
2NF → remove partial dependency.
3NF → remove transitive dependency.

#10) What does JOIN mean?

👉 JOIN = combine rows from multiple tables using common columns.
SELECT Employee.FirstName, Company.CompanyName
FROM Employee
JOIN Company ON Employee.EmployeeID = Company.CompanyID;

#11) What is DDL, DCL, DML?

DDL (Data Definition Language) → CREATE, ALTER, DROP.
DML (Data Manipulation Language) → INSERT, UPDATE, DELETE, SELECT.
DCL (Data Control Language) → GRANT, REVOKE.

#12) Role of JOIN in MySQL & types

👉 JOIN helps link tables.
INNER JOIN = only matching rows.
LEFT JOIN = all left + matching right.
RIGHT JOIN = all right + matching left.
FULL JOIN (not default in MySQL, but can be done with UNION).

-- Example INNER JOIN
SELECT e.FirstName, c.FirstName
FROM Employee e
INNER JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
INNER JOIN Contact c ON c.ContactID = ce.ContactID;