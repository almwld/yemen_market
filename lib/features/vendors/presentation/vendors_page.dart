import 'package:flutter/material.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('البائعون')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.store),
          title: Text('متجر رقم ${i + 1}'),
          subtitle: const Text('منتجات + تقييم'),
        ),
      ),
    );
  }
}
