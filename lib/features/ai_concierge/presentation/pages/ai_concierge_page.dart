import 'package:flutter/material.dart';

class AIConciergePage extends StatelessWidget {
  const AIConciergePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المساعد الذكي')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.smart_toy),
            title: Text('اقترح لي أفضل العروض'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('وين أرخص منتج؟'),
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('رشّح لي بائع موثوق'),
          ),
        ],
      ),
    );
  }
}
