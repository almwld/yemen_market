import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طرق الدفع')),
      body: ListView(
        children: const [
          ListTile(title: Text('محفظة')),
          ListTile(title: Text('تحويل بنكي')),
          ListTile(title: Text('الدفع عند الاستلام')),
        ],
      ),
    );
  }
}
