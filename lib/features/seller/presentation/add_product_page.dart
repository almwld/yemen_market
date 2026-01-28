import 'package:flutter/material.dart';
import '../../products/models/product.dart';
import '../../products/services/product_service.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final ProductService _service = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final product = Product(
                  id: '',
                  name: nameCtrl.text,
                  price: double.parse(priceCtrl.text),
                  sellerId: 'SELLER_ID_HERE',
                  approved: false,
                );

                await _service.addProduct(product);
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
