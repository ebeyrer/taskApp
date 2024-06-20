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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyCTWXNrimfeJz9_j2BcN-cd7qDQk-qEt98',
    appId: '1:905901544331:web:b4f4e5f7e0e4ee8eb6958e',
    messagingSenderId: '905901544331',
    projectId: 'taskapp-3898c',
    authDomain: 'taskapp-3898c.firebaseapp.com',
    storageBucket: 'taskapp-3898c.appspot.com',
    measurementId: 'G-ESJ6ZE2SR5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_FfJmxbPNS6nqM36EuuyX4pcrYc1dZLc',
    appId: '1:905901544331:android:1c080dde3431de41b6958e',
    messagingSenderId: '905901544331',
    projectId: 'taskapp-3898c',
    storageBucket: 'taskapp-3898c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKoSFvZ2kiIWHPCr2Yz2H_n5vaPdE1g48',
    appId: '1:905901544331:ios:e4ae8d5a8e18fca6b6958e',
    messagingSenderId: '905901544331',
    projectId: 'taskapp-3898c',
    storageBucket: 'taskapp-3898c.appspot.com',
    iosBundleId: 'com.example.taskApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKoSFvZ2kiIWHPCr2Yz2H_n5vaPdE1g48',
    appId: '1:905901544331:ios:e4ae8d5a8e18fca6b6958e',
    messagingSenderId: '905901544331',
    projectId: 'taskapp-3898c',
    storageBucket: 'taskapp-3898c.appspot.com',
    iosBundleId: 'com.example.taskApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTWXNrimfeJz9_j2BcN-cd7qDQk-qEt98',
    appId: '1:905901544331:web:f51a76f2a1b50f75b6958e',
    messagingSenderId: '905901544331',
    projectId: 'taskapp-3898c',
    authDomain: 'taskapp-3898c.firebaseapp.com',
    storageBucket: 'taskapp-3898c.appspot.com',
    measurementId: 'G-TRS2QMF0NY',
  );
}
