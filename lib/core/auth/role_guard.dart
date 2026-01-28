import 'package:flutter/material.dart';
import 'role_service.dart';
import 'user_role.dart';

class RoleGuard {
  static void check({
    required BuildContext context,
    required UserRole requiredRole,
    required VoidCallback onAllowed,
  }) {
    if (RoleService.currentRole == requiredRole) {
      onAllowed();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ليس لديك صلاحية الوصول')),
      );
    }
  }
}
