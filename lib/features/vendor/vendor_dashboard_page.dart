import 'package:flutter/material.dart';

class VendorDashboardPage extends StatelessWidget {
  const VendorDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لوحة التاجر')),
      body: const Center(child: Text('إدارة المنتجات')),
    );
  }
}
