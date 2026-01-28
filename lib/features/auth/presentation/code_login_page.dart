import 'package:flutter/material.dart';
import '../../../core/auth/services/auth_service.dart';

class CodeLoginPage extends StatefulWidget {
  const CodeLoginPage({super.key});

  @override
  State<CodeLoginPage> createState() => _CodeLoginPageState();
}

class _CodeLoginPageState extends State<CodeLoginPage> {
  final controller = TextEditingController();
  String error = '';

  void login() {
    final success = AuthService.loginWithCode(controller.text.trim());
    if (success) {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      setState(() => error = '❌ رمز غير صحيح');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'رمز الدخول'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: login, child: const Text('دخول')),
            if (error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(error, style: const TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
    );
  }
}
