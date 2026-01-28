import 'dart:io';
import 'package:flutter/material.dart';
import '../../services/product_service.dart';
import 'image_picker_helper.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  File? image;
  bool loading = false;

  Future<void> submit() async {
    if (image == null) return;

    setState(() => loading = true);

    await ProductService().addProduct(
      name: nameCtrl.text,
      price: priceCtrl.text,
      image: image!,
      merchantId: 'merchant_001', // لاحقًا من auth
    );

    setState(() => loading = false);
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
            GestureDetector(
              onTap: () async {
                image = await ImagePickerHelper.pickImage();
                setState(() {});
              },
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: image == null
                    ? const Icon(Icons.add_a_photo, size: 40)
                    : Image.file(image!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'اسم المنتج'),
            ),
            TextField(
              controller: priceCtrl,
              decoration: const InputDecoration(labelText: 'السعر'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loading ? null : submit,
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text('نشر المنتج'),
            ),
          ],
        ),
      ),
    );
  }
}
