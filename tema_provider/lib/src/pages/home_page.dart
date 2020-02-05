import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tema_provider/src/blocs/theme_changer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
      body: ListBoton()
    );
  }
}

class ListBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        FlatButton(onPressed: () => theme.setTheme = ThemeData.light(), child: Text('Light'),),
        FlatButton(onPressed: () => theme.setTheme = ThemeData.dark(), child: Text('Dark'),)
      ],
    );
  }
}
