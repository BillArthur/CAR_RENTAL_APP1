CREATE DATABASE CarRentalDB;
GO

USE CarRentalDB;
GO

CREATE TABLE Location (
    Location_ID INT IDENTITY(1,1) PRIMARY KEY,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    Postal_Code VARCHAR(20) NOT NULL,
    Is_HQ BIT NOT NULL DEFAULT 0
);

CREATE TABLE Car_Class (
    Class_ID INT IDENTITY(1,1) PRIMARY KEY,
    Class_Name VARCHAR(30) NOT NULL CHECK (Class_Name IN ('Subcompact','Compact','Sedan','Luxury')),
    Daily_Price DECIMAL(10,2) NOT NULL,
    Weekly_Price DECIMAL(10,2) NOT NULL,
    Biweekly_Price DECIMAL(10,2) NOT NULL,
    Monthly_Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Car (
    Car_ID INT IDENTITY(1,1) PRIMARY KEY,
    License_Plate VARCHAR(20) UNIQUE NOT NULL,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Color VARCHAR(30) NOT NULL,
    Class_ID INT NOT NULL REFERENCES Car_Class(Class_ID),
    Location_ID INT NOT NULL REFERENCES Location(Location_ID)
);

CREATE TABLE Person (
	PersonID INT IDENTITY(1,1) PRIMARY KEY,
    License_Number VARCHAR(20) UNIQUE NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province VARCHAR(50) NOT NULL,
    Postal_Code VARCHAR(20) NOT NULL
);

--CREATE TABLE Phone (
  --  Phone_ID INT IDENTITY(1,1) PRIMARY KEY,
    --License_Number VARCHAR(20) NOT NULL REFERENCES Person(License_Number),
    --Phone_Number VARCHAR(20) NOT NULL,
    --Phone_Type VARCHAR(20) NULL
--);

CREATE TABLE Customer (
    License_Number VARCHAR(20) PRIMARY KEY REFERENCES Person(License_Number)
);

CREATE TABLE Employee (
    License_Number VARCHAR(20) PRIMARY KEY REFERENCES Person(License_Number),
    Category VARCHAR(30) NOT NULL CHECK (Category IN ('Workers', 'Driver','Cleaner','Clerk','Manager')),
    Location_ID INT NOT NULL REFERENCES Location(Location_ID),
    Manager_Role VARCHAR(20) NULL
        CHECK (
            Manager_Role IN ('President','VP-Operations','VP-Marketing')
            OR Manager_Role IS NULL
        )
);

CREATE TABLE Dropoff_Charge (
    Charge_ID INT IDENTITY(1,1) PRIMARY KEY,
    Class_ID INT NOT NULL REFERENCES Car_Class(Class_ID),
    Pickup_Location_ID INT NOT NULL REFERENCES Location(Location_ID),
    Return_Location_ID INT NOT NULL REFERENCES Location(Location_ID),
    Charge DECIMAL(10,2) NOT NULL,
    CONSTRAINT UQ_Dropoff UNIQUE (Class_ID, Pickup_Location_ID, Return_Location_ID)
);

CREATE TABLE Promotion (
    Promotion_ID INT IDENTITY(1,1) PRIMARY KEY,
    Class_ID INT NOT NULL REFERENCES Car_Class(Class_ID),
    Week_Start DATE NOT NULL,
    Week_End DATE NOT NULL,
    Discount_Percentage DECIMAL(5,2) NOT NULL DEFAULT 60.00,
    CHECK (Week_End >= Week_Start),
    CONSTRAINT UQ_Promotion UNIQUE (Class_ID, Week_Start)
);

CREATE TABLE Rental (
    Rental_ID INT IDENTITY(1,1) PRIMARY KEY,
    Rent_Date DATE NOT NULL,
    Return_Date DATE NULL,
    Odometer_Before INT NOT NULL,
    Odometer_After INT NULL,

    Gas_Level VARCHAR(20) NULL
        CHECK (Gas_Level IN ('Empty','Quarter','Half','Three-Quarters','Full')
               OR Gas_Level IS NULL),

    Upgrade_Flag BIT NOT NULL DEFAULT 0,

    Requested_Class_ID INT NOT NULL REFERENCES Car_Class(Class_ID),

    Rented_Class_ID INT NOT NULL REFERENCES Car_Class(Class_ID),

    Car_ID INT NOT NULL REFERENCES Car(Car_ID),

    Customer_License VARCHAR(20) NOT NULL REFERENCES Customer(License_Number),

    Employee_License VARCHAR(20) NULL REFERENCES Employee(License_Number),

    Pickup_Location_ID INT NOT NULL REFERENCES Location(Location_ID),

    Return_Location_ID INT NULL REFERENCES Location(Location_ID),

    Charge_ID INT NULL REFERENCES Dropoff_Charge(Charge_ID),

    Promotion_ID INT NULL REFERENCES Promotion(Promotion_ID),

    Total_Charge DECIMAL(10,2) NULL
);

CREATE INDEX IX_Car_Class ON Car(Class_ID);
CREATE INDEX IX_Car_Location ON Car(Location_ID);
CREATE INDEX IX_Rental_Car ON Rental(Car_ID);
CREATE INDEX IX_Rental_Cust ON Rental(Customer_License);
CREATE INDEX IX_Rental_Date ON Rental(Rent_Date);
CREATE INDEX IX_Emp_Location ON Employee(Location_ID);