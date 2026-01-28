import 'package:flutter/material.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🛠️ لوحة تحكم الإدارة')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.campaign),
            title: Text('إدارة الإعلانات'),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('خدمات VIP'),
          ),
          ListTile(
            leading: Icon(Icons.discount),
            title: Text('الخصومات والعروض'),
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text('التقارير'),
          ),
        ],
      ),
    );
  }
}
