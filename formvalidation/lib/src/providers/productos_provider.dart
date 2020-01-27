import 'dart:convert';
import 'dart:io';

import 'package:formvalidation/src/preferences/preferencias_usuario.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:mime_type/mime_type.dart';

class ProductosProvider {
  final String _url = 'https://flutter-varios-1b232.firebaseio.com/';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearProducto(ProductoModel model) async {
    final url = '${this._url}/productos.json?auth=${this._prefs.token}';
    final resp = await http.post(url, body: model.toRawJson());
    final data = json.decode(resp.body);
    print(data);
    return true;
  }

  Future<bool> editarProducto(ProductoModel model) async {
    final url = '${this._url}/productos/${model.id}.json?auth=${this._prefs.token}';
    final resp = await http.put(url, body: model.toRawJson());
    final data = json.decode(resp.body);
    print(data);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '${this._url}/productos.json?auth=${this._prefs.token}';
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);
    final List<ProductoModel> list = List();

    if (data == null) return [];
    if (data['error'] != null) return [];

    data.forEach((i, json) {
      final tmp = ProductoModel.fromJson(json);
      tmp.id = i;

      list.add(tmp);
    });

    return list;
  }

  Future<int> borrarProducto(String id) async {
    final url = '${this._url}/productos/$id.json?auth=${this._prefs.token}';
    final resp = await http.delete(url);
    print(resp.body);
    return 0;
  }

  Future<String> subirImagen(File imagen) async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/elsheimus/image/upload?upload_preset=cxfzfdzu');
    final mimeType = mime(imagen.path).split('/');

    final imagenUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', imagen.path, contentType: MediaType(mimeType[0], mimeType[1]));

    imagenUploadRequest.files.add(file);

    final streamResponse = await imagenUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    if (response.statusCode != 200 && response.statusCode != 201) {
      print('Error: ' + response.body);
      return null;
    }

    final data = json.decode(response.body);
    print(data);
    return data['secure_url'];
  }
}
