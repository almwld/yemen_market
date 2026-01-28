import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart_item_model.dart';

class CartService {
  final _db = FirebaseFirestore.instance.collection('carts');

  Future<void> addToCart(String userId, CartItemModel item) async {
    await _db
        .doc(userId)
        .collection('items')
        .doc(item.productId)
        .set(item.toJson());
  }

  Stream<List<CartItemModel>> getCart(String userId) {
    return _db.doc(userId).collection('items').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => CartItemModel.fromJson(doc.data()))
              .toList(),
        );
  }
}
