import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../models/product.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final ProductService _service = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: StreamBuilder<List<Product>>(
        stream: _service.approvedProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, i) {
              final product = products[i];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('${product.price}'),
              );
            },
          );
        },
      ),
    );
  }
}
