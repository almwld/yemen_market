import 'package:flutter/material.dart';
import '../models/payment_result.dart';

class PaymentSummaryWidget extends StatelessWidget {
  final PaymentResult result;

  const PaymentSummaryWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('السعر الأصلي: ${result.originalPrice} ريال'),
            Text('الخصم: ${result.discountPercent}%'),
            const Divider(),
            Text(
              'الإجمالي: ${result.finalPrice} ريال',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
