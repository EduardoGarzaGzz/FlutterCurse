import 'package:beats/src/models/producto_model.dart';
import 'package:beats/src/pages/home_page.dart';
import 'package:beats/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductosProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Beats Demo',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext ctx) => HomePage(),
        },
      ),
    );
  }
}
