import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final double amount;

  const PaymentPage({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدفع')),
      body: Center(
        child: Text('المبلغ المطلوب: $amount'),
      ),
    );
  }
}
