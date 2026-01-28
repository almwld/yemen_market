import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Web not configured yet');
    }
    return android;
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDB5ckT9-C7n-Am6LFCj-4dnmSbMXWTEAY',
    appId: '1:282862193658:android:c423e9488897ace99c3243',
    messagingSenderId: '282862193658',
    projectId: 'yemenmarketapp',
    storageBucket: 'yemenmarketapp.firebasestorage.app',
  );
}
