import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'مطاعم',
      'عقارات',
      'سفر',
      'شحن ألعاب',
      'إنترنت',
      'مزادات',
      'حجوزات',
      'خدمات',
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (_, i) => Padding(
        padding: const EdgeInsets.all(8),
        child: Chip(label: Text(categories[i])),
      ),
    );
  }
}
