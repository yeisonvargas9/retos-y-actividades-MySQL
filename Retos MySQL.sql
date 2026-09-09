-- 1. Eliminar la tabla de pruebas no deseada
DROP TABLE IF EXISTS test_products;

-- 2. Crear tabla de departamentos
CREATE TABLE IF NOT EXISTS departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 3. Crear tabla de empleados con restricciones
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    salary DECIMAL(10, 2) CHECK (salary >= 0),
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 4. Crear tabla de clientes
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    city VARCHAR(100),
    registration_date DATE NOT NULL,
    accepts_promotions BOOLEAN DEFAULT FALSE,
    phone VARCHAR(20)
);

--------------------------------------------------------------------------

