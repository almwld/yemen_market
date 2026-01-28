import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  static Future<List<Map<String, dynamic>>> searchProducts(String query) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('keywords', arrayContains: query.toLowerCase())
        .get();

    return snapshot.docs.map((d) => d.data()).toList();
  }
}
