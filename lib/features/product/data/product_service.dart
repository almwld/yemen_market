import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../domain/product_model.dart';

class ProductService {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<List<String>> uploadImages(List<File> files, String productId) async {
    List<String> urls = [];
    for (int i = 0; i < files.length; i++) {
      final ref = _storage.ref('products/$productId/img_$i.jpg');
      await ref.putFile(files[i]);
      urls.add(await ref.getDownloadURL());
    }
    return urls;
  }

  Future<void> addProduct(Product product) async {
    await _db.collection('products').doc(product.id).set(product.toMap());
  }
}
