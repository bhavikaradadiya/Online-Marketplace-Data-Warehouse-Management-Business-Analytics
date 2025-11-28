CREATE DEFINER=`root`@`localhost` PROCEDURE `monthly_report`(IN report_month VARCHAR(10))
BEGIN
    -- Calculate total revenue for the specified month
    DECLARE total_revenue DECIMAL(10, 2); DECLARE total_delivery_cost DECIMAL(10, 2);
    DECLARE total_fraudlent_cost DECIMAL(10, 2);  DECLARE monthly_profit DECIMAL(10, 2);
    
    SELECT SUM(r.Commission) INTO total_revenue FROM REVENUE r
    JOIN `ORDER` o ON r.O_ID = o.O_ID
    WHERE DATE_FORMAT(o.Date, '%Y-%m') = report_month;

-- Calculate total delivery costs for the specified month
   
    SELECT SUM(d.Cost) INTO total_delivery_cost FROM DELIVERY d
    JOIN `ORDER` o ON d.O_ID = o.O_ID
    WHERE DATE_FORMAT(o.Date, '%Y-%m') = report_month;
    
-- Calculate total cost of fraudulent returns for the specified month

    SELECT SUM(r.Cost) INTO total_fraudlent_cost FROM `RETURN` r
    JOIN `ORDER` o ON r.O_ID = o.O_ID
    WHERE r.Is_fraudlent = 'y'AND DATE_FORMAT(o.Date, '%Y-%m') = report_month;
-- Calculate profit: Revenue - (Delivery Cost + Fraudulent Return Cost)
   
    SET monthly_profit = total_revenue - (total_delivery_cost + total_fraudlent_cost);

    -- Output the results
    SELECT 
        report_month AS ReportMonth,
        total_revenue AS TotalRevenue,
        total_delivery_cost AS TotalDeliveryCost,
        total_fraudlent_cost AS TotalFraudlentCost,
        monthly_profit AS MonthlyProfit;
END