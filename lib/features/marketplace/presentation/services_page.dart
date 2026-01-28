import 'package:flutter/material.dart';

import '../widgets/animated_ad_banner.dart';
import '../../../admin/services/admin_ads_service.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛍️ جميع الخدمات'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          /// 🔥 بانر إعلاني متحرك (يتغير من لوحة الأدمن)
          AnimatedAdBanner(
            animationPath: AdminAdsService.currentBanner(),
          ),

          const SizedBox(height: 12),

          /// 🧠 عنوان ذكي
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'الخدمات الأكثر طلبًا',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 8),

          /// 📦 مثال كروت خدمات (مكان التوسعة)
          _ServiceCard(title: '✈️ حجز طيران'),
          _ServiceCard(title: '🏨 حجز فنادق'),
          _ServiceCard(title: '📡 شحن وبطاقات إنترنت'),
          _ServiceCard(title: '🎮 ألعاب وشحن'),
          _ServiceCard(title: '💳 دفع إلكتروني'),
          _ServiceCard(title: '💎 خدمات VIP'),
        ],
      ),
    );
  }
}

/// 🧱 كرت خدمة – بسيط وقابل للتطوير
class _ServiceCard extends StatelessWidget {
  final String title;

  const _ServiceCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
