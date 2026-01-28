import 'package:flutter/material.dart';
import '../services/report_service.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تقارير السوق')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _info('إجمالي المبيعات', ReportService.totalSales),
            _info('عمولة السوق', ReportService.totalCommission),
            _info('صافي الأرباح', ReportService.totalNetProfit),
            const Divider(height: 32),
            const Text(
              'عمولة السوق ثابتة: 5%',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        '$title: ${value.toStringAsFixed(2)}',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
