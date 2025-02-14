create database saless;
use saless;
select * from shopping;
DESCRIBE shopping;
-- Get summary statistics
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT `Customer ID`) AS unique_customers,
    MIN(`Purchase Amount (USD)`) AS min_purchase,
    MAX(`Purchase Amount (USD)`) AS max_purchase,
    AVG(`Purchase Amount (USD)`) AS avg_purchase
FROM shopping;

-- Top 10 items by total revenue
SELECT `Item Purchased`, SUM(`Purchase Amount (USD)`) AS total_revenue, SUM(`Previous Purchases`) AS total_quantity_sold
FROM shopping
GROUP BY `Item Purchased`
ORDER BY total_revenue DESC
LIMIT 10;

-- Top categories by revenue
SELECT `Category`, SUM(`Purchase Amount (USD)`) AS total_revenue
FROM shopping
GROUP BY `Category`
ORDER BY total_revenue DESC;

-- Top 10 customers by total spending
SELECT `Customer ID`, SUM(`Purchase Amount (USD)`) AS total_spent, COUNT(*) AS total_purchases
FROM shopping
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 10;

-- Average spending by gender
SELECT `Gender`, AVG(`Purchase Amount (USD)`) AS avg_spending
FROM shopping
GROUP BY `Gender`;

-- Total sales by location
SELECT `Location`, SUM(`Purchase Amount (USD)`) AS total_sales, COUNT(*) AS total_orders
FROM shopping
GROUP BY `Location`
ORDER BY total_sales DESC;

-- Sales with and without discounts
SELECT `Discount Applied`, SUM(`Purchase Amount (USD)`) AS total_sales
FROM shopping
GROUP BY `Discount Applied`;

-- Sales with and without discounts
SELECT `Discount Applied`, SUM(`Purchase Amount (USD)`) AS total_sales
FROM shopping_trends
GROUP BY `Discount Applied`;

-- Sales with and without promo codes
SELECT `Promo Code Used`, SUM(`Purchase Amount (USD)`) AS total_sales
FROM shopping
GROUP BY `Promo Code Used`;

-- Sales by payment method
SELECT `Payment Method`, SUM(`Purchase Amount (USD)`) AS total_sales
FROM shopping
GROUP BY `Payment Method`
ORDER BY total_sales DESC;

-- Sales by shipping type
SELECT `Shipping Type`, SUM(`Purchase Amount (USD)`) AS total_sales
FROM shopping
GROUP BY `Shipping Type`
ORDER BY total_sales DESC;

-- Sales by age group
SELECT 
    CASE 
        WHEN `Age` < 20 THEN 'Under 20'
        WHEN `Age` BETWEEN 20 AND 29 THEN '20-29'
        WHEN `Age` BETWEEN 30 AND 39 THEN '30-39'
        WHEN `Age` BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS age_group,
    SUM(`Purchase Amount (USD)`) AS total_sales
FROM shopping
GROUP BY age_group
ORDER BY total_sales DESC;

-- Subscription status analysis
SELECT `Subscription Status`, SUM(`Purchase Amount (USD)`) AS total_sales
FROM shopping
GROUP BY `Subscription Status`;



