import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سلة المشتريات')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _cartItem(),
          _cartItem(),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            child: const Text('إتمام الشراء'),
          ),
        ],
      ),
    );
  }

  Widget _cartItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: const [
          Icon(Icons.shopping_bag),
          SizedBox(width: 12),
          Expanded(child: Text('منتج')),
          Text('10\$'),
        ],
      ),
    );
  }
}
