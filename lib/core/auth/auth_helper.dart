import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static User? get user => FirebaseAuth.instance.currentUser;

  static bool get isLoggedIn =>
      user != null && !user!.isAnonymous;

  static bool get isGuest =>
      user != null && user!.isAnonymous;
}
