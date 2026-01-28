import 'package:cloud_firestore/cloud_firestore.dart';
import 'order_model.dart';

class OrderService {
  final _db = FirebaseFirestore.instance.collection('orders');

  Future<void> createOrder(String userId, OrderModel order) async {
    await _db.doc(userId).collection('user_orders').add(order.toJson());
  }
}
