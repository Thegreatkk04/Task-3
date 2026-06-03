-- View first 10 rows
SELECT * FROM sales LIMIT 10;

-- Total number of records
SELECT COUNT(*) AS total_records
FROM sales;

-- Total Revenue
SELECT SUM([GROSS AMT]) AS total_revenue
FROM sales;

-- Average Revenue
SELECT AVG([GROSS AMT]) AS avg_revenue
FROM sales;

-- Top 10 Customers by Revenue
SELECT CUSTOMER,
       SUM([GROSS AMT]) AS revenue
FROM sales
GROUP BY CUSTOMER
ORDER BY revenue DESC
LIMIT 10;

-- Revenue by Month
SELECT Months,
       SUM([GROSS AMT]) AS revenue
FROM sales
GROUP BY Months
ORDER BY revenue DESC;

-- Revenue by Size
SELECT Size,
       SUM([GROSS AMT]) AS revenue
FROM sales
GROUP BY Size
ORDER BY revenue DESC;

-- Top 10 Selling Styles
SELECT Style,
       SUM(PCS) AS total_pcs
FROM sales
GROUP BY Style
ORDER BY total_pcs DESC
LIMIT 10;

-- Orders with Revenue > Average Revenue
SELECT *
FROM sales
WHERE [GROSS AMT] >
(
    SELECT AVG([GROSS AMT])
    FROM sales
);

-- Revenue per Customer
SELECT CUSTOMER,
       SUM([GROSS AMT]) AS total_revenue,
       COUNT(*) AS total_orders
FROM sales
GROUP BY CUSTOMER
ORDER BY total_revenue DESC;

-- Create View
CREATE VIEW customer_revenue AS
SELECT CUSTOMER,
       SUM([GROSS AMT]) AS revenue
FROM sales
GROUP BY CUSTOMER;

-- Query View
SELECT *
FROM customer_revenue
ORDER BY revenue DESC;

-- Highest Revenue Month
SELECT Months,
       SUM([GROSS AMT]) AS revenue
FROM sales
GROUP BY Months
ORDER BY revenue DESC
LIMIT 1;

-- Average Rate by Size
SELECT Size,
       AVG(RATE) AS avg_rate
FROM sales
GROUP BY Size;

-- Total Pieces Sold
SELECT SUM(PCS) AS total_pieces_sold
FROM sales;
