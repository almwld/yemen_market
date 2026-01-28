import 'package:flutter/material.dart';

class SellerDashboard extends StatelessWidget {
  const SellerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(title: Text('لوحة البائع')),
      body: Center(child: Text('إدارة المنتجات / الطلبات')),
    );
  }
}
