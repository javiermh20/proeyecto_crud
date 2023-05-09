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
    apiKey: 'AIzaSyBAoiE03r_6e4C-DPM71NoPS6ZnYoKkZRE',
    appId: '1:538543552433:web:90e887609b3b2776a66f90',
    messagingSenderId: '538543552433',
    projectId: 'pruebas-mac-3119b',
    authDomain: 'pruebas-mac-3119b.firebaseapp.com',
    storageBucket: 'pruebas-mac-3119b.appspot.com',
    measurementId: 'G-0CTCCF2BVD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFC0aRszWFyjswkBLiDYioaRptTvQgJK4',
    appId: '1:538543552433:android:af2d08eb6589414fa66f90',
    messagingSenderId: '538543552433',
    projectId: 'pruebas-mac-3119b',
    storageBucket: 'pruebas-mac-3119b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdrnQsiUZ4Fd-PFP5nP_kM0qWGqCTRyxQ',
    appId: '1:538543552433:ios:b5c5d7e11a9a9281a66f90',
    messagingSenderId: '538543552433',
    projectId: 'pruebas-mac-3119b',
    storageBucket: 'pruebas-mac-3119b.appspot.com',
    iosClientId:
        '538543552433-9bv30b5khr4440ccg4dng2komc9nijbv.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyectoCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdrnQsiUZ4Fd-PFP5nP_kM0qWGqCTRyxQ',
    appId: '1:538543552433:ios:b5c5d7e11a9a9281a66f90',
    messagingSenderId: '538543552433',
    projectId: 'pruebas-mac-3119b',
    storageBucket: 'pruebas-mac-3119b.appspot.com',
    iosClientId:
        '538543552433-9bv30b5khr4440ccg4dng2komc9nijbv.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyectoCrud',
  );
}
