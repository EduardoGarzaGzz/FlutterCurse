import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final _pref = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    this._pref.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (this._pref.colorSecundario)? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidgets(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${this._pref.colorSecundario}'),
          Divider(),
          Text('Genero: ${this._pref.genero}'),
          Divider(),
          Text('Nombre usuario: ${this._pref.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
