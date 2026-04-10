USE CarRentalDB;
Go

--Inserting Data
INSERT INTO Location (Street, City, Province, Postal_Code, Is_HQ) VALUES
('Main Street 1', 'Douala', 'Littoral', '10001', 1),
('Airport Road', 'Yaounde', 'Centre', '20002', 0);

INSERT INTO Car_Class (Class_Name, Daily_Price, Weekly_Price, Biweekly_Price, Monthly_Price) VALUES
('Sedan', 50, 400, 550, 2000),
('Compact', 40, 250, 500, 900);

INSERT INTO Car (License_Plate, Make, Model, Year, Color, Class_ID, Location_ID) VALUES
('ABC123', 'Toyota', 'Corolla', 2022, 'White', 1, 1),
('XYZ789', 'Honda', 'Civic', 2021, 'Black', 2, 1),
('LMN456', 'BMW', 'X5', 2023, 'Blue', 1, 2);

INSERT INTO Person (License_Number, First_Name, Last_Name, Street, City, Province, Postal_Code) VALUES
('DL001', 'Chloe', 'Cynthia', 'Street 10', 'Douala', 'Littoral', '10001'),
('DL002', 'Scott', 'Dima', 'Street 20', 'Yaounde', 'Centre', '20002'),
('DL003', 'Bill', 'Arthur', 'Street 30', 'Douala', 'Littoral', '10001');

INSERT INTO Customer VALUES
('DL001'),
('DL002'),
('DL003');

INSERT INTO Employee (License_Number, Category, Location_ID, Manager_Role) VALUES
('DL003', 'Manager', 1, 'President'),
('DL002', 'Clerk', 1, NULL);

INSERT INTO Dropoff_Charge (Class_ID, Pickup_Location_ID, Return_Location_ID, Charge) VALUES
(1, 1, 2, 50.00),
(2, 1, 2, 40.00);

INSERT INTO Promotion (Class_ID, Week_Start, Week_End, Discount_Percentage) VALUES
(1, '2026-03-01', '2026-03-07', 60.00);

INSERT INTO Rental (
Rent_Date, Return_Date, Odometer_Before, Odometer_After, Gas_Level, Upgrade_Flag,
Requested_Class_ID, Rented_Class_ID,
Car_ID, Customer_License, Employee_License,
Pickup_Location_ID, Return_Location_ID,
Charge_ID, Promotion_ID, Total_Charge
)
VALUES

-- Completed rental
('2026-03-01', '2026-03-03', 10000, 10200, 'Half', 0,
 1, 1, 1, 'DL001', 'DL003', 1, 2, 1, 1, 120.00),

-- Ongoing rental
('2026-03-10', NULL, 20000, NULL, NULL, 0,
 2, 2, 2, 'DL002', NULL, 1, NULL, NULL, NULL, NULL),

-- Short rental
('2026-03-05', '2026-03-06', 15000, 15100, 'Full', 1,
 1, 1, 3, 'DL001', NULL, 2, 1, 1, NULL, 50.00);
