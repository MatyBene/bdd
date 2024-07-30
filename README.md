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

# Uniones y funciones de agregacion

## Joins

Sirve para unir los resultados de consultas realizadas a distintas tablas.

### Partes del inner join

Ejemplo:

```SQL
SELECT usuarios.username, juegos.juegoname
FROM usuarios
INNER JOIN juegousuario ON usuarios.ID = juegousuario.ID_usuario
INNER JOIN juegos ON juegosusuario.ID_juego = juegos.ID
```

```SQL
INNER JOIN juegousuario ON usuarios.ID = juegousuario.ID_usuario
```

Aca se indica que sobre que tabla queremos que seleccione los dato. En el ON, indicamos el campo de nuestra tabla inicial con el campo que relaciona, y la tabla sobre la que vamos a combinar datos, con su campo relacionado. En este caso la ID en la tabla usuarios coincidira con ID_usuario, en la tabla juegousuario. En ese momento los campos de esa tabla que tengan coincidencias pasaran a poderse utilizar dentro de la consulta.

### Inner join

Hace el cruce entre dos tablas. Si cruzaramos las tablas de clientes y ventas y hubiese algun cliente sin ventas, el INNER JOIN no traeria a ese cliente como resultado.

![INNER JOIN](/images/inner-join.png)

#### Creando un inner join

Antes escribiamos:

```SQL
SELECT clientes.id AS id, clientes.nombre, ventas.fecha
FROM clientes, ventas
```

Ahora escribimos:

```SQL
SELECT clientes.id AS id, clientes.nombre, ventas.fecha
FROM clientes
INNER JOIN ventas
```

La sintaxis del join requiere de la palabra ON. Es ahi donde indicaremos el filtro a tener en cuenta para realizar el cruce.

```SQL
SELECT clientes.id AS id, clientes.nombre, ventas.fecha
FROM clientes
INNER JOIN ventas
ON clientes.id = ventas.cliente_id
```

### Left join

Incluira todos los registros de la primera tabla de la consulta (la tabla izquierda) incluso cuando no exista coincidencia con la tabla derecha.

```SQL
SELECT cliente.id AS id, clientes.nombre, ventas.fecha
FROM clientes
LEFT JOIN ventas
ON clientes.id = ventas.cliente_id
```

### Right join

Incluira todos los registros de la tabla derecha.

```SQL
SELECT clientes.id AS id, clientes.nombre, ventas.fecha
FROM clientes
RIGHT JOIN ventas
ON clientes.id = ventas.cliente_id
```

### Cruzando muchas tablas

```SQL
SELECT clientes.id AS id, clientes.nombre, ventas.fecha
FROM clientes
INNER JOIN ventas
ON clientes.id = ventas.cliente_id
INNER JOIN productos
ON productos.id = ventas.producto_id
```

## Distincs

Nos devuelve valores unicos. Es decir, no aparecen los valores que estan repetidos en una misma columna.

```SQL
SELECT DISTINCT columna_1, columna_2
FROM tabla
```

Ejemplo: Pide los actores que hayan actuado en cualquier pelicula de Harry Potter. Si no escribieramos el DISTINCT los actores que hayan participado en mas de una pelicula, apareceran repetidos en el resultado.

```SQL
SELECT DISTINCT actors.first_name, actors.last_name
FROM actors
INNER JOIN actor_movie ON actors.id = actor_movie.actor_id
INNER JOIN movies ON movies.id = actor_movie.movie_id
WHERE movies.title LIKE '%Harry Potter%'
```

## Group by

Se usa para agrupar los registros de la tabla resultante de una consulta por una o mas columnas.

```SQL
SELECT columna_1
FROM tabla
WHERE condicion
GROUP BY columna_1
```

Perdemos detalle de cada una de las filas. Es decir, ya no nos interesa el valor de cada fila sino un resultado consolidado entre todas las filas.

Ejemplo:

```SQL
SELECT genero.nombre, AVG(duracion)
FROM peliculas
INNER JOIN generos ON generos.id = genero_id
GROUP BY genero.nombre
```

## Funciones de agregacion

Realizan calculos sobre un conjunto de datos y devuelven un unico resultado. Excepto COUNT, las funciones de agregacion ignoraran los valores NULL.

### COUNT

Devolvera la cantidad de filas/registros que cumplen con el criterio.

Ejemplo: Devolvera la cantidad de peliculas de la tabla movies con el genero_id 3.

```SQL
SELECT COUNT(id)
FROM movies
WHERE genre_id = 3
```

### AVG

Devolvera el promedio de una columna con valores numericos.

```SQL
SELECT AVG(rating)
FROM movies
```

### SUM

Devolvera la suma de una columna con valores numericos.

```SQL
SELECT SUM(length)
FROM movies
```

### MIN

Devolvera el valor minimo de una columna con valores numericos.

```SQL
SELECT MIN(rating)
FROM movies
```

### MAX

Devolvera el valor maximo de una columna.

```SQL
SELECT MAX(rating)
FROM movies
```

## Having

Cumple la misma funcion que WHERE, a diferencia de que HAVING se va a poder usar en conjunto con las funciones de agregacion para filtrar datos agregados.

```SQL
SELECT columna
FROM tabla
WHERE condicion
GROUP BY columna
HAVING condicion
ORDER BY columna
```

Ejemplo: Esta consulta devolvera la cantidad de clientes por pais (agrupados por pais). Solamente se incluiran en el resultado aquellos paises qie tengan al menos 3 clientes.

```SQL
SELECT COUNT(cliente_id), pais
FROM clientes
GROUP BY pais
HAVING COUNT(cliente_id) > 3
```

### Estructura de una query

![Estructura de una query](/images/estructura-query.png)
