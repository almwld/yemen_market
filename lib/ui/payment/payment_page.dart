import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../payment/payment_service.dart';

class PaymentPage extends StatelessWidget {
  final double amount;
  const PaymentPage({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final service = PaymentService();

    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: StreamBuilder<QuerySnapshot>(
        stream: service.getAvailableMethods(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['type']),
                onTap: () async {
                  await service.createPayment(
                    userId: 'TEMP_USER',
                    amount: amount,
                    method: data['name'],
                  );
                  Navigator.pop(context);
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
