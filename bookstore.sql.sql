-- Step 1: Create the Database Schema
-- We begin by creating the tables using SQL CREATE TABLE statements. These include foreign key relationships for orders and marketing spend.

-- 1. Books table
CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    genre TEXT,
    price DECIMAL(6,2),
    stock INTEGER
);

-- 2. Customers table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT,
    signup_date DATE
);

-- 3. Orders table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    book_id INTEGER,
    quantity INTEGER,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- 4. MarketingSpend table
CREATE TABLE MarketingSpend (
    spend_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    spend_amount DECIMAL(7,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Step 2: Insert Sample Data
-- In this step we will insert sample data into all four tables: Books, Customers, Orders and MarketingSpend
-- Books
INSERT INTO Books VALUES
(1, 'Data Science 101', 'Education', 29.99, 100),
(2, 'The Art of SQL', 'Technology', 34.50, 50),
(3, 'Mystery at the Bookstore', 'Fiction', 15.00, 20),
(4, 'Learn Python the Hard Way', 'Education', 40.00, 30),
(5, 'Fantasy World Chronicles', 'Fantasy', 22.50, 10),
(6, 'AI for Beginners', 'Technology', 27.99, 60),
(7, 'Deep Learning Guide', 'Technology', 45.00, 40),
(8, 'Romantic Escapes', 'Fiction', 18.75, 25),
(9, 'History of Civilizations', 'Education', 32.00, 35),
(10, 'Space Adventures', 'Fantasy', 24.99, 15),
(11, 'Data Analytics Pro', 'Technology', 38.00, 50),
(12, 'Modern Web Development', 'Technology', 42.50, 45),
(13, 'Thriller Nights', 'Fiction', 20.00, 30),
(14, 'Ancient Empires', 'History', 28.00, 20),
(15, 'Machine Learning Basics', 'Technology', 36.99, 55),
(16, 'Poetry of the Soul', 'Fiction', 14.99, 40),
(17, 'Cybersecurity Essentials', 'Technology', 39.99, 25),
(18, 'World War Chronicles', 'History', 34.00, 22),
(19, 'Advanced Python', 'Education', 44.00, 33),
(20, 'Dragon Realm', 'Fantasy', 26.50, 18);

-- Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'New York', '2023-01-10'),
(2, 'Bob', 'San Francisco', '2023-03-15'),
(3, 'Charlie', 'Austin', '2023-06-20'),
(4, 'Diana', 'New York', '2024-01-10'),
(5, 'Evan', 'Chicago', '2024-04-05'),
(6, 'Fiona', 'Boston', '2024-05-01'),
(7, 'George', 'Seattle', '2024-05-10'),
(8, 'Hannah', 'Austin', '2024-05-15'),
(9, 'Ian', 'Chicago', '2024-05-20'),
(10, 'Julia', 'San Francisco', '2024-05-25'),
(11, 'Kevin', 'New York', '2024-06-01'),
(12, 'Laura', 'Boston', '2024-06-02'),
(13, 'Mike', 'Dallas', '2024-06-03'),
(14, 'Nina', 'Seattle', '2024-06-04'),
(15, 'Oscar', 'Austin', '2024-06-05'),
(16, 'Paula', 'Chicago', '2024-06-06'),
(17, 'Quinn', 'San Francisco', '2024-06-07'),
(18, 'Ryan', 'Dallas', '2024-06-08'),
(19, 'Sophia', 'New York', '2024-06-09'),
(20, 'Tom', 'Boston', '2024-06-10');

-- Orders
INSERT INTO Orders VALUES
(1, 1, 1, 2, '2024-06-01'),
(2, 2, 2, 1, '2024-06-02'),
(3, 1, 3, 1, '2024-06-03'),
(4, 3, 1, 3, '2024-06-04'),
(5, 4, 5, 2, '2024-06-04'),
(6, 5, 2, 2, '2024-06-05'),
(7, 2, 4, 1, '2024-06-05'),
(8, 1, 1, 1, '2024-06-06'),
(9, 6, 6, 2, '2024-06-07'),
(10, 7, 7, 1, '2024-06-07'),
(11, 8, 8, 3, '2024-06-08'),
(12, 9, 9, 1, '2024-06-08'),
(13, 10, 10, 2, '2024-06-09'),
(14, 11, 11, 1, '2024-06-09'),
(15, 12, 12, 2, '2024-06-10'),
(16, 13, 13, 1, '2024-06-10'),
(17, 14, 14, 2, '2024-06-11'),
(18, 15, 15, 3, '2024-06-11'),
(19, 16, 16, 1, '2024-06-12'),
(20, 17, 17, 2, '2024-06-12'),
(21, 18, 18, 1, '2024-06-13'),
(22, 19, 19, 2, '2024-06-13'),
(23, 20, 20, 1, '2024-06-14');

-- Marketing Spend
INSERT INTO MarketingSpend VALUES
(1, 1, 50.00),
(2, 2, 75.00),
(3, 3, 40.00),
(4, 4, 60.00),
(5, 5, 35.00),
(6, 6, 55.00),
(7, 7, 65.00),
(8, 8, 45.00),
(9, 9, 70.00),
(10, 10, 80.00),
(11, 11, 60.00),
(12, 12, 50.00),
(13, 13, 42.00),
(14, 14, 68.00),
(15, 15, 47.00),
(16, 16, 39.00),
(17, 17, 75.00),
(18, 18, 52.00),
(19, 19, 66.00),
(20, 20, 58.00);

-- Step 3: Analyze Book Performance
-- Here we will use SQL Joins and aggregations to calculate total units sold and total revenue per book

SELECT 
    b.title,
    SUM(o.quantity) AS total_units_sold,
    SUM(o.quantity * b.price) AS total_revenue
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.title
ORDER BY total_revenue DESC;

-- Step 4: Inventory Alerts
-- In this step we will trigger alerts for books running low on stock. We need to maintain healthy stock levels to prevent lost sales

SELECT 
    title, stock
FROM Books
WHERE stock < 15;

-- Step 5: Segment Customers Using RFM Analysis 
-- Use a Common Table Expression (CTE) to understand top customers and create segments.
-- Recency: Time since last purchase
-- Frequency: Number of orders
-- Monetary: Total spent

WITH customer_metrics AS (
    SELECT
        c.customer_id,
        c.name,
        MAX(order_date) AS last_order,
        COUNT(o.order_id) AS frequency,
        SUM(o.quantity * b.price) AS monetary
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Books b ON o.book_id = b.book_id
    GROUP BY c.customer_id
)
SELECT *,
       DATEDIFF('2024-07-01', last_order) AS recency_days
FROM customer_metrics;

-- Step 6: Evaluate Marketing ROI
--Compare customer lifetime revenue vs acquisition cost using joins and subqueries.
-- We can say how much return you are getting per customer on marketing spend.

WITH customer_spend AS (
    SELECT 
        o.customer_id,
        SUM(o.quantity * b.price) AS total_revenue
    FROM Orders o
    JOIN Books b ON o.book_id = b.book_id
    GROUP BY o.customer_id
)
SELECT 
    c.customer_id,
    c.name,
    ms.spend_amount,
    cs.total_revenue,
    (cs.total_revenue - ms.spend_amount) AS profit
FROM Customers c
JOIN MarketingSpend ms ON c.customer_id = ms.customer_id
JOIN customer_spend cs ON c.customer_id = cs.customer_id;

-- Step 7: Monthly Sales Trend
-- This step tracks how many books were sold and the total revenue generated each month.
-- It helps identify sales seasonality and evaluate the performance of promotional campaigns.

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(quantity * b.price) AS total_revenue
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY month
ORDER BY month;

-- Step 8: Returning Customers
-- This query identifies customers who have placed more than one order. 
-- It helps assess customer loyalty and repeat engagement with the store

SELECT 
    c.customer_id,
    c.name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING total_orders > 1;

-- Step 9: Average Order Value (AOV)
-- This step calculates how much revenue is generated per order on average. 
-- It is a key business metric for understanding customer purchasing behavior.

SELECT 
    ROUND(SUM(quantity * b.price) * 1.0 / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM Orders o
JOIN Books b ON o.book_id = b.book_id;

-- Step 10: Books Frequently Bought Together
-- Identify books that are often purchased by the same customer, enabling better recommendations and bundle promotions.
-- Use this to suggest complementary books during checkout.

SELECT 
    o1.book_id AS book_1,
    o2.book_id AS book_2,
    COUNT(*) AS times_bought_together
FROM Orders o1
JOIN Orders o2 
  ON o1.customer_id = o2.customer_id AND o1.order_id != o2.order_id
WHERE o1.book_id < o2.book_id
GROUP BY book_1, book_2
ORDER BY times_bought_together DESC
LIMIT 10;
 
-- Step 11: Churned Customers
-- This step detects customers who haven’t made a purchase in the last 365 days, identifying users who may need re-engagement campaigns.

SELECT 
    c.customer_id,
    c.name,
    MAX(o.order_date) AS last_purchase,
    DATEDIFF('2025-07-01', MAX(o.order_date)) AS days_since_last_purchase
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING DATEDIFF('2025-07-01', MAX(o.order_date)) > 365;


