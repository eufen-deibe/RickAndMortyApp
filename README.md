#RickAndMortyApp

Este documento tiene como objetivo proporcionar una descripción detallada de la aplicación RickAndMortyApp desarrollada en Swift. RickAndMortyApp es una aplicación que sigue la arquitectura MVP (Model-View-Presenter) para garantizar una estructura organizada y modular.

Estructura del Proyecto
-----------------------

La aplicación está organizada en diferentes "features" o características principales, cada una con su propia estructura de carpetas y componentes. Las dos características principales son:

Home
----

En la característica "Home", encontrarás los siguientes componentes:

Builder: Esta clase se encarga de crear y configurar el módulo de vista correspondiente. En este caso, crea y configura el HomeViewController.

Model: Define los modelos de datos utilizados en esta característica. En este caso, hemos definido el modelo Character.

Presenter: El presentador HomePresenter actúa como intermediario entre la vista y el modelo. Se encarga de manejar la lógica de presentación y la lógica de negocio. Realiza solicitudes a la API y formatea los datos para su visualización.

View: La vista HomeViewController es responsable de la interfaz de usuario y muestra los datos proporcionados por el presentador. Nota: Esta vista se implementa utilizando XIBs en lugar de Storyboards para una mayor flexibilidad en la interfaz de usuario.

Mapper: El CharactersViewDataMapper convierte los datos de la API en objetos CharacterViewData para su visualización en la vista.

Service: HomeDataService maneja las solicitudes a la API utilizando la biblioteca Alamofire. Descarga datos de la API y los pasa al presentador para su procesamiento.

Detail
------

La característica "Detail" sigue una estructura similar a "Home" pero no requiere de un servicio para obtener datos, ya que estos datos se envían desde "Home" a través del DetailBuilder.
Comunicación entre Componentes

La comunicación entre los componentes se realiza a través de protocolos. Esto permite una separación clara de responsabilidades y cumple con los principios SOLID.

Los protocolos HomeView y DetailView definen las interfaces que las vistas deben adoptar para comunicarse con los presentadores.

Los protocolos HomePresenterProtocol y DetailPresenterProtocol definen las interfaces para los presentadores, permitiendo que las vistas y presentadores se comuniquen de manera efectiva.

Modelo de Datos
---------------

Existen dos modelos de datos: uno (Character) para representar los datos de la API y otro (CharacterViewData) para mostrar datos relevantes en la vista.

Funcionalidades Clave
---------------------

La aplicación utiliza la biblioteca Alamofire para realizar solicitudes a la API y AlamofireImage para gestionar imágenes y su caché.

La pantalla "Home" muestra una lista de personajes obtenidos de la API. Los datos se formatean utilizando el mapeo de datos antes de ser mostrados.

Se ha implementado una barra de búsqueda (UISearchBar) que permite al usuario buscar personajes por nombre. Los resultados se actualizan en tiempo real a medida que se escribe el texto de búsqueda.

Se ha incluido un "loader" que simula una espera de respuesta del servidor antes de mostrar los datos.

En caso de error al cargar los datos desde la API, se muestra un controlador de alerta (UIAlertController) que permite al usuario reintentar la solicitud.

Pruebas Unitarias
-----------------

La aplicación incluye una serie de pruebas unitarias para garantizar el funcionamiento correcto de sus componentes. Estas pruebas cubren casos de uso importantes y ayudan a mantener la calidad del código.

Autor
-----

Este proyecto fue desarrollado por Eufén Deibe Sánchez como parte de la aplicación RickAndMortyApp.

Conclusiones
------------

RickAndMortyApp es un ejemplo de una aplicación estructurada y modular que sigue la arquitectura MVP. Utiliza protocolos para una comunicación efectiva entre los componentes y se apoya en bibliotecas externas como Alamofire y AlamofireImage para facilitar la gestión de solicitudes y de imágenes.

La aplicación demuestra buenas prácticas de desarrollo en Swift y proporciona una experiencia de usuario intuitiva para los fanáticos de Rick and Morty.
