import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // إضافة منتج (تاجر)
  Future<void> addProduct(Product product) async {
    await _firestore.collection('products').add(product.toMap());
  }

  // منتجات معتمدة (للمستخدم)
  Stream<List<Product>> approvedProducts() {
    return _firestore
        .collection('products')
        .where('approved', isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((d) => Product.fromMap(d.id, d.data())).toList());
  }

  // منتجات بانتظار الموافقة (للأدمن)
  Stream<List<Product>> pendingProducts() {
    return _firestore
        .collection('products')
        .where('approved', isEqualTo: false)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((d) => Product.fromMap(d.id, d.data())).toList());
  }

  // موافقة الأدمن
  Future<void> approveProduct(String productId) async {
    await _firestore
        .collection('products')
        .doc(productId)
        .update({'approved': true});
  }
}
