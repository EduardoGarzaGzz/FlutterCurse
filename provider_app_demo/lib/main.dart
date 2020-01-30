import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_demo/src/pages/home_page.dart';
import 'package:provider_app_demo/src/providers/heroes_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HeroesInfo(),
      child: MaterialApp(
        title: 'Provider app demo',
        initialRoute: 'home',
        routes: {
          'home' : (BuildContext ctx) => HomePage(),
        },
      ),
    );
  }
}