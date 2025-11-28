Objective 1: Price Analytics - Optimal Prices
 
1. Average Product Price Across Vendors
 
SELECT P_ID, AVG(Price) AS AvgPrice FROM   PRODUCT_VENDOR 
GROUP BY P_ID
ORDER BY AvgPrice ASC;


2.Total Sales Performance by Vendor
 
SELECT v.V_ID, v.Name AS VendorName, SUM(op.Quentity * pv.Price) AS TotalSales  FROM  order_product op
JOIN product_vendor pv ON op.P_ID = pv.P_ID
JOIN vendor v ON pv.V_ID = v.V_ID
GROUP BY   v.V_ID
ORDER BY TotalSales DESC;

Objective 2: Customer Insights
 
1. Average time spent on site per customer type
SELECT c.Type , AVG(e.time_spent_minutes) AS AvgTimeSpent FROM experience e
JOIN customer c ON e.C_ID = c.C_ID
GROUP BY c.Type;


2. Orders Corresponding to High Customer Engagement
 
SELECT o.O_ID, c.Name AS CustomerName, e.time_spent_minutes, o. Status FROM `order` o
JOIN customer c ON o.C_ID = c.C_ID
JOIN experience e ON c.C_ID = e.C_ID
WHERE e.time_spent_minutes > 30 AND o.Status = 'Complete';

3. Customers with Multiple Reviews
 
SELECT c.C_ID, c.Name, COUNT(r.R_ID) AS ReviewCount FROM customer c
JOIN review r ON c.C_ID = r.C_ID
GROUP BY c.C_ID
HAVING ReviewCount > 1;

Objective 3: Operational cost Analysis
 
1. Average Cost of Delivery Failures
SELECT AVG(d.Cost) AS AvgFailureCost FROM delivery d
WHERE d.Is_successful = 'n';


2.  Total Logistical Cost (Deliveries and Returns)
 
SELECT SUM(d.Cost) + SUM(r.Cost) AS TotalLogisticalCost
FROM delivery d
JOIN `return` r ON d.O_ID = r.O_ID;

Query using String Operation
 
1. Select customer id and name and number of characters in their name whose length of name is greater than 14 characters.
SELECT C_ID, Name, LENGTH(Name) as NumberOfCharacterInName, Type FROM customer 
WHERE LENGTH(Name) > 14 AND Type IN ('Member');

 
Query using Window Function
 
1. Top five vendors by sales.
SELECT v.V_ID, v.Name AS VendorName, SUM(op.Quentity * pv.Price) AS TotalSales, 
RANK() OVER (ORDER BY SUM(op.Quentity * pv.Price) DESC) AS SalesRank
FROM order_product op
JOIN product_vendor pv ON op.P_ID = pv.P_ID
JOIN vendor v ON pv.V_ID = v.V_ID
GROUP BY v.V_ID;


