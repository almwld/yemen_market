import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/cart_item.dart';

class CartService {
  static String get uid =>
      FirebaseAuth.instance.currentUser!.uid;

  static CollectionReference get _cartRef =>
      FirebaseFirestore.instance
          .collection('carts')
          .doc(uid)
          .collection('items');

  static Future<void> addToCart(CartItem item) async {
    final doc = _cartRef.doc(item.productId);
    final snap = await doc.get();

    if (snap.exists) {
      await doc.update({
        'quantity': (snap['quantity'] ?? 1) + 1,
      });
    } else {
      await doc.set(item.toMap());
    }
  }

  static Stream<List<CartItem>> cartStream() {
    return _cartRef.snapshots().map(
      (snapshot) => snapshot.docs
          .map((e) => CartItem.fromMap(e.data() as Map<String, dynamic>))
          .toList(),
    );
  }

  static Future<void> clearCart() async {
    final items = await _cartRef.get();
    for (var doc in items.docs) {
      await doc.reference.delete();
cat > lib/features/cart/view/cart_page.dart <<'EOF'
import 'package:flutter/material.dart';
import '../service/cart_service.dart';
import '../model/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('السلة')),
      body: StreamBuilder<List<CartItem>>(
        stream: CartService.cartStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data!;
          if (items.isEmpty) {
            return const Center(child: Text('السلة فار
import '../../cart/service/cart_service.dart';
import '../../cart/model/cart_item.dart';

ElevatedButton(
  onPressed: () {
    CartService.addToCart(
      CartItem(
        productId: product.id,
        name: product.name,
        price: product.price,
        quantity: 1,
      ),
    );
  },
  child: const Text('أضف للسلة'),
)
mkdir -p lib/core/auth
mkdir -p lib/features/auth/view
cat > lib/core/auth/auth_helper.dart <<'EOF'
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static User? get user => FirebaseAuth.instance.currentUser;

  static bool get isLoggedIn =>
      user != null && !user!.isAnonymous;

  static bool get isGuest =>
      user != null && user!.isAnonymous;
}
