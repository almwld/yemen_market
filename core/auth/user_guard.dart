import 'package:flutter/material.dart';
import 'services/auth_service.dart';

class UserGuard extends StatelessWidget {
  final Widget child;
  const UserGuard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    if (!AuthService.isUser && !AuthService.isAdmin) {
      return const Scaffold(
        body: Center(child: Text('🔑 أدخل رمز الدخول')),
      );
    }
    return child;
  }
}
