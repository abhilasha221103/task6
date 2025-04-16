
-- Create the table
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

-- Insert sample data
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-15', 100.00, 101),
(2, '2023-01-25', 200.00, 102),
(3, '2023-02-01', 150.00, 101),
(4, '2023-02-18', 300.00, 103),
(5, '2023-03-20', 250.00, 104),
(6, '2023-03-22', 100.00, 101),
(7, '2023-04-10', 400.00, 105);

-- Query 1: Monthly revenue and order volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    year, month
ORDER BY 
    year, month;

-- Query 2: Top 3 months by revenue
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM 
    online_sales
GROUP BY 
    year, month
ORDER BY 
    monthly_revenue DESC
LIMIT 3;
