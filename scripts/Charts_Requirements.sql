/* We would like to visualize various asptects of our pizza sales data to gain insights and understand key
trends. We have identified the following requirements for creating charts:
1.Daily Trend for Total Orders, 2.Monthly and Hourly Trend for Total Orders, 3.Percentage of Sales by Pizza Category,
4.Percentage of Sales by Pizza Size, 5.Total Pizzas Sold by Pizza Category, 6.Top 5 Best Sellers by Total Pizzas Sold,
7.Bottom 5 Worst Sellers by Total Sold */

/* 1.Daily Trend for Total Orders: Create a bar chart that displays the daily trend of total orders a specific time period.
This chart will help us identify any patterns or fluctuations in order volumes on a daily basis. */
SELECT
DATENAME(WEEKDAY, order_date) AS day_of_the_week,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date)

/* 2.Hourly Trend for Total Orders: Create a line chart that illustrates the hourly trend of total orders throughout the day.
This chart will allow us identify hours or periods of high order activity. */
SELECT
DATEPART(HOUR,order_time) AS order_hour,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY order_hour

/* 2.Monthly Trend for Total Orders: Create a line chart that displays the monthly trend of total orders over a specific time period.
This chart will allow us to identify peak months of high order activity. */
SELECT
FORMAT(order_date, 'MMM') AS order_month,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY FORMAT(order_date, 'MMM'),
	     DATEPART(MONTH,order_date)
ORDER BY DATEPART(MONTH,order_date)

/* 3.Percentage of Sales by Pizza Category: Create a pie chart shows the distribution of sales across different pizza categories.
This chart will provide insights into the popularity categories and thier contirbution to overall sales. */
	
-- What different categories of pizza do we have in the business, and how many are there?
SELECT
DISTINCT pizza_category
FROM pizza_sales

SELECT
pizza_category,
ROUND(SUM(total_price),0) AS total_revenue,
ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales),2) AS PCT    -- Use 100.0 to ensure decimal division and avoid integer truncation
FROM pizza_sales
GROUP BY pizza_category
ORDER BY PCT DESC

/* 4.Percentage of Sales by Pizza Size: Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. 
This chart will help us understand customer preference for pizza sizes and their impact on sales. */
SELECT
pizza_size,
ROUND(SUM(total_price),0) AS total_revenue,
ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales),2) AS PCT    -- Use 100.0 to ensure decimal division and avoid integer truncation
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

/* 5.Total Pizzas Sold by Pizza Category: Create a funnel chart that presents the total number of pizzas sold for each pizza category.
This chart will allow us to compare the sales performance of different pizza categories. */
SELECT
pizza_category,
ROUND(SUM(quantity),0) AS total_quantity
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_quantity DESC

/* 6.Top 5 Best Sellers by Total Pizzas Sold: Create a bar chart highlighting the top 5 best-selling pizzas based on the total number of pizzas sold.
This chart will help us identify the most popular pizza options. */

-- by Revenue
SELECT TOP 5
pizza_name,
ROUND(SUM(total_price),0) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC

 -- by Quantity
SELECT TOP 5
pizza_name,
ROUND(SUM(quantity),0) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC

-- by Total Orders
SELECT TOP 5
pizza_name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC

/* 7.Bottom 5 Worst Sellers by Total Sold: Create a bar chart showcasing the bottom 5 worst-selling pizzas based on the total number of pizzas sold.
This chart will enable us to identify underperforming or less popular pizza options. */

-- by Revenue
SELECT TOP 5
pizza_name,
ROUND(SUM(total_price),0) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC

-- by Quantity
SELECT TOP 5
pizza_name,
ROUND(SUM(quantity),0) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC

-- by Total Orders
SELECT TOP 5
pizza_name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
