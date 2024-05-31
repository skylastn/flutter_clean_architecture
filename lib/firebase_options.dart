// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyB9er457ibXp-vTFeCalWvXn9cn7R0vgOs',
    appId: '1:901307950886:web:a9278b594e8b0241de83e7',
    messagingSenderId: '901307950886',
    projectId: 'lugu-food-deliv',
    authDomain: 'lugu-food-deliv.firebaseapp.com',
    storageBucket: 'lugu-food-deliv.appspot.com',
    measurementId: 'G-85G2EJ2MHK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9AKUz0p6_hMXzzUzYx8306y4sEmUDMd0',
    appId: '1:901307950886:android:4d17bbff2f3ed528de83e7',
    messagingSenderId: '901307950886',
    projectId: 'lugu-food-deliv',
    storageBucket: 'lugu-food-deliv.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB9er457ibXp-vTFeCalWvXn9cn7R0vgOs',
    appId: '1:901307950886:web:3505d2e0e8fb3821de83e7',
    messagingSenderId: '901307950886',
    projectId: 'lugu-food-deliv',
    authDomain: 'lugu-food-deliv.firebaseapp.com',
    storageBucket: 'lugu-food-deliv.appspot.com',
    measurementId: 'G-Z3LRQRJ013',
  );
}
