CREATE DATABASE club;
USE club;

CREATE TABLE Deportes (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    es_grupal BOOLEAN
);

CREATE TABLE Socios (
    num_socio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45),
    apellido VARCHAR(45),
    dni VARCHAR(15),
    FOREIGN KEY (fk_codigo) REFERENCES Deportes(codigo)
);

INSERT INTO Deportes (nombre, es_grupal) VALUES
("Tenis", 0),
("Basquet", 1),
("Futbol", 1);

INSERT INTO Socios (nombre, apellido, dni, fk_codigo) VALUES
('Juan', 'Perez', '12345678A', 1),
('Maria', 'Lopez', '23456789B', 2),
('Carlos', 'Gomez', '34567890C', 1),
('Ana', 'Martinez', '45678901D', 3),
('Luis', 'Garcia', '56789012E', 2),
('Elena', 'Fernandez', '67890123F', 3),
('Marta', 'Sanchez', '78901234G', 1),
('Jose', 'Diaz', '89012345H', 3),
('Sofia', 'Ramirez', '90123456I', 2),
('Pedro', 'Molina', '01234567J', 1);

/* CONSULTAS */

/* 1 */
SELECT *
FROM Socios

/* 2 */
SELECT *
FROM Deportes

/* 3 */
SELECT *
FROM Socios
WHERE fk_codigo = 1

/* 4 */
SELECT COUNT(fk_codigo)
FROM Socios
WHERE fk_codigo = 3