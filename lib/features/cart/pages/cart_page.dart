import 'package:flutter/material.dart';
import '../../../core/auth/guest_guard.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('السلة')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GuestGuard.check(
              context: context,
              onAllowed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم السماح بالدفع')),
                );
              },
            );
          },
          child: const Text('إتمام الشراء'),
        ),
      ),
    );
  }
}
