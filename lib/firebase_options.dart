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
    apiKey: 'AIzaSyBG0dJmKur_m-F4qPqRyMH2vXwoiL7LcXQ',
    appId: '1:226157239542:web:db6926574c836de50760d7',
    messagingSenderId: '226157239542',
    projectId: 'contacts-app-flutter-firebase',
    authDomain: 'contacts-app-flutter-firebase.firebaseapp.com',
    storageBucket: 'contacts-app-flutter-firebase.appspot.com',
    measurementId: 'G-MR1W46YC2C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAd9S5-CaZMvioBJG5yLcpBBGrnmJlQAgg',
    appId: '1:226157239542:android:e73b516c299a8bd10760d7',
    messagingSenderId: '226157239542',
    projectId: 'contacts-app-flutter-firebase',
    storageBucket: 'contacts-app-flutter-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsTsCZWjPySgnZaUapu6vK1WzaUnzmWlQ',
    appId: '1:226157239542:ios:593d46d4dccfe6ef0760d7',
    messagingSenderId: '226157239542',
    projectId: 'contacts-app-flutter-firebase',
    storageBucket: 'contacts-app-flutter-firebase.appspot.com',
    iosBundleId: 'com.example.contactsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsTsCZWjPySgnZaUapu6vK1WzaUnzmWlQ',
    appId: '1:226157239542:ios:4ff83262272180f20760d7',
    messagingSenderId: '226157239542',
    projectId: 'contacts-app-flutter-firebase',
    storageBucket: 'contacts-app-flutter-firebase.appspot.com',
    iosBundleId: 'com.example.contactsApp.RunnerTests',
  );
}
