-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT "ProductName", "CategoryName" 
FROM Product
JOIN Category 
ON "Product"."CategoryId" = "Category"."Id";

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id, s.CompanyName
FROM "Order" AS o
JOIN "Shipper" AS s
ON "o"."ShipVia" = "s"."Id"
WHERE "OrderDate" < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT "ProductName", "UnitsOnOrder"
FROM ProductDetails_V
JOIN OrderDetail
ON "ProductDetails_V"."Id" = "OrderDetail"."ProductId"
WHERE "OrderId" = 10251
ORDER BY "ProductName" ASC;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o."Id", c."CompanyName", e."LastName"
FROM "Order" As o
JOIN "Customer" As c ON o."CustomerId" = c."Id"
JOIN "Employee" as e ON o."EmployeeId" = e."Id";