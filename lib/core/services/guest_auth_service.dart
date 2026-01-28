import 'package:firebase_auth/firebase_auth.dart';

class GuestAuthService {
  static Future<User?> signInAsGuest() async {
    final cred = await FirebaseAuth.instance.signInAnonymously();
    return cred.user;
  }
}
