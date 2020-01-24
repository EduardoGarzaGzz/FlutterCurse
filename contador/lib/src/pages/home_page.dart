import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextStyle _style = new TextStyle(fontSize: 25);
  final int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hola mundo", style: this._style),
            Text("$_conteo", style: this._style)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("Click num: $_conteo");
        },
      ),
    );
  }
}
