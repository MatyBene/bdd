# Torneo de tenis

Un club de deportes necesita de una base de datos para gestionar el torneo de tenis que realizara.

Para esto, el encargado del club manifiesta que necesitaria almacenar los datos de los jugadores, las diferentes categorias (con sus respectivos rangos de edad y sexo) y las inscripciones de cada uno de los participantes en donde se debe especificar si el mismo abono o no la inscripcion. Sugiere como estructura de las tablas lo siguiente:

## Modelado

- Participantes: dni_participante, apellido, nombre, direccion, edad, telefono, sexo.
- Categorias: id_categoria, nombre, edad_min, edad_max, sexo.
- Inscripciones: num_inscripcion, fecha_insc, abono_insc.
- Agregar registros a las tablas para poder realizar consultas.

## Categorias

- Damas A (18 a 34 años)
- Damas B (35 a 45 años)
- Damas C (46 a 100 años)
- Caballeros A (18 a 34 años)
- Caballeros B (35 a 50 años)
- Caballeros C (51 a 100 años)
- Juveniles varones (13 a 17 años)
- Juveniles mujeres (13 a 17 años)

## Consultas SQL:

1. Contar la cantidad total de participantes.
2. Obtener la lista completa de todos los participantes.
3. Obtener la lista completa de todas las categorias.
4. Obtener la cantidad de participantes mujeres (sin importar categoria).
5. Obtener el nombre y apellido de los inscriptos en la categoria "Caballeros B".
6. Obtener los datos de los participantes (de cualquier genero) que tengan una edad entre 25 y 37 años.
7. Obtener la lista completa de inscripciones, especificando nombre y apellido (y ademas los datos de la incripcion) de cada uno de los inscriptos, sin diferenciar categoria.
