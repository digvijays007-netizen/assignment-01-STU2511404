-- Part 5 — Data Lakes & DuckDB
-- NOTE:
-- Run from repository root: https://github.com/digvijays007-netizen/assignment-01-STU2511404/tree/7c1e84febbc430f15ec0089e2becf48fc7bebe95/datasets
-- duckdb
-- .read part5-datalake/duckdb_queries.sql

-- Q1: List all customers along with the total number of orders they have placed
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('datasets/customers.csv', header = true) AS c
LEFT JOIN read_json_auto('datasets/orders.json') AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC, c.customer_id;

-- Q2: Find the top 3 customers by total order value
SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_order_value
FROM read_csv_auto('datasets/customers.csv', header = true) AS c
JOIN read_json_auto('datasets/orders.json') AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_order_value DESC, c.customer_id
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore
SELECT DISTINCT
    c.customer_id,
    c.name,
    p.product_id,
    p.product_name,
    p.category
FROM read_csv_auto('datasets/customers.csv', header = true) AS c
JOIN read_json_auto('datasets/orders.json') AS o
    ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') AS p
    ON o.order_id = p.order_id
WHERE c.city = 'Bangalore'
ORDER BY c.customer_id, p.product_name;

-- Q4: Join all three files to show customer name, order date, product name, and quantity
SELECT
    c.name AS customer_name,
    o.order_date,
    p.product_name,
    p.quantity
FROM read_csv_auto('datasets/customers.csv', header = true) AS c
JOIN read_json_auto('datasets/orders.json') AS o
    ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') AS p
    ON o.order_id = p.order_id
ORDER BY o.order_date, customer_name, p.product_name;
