import 'package:flutter/material.dart';

class FlashSalesPage extends StatelessWidget {
  const FlashSalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('⚡ عروض فلاش')),
      body: Center(
        child: Text(
          '⏳ ينتهي العرض خلال 01:23:45',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
