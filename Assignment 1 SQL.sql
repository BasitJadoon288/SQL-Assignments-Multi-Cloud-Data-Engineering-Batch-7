---------- Assignemnt 1 SQL ----------------
---- Q1 ----
SELECT
    product_name,
    list_price,
    list_price / 1000.0 AS price_in_thousands
FROM production.products;
---------------------------------------------

--- Q2 ---
-- Distinct used for remove duplicate values and show unique value one time --
SELECT DISTINCT state
FROM sales.customers;
----------------------

--- Q3 ---
SELECT TOP 5
    product_name,
    list_price
FROM production.products
ORDER BY list_price ASC;
------------------------

--- Q4 ---
SELECT *
FROM production.products
WHERE list_price BETWEEN 200 AND 600
  AND category_id IN (1, 6);
-------------------------------------

--- Q5 correct Query ---
SELECT
    product_name,
    category_id,
    list_price
FROM production.products
WHERE category_id IN (1, 6)
  AND list_price < 1000;
----------------------------

--- Q6 ---
SELECT *
FROM sales.customers
WHERE email LIKE '%.com'
  AND last_name LIKE 'M%';
--------------------------

--- Q7 ---
-- OFFSET is used to skip a specified number of rows. --
-- FETCH is used to retrieve a specified number of rows. --
SELECT
    product_name,
    list_price
FROM production.products
ORDER BY list_price DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;
------------------------

--- Q8 ---
-- !=, <> means not equal to --
-- NULL cannot be compared using <>. Use IS NOT NULL instead. --
-- Use IS NULL or IS NOT NULL to check for NULL values. --
SELECT *
FROM sales.order_items
WHERE discount IS NOT NULL;
----------------------------