import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'ad_service.dart';

class AdsBanner extends StatelessWidget {
  const AdsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final ads = AdService.getActiveAds();

    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: ads.length,
        itemBuilder: (_, i) {
          final ad = ads[i];
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ad.title,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text(ad.subtitle),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Lottie.asset(ad.lottie),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
