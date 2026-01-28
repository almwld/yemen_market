import 'package:flutter/material.dart';

import '../features/ai_concierge/presentation/ai_concierge_page.dart';
import '../features/admin/dashboard/admin_dashboard_page.dart';
import '../features/marketplace/presentation/services_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/services': (_) => const ServicesPage(),
  '/ai-concierge': (_) => const AiConciergePage(),
  '/admin-dashboard': (_) => const AdminDashboardPage(),
};
