import 'package:firebase_auth/firebase_auth.dart';

class GuestAuthService {
  static Future<void> signIn() async {
    final auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      await auth.signInAnonymously();
    }
  }
}
