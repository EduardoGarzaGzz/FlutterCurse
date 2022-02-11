import 'package:flutter/material.dart';
import 'package:flutter_secret_chat/src/pages/login_page.dart';
import 'package:flutter_secret_chat/src/pages/sigin_up_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        'login': (ctx) => LoginPage(),
        'singup': (ctx) => SingnUpPage()
      },
    );
  }
}

