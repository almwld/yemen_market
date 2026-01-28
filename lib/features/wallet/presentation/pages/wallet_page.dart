import 'package:flutter/material.dart';
import '../../data/wallet_service.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المحفظة'),
      ),
      body: FutureBuilder<int>(
        future: WalletService().getBalance(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Text(
              'رصيدك: ${snap.data} ر.ي',
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
  }
}
