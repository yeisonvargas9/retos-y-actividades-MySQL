DROP DATABASE IF EXISTS techstore;
CREATE DATABASE techstore;
USE techstore;


CREATE TABLE Producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    categoria VARCHAR(50)
);

CREATE TABLE Venta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    cantidad INT,
    fecha DATE
);


ALTER TABLE Venta
ADD CONSTRAINT fk_producto
FOREIGN KEY (id_producto) REFERENCES Producto(id);

INSERT INTO Producto (nombre, precio, categoria) VALUES
('laptop hp', 2500000, 'tecnologia'),
('mouse logitech', 45000, 'tecnologia'),
('silla oficina', 350000, 'muebles'),
('camisa polo', 80000, 'ropa');

INSERT INTO Venta (id_producto, cantidad, fecha) VALUES
(1, 2, '2026-01-10'),
(2, 5, '2026-02-15'),
(3, 1, '2026-03-01'),
(4, 3, '2026-03-05');



CREATE TABLE productos_caros AS
SELECT *
FROM Producto
WHERE precio > 100000;


DESCRIBE productos_caros;


SELECT p.nombre, p.precio, v.cantidad, v.fecha
FROM Producto p
JOIN Venta v ON p.id = v.id_producto;


SELECT 
    nombre,
    precio,
    IF(precio > 500000, 'Premium', 'Estándar') AS clasificacion
FROM Producto;




SELECT 
    p.nombre AS producto,
    UPPER(p.categoria) AS categoria,
    v.cantidad,
    ROUND(p.precio * v.cantidad, 0) AS total_venta,
    IF(p.precio > 500000, 'Premium', 'Estándar') AS tipo_producto
FROM Producto p
JOIN Venta v ON p.id = v.id_producto;


















