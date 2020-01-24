import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

abrirScan(BuildContext context, ScanModel model) async {

  if(model.tipo == 'http') {
    if( await canLaunch(model.valor)){
      await launch(model.valor);
    } else {
      throw 'No se puede lanzar el ${model.valor}';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: model);
  }

}