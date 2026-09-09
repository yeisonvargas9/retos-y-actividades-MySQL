-- RETO 1: 
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL, 
    city VARCHAR(100),
    registration_date DATE NOT NULL,
    accepts_promotions BOOLEAN DEFAULT FALSE 
);

-- RETO 2: 
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    salary DECIMAL(10, 2) CHECK (salary >= 0),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- RETO 3: 
DROP TABLE IF EXISTS test_products;

ALTER TABLE customers 
ADD COLUMN phone VARCHAR(20);


-- RETO 4:
UPDATE products
SET price = 549.00
WHERE product_id = 310;

DELETE FROM products
WHERE product_id = 118;

-- RETO 5:
SELECT name, registration_date
FROM customers
WHERE city = 'Bogotá'
ORDER BY registration_date DESC
LIMIT 5;

-- RETO 6: 
SELECT product_id, product_name, category, price
FROM products
WHERE category IN ('Home Appliances', 'Technology')
  AND product_name LIKE '%Smart%';
  
 -- RETO 7:
SELECT 
    category_id, 
    AVG(price) AS average_price
FROM products
GROUP BY category_id
HAVING AVG(price) > 300000;



 
 
 
 