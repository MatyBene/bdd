# Escuela de musica

Una escuela de musica necesita una base de datos para gestionar las clases y cursos que ofrecera. Para esto, el director de la escuela manifiesta que necesitaria almacenar los datos de los alumnos, los cursos (con sus respectivos niveles de habilidad y tipo de instrumento), y las inscripciones de cada alumno en los cursos donde se debe especificar si el mismo abono la inscripcion. Sugiere como estructura de las tablas lo siguiente:

## Modelado

- Alumnos: id_alumno, apellido, nombre, edad, direccion, telefono, email.
- Cursos: id_curso, nombre, nivel_habilidad, tipo_instrumento.
- Inscripciones: id_inscripcion, fecha_inscripcion, abono_inscripcion, fk_alumno, fk_curso.

## El director manifesto que los cursos presentes seran:

- Guitarra principiante
- Guitarra intermedio
- Guitarra avanzado
- Piano principiante
- Piano intermedio
- Piano avanzado
- Violin principiante
- Violin intermedio
- Violin avanzado

## Consultas SQL

### Nivel 1

1. Listar todos los alumnos inscriptos en el curso de "Guitarra intermedio".
2. Mostrar todas las inscripciones realizadas despues del 1 de Enero de 2024.
3. Contar la cantidad de alumnos que han abonado la inscripcion.
4. Listar los cursos disponibles para alumnos avanzados.

### Nivel 2

1. Listar los nombres y apellidos de los alumnos junto con los nombres de los cursos a los que estan inscriptos.
2. Obtener el nombre y apellido de los alumnos que estan inscriptos en mas de un curso.
3. Mostrar el nombre del curso y la cantidad de alumnos inscriptos en cada curso.

### Nivel 3

1. Listar los alumnos que no han abandonado la inscripcion.
2. Obtener los nombres de los cursos que tienen al menos un alumno mayor de 20 anos inscripto.
3. Listar el nombre y apellido de los alumnos junto con los nombres de los cursos en los que estan inscriptos, pero solo para aquellos que se inscribieron en 2024.
