import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedAdBanner extends StatelessWidget {
  final String animationPath;

  const AnimatedAdBanner({super.key, required this.animationPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Lottie.asset(animationPath),
    );
  }
}
