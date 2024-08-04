# Veterinaria

Una veterinaria desea llevar un control de sus pacientes y sus tratamientos en la tablas Pacientes y Tratamientos con los siguientes datos:

## Modelado

- Pacientes: id_paciente, nombre, fecha_nacimiento, especie.
- Tratamientos: id_tratamiento, id_paciente(fk), tipo, fecha.
- Realizar el modelado de la base de datos.
- Agregar registros a ambas tablas para realizar consultas.

## Consultas SQL

1. Obtener el nombre de cada paciente asociado a la lista historica de tratamientos que se le realizo, ordenado alfabeticamente por nombre del paciente.
2. Obtener la cantidad total de tratamientos asignados a un mismo paciente entre dos fechas.
3. El paciente con mayor cantidad de tratamientos realizados.
