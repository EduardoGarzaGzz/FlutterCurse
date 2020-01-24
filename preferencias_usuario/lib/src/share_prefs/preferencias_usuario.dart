import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instance = PreferenciasUsuario._();
  SharedPreferences _preferences;

  PreferenciasUsuario._();

  factory PreferenciasUsuario() {
    return PreferenciasUsuario._instance;
  }

  initPreferences() async {
    this._preferences = await SharedPreferences.getInstance();
  }

  get genero {
    return this._preferences.getInt('genero') ?? 1;
  }

  set genero( int val) {
    this._preferences.setInt('genero', val);
  }

  get colorSecundario {
    return this._preferences.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool val) {
    this._preferences.setBool('colorSecundario', val);
  }

  get nombreUsuario {
    return this._preferences.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario (String val) {
    this._preferences.setString('nombreUsuario', val);
  }

  get ultimaPagina {
    return this._preferences.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set ultimaPagina (String val) {
    this._preferences.setString('ultimaPagina', val);
  }
}
