import 'package:flutter/material.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('السوق المباشر')),
      body: const Center(
        child: Text(
          '📈 Charts & Trading (قادم)',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
