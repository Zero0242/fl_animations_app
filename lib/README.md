# Config

- Configuraciones de la app
  1. Entorno
  2. Helpers
     - funciones de ayuda
  3. Plugins
     - adaptadores de paquetes
  4. Router
     - rutas de la aplicación
  5. Theme
     - tema de la aplicacion y colores

# Domain

- Interfaces usadas por la app - **El formato**

  1. interfaces:

     - Esquema de las fuentes de datos (ejecutar)
     - Esquema del repositorio (traer)

  2. models:

     - Esquema de las entidades de las app (mis objetos)

# Infraestructure

- Implementacion de la fuente de datos - **El como se traen los datos**

  1. datasource:

     - Ejecucion consulta a **api**, **db local** o **mock**

  2. mappers:

     - Adaptador **respuesta** a **entidad**

  3. repository:
     - Conexión a la fuente de datos (datasource)

# Presentation

- Interface del usuario y presentacion de datos

  1. providers:

     - gestores de estados y consumidores de repositorio

  2. screens:

     - pantallas de la aplicacion

  3. widgets:

     - componentes de la app
