import 'package:beats/src/models/producto_model.dart';
import 'package:beats/src/providers/productos_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardsViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProductosProvider>(context);

    return Container(
        width: double.infinity,
        height: 460,
        child: PageView(
            controller: PageController(viewportFraction: 0.8),
            children: productos.productos.map((p) => _Card(p)).toList()));
  }
}

class _Card extends StatelessWidget {
  ProductoModel _model;

  _Card(this._model);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            _PrimeraDescripcion(this._model),
            SizedBox(
              width: 55.0,
            ),
            _TarjetaDescripcion(this._model),
          ],
        ),
        Positioned(
          top: 90,
          left: 50,
          child: Image(
            image: AssetImage('assets/imgs/${this._model.url}'),
            width: 160,
          ),
        )
      ],
    ));
  }
}

class _TarjetaDescripcion extends StatelessWidget {
  ProductoModel _model;

  _TarjetaDescripcion(this._model);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width * 0.55,
          height: 340,
          color: Color(this._model.color),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      this._model.titulo,
                      style: TextStyle(color: Colors.white24, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      this._model.subtitulo,
                      style: TextStyle(color: Colors.white24, fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      this._model.nombre,
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 80.0,
                    child: Text(
                      '\$${this._model.precio}',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 120.0,
                    height: 45.0,
                    child: Center(
                      child: Text(
                        'Add to bag',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration:
                        BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(topLeft: Radius.circular(15))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PrimeraDescripcion extends StatelessWidget {
  ProductoModel _model;

  _PrimeraDescripcion(this._model);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.batteryFull,
              size: 15,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              '${this._model.bateria}-hour Battery',
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(
              width: 30.0,
            ),
            Icon(
              FontAwesomeIcons.wifi,
              size: 15,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Wireless',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
