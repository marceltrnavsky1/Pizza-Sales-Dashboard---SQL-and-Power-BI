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
