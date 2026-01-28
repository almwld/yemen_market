import 'package:flutter/material.dart';

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'icon': Icons.flight, 'title': 'سفر'},
      {'icon': Icons.hotel, 'title': 'فنادق'},
      {'icon': Icons.wifi, 'title': 'اتصالات'},
      {'icon': Icons.videogame_asset, 'title': 'ألعاب'},
      {'icon': Icons.currency_bitcoin, 'title': 'كريبتو'},
      {'icon': Icons.star, 'title': 'VIP'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(services[index]['icon'] as IconData, size: 32),
              const SizedBox(height: 8),
              Text(
                services[index]['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
