USE CarRentalDB;
Go 

--Queries :
--1. Last name of all customers currently renting a car:
SELECT DISTINCT p.Last_Name
FROM Rental r
JOIN Customer c ON c.License_Number = r.Customer_License
JOIN Person  p ON p.License_Number = c.License_Number
WHERE r.Return_Date IS NULL;

--2. Make and color of all cars currently rented out:
SELECT DISTINCT c.Make, c.Color
FROM Rental r
JOIN Car c ON c.Car_ID = r.Car_ID
WHERE r.Return_Date IS NULL;

--3. Rental price and ID for each completed rental:
SELECT Rental_ID, Total_Charge
FROM Rental
WHERE Return_Date IS NOT NULL
  AND Total_Charge IS NOT NULL;

--4. Last name of all managers:
SELECT p.Last_Name
FROM Employee e
JOIN Person p ON p.License_Number = e.License_Number
WHERE e.Category = 'Manager';

--5. First and last name of all customers:
SELECT p.First_Name, p.Last_Name
FROM Customer c
JOIN Person p ON p.License_Number = c.License_Number;

--6. Are any employees also customers?
SELECT p.First_Name, p.Last_Name, p.License_Number
FROM Person p
WHERE p.License_Number IN (
    SELECT License_Number FROM Employee
    INTERSECT
    SELECT License_Number FROM Customer
);

--7. Rental IDs of all shortest rentals:
SELECT Rental_ID,
       DATEDIFF(day, Rent_Date, Return_Date) AS Duration_Days
FROM Rental
WHERE Return_Date IS NOT NULL
  AND DATEDIFF(day, Rent_Date, Return_Date) = (
      SELECT MIN(DATEDIFF(day, Rent_Date, Return_Date))
      FROM Rental
      WHERE Return_Date IS NOT NULL
  );

--8. Value of the cheapest completed rental:
SELECT MIN(Total_Charge) AS Cheapest_Rental
FROM Rental
WHERE Return_Date IS NOT NULL
  AND Total_Charge IS NOT NULL;

--9. Make of cars that have never been rented:
SELECT Make
FROM Car
WHERE Car_ID NOT IN (
    SELECT DISTINCT Car_ID
    FROM Rental
);
