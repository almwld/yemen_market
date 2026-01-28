import 'package:flutter/material.dart';
import 'report_service.dart';

class AdminReportsPage extends StatelessWidget {
  const AdminReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final report = ReportService().generate(
      orders: 120,
      sellers: 15,
      revenue: 850000,
      commissionRate: 0.05,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('تقارير السوق')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _item('عدد الطلبات', report.totalOrders.toString()),
            _item('عدد التجار', report.totalSellers.toString()),
            _item('إجمالي المبيعات', '${report.totalRevenue} ريال'),
            _item('عمولة السوق', '${report.marketCommission} ريال'),
          ],
        ),
      ),
    );
  }

  Widget _item(String title, String value) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
