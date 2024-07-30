## Foreign keys

Es un constraint que permite que una columna de una tabla guarde como valor un dato particular que referencia a otra tabla, y que sirve para relacionar estas dos tablas entre si.

Ejemplo:

![foreign key](img/ej-fk.png)

# Manipulacion y consulta de datos

## Insert, update, delete

### Insert

Existen dos formas de agregar datos en una tabla:

- Insertando datos en todas las columnas
- Insertando datos en las columnas que especificamos

#### Todas las columnas

El orden en el que insertemos los valores, debera ser el mismo orden que tengan asignadas las columnas en la tabla.

```SQL
INSERT INTO table_name(c1, c2, ...)
VALUES(v1, v2, ...)
```

```SQL
INSERT INTO usuarios(id, nombre, apellido)
VALUES(DEFAULT, 'Max', 'Power');
```

```SQL
INSERT INTO usuarios
VALUES(DEFAULT, 'Max', 'Power')
```

#### Columnas especificas

Aclarar la tabla y luego escribimos el nombre de la o las columnas entre parentesis.

```SQL
INSERT INTO usuarios(nombre)
VALUES('Santi')
```

```SQL
INSERT INTO peiculas(duracion, titulo)
VALUES(112, 'Kill Bill')
```

### Update

Modificara los registros existentes de una tabla. Utilizar WHERE para agregar la condicion de cuales son las filas que queremos actualizar.

```SQL
UPDATE nombre_tabla
SET c1 = v1, c2 = v2, ...
WHERE condicion;
```

```SQL
UPDATE usuarios
SET nombre = 'Juan', apellido = 'Doe'
WHERE id = 1;
```

### Delete

Se puede borrar informacion de una tabla. Utilizar WHERE para aclarar la condicion. Si no se escribe WHERE, se borra toda la tabla.

```SQL
DELETE FROM nombre_tabla WHERE condicion;
```

```SQL
DELETE FROM usuarios WHERE usuario_id = 4;
```

## Select

Su funcionalidad es la de realizar consultas sobre una o varias columnas de una tabla. Para especificar sobre que tabla queremos realizar esa consulta usamos la palabra clave FROM seguida del nombre de la tabla.

```SQL
SELECT nombre_columna_1, nombre_columna_2, ...
FROM nombre_tabla
```

Ejemplo: Para conocer los titulos y ratings de las peliculas guardadas en la tabla peliculas.

```SQL
SELECT titulo, rating
FROM peliculas
```

## Where y order by

### Where

Condiciona y filtra las consultas SELECT que se realizan a una base de datos.

```SQL
SELECT nombre_columna_1, nombre_columna_2, ...
FROM nombre_tabla
WHERE condicion
```

#### Operadores

- Igual a =
- Mayor que >
- Mayor o igual que >=
- Menor que <
- Menor o igual que <=
- Diferente a <>
- Diferente a !=
- Es nulo IS NULL
- Entre dos valores BETWEEN
- Lista de valores IN
- Se ajusta a... LIKE

Ejemplos:

```SQL
SELECT nombre, edad
FROM usuarios
WHERE edad > 17;
```

```SQL
SELECT *
FROM movies
WHERE title LIKE 'Avatar';
```

```SQL
SELECT *
FROM movies
WHERE awards >= 3 AND awards < 8;
```

```SQL
SELECT *
FROM movies
WHERE awards = 2 OR awards = 6;
```

### Order by

Se utiliza para ordenar los resultados de una consulta segun el valor de la columna especificada. Por defecto se ordena de forma ascendente (ASC). Para ordenarlo de forma descendiente (DESC) hay que aclararlo en la consulta.

```SQL
SELECT columna_1, columna_2, ...
FROM tabla
WHERE condicion
ORDER BY columna_1
```

```SQL
SELECT nombre, edad
FROM usuarios
WHERE edad > 21
ORDER BY nombre DESC
```

## Between y like

### Between

Se utiliza cuando necesitamos obtener valores dentro de un rango.

- Incluye los extremos
- Funciona con numeros, textos y fechas
- Se usa como un filtro de un WHERE

Ejemplo:

```SQL
SELECT nombre, edad
FROM alumnos
WHERE edad BETWEEN 6 AND 12
```

