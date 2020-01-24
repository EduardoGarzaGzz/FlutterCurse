import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final _mapController = MapController();
  String tipoMapa = 'streets';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              this._mapController.move(scan.getLatLng(), 15);
            },
          )
        ],
      ),
      body: this._crearFlutterMap(context, scan),
      floatingActionButton: _crearBotonFlotante(context),
    );
  }

  Widget _crearFlutterMap(BuildContext context, ScanModel scan) {
    return FlutterMap(
      mapController: this._mapController,
      options: MapOptions(center: scan.getLatLng(), zoom: 10),
      layers: [this._crearMapa(), this._crearMarcadores(context, scan)],
    );
  }

  TileLayerOptions _crearMapa() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoiZWxzaGVpbXVzIiwiYSI6ImNrNXBmaTl1bjA4M3Mzbm16eHRpMHp2YTkifQ.ZVkUNrlTNOXdLaRoFkUXOw',
          'id': 'mapbox.$tipoMapa'
        });
  }

  MarkerLayerOptions _crearMarcadores(BuildContext context, ScanModel model) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          height: 100.0,
          width: 100.0,
          point: model.getLatLng(),
          builder: (BuildContext ctx) => Container(
                child: Icon(
                  Icons.location_on,
                  size: 45,
                  color: Theme.of(context).primaryColor,
                ),
              ))
    ]);
  }

  Widget _crearBotonFlotante(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          if (tipoMapa == 'streets')
            tipoMapa = 'dark';
          else if (tipoMapa == 'dark')
            tipoMapa = 'light';
          else if (tipoMapa == 'light')
            tipoMapa = 'outdoors';
          else if (tipoMapa == 'outdoors')
            tipoMapa = 'satellite';
          else
            tipoMapa = 'streets';
        });
      },
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
