import 'package:flutter/material.dart';
import '../services/admin_offer_service.dart';

class AdminOffersPage extends StatelessWidget {
  const AdminOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = AdminOfferService.activeOffers;

    return Scaffold(
      appBar: AppBar(title: const Text('إدارة العروض')),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(offers[i].title),
          subtitle: Text(offers[i].description),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AdminOfferService.addOffer(
            AdminOffer(
              title: '🔥 عرض جديد',
              description: 'خصم لفترة محدودة',
              route: '/services',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
