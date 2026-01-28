import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _action(Icons.person, 'حسابي'),
        _action(Icons.account_balance_wallet, 'المحفظة'),
        _action(Icons.receipt_long, 'طلباتي'),
      ],
    );
  }

  Widget _action(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          child: Icon(icon),
        ),
        const SizedBox(height: 6),
        Text(title),
      ],
    );
  }
}
