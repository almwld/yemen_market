import 'dart:io';
import 'package:flutter/material.dart';

import '../services/wallet_image_service.dart';
import '../services/wallet_service.dart';

class PaymentInfoPage extends StatefulWidget {
  const PaymentInfoPage({super.key});

  @override
  State<PaymentInfoPage> createState() => _PaymentInfoPageState();
}

class _PaymentInfoPageState extends State<PaymentInfoPage> {
  String walletName = '';
  String walletNumber = '';

  @override
  void initState() {
    super.initState();
    _loadWallet();
  }

  Future<void> _loadWallet() async {
    final data = await WalletService.loadWallet();
    setState(() {
      walletName = data['name'] ?? '';
      walletNumber = data['number'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final File? walletImage = WalletImageService.getImage();

    return Scaffold(
      appBar: AppBar(title: const Text('معلومات الدفع')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'يرجى التحويل إلى المحفظة التالية:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            if (walletImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  walletImage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            else
              const Text('⚠️ لم يتم تعيين صورة للمحفظة'),

            const SizedBox(height: 16),
            Text('اسم المحفظة: $walletName'),
            const SizedBox(height: 8),
            Text('رقم المحفظة: $walletNumber'),

            const SizedBox(height: 24),
            const Text(
              'بعد التحويل، يرجى تأكيد الدفع.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
