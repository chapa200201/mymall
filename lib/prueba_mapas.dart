import 'package:flutter/material.dart';

class Store {
  final String name;
  final String info;
  final List<String> products;
  final List<Review> reviews;
  //posiciones
  final double x;
  final double y;

  Store(this.name, this.info, this.products, this.reviews, this.x, this.y);
}

class Review {
  final String text;
  final double rating;

  Review(this.text, this.rating);
}

enum TabItem { Information, Products, Rating }

class MapScreen extends StatelessWidget {
  //lista de tienda, verificar formato antes de agregar algo, si funcionan los list (no modificar lo de abajo si se busca solo actualizar informacion)
  final List<Store> stores = [
    Store(
      'Sears',
      'Por Fiestas Navideñas y Fin de Año, toda la tienda al 50% de Descuento',
      ['Ropa de todas las marcas', 'Tecnologia', 'Linea Blanca', 'Dulceria', 'Muebleria'],

     [
        Review('Buena tienda', 4.5),
        Review('Buen servicio', 4.0),
      ],
      100.0,
      100.0,
      ),



    Store(
      'C&A',
      'Para este Invierno llevate el 40% de Descuento + el 10%',
      ['Ropa', 'Calzado', 'Accesorios'],
      [
        Review('Gran variedad', 4.2),
        Review('Buenos precios', 3.9),
      ],
      200.0,
      100.0,
    ),
    Store(
      'Sanborns',
      'Para estas fiestas navideñas lleva tus regalos a tus seres queridos, toda la tienda esta en Descuento',
      ['Electronicos', 'Articulos para el hogar', 'Muebles', 'Ropa', 'Farmaceuiticos', 'Belleza', 'Salud', 'Tecnologia'],
      [
        Review('Excelente calidad', 4.8),
        Review('Buen trato', 4.3),
      ],
      300.0,
      100.0,
    ),
    Store(
      'Suburbia',
      'Ropa de Invierno al 50% de Descuento',
      ['Ropa', 'Dulceria', 'Perfumeria', 'Electronicos'],
      [
        Review('Buenos productos', 4.4),
        Review('Servicio rápido', 4.1),
      ],
      400.0,
      100.0,
    ),
    Store(
      'InnovaSport',
      'Llegaron las nuevas equipaciones de la nueva temporada, llevate con descuento las equipaciones de Tigres y Rayados de la temporada pasada',
      ['Tennis', 'Articulos de Deportes', 'Balones'],
      [
        Review('Recomendada', 4.9,),
        Review('Buena atención', 4.7),
      ],
      500.0,
      100.0,
    ),
    Store(
      'Cinepolis',
      'Nuevos estrenos han llegado, que mejor aqui en Cinepolis donde se vive el Cine',
      ['Dulceria', 'Peliculas'],
      [
        Review('Calidad premium', 4.6),
        Review('Amplia variedad', 4.2),
      ],
      100.0,
      300.0,
    ),
    Store(
      'Centro de Atencion Movistar',
      'Llevate un plan de 500 o  mas y llevate un telefono completamente gratis con redes y minutos ilimitados',
      ['Celulares', 'Planes Celulares'],
      [
        Review('Ofertas increíbles', 4.7),
        Review('Buen ambiente', 4.5),
      ],
      200.0,
      300.0,
    ),
    Store(
      'GamePlanet',
      'Que mejor obsequio para tu familiar o amigo Gamer, solo en GamePlanet',
      ['Videojuegos', 'Figuras de coleccion', 'Consolas', 'Articulos de consolas e Items'],
      [
        Review('Buena experiencia', 4.3),
        Review('Atención al cliente', 4.0),
      ],
      300.0,
      300.0,
    ),
    Store(
      'OXXO',
      'Llevate 3 SixPack de Tecates a solo 350, para tu cena navideña',
      ['Productos de abastos', 'Servicios'],
      [
        Review('Excelente servicio', 4.8),
        Review('Productos frescos', 4.4),
      ],
      400.0,
      300.0,
    ),
    Store(
      'Invictus',
      'Descuentos hasta el 50% de Descuento',
      ['Calzado casual', 'Ropa casual', 'Articulos y productos para el calzado'],
      [
        Review('Calidad garantizada', 4.5),
        Review('Precios competitivos', 4.1),
      ],
      500.0,
      300.0,
    ),
  ];

  



  double minX = double.infinity;
  double maxX = -double.infinity;
  double minY = double.infinity;
  double maxY = -double.infinity;

  MapScreen() {
    // intento de hacer el cuadrado de margen escalable
    for (final store in stores) {
      if (store.x < minX) {
        minX = store.x;
      }
      if (store.x > maxX) {
        maxX = store.x;
      }
      if (store.y < minY) {
        minY = store.y;
      }
      if (store.y > maxY) {
        maxY = store.y;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              //Aqui se modifican los espacios del cuadrado y es donde se agrega la imagen, tomar en cuenta si se agregan mas tiendas o se cambia el formato "mapa"
              width: maxX - minX + 50,
              height: maxY - minY + 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              child: Stack(
                children: stores.map((store) {
                  return Positioned(
                    left: store.x - minX + 25,
                    top: store.y - minY + 25,
                    child: Column(
                      children: [
                        //Aqui son los tamaños de los cuadrados de las tiendas y el icono que va a llevar
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          child: StoreButton(store: store),
                        ),
                        //Aqui para modificar el espacio entre los cuadritos de las tiendas
                        SizedBox(height: 5),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreButton extends StatelessWidget {
  final Store store;

  StoreButton({required this.store});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showStoreInfoDialog(context);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            store.name,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

//Parte de los botones dentro de los pop ups de las tiendas (al dar clic en los botones o tiendas)
  void _showStoreInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //Esto elige un boton predeterminado al momento de abrir el pop up en este caso es el de informacion
        TabItem _selectedTab = TabItem.Information; 

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(store.name),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    //Aqui van los tamaños y la imagen que va a llevar la respectiva tienda dentro del pop up
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/citadelogo.jpg'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //botones, seguir el mismo formato por si se quiere agregar uno nadamas tener en cuenta el como se acomodan
                      _buildTabButton(
                        'Información',
                        TabItem.Information,
                        _selectedTab,
                        () {
                          setState(() {
                            _selectedTab = TabItem.Information;
                          });
                        },
                      ),
                      _buildTabButton(
                        'Productos',
                        TabItem.Products,
                        _selectedTab,
                        () {
                          setState(() {
                            _selectedTab = TabItem.Products;
                          });
                        },
                      ),
                      _buildTabButton(
                        'Calificación',
                        TabItem.Rating,
                        _selectedTab,
                        () {
                          setState(() {
                            _selectedTab = TabItem.Rating;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _buildTabContent(_selectedTab),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

//botones al tiro si se modifica algo mama todo
  Widget _buildTabButton(
    String title,
    TabItem tabItem,
    TabItem selectedTab,
    Function() onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: selectedTab == tabItem ? Colors.blue : Colors.grey,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(title),
    );
  }

  Widget _buildTabContent(TabItem selectedTab) {
    //Esto es lo que no hay que modificar si solo se quiere actualizar la informacion 
    switch (selectedTab) {
      case TabItem.Information:
        return Text(store.info);
      case TabItem.Products:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: store.products.map((product) {
            return Text(product);
          }).toList(),
        );
      case TabItem.Rating:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: store.reviews.map((review) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Calificación: ${review.rating}'),
                Text('Reseña: ${review.text}'),
                Divider(), //
              ],
            );
          }).toList(),
        );
      default:
        return SizedBox.shrink();
    }
  }
}