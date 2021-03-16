import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final peliculas = [
    'Spiderman',
    'Capitan America',
    'Aqueman',
    'Batman',
    'Shazam!',
    'Iron Man'
  ];
  final peliculasRecientes = ['Spiderman', 'Capitan America'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro appbar

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          print('click icon');
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la Izq del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.redAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe

    final listaSugeria = (query.isEmpty)
        ? peliculasRecientes
        : peliculas
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: listaSugeria.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.movie),
        title: Text(listaSugeria[index]),
        onTap: () {
          seleccion = listaSugeria[index];
          showResults(context);
        },
      ),
    );
  }
}
