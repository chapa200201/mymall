import 'package:flutter/material.dart';
import 'package:pruebas_proyecto/delegates/search_shops_delegates.dart';
import 'package:pruebas_proyecto/prueba_mapas.dart';
import 'package:pruebas_proyecto/prueba_navegacion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    // Aqui es donde se ponen los widgets que se usaran como pantallas, tienen orden, no es necesario ponerlo, de arriba hacia abajo 
    Placeholder(),
    MapScreen(), 
    NavigationMap(), 
     
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyMall'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            
            showSearch(context: context, 
            delegate: SearchShopsDelegate()
            );




            },
          ),
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        //Aqui es donde se debe de modificar si se quiere agregar mas botones en la parte de abajo
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Navegacion',
          ),
          
        ],
      ),
    );
  }
}