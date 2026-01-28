import 'package:flutter/material.dart';

import '../ui/home/home_page.dart';
import '../features/chat/presentation/chat_page.dart';
import '../features/settings/presentation/settings_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (_) => const HomePage(),
  '/chat': (_) => const ChatPage(),
  '/settings': (_) => const SettingsPage(),
};
