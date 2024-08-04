CREATE TABLE veterinaria;
USE veterinaria;

CREATE TABLE Pacientes(
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45),
    fecha_nacimiento DATE,
    especie VARCHAR(45)
);

CREATE TABLE Tratamientos(
    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(45),
    fecha DATE,
    FOREIGN key (id_paciente) REFERENCES Pacientes(id_paciente)
);

INSERT INTO Pacientes (nombre, fecha_nacimiento, especie) VALUES
('Max', '2015-06-12', 'Perro'),
('Luna', '2018-03-22', 'Gato'),
('Bella', '2017-11-08', 'Conejo'),
('Rocky', '2019-01-15', 'Hámster'),
('Simba', '2016-07-29', 'Gato');

INSERT INTO Tratamientos (tipo, fecha, id_paciente) VALUES
('Vacunación', '2020-05-14', 1),
('Desparasitación', '2021-07-20', 2),
('Cirugía', '2019-09-25', 3),
('Revisión General', '2022-02-18', 4),
('Vacunación', '2020-10-05', 5),
('Limpieza Dental', '2023-01-10', 2),
('Tratamiento Antipulgas', '2021-03-11', 2);

/* CONSULTAS SQL */

/* 1 */
/* FORMA SENCILLA */
SELECT p.nombre, t.tipo, t.fecha
FROM Pacientes p, Tratamientos t
WHERE p.id_paciente = t.id_paciente
ORDER BY p.nombre;

/* OTRA FORMA (INNER JOIN EXPLICITO) */
SELECT p.nombre, t.tipo, t.fecha
FROM Pacientes p
INNER JOIN Tratamientos t
ON p.id_paciente = t.id_paciente
ORDER BY p.nombre;

/* 2 */
SELECT p.nombre, COUNT(id_tratamiento) AS cant_tratamientos
FROM Pacientes p
INNER JOIN Tratamientos t
ON p.id_paciente = t.id_paciente
-- WHERE t.fecha > '2022-01-01' AND t.fecha <= '2022-12-31'
WHERE t.fecha BETWEEN '2020-01-01' AND '2023-12-31' AND p.id_paciente = 4;

/* 3 */
SELECT p.nombre, COUNT(id_tratamiento) AS cant_tratamientos
FROM Pacientes p
INNER JOIN Tratamientos t
ON p.id_paciente = t.id_paciente
GROUP BY id_paciente 
ORDER BY cant_tratamientos DESC
LIMIT 1;

