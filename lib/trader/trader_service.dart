import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TraderService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addProduct({
    required String name,
    required double price,
  }) async {
    final uid = _auth.currentUser!.uid;

    await _db.collection('products').add({
      'name': name,
      'price': price,
      'sellerId': uid,
      'approved': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
