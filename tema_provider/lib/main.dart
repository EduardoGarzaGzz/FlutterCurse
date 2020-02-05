import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tema_provider/src/blocs/theme_changer.dart';
import 'package:tema_provider/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MainApp()
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: theme.getTheme,
      home: HomePage(),
    );
  }
}


