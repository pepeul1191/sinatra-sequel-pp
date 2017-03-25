# Sinatra-Sequel-PP

### Descipción

Servicio web desarrollado en Ruby usando el framework Sinatra, con patrones de diseño front-controller y distpacher y la interfaz de Sequel para interactuar con la base de datos.

### Tecnologías

+ Ruby (2+)
+ SQLite3

### Instalación - Despliegue

+ git clone [repositorio.git]
+ bundler install

### Rutas

+ get 'usuario/listar', to: 'usuario#listar'

### Rutas - Descripción

#### [URL] + usuario/listar

<b>Objetivo(s)</b>

Devolver un listado de todos los datos de los usuarios.

<b>Método HTTP</b>

+ GET

<b>Parámetros</b>

+ Argumentos en la url : ninguno
+ Query Params : ninguno 

<b>Formato de respuesta OK</b>

JSON string de la lista de usuarios.

> {"id":1,"usuario":"pepe","contrasenia":"ujaGz6w7QkJOKec1YkSkNgu4RGJIHYxkjpdpHx/YU/w=","correo":"jvaldivia@softweb.pe","estado_usuario_id":1}{"id":2,"usuario":"yacky","contrasenia":"ujaGz6w7QkJOKec1YkSkNiB4CQM2YMjqrX5tyjAyXaY=","correo":"yramirez@disenoreal.com","estado_usuario_id":1}{"id":3,"usuario":"rails","contrasenia":"Z66FgGws3EKbDFPViiEnSA==","correo":"jvaldivia@softweb.pe","estado_usuario_id":1}{"id":4,"usuario":"fuel","contrasenia":"QJOPfBjSrktR5f4aZKOaGpdZs8fnwzYAoT3F2dOrIks=","correo":"jvaldivia@softweb.pe","estado_usuario_id":1}

<b>Formato de respuesta alternativo </b>

+ Los generados por las excepciones controladas con el siguiente formato:

> {"tipo_mensaje":"error","rpta_mensaje":"mensaje personalizado","error":"Error en string de la excepción"}

--- 

#### Fuentes

Sequel - ORM a la base de datos

http://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html
	
Framewor Sinatra :

http://www.sinatrarb.com/ 