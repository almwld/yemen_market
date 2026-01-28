import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedAdBanner extends StatelessWidget {
  final String animationPath;

  const AnimatedAdBanner({
    super.key,
    required this.animationPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Lottie.asset(
          animationPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
