import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/product_model.dart';

class ProductService {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> addProduct(ProductModel product, File image) async {
    final uid = _auth.currentUser!.uid;

    final ref = _storage
        .ref('products/$uid/${DateTime.now().millisecondsSinceEpoch}.jpg');

    await ref.putFile(image);
    final imageUrl = await ref.getDownloadURL();

    await _firestore.collection('products').add(
      product.toMap()..['imageUrl'] = imageUrl,
    );
  }
}
