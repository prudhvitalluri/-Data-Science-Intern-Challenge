--Question 2: For this question you’ll need to use SQL. Follow this link to access the data set required for the challenge. Please use queries to answer the following questions. --Paste your queries along with your final numerical answers below.

--1)How many orders were shipped by Speedy Express in total?
SELECT s.ShipperName,count(o.OrderID) as Orders FROM [Orders] o join Shippers s
on o.ShipperID = s.ShipperID
where s.ShipperName = 'Speedy Express'

-- ************************************* Output ********************************************************************
--ShipperName	Orders
--Speedy Express	54

--2)What is the last name of the employee with the most orders?

with lastname_tab as(
SELECT e.LastName,count(o.OrderID) as orders FROM [Orders] o join Employees e
on o.EmployeeID = e.EmployeeID
group by e.LastName order by orders desc limit 1)
select LastName from lastname_tab

-- ************************************* Output ********************************************************************
--LastName
--Peacock

--3)What product was ordered the most by customers in Germany?

SELECT p.ProductName, SUM(od.Quantity) AS Quantity
FROM Orders o, OrderDetails od, Customers c, Products p
WHERE c.Country = "Germany" AND od.OrderID = o.OrderID AND od.ProductID = p.ProductID AND c.CustomerID = o.CustomerID
GROUP BY p.ProductID
ORDER BY Quantity DESC
LIMIT 1;

-- ************************************* Output ********************************************************************
--ProductName	Quantity
--Boston Crab Meat	160
