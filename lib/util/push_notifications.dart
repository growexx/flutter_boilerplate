import 'package:firebase_messaging/firebase_messaging.dart';

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