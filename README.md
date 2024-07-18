# Base de datos

## Introduccion

- Es un conjunto de datos pertenecientes a un mismo contexto organizados para un proposito especifico.
- Es una representacion de aspectos de la realidad.
- Nos sirven para:
  - Almacenar datos
  - Acceder a los datos
  - Manipular datos y combinarlos
  - Analizar datos

## Tablas

Los registros concretos se organizan dentro de tablas con filas y columnas.

Filas: contienen los datos/registros concretamente.

Columnas: representan los atributos/campos de cada dato/registro.

![Resumen de tablas](img/tablas-resumen.png)

## Relaciones

Indican como se van a relacionar dos tablas. Dentro de una base de datos existen 3 tipos de relaciones:

- Uno a uno
- Uno a muchos
- Muchos a muchos

### Cardinalidad

Es la forma en que se relacionan las entidades

![cardinalidad](img/cardinalidad.png)

### Tipos de relaciones

#### Uno a uno (1:1)

Un usuario tiene solo una direccion. Una direccion pertenece a solo un usuario.
Para estabecer la relacion colocamos la clave primaria de la direccion en la tabla de usuarios, indicando que esa direccion esta asociada a ese usuario.

![uno a uno](img/uno-a-uno.png)

#### Uno a muchos (1:M)

Un cliente puede tener muchas tarjetas. Una tarjeta pertenece solo a un cliente. Para establecer la relacion colocamos la clave primaria del cliente en la tabla de tarjetas, indicando que esas tarjetas estan asociadas a un usuario en particular.

![uno a muchos](img/uno-a-muchos.png)

#### Muchos a muchos (M:M)

Un cliente puede comprar muchos productos. Un producto puede ser comprado por muchos clientes. En las relaciones M:M, en la base de datos, la relacion en si pasa a ser una tabla. Esta tabla intermedia (tabla pivot) tiene como minimo 3 datos: una clave primaria (PK) y dos claves foraneas (FK), cada una haciendo referencia a cada tabla de la relacion.

![muchos a muchos](img/muchos-a-muchos.png)

- Ejemplo:

![ejemplo muchos a muchos](img/ej-m-m.png)

## Tipos de datos

Los datos o atributos de cada registro de una tabla tienen que ser de un tipo de dato concreto. Cada tipo de dato tiene un tamano determinado y cuanta mas precision pongamos a este tipo de dato, mas rapido y performante va a funcionar MySQL.

### Datos de tipo numerico

- Numericos sin decimales:

![sin decimales](img/sin-decimales.png)

- Booleanos: MySQL guarda los booleanos como un cero (false) o como un uno (true). Por cuestiones de performance, no se recomienda utilizar este tipo de dato en MySQL. Se recomienda usar el tipo de dato TINYINT.

### Datos de tipo fecha

MySql no comprueba de una manera estricta si una fecha es valida o no.

- DATE: Almacena solamente la fecha en formato YYYY-MM-DD

- TIME: Almacena solamente la hora en formato HH:MM:SS

- DATETIME: Corresponde a una representacion completa de fecha y hora. YYYY-MM-DD HH:MM:SS

### Datos de tipo texto

- CHAR(num): El numero entre parentesis va a indicar la cantidad exacta de caracteres.

- VARCHAR(num): El numero entre parentesis va a indicar la cantidad exacta de caracteres.

- TEXT: Determina un dato de tipo texto sin limite de caracteres.

## Constrains

Nos permiten generar un esquema de informacion mucho mas estable y funcional a los ojos de nuestra aplicacion.

- UNIQUE KEYS: Solo permite valores unicos para uno (o multiples) campos.
- NULL / NOT NULL: "NULL" significa que el valor para ese campo no existe o no se conoce. "NULL" no es vacio '' ni cero.
- DEFAULT: Se usa para definir un valor por defecto para una columna. Este valor se le va a agregar a cada registro nuevo siempre y cuando no se especifique otro valor que lo sobreescriba.
- AUTO_INCREMENT: Genera un numero unico y lo incrementa automaticamente con cada nuevo registro en la tabla. Se suele usar a menudo para el campo ID.
