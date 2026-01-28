import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> addProduct({
    required String name,
    required double price,
    required String description,
    required File imageFile,
    required String merchantId,
  }) async {
    // إنشاء ID للمنتج
    final productRef = _firestore.collection('products').doc();
    final productId = productRef.id;

    // رفع الصورة إلى Firebase Storage
    final storageRef = _storage
        .ref()
        .child('products/$merchantId/$productId.jpg');

    await storageRef.putFile(imageFile);

    final imageUrl = await storageRef.getDownloadURL();

    // حفظ بيانات المنتج في Firestore
    await productRef.set({
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'merchantId': merchantId,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
