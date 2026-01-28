import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/product.dart';

class ProductsRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<Product>> fetchProducts() async {
    final snap = await _db.collection('products').get();
    return snap.docs
        .map((d) => Product.fromMap(d.id, d.data()))
        .toList();
  }
}
