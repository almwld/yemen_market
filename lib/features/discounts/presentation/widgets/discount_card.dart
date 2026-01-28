import 'package:flutter/material.dart';
import '../../models/discount.dart';

class DiscountCard extends StatelessWidget {
  final Discount discount;

  const DiscountCard({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.local_offer, color: Colors.green),
        title: Text(discount.title),
        subtitle: Text('كود الخصم: ${discount.code}'),
        trailing: Text(
          '-${discount.percent.toInt()}%',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
