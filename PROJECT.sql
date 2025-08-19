CREATE DATABASE Car_rentals;
USE Car_rentals;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    LicenseNumber VARCHAR(50) UNIQUE
);

CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    CarModel VARCHAR(100),
    Brand VARCHAR(50),
    Year INT,
    DailyRate DECIMAL(10,2),
    Status VARCHAR(20)
);

CREATE TABLE Rentals (
    RentalID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    CarID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) CHECK (TotalAmount > 0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    RentalID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    Method VARCHAR(50),  
    FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID)
);


CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    City VARCHAR(50),
    Phone VARCHAR(15)
);


INSERT INTO Customers (CustomerID, Name, Email, Phone, LicenseNumber) VALUES
(1, 'Puneeth Sai', 'puneeth@email.com', '9876543210', 'DL1234567'),
(2, 'Anjali R', 'anjali@email.com', '8765432109', 'DL9876543'),
(3, 'Rohan K', 'rohan@email.com', '9123456789', 'DL2345678'),
(4, 'Sneha P', 'sneha@email.com', '9988776655', 'DL3456789'),
(5, 'Vikram S', 'vikram@email.com', '9876501234', 'DL4567890'),
(6, 'Priya T', 'priya@email.com', '9876512345', 'DL5678901'),
(7, 'Aditya M', 'aditya@email.com', '9876523456', 'DL6789012'),
(8, 'Neha L', 'neha@email.com', '9876534567', 'DL7890123'),
(9, 'Karthik R', 'karthik@email.com', '9876545678', 'DL8901234'),
(10, 'Isha G', 'isha@email.com', '9876556789', 'DL9012345');

SELECT * FROM Customers;

INSERT INTO Cars (CarID, CarModel, Brand, Year, DailyRate, Status) VALUES
(101, 'Creta', 'Hyundai', 2023, 3000.00, 'Available'),
(102, 'City', 'Honda', 2022, 2500.00, 'Rented'),
(103, 'Swift', 'Maruti', 2021, 1500.00, 'Available'),
(104, 'Fortuner', 'Toyota', 2022, 5000.00, 'Rented'),
(105, 'Baleno', 'Maruti', 2023, 1800.00, 'Available'),
(106, 'Verna', 'Hyundai', 2022, 2800.00, 'Available'),
(107, 'Civic', 'Honda', 2023, 3500.00, 'Rented'),
(108, 'EcoSport', 'Ford', 2021, 2200.00, 'Available'),
(109, 'Polo', 'Volkswagen', 2022, 2000.00, 'Available'),
(110, 'Altroz', 'Tata', 2023, 1700.00, 'Rented');

SELECT * FROM Cars;


INSERT INTO Rentals (RentalID, CustomerID, CarID, StartDate, EndDate, TotalAmount) VALUES
(201, 1, 101, '2025-08-20', '2025-08-22', 6000.00),
(202, 2, 102, '2025-08-19', '2025-08-21', 5000.00),
(203, 3, 103, '2025-08-18', '2025-08-19', 1500.00),
(204, 4, 104, '2025-08-15', '2025-08-18', 15000.00),
(205, 5, 105, '2025-08-17', '2025-08-19', 3600.00),
(206, 6, 106, '2025-08-16', '2025-08-17', 2800.00),
(207, 7, 107, '2025-08-14', '2025-08-16', 7000.00),
(208, 8, 108, '2025-08-13', '2025-08-14', 2200.00),
(209, 9, 109, '2025-08-12', '2025-08-13', 2000.00),
(210, 10, 110, '2025-08-11', '2025-08-12', 1700.00);

SELECT * FROM Rentals;

INSERT INTO Payments (PaymentID, RentalID, PaymentDate, Amount, Method) VALUES
(301, 201, '2025-08-19', 6000.00, 'Card'),
(302, 202, '2025-08-19', 5000.00, 'UPI'),
(303, 203, '2025-08-18', 1500.00, 'Cash'),
(304, 204, '2025-08-15', 15000.00, 'Card'),
(305, 205, '2025-08-17', 3600.00, 'UPI'),
(306, 206, '2025-08-16', 2800.00, 'Card'),
(307, 207, '2025-08-14', 7000.00, 'UPI'),
(308, 208, '2025-08-13', 2200.00, 'Cash'),
(309, 209, '2025-08-12', 2000.00, 'Card'),
(310, 210, '2025-08-11', 1700.00, 'UPI');

SELECT * FROM Payments;

INSERT INTO Branches (BranchID, BranchName, City, Phone) VALUES
(1, 'MG Road Branch', 'Bangalore', '9123456780'),
(2, 'Jubilee Hills', 'Hyderabad', '9234567890'),
(3, 'Koramangala', 'Bangalore', '9345678901'),
(4, 'Banjara Hills', 'Hyderabad', '9456789012'),
(5, 'Andheri', 'Mumbai', '9567890123'),
(6, 'Powai', 'Mumbai', '9678901234'),
(7, 'Indiranagar', 'Bangalore', '9789012345'),
(8, 'Hitech City', 'Hyderabad', '9890123456'),
(9, 'Malad', 'Mumbai', '9901234567'),
(10, 'Whitefield', 'Bangalore', '9012345678');

