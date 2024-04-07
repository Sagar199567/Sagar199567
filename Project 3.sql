create database Customers_Orders_Products 

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers values(1, 'John Doe', 'johndoe@example.com')
INSERT INTO Customers values(2, 'Jane Smith', 'janesmith@example.com')
INSERT INTO Customers values(3, 'Robert Johnson', 'robertjohnson@example.com')
INSERT INTO Customers values(4, 'Emily Brown', 'emilybrown@example.com')
INSERT INTO Customers values(5, 'Michael Davis', 'michaeldavis@example.com')
INSERT INTO Customers values(6, 'Sarah Wilson', 'sarahwilson@example.com')
INSERT INTO Customers values(7, 'David Thompson', 'davidthompson@example.com')
INSERT INTO Customers values(8, 'Jessica Lee', 'jessicalee@example.com')
INSERT INTO Customers values(9, 'William Turner', 'williamturner@example.com')
INSERT INTO Customers values(10, 'Olivia Martinez', 'oliviamartinez@example.com');

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders Values(1, 1, 'Product A', '2023-07-01', 5)
INSERT INTO Orders Values(2, 2, 'Product B', '2023-07-02', 3)
INSERT INTO Orders Values(3, 3, 'Product C', '2023-07-03', 2)
INSERT INTO Orders Values(4, 4, 'Product A', '2023-07-04', 1)
INSERT INTO Orders Values(5, 5, 'Product B', '2023-07-05', 4)
INSERT INTO Orders Values(6, 6, 'Product C', '2023-07-06', 2)
INSERT INTO Orders Values(7, 7, 'Product A', '2023-07-07', 3)
INSERT INTO Orders Values(8, 8, 'Product B', '2023-07-08', 2)
INSERT INTO Orders Values(9, 9, 'Product C', '2023-07-09', 5)
INSERT INTO Orders Values(10, 10, 'Product A', '2023-07-10', 1);

CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products values(1, 'Product A', 10.99)
INSERT INTO Products values(2, 'Product B', 8.99)
INSERT INTO Products values(3, 'Product C', 5.99)
INSERT INTO Products values(4, 'Product D', 12.99)
INSERT INTO Products values(5, 'Product E', 7.99)
INSERT INTO Products values(6, 'Product F', 6.99)
INSERT INTO Products values(7, 'Product G', 9.99)
INSERT INTO Products values(8, 'Product H', 11.99)
INSERT INTO Products values(9, 'Product I', 14.99)
INSERT INTO Products values(10, 'Product J', 4.99)

select * from customers

SELECT *
FROM customers
WHERE email LIKE '%j%' OR name LIKE '%j%';

select * from Orders

select sum(quantity)
from orders

SELECT name
FROM customers
WHERE customerid IN (SELECT DISTINCT customerid FROM orders);
;

SELECT *
FROM products
WHERE price > 10.00;

SELECT customers.name AS customer_name, orders.orderdate
FROM orders
JOIN customers ON orders.customerid = customers.customerid
WHERE orders.orderdate >= '2023-07-05';

select avg(price)
from products

SELECT customers.name AS customer_name, SUM(orderid.quantity) AS total_quantity_ordered
FROM customers
JOIN orders ON customers.customerid = orders.customerid
JOIN Orders ON orders.order_id = orders.order_id
GROUP BY customers.name;

SELECT customerid, SUM(quantity) AS total_orders
FROM orders
GROUP BY customerid
ORDER BY total_orders DESC 
Limit 5

SELECT productname, AVG(price)
FROM products
GROUP BY productname;

SELECT productid, AVG(quantity) AS avg_quantity_ordered
FROM orders
GROUP BY productid
ORDER BY avg_quantity_ordered DESC
LIMIT 3;

SELECT Orders.OrderID, Products.ProductName, OrderDetails.Quantity
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Customers.CustomerName LIKE 'M%'

SELECT SUM(Orders.Quantity * Products.UnitPrice) AS TotalRevenue
FROM Orders
JOIN Products ON Orders.ProductID = Products.ProductID

SELECT Customers.CustomerName, SUM(OrderDetails.Quantity * Products.UnitPrice) AS TotalRevenue
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Customers.CustomerName;

SELECT DISTINCT C.CustomerID, C.CustomerName
FROM Customers C
JOIN Orders O1 ON C.CustomerID = O1.CustomerID
JOIN Orders O2 ON C.CustomerID = O2.CustomerID
WHERE O1.OrderDate = DATEADD(day, 1, O2.OrderDate) OR O1.OrderDate = DATEADD(day, -1, O2.OrderDate);

SELECT 
    COUNT(CASE WHEN OrderDetails.Quantity > AvgQuantity THEN 1 END) * 100.0 / COUNT(*) AS Percentage
FROM 
    OrderDetails
CROSS JOIN
    (SELECT AVG(Quantity) AS AvgQuantity FROM OrderDetails) AS AvgQ;

SELECT orders.orderID, customer.name
FROM orders, customers
WHERE orders.orderid = customer.customerid;

SELECT p.product_id, p.product_name
FROM Products p
WHERE NOT EXISTS (
    SELECT DISTINCT c.customer_id
    FROM Customers c
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o
        WHERE o.product_id = p.product_id
        AND o.customer_id = c.customer_id
    )
);

SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(order_amount) AS total_revenue
FROM 
    Orders
GROUP BY 
    DATE_TRUNC('month', order_date)
ORDER BY 
    month;

SELECT 
    p.product_id,
    p.product_name
FROM 
    Products
WHERE 
    (
        SELECT 
            COUNT(DISTINCT customer_id)
        FROM 
            Customers
    ) * 0.5 <= (
        SELECT 
            COUNT(DISTINCT orders.customer_id)
        FROM 
            Orders
        WHERE 
            orders.product_id = product.product_id
    );

SELECT customer_id, MAX(order_price) AS HighestPurchase
FROM customer_order_details
GROUP BY customer_id
ORDER BY MAX(order_price) DESC
LIMIT 5;

SELECT customer_id, order_id, quantity,
       SUM(quantity) OVER (PARTITION BY customer_id ORDER BY order_id) AS **running_total**
FROM orders
ORDER BY customer_id, order_id;

SELECT o.customer_id, o.order_id, o.order_date
FROM (
    SELECT o.customer_id, o.order_id, o.order_date,
           ROW_NUMBER() OVER(PARTITION BY o.customer_id ORDER BY o.order_date DESC) AS rn
    FROM orders o
) AS o
WHERE o.rn <= 3
ORDER BY o.customer_id, o.order_date DESC

SELECT 
    customer_id,
    SUM(order_amount) AS total_revenue
FROM 
    Orders
WHERE 
    order_date >= DATE_SUB(CURRENT_DATE INTERVAL 30 DAY)
GROUP BY 
    customer_id;