### Like

Cuando hacemos un filtro con un WHERE, podemos especificar un patron de busqueda que nos permita especificar algo en concreto que queremos encontrar en los registros. Eso lo logramos utilizando comodines (wildcards).

- Comodin %: Es un sustituto que representa cero, uno, o varios caracteres.
- Comodin \_: Es un sustituto para un solo caracter.

Ejemplos:

Devuelve aquellos nombres que tengan la letra 'a' como segundo caracter.

```SQL
SELECT nombre
FROM usuarios
WHERE edad LIKE '_a%'
```

Devuelve las direcciones de los usuarios que incluyan la calle 'Monroe'.

```SQL
SELECT nombre
FROM usuarios
WHERE direccion LIKE 'Monroe'
```

Devuelve los clientes que empiecen con 'Los' y terminen con 's'.

```SQL
SELECT nombre
FROM clientes
WHERE nombre LIKE 'Los%s'
```

## Limit y offset

### Limit

Su funcionalidad es la de limitar el numero de fila devueltas en las consultas SELECT. Tambien establece el numero maximo de registros a eliminar con DELETE.

```SQL
SELECT columna_1, columna_2, ...
FROM tabla
LIMIT cantidad_de_registros
```

### Offset

Nos permite especificar a partir de que fila comenzat en la recuperacion de los datos solicitados.

Ejemplo:

Con el OFFSET 20 desplazamos los resultados 20 posiciones para que se muestre desde la posicion 21.

```SQL
SELECT id, nombre, apellido
FROM alumnos
LIMIT 20
OFFSET 20
```

## Alias

Se usan para darle un nombre temporal a las tablas, columnas y funciones. Se definen durante una consulta y persisten solo durante esa consulta. No modifican los nombres originales en la base de datos.

```SQL
SELECT columna_1 AS alias_columna_1
FROM tabla
```

- Alias para una columna

```SQL
SELECT razon_social_cliente AS nombre
FROM cliente
```

- Alias para una tabla

```SQL
SELECT nombre, apellido, edad
FROM alumnos_comision_inicial AS alumnos
```

## Funciones de alteracion

### Concat

Se usa para concatenar dos o mas expresiones.

Ejemplo: 'Nombre: Emilia Clerke'

```SQL
SELECT CONCAT('Nombre: ', fisrt_name, ' ', last_name)
FROM actors
```

### Coalesce

Se usa para obtener la primera expresion que no sea NULL.

Ejemplo 1

```SQL
SELECT COALESCE(NULL, 1, 20, 'Digital house')
```

Ejemplo: Digital house

```SQL
SELECT COALESCE(NULL, NULL, 'Digital house')
```

### Datediff

Se usa para devolver la diferencia (en dias) entre dos fechas.

Ejemplo: devuelve 19

```SQL
SELECT DATEDIFF('2017/08/25', '2017/08/15')
```

### Extract

Se usa para extraer partes de una fecha.

SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, YEAR.

Ejemplo: devuelve 21

```SQL
SELECT EXTRACT(SECOND FROM '2014-02-13 08:44:21')
```

### Replace

Se usa para reemplazar una secuencia de caracteres por otra en un string.

Ejemplo: Bbc Bbc

```SQL
SELECT REPLACE('abc abc', 'a', 'B')
```

### Date format

Se usa para que dada una fecha determinada se pueda formatear la misma segun deseemos.

Ejemplo: 'Thursday June 15 2017'

```SQL
SELECT DATE_FORMAT('2017-06-15', '%W %M %e %Y')
```

### Case

Se usa para evaluar condiciones y devolver la primera que se cumpla.

Ejemplo: La tabla resultante tendra 4 columnas: id, title, rating y rating_categories. Esta mostrara 'Mala', 'Regular', etc., segun el rating de la pelicula.

```SQL
SELECT
  CASE
    WHEN rating < 4 THEN 'Mala'
    WHEN rating < 6 THEN 'Regular'
    WHEN rating < 8 THEN 'Buena'
    WHEN rating < 9.5 THEN 'Muy buena'
    ELSE 'Excelente'
  END AS rating_categories
FROM movies
ORDER BY rating
```
