import 'package:flutter/material.dart';

import '../../features/marketplace/home/home_page.dart';
import '../../features/seller/presentation/dashboard_page.dart';
import '../../features/admin/presentation/admin_dashboard_page.dart';
import '../auth/user_role.dart';

class RoleRouter extends StatelessWidget {
  final UserRole role;

  const RoleRouter({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    switch (role) {
      case UserRole.admin:
        return const AdminDashboardPage();
      case UserRole.trader:
        return const SellerDashboardPage();
      default:
        return const HomePage();
    }
  }
}
