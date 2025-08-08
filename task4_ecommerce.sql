CREATE DATABASE ecommerce_db;
USE ecommerce_db;
-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- OrderDetails Table
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Customers
INSERT INTO customers (name, email, country) VALUES
('Alice', 'alice@example.com', 'USA'),
('Bob', 'bob@example.com', 'UK'),
('Charlie', 'charlie@example.com', 'India');

-- Products
INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 800),
('Phone', 'Electronics', 500),
('Book', 'Stationery', 20);

-- Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-08-01'),
(2, '2025-08-02'),
(1, '2025-08-03');

-- Order Details
INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 1, 1),
(3, 2, 1);
SELECT name, country
FROM customers
WHERE country = 'USA'
ORDER BY name ASC;
SELECT c.country, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country;
-- INNER JOIN to get order details
SELECT o.order_id, c.name, p.product_name, od.quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id;
SELECT name, country
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
);
CREATE VIEW customer_orders AS
SELECT c.name, p.product_name, od.quantity, p.price, (od.quantity * p.price) AS total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id;
CREATE INDEX idx_customer_country ON customers(country);






