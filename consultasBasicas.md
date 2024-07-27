## Modelos

Un modelo va a retornarnos informacion en formato util y comodo para luego operar con la misma. Es la representacion de nuestra tabla en codigo.

### Creando un modelo

Siempre creamos un modelo para cada tabla de nuestra base de datos. Sus nombres deben estar escritos en UpperCamelCase y en singular.

Es una funcion que debemos definir y luego exportar. Recibe dos parametros. En primer lugar, el objeto sequelize para poder acceder a su metodo define(), y en segundo, necesitamos traer al objeto DataTypes que nos dara la posibilidad de decirle a nuestras columnas que tipo de datos permitiran.

### Metodo .define()
