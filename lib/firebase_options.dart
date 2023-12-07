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
    apiKey: 'AIzaSyBOp2x4A7NfpqmTrED96GwVVSsWatz2RI0',
    appId: '1:697779567641:web:d58cbe7a8a690fbbb6fe88',
    messagingSenderId: '697779567641',
    projectId: 'final-exam-flutter-92d58',
    authDomain: 'final-exam-flutter-92d58.firebaseapp.com',
    storageBucket: 'final-exam-flutter-92d58.appspot.com',
    measurementId: 'G-ZCNC89HF7T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeDskrUl1XKe9bRPfiAg6yB-v__Hn_hOE',
    appId: '1:697779567641:android:e6a32a2e465941c6b6fe88',
    messagingSenderId: '697779567641',
    projectId: 'final-exam-flutter-92d58',
    storageBucket: 'final-exam-flutter-92d58.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPGpiK6Pd0ny1-hq-e7D-PDCg9rJSMVVI',
    appId: '1:697779567641:ios:e8ea349c4e64af1ab6fe88',
    messagingSenderId: '697779567641',
    projectId: 'final-exam-flutter-92d58',
    storageBucket: 'final-exam-flutter-92d58.appspot.com',
    iosClientId: '697779567641-ljq5ob81a0bf7ftu0bukh93roli2mc7i.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPGpiK6Pd0ny1-hq-e7D-PDCg9rJSMVVI',
    appId: '1:697779567641:ios:45447d69bd9c92c2b6fe88',
    messagingSenderId: '697779567641',
    projectId: 'final-exam-flutter-92d58',
    storageBucket: 'final-exam-flutter-92d58.appspot.com',
    iosClientId: '697779567641-1o9ilj9qjntttrd3h7ctm04lsk3ufmpu.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoFlutterApp.RunnerTests',
  );
}
