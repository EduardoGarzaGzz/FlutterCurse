import 'package:flutter/material.dart';
import 'package:newapp/src/pages/tabs_page.dart';
import 'package:newapp/src/services/news_service.dart';
import 'package:newapp/src/themes/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => NewsService())
      ],
      child: MaterialApp(
        title: 'Material app',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
      ),
    );
  }
}