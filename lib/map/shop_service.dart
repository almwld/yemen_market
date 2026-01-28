import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShopService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addShop({
    required String name,
    required double lat,
    required double lng,
  }) async {
    final uid = _auth.currentUser!.uid;

    await _db.collection('shops').add({
      'name': name,
      'lat': lat,
      'lng': lng,
      'ownerId': uid,
      'approved': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