SELECT * FROM Branches;

----------------------------------------------------------------------------
SELECT * FROM Cars
WHERE Status = 'Available' AND DailyRate < 2500;

SELECT * FROM Payments
WHERE Amount > 5000 OR Method = 'UPI';

SELECT * FROM Cars
WHERE Status <> 'Rented';

SELECT * FROM Rentals
WHERE StartDate BETWEEN '2025-08-15' AND '2025-08-20';

SELECT * FROM Customers
WHERE Name LIKE 'P%';

SELECT * FROM Cars 
WHERE CarModel IN ('Creta', 'Civic', 'Fortuner');

SELECT CarModel, Brand, DailyRate FROM Cars
ORDER BY DailyRate ASC;

SELECT CarModel, Brand, DailyRate FROM Cars
ORDER BY DailyRate DESC;

SELECT * FROM Payments WHERE Method IS NOT NULL;

SELECT * FROM Customers 
WHERE EXISTS (SELECT * FROM Rentals WHERE Rentals.CustomerID = Customers.CustomerID);

SELECT * FROM Rentals 
WHERE CarID IN (SELECT CarID FROM Cars WHERE Brand = 'Hyundai');
---------------------------------------------------------------------------------------------
ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Rentals
CHANGE StartDate RentalStart DATE;

ALTER TABLE Customers
RENAME TO customer_details;

ALTER TABLE customer_details
DROP COLUMN Email;

ALTER TABLE Cars
ADD Color VARCHAR(20);
------------------------------------------------------------------------------
SELECT COUNT(*) FROM Cars;

SELECT SUM(Amount) FROM Payments;

SELECT AVG(DailyRate) FROM Cars;

SELECT MIN(DailyRate) FROM Cars;

SELECT MAX(DailyRate) FROM Cars;

SELECT DISTINCT Brand FROM Cars;
------------------------------------------------------------------------------------
SELECT c.Name, SUM(r.TotalAmount) FROM Rentals r
JOIN Customer_details c ON r.CustomerID = c.CustomerID
GROUP BY c.Name;

SELECT c.Name, SUM(r.TotalAmount) FROM Rentals r
JOIN Customer_details c ON r.CustomerID = c.CustomerID
GROUP BY c.Name
HAVING SUM(r.TotalAmount) > 5000;
-----------------------------------------------------------------------------------
SELECT r.RentalID, c.Name, r.RentalStart, r.EndDate FROM Rentals r
INNER JOIN Customer_details c ON r.CustomerID = c.CustomerID;

SELECT ca.CarModel, ca.Status, r.RentalID FROM Cars ca
RIGHT JOIN Rentals r ON ca.CarID = r.CarID;

SELECT ca.CarModel, ca.Status, r.RentalID FROM Cars ca
LEFT JOIN Rentals r ON ca.CarID = r.CarID;
----------------------------------------------------------------------------------
DELIMITER //

CREATE PROCEDURE BookCar(
    IN p_CustomerID INT,
    IN p_CarID INT,
    IN p_RentalStart DATE,
    IN p_RentalEnd DATE,
    IN p_TotalAmount DECIMAL(10,2),
    IN p_PaymentMethod VARCHAR(50)
)
BEGIN
    DECLARE newRentalID INT;
    DECLARE newPaymentID INT;

    INSERT INTO Rentals (CustomerID, CarID, RentalStart, EndDate, TotalAmount)
    VALUES (p_CustomerID, p_CarID, p_RentalStart, p_RentalEnd, p_TotalAmount);

    SET newRentalID = LAST_INSERT_ID();

    INSERT INTO Payments (RentalID, PaymentDate, Amount, Method)
    VALUES (newRentalID, CURDATE(), p_TotalAmount, p_PaymentMethod);

    SET newPaymentID = LAST_INSERT_ID();

    UPDATE Cars
    SET Status = 'Rented'
    WHERE CarID = p_CarID;

    SELECT newRentalID AS RentalID, newPaymentID AS PaymentID;
END //

DELIMITER ;

CALL BookCar(1, 101, '2025-08-25', '2025-08-27', 6000.00, 'Card');

--------------------------------------------------------------------------------
DELIMITER //

CREATE TRIGGER AfterRentalInsert
AFTER INSERT ON Rentals
FOR EACH ROW
BEGIN
    UPDATE Cars
    SET Status = 'Rented'
    WHERE CarID = NEW.CarID;
END //

DELIMITER ;

INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalStart, EndDate, TotalAmount)
VALUES (213, 2, 103, '2025-09-01', '2025-09-05', 12000.00);

SELECT * FROM Rentals;
SELECT * FROM Cars;


CREATE TABLE payment_records (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentID INT,
    Action VARCHAR(50),
    ActionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //

CREATE TRIGGER AfterPaymentInsert
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    INSERT INTO payment_records (PaymentID, Action)
    VALUES (NEW.PaymentID, 'INSERT');
END //

DELIMITER ;

INSERT INTO Payments (RentalID, PaymentDate, Amount, Method)
VALUES (211, '2025-09-01', 12000.00, 'Card');

SELECT * FROM payment_records;
SELECT * FROM Payments;