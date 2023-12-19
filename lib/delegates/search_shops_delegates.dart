import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class SearchShopsDelegate extends SearchDelegate{


  @override
  String get searchFieldLabel => 'Buscar Tienda';


  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        query = "";
      } ,
      )

    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton (
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}

List <String> StoreList = [
    'Sears'
    'Samborns'
    'C&A'
    'Suburbia'
    'InnovaSport'
    'Cinepolis'
    'Centro de ayuda Movistar'
    'GamePlanet'
    'OXXO'
    'Invictus'
  ];