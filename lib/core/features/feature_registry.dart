import 'package:flutter/material.dart';
import '../../features/search/search_page.dart';

class Feature {
  final String id;
  final String title;
  final IconData icon;
  final Widget page;
  final List<String> roles;

  const Feature({
    required this.id,
    required this.title,
    required this.icon,
    required this.page,
    required this.roles,
  });
}

class FeatureRegistry {
  static List<Feature> all = [
    Feature(
      id: 'search',
      title: 'بحث',
      icon: Icons.search,
      page: SearchPage(),
      roles: ['guest', 'user', 'vip'],
    ),
  ];
}
