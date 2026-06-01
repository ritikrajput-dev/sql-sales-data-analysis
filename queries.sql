-- SQL Sales Data Analysis Project

-- Creating Customers Table
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    city TEXT
);

-- Creating Orders Table
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product TEXT,
    amount INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Inserting Customer Data
INSERT INTO customers VALUES
(1, 'Rohan', 'Delhi'),
(2, 'Amit', 'Mumbai'),
(3, 'Sneha', 'Bhopal');

-- Inserting Order Data
INSERT INTO orders VALUES
(101, 1, 'Laptop', 50000),
(102, 2, 'Mobile', 20000),
(103, 1, 'Keyboard', 2000),
(104, 3, 'Tablet', 15000),
(105, 2, 'Headphones', 3000);

-- 1. View all customers
SELECT * FROM customers;

-- 2. View all orders
SELECT * FROM orders;

-- 3. Total sales amount
SELECT SUM(amount) AS total_sales
FROM orders;

-- 4. Customer-wise total spending
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- 5. Customer-wise sales report using JOIN
SELECT customers.customer_name, customers.city, SUM(orders.amount) AS total_spent
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name, customers.city;

-- 6. Orders above 10000
SELECT *
FROM orders
WHERE amount > 10000;

-- 7. Highest value orders
SELECT *
FROM orders
ORDER BY amount DESC;

-- 8. City-wise sales analysis
SELECT customers.city, SUM(orders.amount) AS city_sales
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.city;

-- 9. Average order value
SELECT AVG(amount) AS average_order_value
FROM orders;

-- 10. Total number of orders
SELECT COUNT(order_id) AS total_orders
FROM orders;
