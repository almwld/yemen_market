import 'package:flutter/material.dart';
import '../../../../core/config/feature_flags.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: ListView(
        children: [
          const ListTile(title: Text('الحساب')),
          const ListTile(title: Text('الطلبات')),
          const ListTile(title: Text('الإشعارات')),

          if (FeatureFlags.walletEnabled)
            const ListTile(title: Text('المحفظة')),

          if (FeatureFlags.vipEnabled)
            const ListTile(title: Text('VIP')),

          if (FeatureFlags.sellerEnabled)
            const ListTile(title: Text('وضع البائع')),
        ],
      ),
    );
  }
}
