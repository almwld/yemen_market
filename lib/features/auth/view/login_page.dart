import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> loginAnonToEmail(BuildContext context) async {
    // مؤقت – لاحقًا Email / Phone / Google
    await FirebaseAuth.instance.signInAnonymously();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => loginAnonToEmail(context),
          child: const Text('تسجيل الدخول'),
        ),
      ),
    );
  }
}
