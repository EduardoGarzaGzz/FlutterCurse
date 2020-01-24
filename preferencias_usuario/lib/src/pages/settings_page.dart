import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _State createState() => _State();
}

class _State extends State<SettingsPage> {
  TextEditingController _textEditingController;
  final _pref = PreferenciasUsuario();

  bool _colorSecundario;
  int _genero;
  String _nombre = 'Pedro';

  @override
  void initState() {
    super.initState();

    this._pref.ultimaPagina = SettingsPage.routeName;
    this._genero = this._pref.genero;
    this._colorSecundario = this._pref.colorSecundario;
    this._textEditingController = TextEditingController(text: this._pref.nombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (this._pref.colorSecundario)? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidgets(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: this._colorSecundario,
              title: Text('Color secundario'),
              onChanged: (val) {
                setState(() {
                  this._colorSecundario = val;
                  this._pref.colorSecundario = this._colorSecundario;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: this._genero,
              onChanged: this._setSelectRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: this._genero,
              onChanged: this._setSelectRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: this._textEditingController,
                decoration: InputDecoration(labelText: 'Nombre', helperText: 'Nombre de la persona usando el telefono'),
                onChanged: (val) {
                  this._pref.nombreUsuario = val;
                },
              ),
            )
          ],
        ));
  }

  void _setSelectRadio(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    this._genero = value;
    this._pref.genero = this._genero;

    setState(() {});
  }
}
