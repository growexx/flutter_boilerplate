// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCLNXnLhAdIVv-JWwpY_xSkM9PoJUDSPiI',
    appId: '1:201284781559:web:2041f777e7f18cc0821af2',
    messagingSenderId: '201284781559',
    projectId: 'flutter-boilerplate-919f8',
    authDomain: 'flutter-boilerplate-919f8.firebaseapp.com',
    storageBucket: 'flutter-boilerplate-919f8.appspot.com',
    measurementId: 'G-XBQGGR6H5Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoI0l_Vkz2sektd1zaw3nETSnp7TEscq8',
    appId: '1:201284781559:android:a450bf72bf18d3d8821af2',
    messagingSenderId: '201284781559',
    projectId: 'flutter-boilerplate-919f8',
    storageBucket: 'flutter-boilerplate-919f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3d06ani_U8jfmjB7FGa-vgN-USs_yu_U',
    appId: '1:201284781559:ios:28c66c571121d696821af2',
    messagingSenderId: '201284781559',
    projectId: 'flutter-boilerplate-919f8',
    storageBucket: 'flutter-boilerplate-919f8.appspot.com',
    iosClientId: '201284781559-5i7up014ek22tkq5dcd7norj395rsu8a.apps.googleusercontent.com',
    iosBundleId: 'com.growexx.flutterBoilerplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3d06ani_U8jfmjB7FGa-vgN-USs_yu_U',
    appId: '1:201284781559:ios:87a5b93137da721a821af2',
    messagingSenderId: '201284781559',
    projectId: 'flutter-boilerplate-919f8',
    storageBucket: 'flutter-boilerplate-919f8.appspot.com',
    iosClientId: '201284781559-2hv3epo0gnggkple19jf6qp2928jvl21.apps.googleusercontent.com',
    iosBundleId: 'com.growexx.flutterBoilerplate.RunnerTests',
  );
}
