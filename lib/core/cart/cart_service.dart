import 'package:firebase_auth/firebase_auth.dart';

class CartService {
  static String get cartOwnerId {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return 'guest';
    }
    return user.uid;
  }
}
