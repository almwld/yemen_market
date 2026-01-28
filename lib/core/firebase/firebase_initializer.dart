import 'package:firebase_core/firebase_core.dart';

class FirebaseInitializer {
  static Future<void> init() async {
    await Firebase.initializeApp();
  }
}
