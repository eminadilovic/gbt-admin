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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDPdXMIYIU8CEUOwa_OI2MkfJhpVmuv2xs',
    appId: '1:973035508247:web:7d845bb15de9f05af8c252',
    messagingSenderId: '973035508247',
    projectId: 'global-barber-tool',
    authDomain: 'global-barber-tool.firebaseapp.com',
    storageBucket: 'global-barber-tool.appspot.com',
    measurementId: 'G-T8Q43P7LH3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFdNnR__IU7OW-zlrFcnelI9qkBkNk3Qs',
    appId: '1:973035508247:android:dee5f535c4805206f8c252',
    messagingSenderId: '973035508247',
    projectId: 'global-barber-tool',
    storageBucket: 'global-barber-tool.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbH-ZcP1fgMaxk1QkZuqxPJ7klIn8VZc0',
    appId: '1:973035508247:ios:9b79d28f43ac9dacf8c252',
    messagingSenderId: '973035508247',
    projectId: 'global-barber-tool',
    storageBucket: 'global-barber-tool.appspot.com',
    androidClientId: '973035508247-h3fbushg8qi4giktat15s247bt9nmm3h.apps.googleusercontent.com',
    iosClientId: '973035508247-i8446cpgj6v8rti1di3lpaulb8gidlku.apps.googleusercontent.com',
    iosBundleId: 'com.globalbarbertool.owner',
  );
}
