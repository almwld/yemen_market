import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepository {
  static final _db = FirebaseFirestore.instance;

  static String get _ownerId {
    final user = FirebaseAuth.instance.currentUser;
    return user == null ? 'guest' : user.uid;
  }

  static Future<void> addItem(String productId) async {
    await _db
        .collection('carts')
        .doc(_ownerId)
        .collection('items')
        .doc(productId)
        .set({'qty': 1});
  }
}
