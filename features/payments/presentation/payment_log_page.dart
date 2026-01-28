import 'package:flutter/material.dart';
import '../services/payment_log_service.dart';
import '../models/payment_record.dart';

class PaymentLogPage extends StatefulWidget {
  const PaymentLogPage({super.key});

  @override
  State<PaymentLogPage> createState() => _PaymentLogPageState();
}

class _PaymentLogPageState extends State<PaymentLogPage> {
  @override
  Widget build(BuildContext context) {
    final payments = PaymentLogService.all;

    return Scaffold(
      appBar: AppBar(title: const Text('سجل عمليات الدفع')),
      body: payments.isEmpty
          ? const Center(child: Text('لا توجد عمليات دفع'))
          : ListView.builder(
              itemCount: payments.length,
              itemBuilder: (context, i) {
                final p = payments[i];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('المبلغ: ${p.amount} ريال'),
                    subtitle: Text(
                      'التاريخ: ${p.date}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_statusText(p.status)),
                        const SizedBox(width: 8),
                        if (p.status == PaymentStatus.pending)
                          PopupMenuButton<String>(
                            onSelected: (v) {
                              setState(() {
                                if (v == 'approve') {
                                  PaymentLogService.approve(i);
                                } else {
                                  PaymentLogService.reject(i);
                                }
                              });
                            },
                            itemBuilder: (_) => const [
                              PopupMenuItem(
                                value: 'approve',
                                child: Text('قبول'),
                              ),
                              PopupMenuItem(
                                value: 'reject',
                                child: Text('رفض'),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  String _statusText(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.approved:
        return '✔ مقبول';
      case PaymentStatus.rejected:
        return '✖ مرفوض';
      default:
        return '⏳ قيد المراجعة';
    }
  }
}
