import 'package:flutter/material.dart';
import '../../../core/auth/guest_guard.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        GuestGuard.check(
          context: context,
          onAllowed: () {
            // المتابعة للدفع
            // Navigator.push(context, ...);
          },
        );
      },
      child: const Text('إتمام الشراء'),
    );
  }
}
