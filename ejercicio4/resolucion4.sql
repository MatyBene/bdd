CREATE TABLE torneo_tenis;
USE torneo_tenis;

CREATE TABLE Participantes(
    id_participante INT AUTO_INCREMENT PRIMARY KEY,
    dni_participante VARCHAR(12),
    apellido VARCHAR(25),
    nombre VARCHAR(40),
    direccion VARCHAR(50),
    edad INT,
    telefono VARCHAR(20),
    sexo VARCHAR(15)
);

CREATE TABLE Categorias(
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25),
    edad_min INT,
    edad_max INT,
    sexo VARCHAR(15)
);

CREATE TABLE Inscripciones(
    num_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inscripcion DATE,
    abono_inscripcion BOOLEAN,
    FOREIGN KEY (fk_categoria) REFERENCES Categorias(id_categoria)
    FOREIGN KEY (fk_participante) REFERENCES Participantes(id_participante)
);

INSERT INTO Participantes() VALUES

INSERT INTO Categorias() VALUES

INSERT INTO Inscripciones() VALUES

/* CONSULTAS SQL */

/* 1 */
SELECT COUNT(*)
FROM Participantes;

/* 2 */
SELECT *
FROM Participantes;

/* 3 */
SELECT *
FROM Categorias;

/* 4 */
SELECT COUNT(*)
FROM Participantes
WHERE sexo = "Femenino";

/* 5 */
/* INNER JOIN IMPLICITO */
SELECT p.nombre, p.apellido
FROM Participantes p, Inscripciones i
WHERE p.id_participante = i.fk_participante AND i.fk_categoria = 5; -- ACA ES SABIENDO LA CATEGORIA --

/* INNER JOIN EXPLICITO */
SELECT p.nombre, p.apellido
FROM Participantes p
INNER JOIN Inscripciones i 
ON p.id_participante = i.fk_participante
INNER JOIN Categorias c
ON i.fk_categoria = c.id_categoria
WHERE c.nombre = "Caballeros B";

/* 6 */
/* CON BETWEEN */
SELECT *
FROM Participantes
WHERE edad BETWEEN 25 AND 37;

/* SIN BETWEEN */
SELECT *
FROM Participantes
WHERE edad >= 25 AND edad <= 37;

/* 7 */
/* INNER JOIN IMPLICITO */
SELECT p.nombre, p.apellido, i.num_inscripcion, i.fecha_inscripcion, i.abono_inscripcion
FROM Participantes p, Inscripciones i
WHERE p.id_participante = i.fk_participante;

/* INNER JOIN EXPLICITO */
SELECT p.nombre, p.apellido, i.num_inscripcion, i.fecha_inscripcion, i.abono_inscripcion
FROM Participantes p
INNER JOIN Inscripciones i 
ON p.id_participante = i.fk_participante;
