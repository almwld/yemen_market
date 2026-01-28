import 'package:flutter/material.dart';
import '../../../../core/config/feature_flags.dart';

class HomeSections extends StatelessWidget {
  const HomeSections({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _card(context, '🔥 عروض اليوم', Icons.local_offer),
        _card(context, '🛍️ المتاجر', Icons.store),

        if (FeatureFlags.aiEnabled)
          _card(context, '🤖 مساعد ذكي', Icons.smart_toy),

        if (FeatureFlags.vipEnabled)
          _card(context, '👑 VIP', Icons.workspace_premium),

        if (FeatureFlags.walletEnabled)
          _card(context, '💳 المحفظة', Icons.account_balance_wallet),
      ],
    );
  }

  Widget _card(BuildContext context, String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {},
      ),
    );
  }
}
