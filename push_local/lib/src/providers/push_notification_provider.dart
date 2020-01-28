import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final _msgStreamController = StreamController<String>.broadcast();
  Stream<String> get msg => this._msgStreamController.stream;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initNotifications() {
    this._firebaseMessaging.requestNotificationPermissions();
    this._firebaseMessaging.getToken().then((token) {
      print('Token ===============');
      print(token);
    });

    this._firebaseMessaging.configure(

      onMessage: (info) async {
        print('==== OnMessage ====');
        print(info);

        String arg = 'no-data';
        if(Platform.isAndroid){
          arg = info['data']['comida'] ?? 'no-data';
        }

        this._msgStreamController.sink.add(arg);
      },
      onLaunch: (info) async {
        print('==== OnLaunch ====');
        print(info);
      },
      onResume: (info) async {
        print('==== OnResume ====');
        print(info);

        String arg = 'no-data';
        if(Platform.isAndroid){
          arg = info['data']['comida'] ?? 'no-data';
        }

        this._msgStreamController.sink.add(arg);
      },

    );
  }

  dispose() {
    this._msgStreamController?.close();
  }
}