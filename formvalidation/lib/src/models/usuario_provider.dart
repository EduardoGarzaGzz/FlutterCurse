import 'dart:convert';

import 'package:formvalidation/src/preferences/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String firebaseToken = 'AIzaSyCQBY5Erwlb7i3Laizk0K2vE8A1cONNbTA';
  final prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {'email': email, 'password': password, 'returnSecureToken': true};

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${this.firebaseToken}',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      this.prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(String email, String password) async {
    final authData = {'email': email, 'password': password, 'returnSecureToken': true};

    final resp = await http.post('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${this.firebaseToken}',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      this.prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
