import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManualPaymentPage extends StatefulWidget {
  const ManualPaymentPage({super.key});

  @override
  State<ManualPaymentPage> createState() => _ManualPaymentPageState();
}

class _ManualPaymentPageState extends State<ManualPaymentPage> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  bool _saved = false;

  Future<void> _savePayment() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_manual_amount', _amountController.text);
    await prefs.setString('last_manual_note', _noteController.text);

    setState(() {
      _saved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدفع اليدوي (أدمن)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'المبلغ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'ملاحظات',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('حفظ عملية الدفع'),
              onPressed: _savePayment,
            ),
            const SizedBox(height: 20),
            if (_saved)
              const Text(
                '✅ تم حفظ الدفع اليدوي بنجاح',
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
