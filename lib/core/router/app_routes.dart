import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (_) => const LoginPage(),
    '/orders': (_) => const OrdersPage(),
  };
}
