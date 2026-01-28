import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAvailableMethods() {
    return _db
        .collection('payment_methods')
        .where('enabled', isEqualTo: true)
        .snapshots();
  }

  Future<void> createPayment({
    required String userId,
    required double amount,
    required String method,
  }) async {
    await _db.collection('payments').add({
      'userId': userId,
      'amount': amount,
      'method': method,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
