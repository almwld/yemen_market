import 'package:flutter/material.dart';

class TelecomPage extends StatelessWidget {
  const TelecomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📡 الاتصالات')),
      body: const Center(child: Text('شحن وبطاقات إنترنت')),
    );
  }
}
