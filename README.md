# WebFacturacion

A continuación se muestran los pasos a seguir para correr y compilar el proyecto de Facturacion App localmente.

# Requerimientos de Instalación
  - Tener instalado .NET Framework 4.7.2
  - Instalar GIT 
  - Microsoft Visual Studio 2015 o superior
  - Microsoft SQL Server Management Studio

# Obteniendo el Repositorio!
  1. Abre una terminal (git bash) si es en Windows y dirijete con el comando `cd` a la carpeta de repositorios de Visual Studio, ej. `cd C:\Users\TuUsuario\Source\Repos`
  2. Una vez detro de este directorio de `Repos` ejecuta el siguiente comando `git clone https://github.com/vjdavid/WebFacturacion.git`, lo que hara este comando sera descargar el proyecto en tu computadora.
  
# Cargando la base de datos
  1. Una vez teniendo el repositorio, deberas crear una base de datos vacia en SQL Server Management Studio, llamada `sistemaFacturacion`, si ya tienes una creada borrala y crea una vacia.
  2. Una vez teniendo creada la base de datos en blanco necesitaras, importar la base de datos, para esto da click detecho en la base de datos que acabas de crear y selecciona `New Query`.
  3. Dirijete al codigo del repositorio en el siguiente link [schemaFacturacion](../master/WebFacturacion3/sql_dumps/schemaFacturacion.sql) copia el contenido del archivo llamado `SchemaFacturacion.sql` y pegalo en la ventana de `New Query` del paso anterior numero 4 y da click en ejecutar, con esto tendras ya la base de datos localmente.
# Estableciendo Variables de Entorno
Antes de comenzar a trabajar deberas configurar la variable de entorno
1. Necesitas irte a un proyecto de Visual Studio que ya tengas localmente (ojo que no sea este) y copiar el `connectionString` de algun proyecto que ya tengas, normalmente es de la siguiente forma y esta ubicado en el `Web.config`, por ejemplo el mio es asi: `server=VOIDXEROX; database=sistemaFacturacion; uid=userFacturacion; password=erickso10`
2. Lo unico que tienes que asegurate es que en el nombre de la base de datos sea llamada `database=sistemaFacturacion`
3. Una vez copiado el `connectionString` deberas abrir una terminal de PowerShell y pegarlo en el siguiente commando:
```sh
[Environment]::SetEnvironmentVariable("MyDbConnection", "AQUI PEGAS EL CONECCTION STRING QUE ACABAS DE COPIAR EN EL PASO 1", "User")
```
### Haciendo Cambios en el Repositorio

Como contribuir?
Para empezar a trabajar deberas crear una rama o espacio de trabajo, para esto sigue los siguientes comandos!

Abre una terminal (git bash) si es en Windows y dirijete con el comando `cd` a la carpeta de repositorios de Visual Studio, ej. `cd C:\Users\TuUsuario\Source\Repos\WebFacturacion3` .

Crea una nueva rama para tu trabajo, con el siguiente comando:
```sh
$ git checkout -b caracteristica/nombre-de-tu-actividad-que-estes-haciendo
```
Hasta este punto ya podras empezar a trabajar sin problema alguno, una vez que termines tu trabajo continua con las siguientes instrucciones.
#### Enviando cambios
Una vez que hayas terminado tu trabajo debes ejecutar los siguientes comandos para guardar tu trabajo para enviar tus cambios deberas empujar tu rama a Github, con los siguientes comandos que se listan:
Este comando git add . servira para preparar tus al commit 
```sh
$ git add .
```
Seguido de este tienes que utilizar el comando `git status` y revisar que todos archivos se hay marcado de color verde, esto significa que los archivos han sido agregados correctamente al commit.
```sh
$ git status
```
Ahora puedes crear y guardar el commit con el siguiente commando `git commit`, esto creara el commit y guardara el estado de los archivos, de la siguiente forma:
```sh
$ git commit -m "una descripcion detallada de las actividades que hayas realizado"
```
Ahora puedes enviar y empujar tus cambios o commits con el siguiente comando `git push`, esto enviara los commits a Github, de la siguiente forma:
```sh
$ git push origin caracteristica/nombre-de-tu-actividad-que-estes-haciendo 
```
