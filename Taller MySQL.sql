

-- ============================
-- TALLER PRACTICO DE SQL - TechStore
-- ============================

-- EJ.01 - Construir la base
DROP DATABASE IF EXISTS techstore;
CREATE DATABASE techstore;
USE techstore;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_venta DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- EJ.02 - Modificar una estructura
ALTER TABLE clientes ADD COLUMN telefono VARCHAR(20);
ALTER TABLE productos MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

-- EJ.03 - Cargar productos y clientes
INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Mouse inalámbrico', 'Periféricos', 45000, 50),
('Teclado mecánico', 'Periféricos', 180000, 30),
('Monitor 24 pulgadas', 'Monitores', 650000, 15),
('Monitor 27 pulgadas', 'Monitores', 950000, 10),
('Laptop Core i5', 'Computadores', 2800000, 8),
('Laptop Core i7', 'Computadores', 3900000, 5),
('Disco SSD 1TB', 'Almacenamiento', 320000, 25),
('Memoria RAM 16GB', 'Componentes', 210000, 40),
('Audífonos Bluetooth', 'Audio', 95000, 20),
('Base para laptop', 'Accesorios', 60000, 35);

INSERT INTO clientes (nombre, email, ciudad, telefono) VALUES
('Carlos Ramírez', 'carlos.ramirez@mail.com', 'Cúcuta', '3001112233'),
('Laura Gómez', 'laura.gomez@mail.com', 'Bogotá', '3012223344'),
('Andrés Pérez', 'andres.perez@mail.com', 'Medellín', '3023334455'),
('Sofía Torres', 'sofia.torres@mail.com', 'Cali', '3034445566'),
('Yeison Rojas', 'yeison.rojas@mail.com', 'Cúcuta', '3045556677'),
('Diana Suárez', 'diana.suarez@mail.com', 'Bucaramanga', '3056667788');

-- EJ.04 - Registrar ventas con sentido
INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta) VALUES
(1, 1, 2, '2025-01-10'),
(1, 3, 1, '2025-02-15'),
(2, 5, 1, '2025-01-20'),
(2, 8, 3, '2025-03-01'),
(3, 2, 1, '2025-01-25'),
(3, 2, 2, '2025-04-05'),
(4, 6, 1, '2025-02-10'),
(4, 9, 2, '2025-02-11'),
(5, 7, 1, '2025-03-15'),
(5, 4, 1, '2025-05-01'),
(6, 10, 4, '2025-03-20'),
(6, 1, 1, '2025-05-10');

-- EJ.05 - Corregir y eliminar con seguridad
SELECT * FROM productos WHERE id_producto = 2;
UPDATE productos SET precio = 175000 WHERE id_producto = 2;

SELECT stock FROM productos WHERE id_producto = 1;
UPDATE productos SET stock = stock - 2 WHERE id_producto = 1;

INSERT INTO productos (nombre, categoria, precio, stock)
VALUES ('Producto erróneo', 'Accesorios', 1000, 1);

SELECT * FROM productos WHERE nombre = 'Producto erróneo';
DELETE FROM productos WHERE nombre = 'Producto erróneo';

-- EJ.06 - Primera exploracion
SELECT * FROM productos;
SELECT nombre, precio FROM productos;
SELECT nombre, precio AS precio_unitario FROM productos;

-- EJ.07 - Filtrar por una condicion
SELECT * FROM productos WHERE precio > 500000;
SELECT * FROM clientes WHERE ciudad = 'Cúcuta';
SELECT * FROM productos WHERE categoria = 'Monitores';

-- EJ.08 - Combinar condiciones
SELECT * FROM productos
WHERE categoria = 'Monitores' AND precio < 700000;

SELECT * FROM clientes
WHERE ciudad = 'Cúcuta' OR ciudad = 'Bogotá';

-- EJ.09 - Buscar por rangos y texto
SELECT * FROM productos WHERE precio BETWEEN 100000 AND 500000;
SELECT * FROM productos WHERE categoria IN ('Periféricos', 'Audio', 'Accesorios');
SELECT * FROM productos WHERE nombre LIKE '%Laptop%';

-- EJ.10 - Ordenar resultados
SELECT * FROM productos ORDER BY precio ASC;
SELECT * FROM productos ORDER BY stock DESC;
SELECT nombre, categoria, precio
FROM productos
WHERE categoria = 'Componentes' OR categoria = 'Almacenamiento'
ORDER BY precio DESC;