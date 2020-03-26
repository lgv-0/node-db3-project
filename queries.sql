-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT Cat.CategoryName, Prod.ProductName FROM Product as Prod JOIN Category as Cat ON Prod.CategoryId = Cat.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT Shippr.CompanyName AS ShipperCompanyName, Ordr.OrderDate FROM [Order] as Ordr JOIN Shipper AS Shippr ON Ordr.shipVia = Shippr.id 
WHERE Ordr.OrderDate < '2012-08-09' ORDER BY Shippr.CompanyName;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Prod.ProductName, Prod.QuantityPerUnit FROM product as Prod LEFT JOIN OrderDetail as OrderDetails
ON Prod.Id = OrderDetails.ProductID WHERE instr(OrderDetails.Id, '10251') > 0 ORDER BY Prod.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT Ordr.Id AS OrderID, Cust.CompanyName AS CustomerCompanyName, Emp.LastName AS EmployeeLastName
FROM `Order` AS Ordr JOIN Customer AS Cust ON Ordr.CustomerId = Cust.id JOIN Employee AS Emp ON Ordr.EmployeeId = Emp.id;