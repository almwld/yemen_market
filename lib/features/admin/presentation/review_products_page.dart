import 'package:flutter/material.dart';
import '../services/admin_service.dart';
import '../models/admin_product_model.dart';

class ReviewProductsPage extends StatelessWidget {
  const ReviewProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = AdminService();

    service.products.add(
      AdminProduct(
        id: 'p1',
        name: 'رز يمني',
        price: 8000,
        sellerId: 's1',
        approved: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('مراجعة المنتجات')),
      body: ListView.builder(
        itemCount: service.products.length,
        itemBuilder: (context, i) {
          final product = service.products[i];
          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('${product.price} ريال'),
              trailing: ElevatedButton(
                onPressed: product.approved
                    ? null
                    : () => service.approveProduct(product.id),
                child: const Text('موافقة'),
              ),
            ),
          );
        },
      ),
    );
  }
}
