import 'package:flutter/material.dart';
import 'admin_wallet_service.dart';

class AdminWalletPage extends StatefulWidget {
  const AdminWalletPage({super.key});

  @override
  State<AdminWalletPage> createState() => _AdminWalletPageState();
}

class _AdminWalletPageState extends State<AdminWalletPage> {
  final controller = TextEditingController();

  void _add() {
    final value = double.tryParse(controller.text);
    if (value != null) {
      AdminWalletService.addBalance(value);
      controller.clear();
      setState(() {});
    }
  }

  void _deduct() {
    final value = double.tryParse(controller.text);
    if (value != null) {
      AdminWalletService.deductBalance(value);
      controller.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🛠️ إدارة المحفظة')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'المبلغ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _add,
                    child: const Text('➕ إضافة رصيد'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _deduct,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('➖ خصم رصيد'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
