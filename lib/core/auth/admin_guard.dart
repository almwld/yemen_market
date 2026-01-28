import 'package:flutter/material.dart';
import 'services/auth_service.dart';

class AdminGuard extends StatelessWidget {
  final Widget child;
  const AdminGuard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    if (!AuthService.isAdmin) {
      return const Scaffold(
        body: Center(child: Text('🚫 دخول الأدمن فقط')),
      );
    }
    return child;
  }
}
