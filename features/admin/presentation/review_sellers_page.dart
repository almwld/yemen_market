import 'package:flutter/material.dart';
import '../services/admin_service.dart';
import '../models/seller_model.dart';

class ReviewSellersPage extends StatelessWidget {
  const ReviewSellersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = AdminService();

    service.sellers.add(
      SellerModel(
        id: 's1',
        name: 'تاجر صنعاء',
        approved: false,
        createdAt: DateTime.now(),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('مراجعة التجار')),
      body: ListView.builder(
        itemCount: service.sellers.length,
        itemBuilder: (context, i) {
          final seller = service.sellers[i];
          return Card(
            child: ListTile(
              title: Text(seller.name),
              subtitle: Text(
                seller.approved ? 'مفعل' : 'بانتظار الموافقة',
              ),
              trailing: ElevatedButton(
                onPressed: seller.approved
                    ? null
                    : () => service.approveSeller(seller.id),
                child: const Text('موافقة'),
              ),
            ),
          );
        },
      ),
    );
  }
}
