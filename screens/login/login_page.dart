import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '👋 مرحبًا بك في سوق اليمن',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ).animate().fade().slideY(),

            const SizedBox(height: 12),

            const Text(
              'كل خدماتك الرقمية في مكان واحد',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ).animate().fade(delay: 200.ms),

            const SizedBox(height: 32),

            TextField(
              decoration: InputDecoration(
                hintText: '🔑 أدخل رمز الدخول',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('الدخول كضيف'),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('🚀 دخول السوق'),
            )
          ],
        ),
      ),
    );
  }
}
