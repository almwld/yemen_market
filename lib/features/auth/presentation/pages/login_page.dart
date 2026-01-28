import 'package:flutter/material.dart';
import '../../../core/auth/auth_service.dart';
import '../../../core/cart/guest_cart_migrator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthService.signIn();
            await GuestCartMigrator.migrate();
            Navigator.pop(context);
          },
          child: const Text('تسجيل الدخول'),
        ),
      ),
    );
  }
}
