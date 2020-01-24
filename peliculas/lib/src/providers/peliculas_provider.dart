import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/actores_model.dart';
import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaProvider {
  final _popularesStream = StreamController<List<Pelicula>>.broadcast();
  List<Pelicula> _populares = new List();

  String _apiKey = '73a9fa05b1759fffccf47bb6e7668621';
  String _url = 'api.themoviedb.org';
  String _language = 'es-MX';

  int _popularesPage = 0;

  bool _cargandoPopulares = false;

  Function(List<Pelicula>) get popularesSink => this._popularesStream.add;

  Stream<List<Pelicula>> get popularesStream => this._popularesStream.stream;

  void disposeStream() {
    this._popularesStream?.close();
  }

  Future<List<Pelicula>> responseProcces(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJson(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(this._url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    return await this.responseProcces(url);
  }

  Future<List<Pelicula>> getPopulars() async {
    if (this._cargandoPopulares) return [];
    this._cargandoPopulares = true;

    this._popularesPage++;

    final url = Uri.https(this._url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await this.responseProcces(url);
    this._populares.addAll(resp);
    this.popularesSink(_populares);

    this._cargandoPopulares = false;
    return resp;
  }

  Future<List<Actor>> getCast(String peliculaId) async {
    final url = Uri.https(this._url, '3/movie/$peliculaId/credits', {
      'api_key': _apiKey,
      'language': _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = Cast.fromJsonList(decodedData['cast']);

    return cast.actores;
  }

  Future<List<Pelicula>> buscarPeliculas(String query) async {
    final url = Uri.https(this._url, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});

    return await this.responseProcces(url);
  }
}
