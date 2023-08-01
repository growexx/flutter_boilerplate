import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/authentication/user_repository.dart';
import 'package:flutter_boilerplate/view/screens/dashboard_screen.dart';
import 'package:flutter_boilerplate/view/screens/login/signin_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
   print(message.notification?.title);
   print(message.notification?.body);
   print(message.data);
}

class FirebasePushNotifications {
  final _firebaseMessaging = FirebaseMessaging.instance;
  
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(
       alert: true,
       announcement: false,
       badge: true,
       carPlay: false,
       criticalAlert: false,
       provisional: false,
       sound: true,
   );

    final fCMToken = await _firebaseMessaging.getToken();
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
    }
   });
  }
}