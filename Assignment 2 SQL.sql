---------- Assignment 2 SQL ----------------

---- Q1 ----
-- Lists every product with its brand name --
SELECT
    p.product_name,
    b.brand_name
FROM production.products AS p
INNER JOIN production.brands AS b
    ON p.brand_id = b.brand_id;
---------------------------------------------

--- Q2 ---
-- LEFT JOIN is used to find stores with zero staff assigned --
SELECT
    s.store_id,
    s.store_name
FROM sales.stores AS s
LEFT JOIN sales.staffs AS st
    ON s.store_id = st.store_id
WHERE st.staff_id IS NULL;
---------------------------------------------

--- Q3 ---
-- INNER JOIN returns products with matching stock records --
-- WHERE filters products with fewer than 5 units in store 1 --
SELECT
    p.product_name,
    s.quantity
FROM production.products AS p
INNER JOIN production.stocks AS s
    ON p.product_id = s.product_id
WHERE s.quantity < 5
  AND s.store_id = 1;
---------------------------------------------

--- Q4 ---
-- Self JOIN lists each manager with their employees --
-- 1 is used as a placeholder for each employee-manager pair --
SELECT
    m.staff_id AS manager_id,
    m.first_name AS manager_name,
    e.staff_id AS employee_id,
    e.first_name AS employee_name,
    1 AS employee_count
FROM sales.staffs AS m
INNER JOIN sales.staffs AS e
    ON e.manager_id = m.staff_id;
---------------------------------------------

--- Q5 ---
-- Lists every item in order #1 with product name and quantity --
SELECT
    o.order_id,
    p.product_name,
    oi.quantity
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id
INNER JOIN production.products AS p
    ON oi.product_id = p.product_id
WHERE o.order_id = 1;
---------------------------------------------

--- Q6 ---
-- COUNT(*) after joining orders with order_items counts order items,
-- not unique orders, because one order can have multiple items --
-- COUNT(DISTINCT) counts each order only once --
SELECT COUNT(DISTINCT o.order_id) AS total_orders
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id;
---------------------------------------------

--- Q7 ---
-- CROSS JOIN returns every possible store-brand combination --
SELECT
    s.store_name,
    b.brand_name
FROM sales.stores AS s
CROSS JOIN production.brands AS b;
---------------------------------------------