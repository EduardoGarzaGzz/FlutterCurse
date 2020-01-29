import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu_app/src/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      home: HomePage(),
    );
  }
}
