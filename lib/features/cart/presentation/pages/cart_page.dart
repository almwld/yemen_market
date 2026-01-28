import 'package:flutter/material.dart';
import '../../services/cart_service.dart';
import '../../../core/auth/guest_guard.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('السلة')),
      body: Column(
        children: [
          const Expanded(
            child: Center(child: Text('عناصر السلة')),
          ),
          ElevatedButton(
            onPressed: () {
              GuestGuard.check(
                context: context,
                onAllowed: () {
                  Navigator.pushNamed(context, '/orders');
                },
              );
            },
            child: const Text('إتمام الشراء'),
          ),
        ],
      ),
    );
  }
}
