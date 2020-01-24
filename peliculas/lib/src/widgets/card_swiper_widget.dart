import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Container(
      child: Swiper(
        itemWidth: screenSize.width * 0.7,
        itemHeight: screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {

          this.peliculas[index].uuid = "${this.peliculas[index].id}-poster";

          return Hero(
            tag: this.peliculas[index].uuid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(this.peliculas[index].getPosterImg()),
                placeholder: NetworkImage('http://alerta.mapbiomas.org/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png'),
              ),
            ),
          );
        },
        itemCount: peliculas.length,
        onTap: (int index) {
          Navigator.pushNamed(context, '/detalle', arguments: this.peliculas[index]);
        },
//        pagination: new SwiperPagination(),
//        control: new SwiperControl(),
      ),
    );
  }
}
