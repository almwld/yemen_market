import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🔥 عروض ذكية')),
      body: ListView(
        children: const [
          ListTile(title: Text('💸 خصم 20% على الاتصالات')),
          ListTile(title: Text('🎮 عروض ألعاب VIP')),
          ListTile(title: Text('✈️ خصم رحلات')),
        ],
      ),
    );
  }
}
