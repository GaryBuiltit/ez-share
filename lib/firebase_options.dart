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
    apiKey: 'AIzaSyAiMqqBGe5FxAP7we73ziITZQl0rQLoKIk',
    appId: '1:445431986276:web:7d67edec778018f8600771',
    messagingSenderId: '445431986276',
    projectId: 'ez-share-app',
    authDomain: 'ez-share-app.firebaseapp.com',
    storageBucket: 'ez-share-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAa2Kv_M8qC9VxXHnGBuPaL82TNItFS_88',
    appId: '1:445431986276:android:478a908f5eabfc24600771',
    messagingSenderId: '445431986276',
    projectId: 'ez-share-app',
    storageBucket: 'ez-share-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpA5zr_MUZSqqChXHeTuG9bWAADehmzME',
    appId: '1:445431986276:ios:20f60760a6a436e9600771',
    messagingSenderId: '445431986276',
    projectId: 'ez-share-app',
    storageBucket: 'ez-share-app.appspot.com',
    iosBundleId: 'com.example.ezshare',
  );
}
