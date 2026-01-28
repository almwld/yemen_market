import 'package:flutter/material.dart';

class AiOffersPage extends StatelessWidget {
  const AiOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('عروض ذكية')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('🔥 عرض مناسب لك')),
          ListTile(title: Text('🤖 اقتراح AI')),
        ],
      ),
    );
  }
}
