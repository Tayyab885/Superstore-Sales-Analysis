Select *
From superstore_sales;

-- Task#1: What percentage of total orders were shipped on the same date?

SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM superstore_sales) AS percentage
FROM superstore_sales
WHERE Order_Date = Ship_Date;

-- Task#2: Name top 3 customers with highest total value of orders?

Select Top 3 Customer_Name, Sum(Sales) as total_sales
From superstore_sales
Group by Customer_Name
Order by total_sales desc;

-- Task#3: Find the top 5 items with the highest average sales per day?

Select Top 5 Order_Date, Product_Name, AVG(Sales) as average_sales
From superstore_sales
Group By Order_Date,Product_Name
Order By average_sales Desc;

SELECT Top 5 Product_Name, AVG(Sales / NULLIF(DATEDIFF(day, Order_Date, Ship_Date), 0)) AS Avg_Sales_Per_Day
FROM superstore_sales
WHERE Order_Date <> Ship_Date
GROUP BY Product_Name
ORDER BY Avg_Sales_Per_Day DESC;

-- Task#4: Write a query to find the average order value for each customer, and rank the customers by their average order value.

With tot_sales as (
	Select Customer_Name,
		Order_ID,
		SUM(Sales) as total_sales
	From superstore_sales
	Group By Customer_Name,Order_ID
)
Select Customer_Name,
	AVG(total_sales) as Avg_order_value,
	Rank() OVER(ORDER BY AVG(total_sales) DESC) as rank
From tot_sales
Group By Customer_Name
Order By Avg_order_value Desc


-- Task#5: Give the name of customers who ordered highest and lowest orders from each city.

SELECT city, 
    MIN(customer_name) AS customer_name_min_order, 
    MAX(customer_name) AS customer_name_max_order
FROM (
    SELECT city, customer_name, 
        ROW_NUMBER() OVER (PARTITION BY city ORDER BY total_sales ASC) AS rn_min_order,
        ROW_NUMBER() OVER (PARTITION BY city ORDER BY total_sales DESC) AS rn_max_order
    FROM (
        SELECT city, customer_name, SUM(sales) AS total_sales
        FROM superstore_sales
        GROUP BY city, customer_name
    ) t
) t2
WHERE rn_min_order = 1 OR rn_max_order = 1
GROUP BY city;

-- Task:6 What is the most demanded sub-category in the west region?

Select Top 1 Sub_Category,Count(*) as most_demanded
From superstore_sales
Where Region = 'West'
Group By Sub_Category
Order By most_demanded Desc;

-- Task#7: Which order has the highest number of items?
Select Order_ID, 
	Count(Product_Name) as total_items
From superstore_sales
Group By Order_ID
Order By total_items Desc;

-- Task#8: Which order has the highest cumulative value?

Select Order_ID,
	SUM(Sales) as order_value
From superstore_sales
Group BY Order_ID
ORDER BY order_value DESC;

---- Together

--Select Order_ID, 
--	Count(Product_Name) as total_items,
--	SUM(Sales) as order_value
--From superstore_sales
--Group By Order_ID
--Order By total_items Desc, order_value Desc;


-- Task#9: Which segment’s order is more likely to be shipped via first class?
WITH tab1 as(
	Select Segment,
		Count(*) as total_orders,
		Count(CASE WHEN Ship_Mode = 'First Class' THEN 1 END) as first_class_orders
	FROM superstore_sales
	Group By Segment
)
Select *, first_class_orders * 100.0 / total_orders as first_class_percentage
FROM tab1
Order BY first_class_percentage Desc;

-- Task#10: Which city is least contributing to total revenue?

Select Top 1 City, SUM(Sales) as total_revenue
FROM superstore_sales
GROUP BY City
ORDER BY total_revenue ASC;

-- Task#11: What is the average time for orders to get shipped after order is placed?

SELECT CONCAT(AVG(DATEDIFF(day, Order_Date, Ship_Date)),' days') AS Avg_Time_To_Ship
FROM superstore_sales;





