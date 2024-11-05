-- retrieve the total sales for each product category.
SELECT Product, sum(TotalSales) AS TotalSales FROM sales 
GROUP BY Product;

-- find the number of sales transactions in each region.
SELECT Region, Count(OrderID) FROM sales 
GROUP BY Region;

-- find the highest-selling product by total sales value.
SELECT Product, Max(TotalSales) FROM sales;

-- calculate total revenue per product.
SELECT Product, sum(TotalSales) AS TotalRevenue FROM sales 
GROUP BY Product;


-- calculate monthly sales totals for the current year.
SELECT OrderMonth AS Month, year(OrderDate) as Year, sum(TotalSales)  FROM sales 
WHERE YEAR(OrderDate) = 2024 
GROUP BY Month;

-- find the top 5 customers by total purchase amount.
SELECT CustomerID, sum(TotalSales) as TotalPurchaseAmount from sales 
GROUP BY CustomerID 
ORDER BY TotalPurchaseAmount DESC 
LIMIT 5;

-- calculate the percentage of total sales contributed by each region.
WITH RegionalSales AS (
		SELECT Region, SUM(Quantity * UnitPrice) AS RegionSales FROM sales GROUP BY Region
	), 
	TotalSales AS (
		SELECT SUM(RegionSales) AS OverAllTotal FROM RegionalSales
	) 

SELECT rs.Region, round((rs.RegionSales/ts.OverallTotal) * 100,2) AS PercentageTotal FROM RegionalSales rs 
CROSS JOIN TotalSales ts;

-- Identify products with no sales in the last quarter.
SELECT 
    Product
FROM 
    Orders
WHERE 
    OrderDate NOT BETWEEN '2023-10-01' AND '2023-12-31'
GROUP BY 
    Product
HAVING 
    COUNT(OrderID) = 0;
