import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  final peliculasProvider = PeliculaProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: this.peliculasProvider.buscarPeliculas(query),
        builder: (BuildContext ctx, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            final peliculas = snapshot.data;

            return ListView(
              children: peliculas.map((p) {
                return ListTile(
                  leading: FadeInImage(
                    height: 50.0,
                    fit: BoxFit.contain,
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    image: NetworkImage(p.getPosterImg()),
                  ),
                  title: Text(p.title),
                  subtitle: Text(p.originalTitle),
                  onTap: () {
                    close(context, null);
                    p.uuid = "${p.id}-search";
                    Navigator.pushNamed(context, '/detalle', arguments: p);
                  },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = (query.isEmpty)
        ? []
        : []
        .where((p) => p.toLowercase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: 0,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text('titulo'),
          onTap: () {
            showResults(context);
          },
        );
      },
    );
  }
}
