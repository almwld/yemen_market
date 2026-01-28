import 'package:flutter/material.dart';
import 'widgets/stat_card.dart';

class SellerDashboardPage extends StatelessWidget {
  const SellerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121826),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121826),
        elevation: 0,
        title: const Text('لوحة التاجر'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _statusBanner(),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: const [
                StatCard(title: 'المنتجات', value: '12'),
                StatCard(title: 'قيد المراجعة', value: '3'),
                StatCard(title: 'الطلبات', value: '5'),
                StatCard(title: 'الحساب', value: 'مفعل'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade700,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        'حسابك مفعل ويمكنك بيع المنتجات',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
