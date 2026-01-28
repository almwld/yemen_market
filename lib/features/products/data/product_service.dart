import 'package:cloud_firestore/cloud_firestore.dart';
import 'product_model.dart';

class ProductService {
  final _db = FirebaseFirestore.instance.collection('products');

  Stream<List<ProductModel>> getProducts() {
    return _db.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }
}
