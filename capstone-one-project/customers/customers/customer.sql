-- retrieve the total number of customers from each region.
SELECT Region, COUNT(CustomerID) FROM customer 
GROUP BY Region;

-- find the most popular subscription type by the number of customers.
SELECT COUNT(SubscriptionType), 
	COUNT(IF(SubscriptionType = "Basic",1, NULL)) AS BasicSubscription, 
	COUNT(IF(SubscriptionType = "Premium",1, NULL)) AS BasicSubscription, 
	COUNT(IF(SubscriptionType = "Standard",1, NULL)) AS BasicSubscription 
FROM customer;

-- find customers who canceled their subscription within 6 months.
SELECT CustomerID, CustomerName FROM customer 
WHERE DATEDIFF(SubscriptionEnd, SubscriptionStart) < 180;

-- calculate the average subscription duration for all customers.
SELECT AVG(DurationDays) FROM customer;

-- find customers with subscriptions longer than 12 months.
SELECT CustomerID, CustomerName, DurationDays FROM customer 
WHERE DurationDays >366;

-- calculate total revenue by subscription type.
SELECT SubscriptionType, SUM(Revenue) FROM customer 
GROUP BY SubscriptionType;

-- find the top 3 regions by subscription cancellations.
SELECT Region, COUNT(Region) AS CanceledSub FROM customer 
WHERE Canceled = "TRUE" 
GROUP BY Region 
ORDER BY CanceledSub DESC 
LIMIT 3;

-- find the total number of active and canceled subscriptions.
SELECT Canceled, COUNT(Canceled) AS SubscriptionCount FROM customer 
GROUP BY Canceled;
