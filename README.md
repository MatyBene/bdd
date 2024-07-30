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
