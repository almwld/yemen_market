import 'package:flutter/material.dart';

class GuestGuard {
  static void check({
    required BuildContext context,
    required VoidCallback onAllowed,
  }) {
    final isGuest = true; // لاحقًا Firebase

    if (isGuest) {
      Navigator.pushNamed(context, '/login');
    } else {
      onAllowed();
    }
  }
}
