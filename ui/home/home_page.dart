import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yemen Market'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 Animated Banner
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/banner.json',
                fit: BoxFit.cover,
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '⚡ الخدمات السريعة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _ServiceIcon(icon: Icons.payment, label: 'دفع'),
                _ServiceIcon(icon: Icons.phone_android, label: 'اتصالات'),
                _ServiceIcon(icon: Icons.flight, label: 'سفر'),
                _ServiceIcon(icon: Icons.sports_esports, label: 'ألعاب'),
                _ServiceIcon(icon: Icons.shopping_cart, label: 'تسوق'),
                _ServiceIcon(icon: Icons.currency_bitcoin, label: 'كريبتو'),
                _ServiceIcon(icon: Icons.wifi, label: 'إنترنت'),
                _ServiceIcon(icon: Icons.star, label: 'VIP'),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '💎 خدمات VIP',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _VipCard(title: 'Crypto Pro'),
                  _VipCard(title: 'Forex Signals'),
                  _VipCard(title: 'Smart Discounts'),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '🔥 الأكثر طلبًا',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('شحن رصيد فوري'),
              subtitle: Text('الأكثر استخدامًا هذا الأسبوع'),
            ),

            const ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('حجز فنادق'),
              subtitle: Text('عروض حصرية'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ServiceIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 24,
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _VipCard extends StatelessWidget {
  final String title;

  const _VipCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.amber, Colors.deepOrange],
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
