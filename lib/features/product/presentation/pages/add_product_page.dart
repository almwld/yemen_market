import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/product_service.dart';
import '../../domain/product_model.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final name = TextEditingController();
  final desc = TextEditingController();
  final price = TextEditingController();
  final service = ProductService();
  List<File> images = [];

  pickImages() async {
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage();
    if (picked != null) {
      setState(() => images = picked.map((e) => File(e.path)).toList());
    }
  }

  submit() async {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final urls = await service.uploadImages(images, id);
    final product = Product(
      id: id,
      name: name.text,
      description: desc.text,
      price: double.parse(price.text),
      images: urls,
      merchantId: 'merchant_001',
    );
    await service.addProduct(product);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة منتج')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(controller: name, decoration: const InputDecoration(labelText: 'الاسم')),
          TextField(controller: desc, decoration: const InputDecoration(labelText: 'الوصف')),
          TextField(controller: price, decoration: const InputDecoration(labelText: 'السعر')),
          ElevatedButton(onPressed: pickImages, child: const Text('اختيار صور')),
          ElevatedButton(onPressed: submit, child: const Text('نشر المنتج')),
        ]),
      ),
    );
  }
}
