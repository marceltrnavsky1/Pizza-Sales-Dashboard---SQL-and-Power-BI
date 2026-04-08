/* We would like to visualize various asptects of our pizza sales data to gain insights and understand key
trends. We have identified the following requirements for creating charts:
1.Daily Trend for Total Orders, 2.Hourly Trend for Total Orders, 3.Percentage of Sales by Pizza Category */

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
DATENAME(MONTH,order_date) AS order_month,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY DATENAME(MONTH,order_date)
