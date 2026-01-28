import 'package:flutter/material.dart';

class UploadProductPage extends StatelessWidget {
  const UploadProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة منتج')),
      body: const Center(
        child: Text('نموذج رفع المنتج (قادم الآن)'),
      ),
    );
  }
}
