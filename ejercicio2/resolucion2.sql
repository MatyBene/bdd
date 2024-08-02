CREATE DATABASE infotienda;
USE infotienda;

CREATE TABLE Fabricantes(
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45),
    direccion VARCHAR(45)
);

CREATE TABLE Productos(
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45),
    precio ,
    FOREIGN KEY (fk_codigo) REFERENCES Fabricantes(codigo)
);


INSERT INTO Fabricantes (nombre, direccion) VALUES
('Fabricante A', 'Calle 123, Ciudad A'),
('Fabricante B', 'Avenida 456, Ciudad B'),
('Fabricante C', 'Boulevard 789, Ciudad C');

INSERT INTO Productos (nombre, precio, fk_codigo) VALUES
('Producto 1', 10.99, 1),
('Producto 2', 15.49, 1),
('Producto 3', 7.25, 2),
('Producto 4', 22.35, 2),
('Producto 5', 18.00, 3),
('Producto 6', 9.75, 3),
('Producto 7', 11.50, 1),
('Producto 8', 14.99, 2),
('Producto 9', 20.45, 3),
('Producto 10', 13.10, 1);


/* CONSULTAS */

/* 1 */
SELECT *
FROM Productos
ORDER BY precio ASC

/* 2 */
SELECT *
FROM Fabricantes
ORDER BY nombre ASC

/* 3 */
SELECT nombre, precio
FROM Productos
WHERE precio > 10000

/* 4 */
/* FORMA 1 */
SELECT nombre, precio
FROM Productos
WHERE precio = (SELECT MIN(precio) FROM Productos);

/* FORMA 2 */
SELECT nombre, precio
FROM Productos
ORDER BY precio ASC
LIMIT 1;
