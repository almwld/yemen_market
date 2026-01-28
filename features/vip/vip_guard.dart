import 'package:flutter/material.dart';

class VipGuard extends StatelessWidget {
  final bool isVip;
  final Widget child;

  const VipGuard({
    super.key,
    required this.isVip,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVip) {
      return const Scaffold(
        body: Center(
          child: Text(
            '💎 هذه الخدمة مخصصة لأعضاء VIP',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }
    return child;
  }
}
