# Superstore Sales Analysis Project

## Introduction
This project is focused on analyzing the sales data of a superstore. The analysis is performed in two parts: pre-processing the dataset using Python and Pandas, and analyzing the data using SQL. The goal of the project is to gain insights into the store's sales performance, customer behavior, and operational aspects.

## Dataset

The dataset used for this analysis is a superstore sales dataset. It contains information about the sales made by the store, including details such as order date, ship date, customer details, product details, and sales revenue. The dataset contains 9800 rows and 18 columns.

## Pre-processing the Dataset

Before analyzing the data, the dataset needs to be cleaned and pre-processed. The following steps were performed using Python and Pandas:

1. Removing duplicate rows (excluding the Row_ID column)
2. Removing rows with missing values
3. Removing irrelevant values from each column
4. Validating all values for each column, ensuring that order date and ship date are in the correct date format, and that the ship date is greater than or equal to the order date.

After pre-processing, the cleaned dataset was exported as a Excel file.

## Analyzing the Data
To gain insights from the superstore sales data, SQL queries were employed to answer specific questions about the sales performance, customer behavior, and operational aspects of the superstore. The following analysis tasks were performed:

1. What percentage of total orders were shipped on the same date?
   - This query calculates the percentage of orders that were shipped on the same date as the order date, providing insight into the store's efficiency in order fulfillment.

2. Name the top 3 customers with the highest total value of orders.
   - This query identifies the top three customers who have made the highest total value of orders, enabling the store to recognize valuable customers and tailor their marketing strategies accordingly.

3. Find the top 5 items with the highest average sales per day.
   - This query determines the top five items that generate the highest average sales per day, helping the store identify its best-selling products and optimize inventory management.

4. Write a query to find the average order value for each customer, and rank the customers by their average order value.
   - This query calculates the average order value for each customer and ranks them based on their average order value. This information aids in understanding customer spending patterns and identifying high-value customers.

5. Give the name of customers who ordered the highest and lowest orders from each city.
   - This query retrieves the names of customers who placed the highest and lowest orders from each city, facilitating targeted marketing campaigns and customer retention strategies.

6. What is the most demanded sub-category in the west region?
   - This query determines the most demanded sub-category of products in the west region, providing insights into regional preferences and aiding in inventory planning.

7. Which order has the highest number of items? And which order has the highest cumulative value?
   - These queries identify the order with the highest number of items and the order with the highest cumulative value. This information helps in understanding exceptional sales transactions and their contributing factors.

8. Which order has the highest cumulative value?
   - This query identifies the order with the highest cumulative value, providing an understanding of the most profitable order in the dataset.

9. Which segment’s order is more likely to be shipped via first class?
   - This query determines which customer segment is more likely to choose first-class shipping as their preferred method of shipment. This information can be used to tailor shipping options and pricing for different customer segments.

10. Which city is least contributing to total revenue?
   - This query identifies the city that has the lowest contribution to the total revenue of the store. This information can be useful in identifying areas where the store may need to improve its marketing or operations.

11. What is the average time for orders to get shipped after an order is placed?
   - This query calculates the average time it takes for orders to be shipped after they are placed. This metric provides insight into the store's operational efficiency in fulfilling orders and can be used to optimize the store's logistics processes.

## Conclusion

By pre-processing the dataset and analyzing the sales data using SQL, this project was able to gain insights into the sales performance, customer behavior, and operational aspects of the superstore. The findings can be used to optimize various aspects of the store's operations, such as inventory management, marketing strategies, and logistics processes, leading to improved profitability and customer satisfaction.

