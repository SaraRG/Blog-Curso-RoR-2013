CISLA-2013-RubyOnRails
======================

Aplicación realizada en Ruby on Rails en el curso de CISLA de 2013. Dicha aplicación es un blog en el que para poder postear el usuario debe registrarse en la aplicación.

Antes de Empezar Hacer:
-----------------------
```bash
$ /bin/bash --login
```
```bash
$ bundle
``` 
* Sólo si no se tienen las gemas correspondientes a esta aplicación instaladas

```bash
$ rake db:migrate 
```
* Es posible que surjan ciertos errores. Si es así eliminar las migraciones problemáticas 

```bash
$ rails destroy migration NombreDeLaMigración
```
```bash
$ rake db:seed
```
* Esta comando no es necesario ejecutarlo, puesto que aún no está activa la función que lo requiere.

Funcionalidades de la Aplicación:
---------------------------------

Al iniciar la aplicación lo primero que se debe realizar es el registro del usuario en la misma, o por el contrario si ya hay un usuario registrado en la aplicación tan sólo debe iniciar sesión con su correo electrónico y su contraseña, ya que si no se realizan estos pasos, es imposible que el usuario pueda ver los posts.

Una vez el usuario inicie sesión, vemos que se añade una nueva barra bajo la barra de navegación actual. Esta nueva barra indica el posicionamiento en cada momento del usuario en la aplicación. Para realizar esta modificación se ha añadido la gema `gem "breadcrumbs_on_rails"`.  Para más información sobre esta gema pinchar [aquí](https://github.com/weppos/breadcrumbs_on_rails)

 Si el usuario pincha en la pestaña `posts`  puede ver todos los posts  hasta el momento o añadir un nuevo post. Además si hay varios posts, se muestran de manera que se vean de cinco en cinco. Para esto se ha usado la gema `gem 'kaminari`, y una vez instalada se ha añadido en el modelo de los posts `paginates_per 5` y `default_scope order("created_at DESC")`. Esto hace que se muestren los posts de cinco en cinco y que muestren primero los ultimos posts creados. Luego en el método index del controlador Post se ha cambiado la linea `@posts = Post.all` por `@posts = Post.order(:created_at).page params[:page]`  y el la respectiva vista se ha añadido `<%= paginate @posts, :theme => 'twitter-bootstrap' %>` de manera que usamos la gema de la paginación y además le aplicamos el estilo de bootstrap para twitter.

Otra de las modificaciones importantes es que solo el usuario creador de su propio posts es el único capaz de modificarlo o eliminarlo. Si un usuario no es dueño de su propio post solo tendrá la opción de mostrarlo. 

Al mostrar un post el usuario puede ver, además del propio posts, los comentarios asociados o si por el contrario no hay ninguno puede comentar en este post. Sólo el usuario dueño de ese posts es el único que puede eliminar los comentarios referentes a su post, así como el propio usuario que comentó.

Para finalizar el usuario puede cerrar su sesión con tan solo pinchar en la pestaña `Cerrar Sesion NombreDelUsuario` y se puede comprobar como se redirige a la pagina principal.

Gemas usadas:
-------------

* Generador de diagramas de clases
```bash
gem 'railroady'
```

* Autenticación de usuarios con Devise
```bash
gem 'devise'
```

* Interfaz de Administración de Rails
```bash
gem 'rails_admin'
```

* Editor de texto
```bash
gem 'tinymce-rails'
```

* Paginacion
```bash
gem 'kaminari'
```

* SimpleForm
```bash
gem 'simple_form'
```

* Migas de Pan =  ruta desde el home hasta la pantalla que se está consultando, y ayudan a mejorar el posicionamiento.
```bash
gem "breadcrumbs_on_rails"
```

