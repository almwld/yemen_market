import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  final _db = FirebaseFirestore.instance;

  Future<void> createPayment({
    required String orderId,
    required String method,
    required double amount,
  }) async {
    await _db.collection('payments').add({
      'orderId': orderId,
      'method': method,
      'amount': amount,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
