import 'package:flutter/material.dart';
import '../services/wallet_service.dart';
import '../models/wallet_model.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wallet = Wallet(userId: 'seller_1', balance: 120000);
    final service = WalletService();

    return Scaffold(
      appBar: AppBar(title: const Text('محفظتي')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text('الرصيد الحالي'),
                trailing: Text('${wallet.balance} ريال'),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                title: const Text('نسبة عمولة السوق'),
                trailing: Text('${WalletService.commissionRate * 100}%'),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                title: const Text('صافي مبلغ طلب 10,000'),
                trailing: Text(
                  '${service.sellerNetAmount(10000)} ريال',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
