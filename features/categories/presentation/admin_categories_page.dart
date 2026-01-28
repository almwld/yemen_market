import 'package:flutter/material.dart';
import '../services/category_service.dart';
import '../models/category_model.dart';

class AdminCategoriesPage extends StatelessWidget {
  const AdminCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = CategoryService();

    return Scaffold(
      appBar: AppBar(title: const Text('إدارة الأقسام')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          service.addCategory(
            CategoryModel(
              id: DateTime.now().toString(),
              name: 'مواد غذائية',
              description: 'أرز – دقيق – سكر',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: service.all.map((c) {
          return SwitchListTile(
            title: Text(c.name),
            subtitle: Text(c.description),
            value: c.active,
            onChanged: (_) => service.toggleCategory(c.id),
          );
        }).toList(),
      ),
    );
  }
}
