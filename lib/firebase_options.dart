import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError('iOS غير مدعوم حالياً');
      case TargetPlatform.macOS:
        throw UnsupportedError('macOS غير مدعوم');
      case TargetPlatform.windows:
        throw UnsupportedError('Windows غير مدعوم');
      case TargetPlatform.linux:
        throw UnsupportedError('Linux غير مدعوم');
      default:
        throw UnsupportedError('هذه المنصة غير مدعومة');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDK_sSIUTKRU2lJS7HlUOrQ-3rde-KbWoA',
    authDomain: 'yemenmarket-6efa1.firebaseapp.com',
    projectId: 'yemenmarket-6efa1',
    storageBucket: 'yemenmarket-6efa1.firebasestorage.app',
    messagingSenderId: '386995199915',
    appId: '1:386995199915:web:cdde7666a6d793a3753cee',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDK_sSIUTKRU2lJS7HlUOrQ-3rde-KbWoA',
    authDomain: 'yemenmarket-6efa1.firebasestorage.app',
    projectId: 'yemenmarket-6efa1',
    storageBucket: 'yemenmarket-6efa1.firebasestorage.app',
    messagingSenderId: '386995199915',
    appId: '1:386995199915:android:c423e9488897ace99c3243',
  );
}
