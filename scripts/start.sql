/* Table overview (with time correction) */
SELECT
    pizza_id,
    order_id,
    pizza_name_id,
    quantity,
    order_date,
    CAST (order_time AS TIME(0)) AS order_time,
    unit_price,
    total_price,
    pizza_size,
    pizza_category,
    pizza_ingredients,
    pizza_name
FROM pizza_sales

/* Handling the NULL before doing any mathematical operations. */
SELECT *
FROM pizza_sales
WHERE 
    pizza_id IS NULL
    OR order_id IS NULL
    OR pizza_name_id IS NULL
    OR quantity IS NULL
    OR order_date IS NULL
    OR order_time IS NULL
    OR unit_price IS NULL
    OR total_price IS NULL
    OR pizza_size IS NULL
    OR pizza_category IS NULL
    OR pizza_ingredients IS NULL
    OR pizza_name IS NULL

-- There are no NULLs.

/* Handling the duplicates: no rows returned means all pizza_id values are unique. */
SELECT 
    pizza_id, 
    COUNT(*) AS cnt
FROM pizza_sales
GROUP BY pizza_id
HAVING COUNT(*) > 1
