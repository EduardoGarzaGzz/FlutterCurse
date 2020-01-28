import 'package:flutter/material.dart';
import 'package:push_local/src/pages/home_page.dart';
import 'package:push_local/src/pages/mensaje_page.dart';
import 'package:push_local/src/providers/push_notification_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// f4r1H1PI46A:APA91bHMQ9URVVOzqwTUTvFduA0mQFcXfB_z4CYS5lgvILf_uhSDMAya-M3mA9FuJKLhu06GdNzW7lNQjZk-dBAQIFqIJugdgLRos9w7exyBEIFnFaP9xVqYo51s3zNppyiLWB-MJ9pk

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    final push = PushNotificationProvider();
    push.initNotifications();

    push.msg.listen((val) {
      this.navigatorKey.currentState.pushNamed('mensaje', arguments: val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: this.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Push Local',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext ctx) => HomePage(),
        'mensaje': (BuildContext ctx) => MensajePage(),
      },
    );
  }
}