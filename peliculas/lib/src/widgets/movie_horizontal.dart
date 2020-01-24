import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePage;

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  MovieHorizontal({@required this.peliculas, @required this.siguientePage});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    this._pageController.addListener(() {
      if (this._pageController.position.pixels >=
          this._pageController.position.maxScrollExtent - 200) {
        this.siguientePage();
      }
    });

    return Container(
      height: screenSize.height * 0.25,
      child: PageView.builder(
        pageSnapping: false,
        controller: this._pageController,
        itemCount: this.peliculas.length,
        itemBuilder: (context, index) {
          return this.createTarjeta(context, this.peliculas[index]);
        },
//        children: _listaTarjetas(context),
      ),
    );
  }

  Widget createTarjeta(BuildContext context, Pelicula pelicula) {
    pelicula.uuid = "${pelicula.id}-mini-poster";

    final tarjeta = Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: pelicula.uuid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: NetworkImage(
                    'http://alerta.mapbiomas.org/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png'),
                fit: BoxFit.cover,
                width: 150.0,
              ),
            ),
          ),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: (){
        Navigator.pushNamed(context, '/detalle', arguments: pelicula);
      },
    );

  }

  List<Widget> _listaTarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: NetworkImage(
                    'http://alerta.mapbiomas.org/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png'),
                fit: BoxFit.cover,
                width: 150.0,
              ),
            ),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}
