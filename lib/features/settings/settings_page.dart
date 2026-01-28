import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: ListView(
        children: const [
          ListTile(title: Text('الوضع الليلي')),
          ListTile(title: Text('اللغة')),
          ListTile(title: Text('حول التطبيق')),
        ],
      ),
    );
  }
}
