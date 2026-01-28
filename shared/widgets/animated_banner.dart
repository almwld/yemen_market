import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedBanner extends StatelessWidget {
  final String asset;
  final double height;

  const AnimatedBanner({
    super.key,
    required this.asset,
    this.height = 160,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Lottie.asset(
        asset,
        height: height,
        fit: BoxFit.cover,
        repeat: true,
      ),
    );
  }
}
