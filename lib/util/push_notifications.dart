import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
   if (kDebugMode) {
     print(message.notification?.title);
     print(message.notification?.body);
     print(message.data);
   }

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
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
    }

    if (message.notification != null) {

    if (kDebugMode) {
      print('Message also contained a notification: ${message.notification}');
    }
    }
   });
  }
}