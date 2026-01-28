import 'package:flutter/material.dart';

class AiConciergePage extends StatelessWidget {
  const AiConciergePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🤖 المساعد الذكي')),
      body: const Center(
        child: Text(
          'سأقترح عليك أفضل الخدمات والعروض 👌',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
