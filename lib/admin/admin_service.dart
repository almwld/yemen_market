import 'package:cloud_firestore/cloud_firestore.dart';

class AdminService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> approveProduct(String productId) async {
    await _db.collection('products').doc(productId).update({
      'approved': true,
      'approvedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> rejectProduct(String productId) async {
    await _db.collection('products').doc(productId).delete();
  }
}
