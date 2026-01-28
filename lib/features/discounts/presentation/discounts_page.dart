import 'package:flutter/material.dart';
import '../services/discount_service.dart';
import 'widgets/discount_card.dart';

class DiscountsPage extends StatelessWidget {
  final bool isVip;

  const DiscountsPage({super.key, required this.isVip});

  @override
  Widget build(BuildContext context) {
    final discounts = DiscountService.getAvailable(isVip);

    return Scaffold(
      appBar: AppBar(title: const Text('🎉 العروض والخصومات')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: discounts.length,
        itemBuilder: (_, i) =>
            DiscountCard(discount: discounts[i]),
      ),
    );
  }
}
