import 'package:flutter/material.dart';

class Feature {
  final String id;
  final String title;
  final IconData icon;
  final Widget page;
  final List<String> roles; // من يراه

  const Feature({
    required this.id,
    required this.title,
    required this.icon,
    required this.page,
    required this.roles,
  });
}
