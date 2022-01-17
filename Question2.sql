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

with product_name as
(SELECT p.ProductName, c.Country as country,count(co.customerID) as customers
FROM (((OrderDetails o
left JOIN Products p ON o.ProductID = p.ProductID)
left JOIN orders co ON o.OrderID = co.OrderID)
left Join Customers c on co.CustomerID = c.CustomerID)
where country == 'Germany'
group by p.ProductName,country order by customers desc limit 1
)
select ProductName from product_name

-- ************************************* Output ********************************************************************
--ProductName
--Gorgonzola Telino