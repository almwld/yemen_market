import 'package:flutter/material.dart';
import '../../services/payment_service.dart';

class PaymentPage extends StatelessWidget {
  final double amount;
  const PaymentPage({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدفع')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final success = await PaymentService.pay(amount: amount);
            if (success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم الدفع بنجاح')),
              );
              Navigator.pop(context);
            }
          },
          child: Text('ادفع $amount'),
        ),
      ),
    );
  }
}
