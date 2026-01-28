import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('💳 الدفع الإلكتروني')),
      body: const Center(child: Text('خدمات الدفع')),
    );
  }
}
