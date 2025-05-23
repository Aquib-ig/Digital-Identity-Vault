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
    apiKey: 'AIzaSyAZKUF9HnFzqfm5lyAQ8kMZ1CkSMl4-eRY',
    appId: '1:537233689133:web:9f4ed7e17e2e4d124646a4',
    messagingSenderId: '537233689133',
    projectId: 'digital-identity-vault',
    authDomain: 'digital-identity-vault.firebaseapp.com',
    storageBucket: 'digital-identity-vault.firebasestorage.app',
    measurementId: 'G-JB9KZT8J3H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMV-INQpgGEaP2uLGS1ExWXJWhHes7Vdg',
    appId: '1:537233689133:android:e4d7a0c7ba264fda4646a4',
    messagingSenderId: '537233689133',
    projectId: 'digital-identity-vault',
    storageBucket: 'digital-identity-vault.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3d2Jj1G_GsXDfUtdRSQrdK_Aq9eaOfEc',
    appId: '1:537233689133:ios:8869ad643b7148b64646a4',
    messagingSenderId: '537233689133',
    projectId: 'digital-identity-vault',
    storageBucket: 'digital-identity-vault.firebasestorage.app',
    iosBundleId: 'com.example.digitalIdentityVault',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3d2Jj1G_GsXDfUtdRSQrdK_Aq9eaOfEc',
    appId: '1:537233689133:ios:8869ad643b7148b64646a4',
    messagingSenderId: '537233689133',
    projectId: 'digital-identity-vault',
    storageBucket: 'digital-identity-vault.firebasestorage.app',
    iosBundleId: 'com.example.digitalIdentityVault',
  );
}
