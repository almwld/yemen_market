import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/product_service.dart';
import '../../models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _name = TextEditingController();
  final _desc = TextEditingController();
  final _price = TextEditingController();
  File? _image;

  Future pickImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) setState(() => _image = File(img.path));
  }

  Future submit() async {
    final product = ProductModel(
      id: '',
      name: _name.text,
      description: _desc.text,
      price: double.parse(_price.text),
      imageUrl: '',
      traderId: FirebaseAuth.instance.currentUser!.uid,
    );

    await ProductService().addProduct(product, _image!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة منتج')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _name, decoration: const InputDecoration(labelText: 'اسم المنتج')),
            TextField(controller: _desc, decoration: const InputDecoration(labelText: 'الوصف')),
            TextField(controller: _price, decoration: const InputDecoration(labelText: 'السعر')),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: pickImage, child: const Text('اختيار صورة')),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: submit, child: const Text('رفع المنتج')),
          ],
        ),
      ),
    );
  }
}
