import 'package:flutter/material.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الرسوم البيانية')),
      body: const Center(
        child: Text('📈 Trading Charts قريبًا'),
      ),
    );
  }
}
