import 'package:flutter/material.dart';

class VipGuard extends StatelessWidget {
  final Widget child;
  final bool isVip;

  const VipGuard({
    super.key,
    required this.child,
    required this.isVip,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVip) {
      return Scaffold(
        appBar: AppBar(title: const Text('خدمة VIP')),
        body: const Center(
          child: Text(
            '💎 هذه الخدمة متاحة لأعضاء VIP فقط',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }
    return child;
  }
}
