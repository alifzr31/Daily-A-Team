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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYhCruSRVqZTAh8prRadQ-dCsPYqDZRWs',
    appId: '1:581079552692:android:5b6877932f7f863c5d7de1',
    messagingSenderId: '581079552692',
    projectId: 'laravel-firebase-demo-8232d',
    databaseURL:
        'https://laravel-firebase-demo-8232d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'laravel-firebase-demo-8232d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8E6e0MOo1H4ut-mBNX_d0tet6ss8gkn8',
    appId: '1:581079552692:ios:2d0d518e201b7f3c5d7de1',
    messagingSenderId: '581079552692',
    projectId: 'laravel-firebase-demo-8232d',
    databaseURL:
        'https://laravel-firebase-demo-8232d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'laravel-firebase-demo-8232d.appspot.com',
    iosBundleId: 'com.example.dailyateam',
  );
}
