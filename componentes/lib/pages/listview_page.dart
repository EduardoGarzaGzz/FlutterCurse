import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNum = new List();
  int _ultimoItem = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNum.length,
        itemBuilder: (BuildContext buildContext, int index) {
          final id = _listaNum[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$id'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> _obtenerPage1() {
    final duration = new Duration(seconds: 2);

    new Timer(duration, () {
      _listaNum.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (int x = 0; x < 10; x++) {
      setState(() {
        _ultimoItem++;
        _listaNum.add(_ultimoItem);
      });
    }
  }

  Future fetchData() async {
    final duration = Duration(seconds: 2);

    setState(() {
      isLoading = true;
    });

    return new Timer(duration, dommyHttp);
  }

  dommyHttp() {
    isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);

    _agregar10();
  }

  Widget _crearLoading() {
    if (isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
