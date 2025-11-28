Objective 1: Price Analytics - Optimal Prices
1. Average Product Price Across Vendors
SELECT P_ID, AVG(Price) AS AvgPrice FROM   PRODUCT_VENDOR 
GROUP BY P_ID
ORDER BY AvgPrice ASC;
Output
 

