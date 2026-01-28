import '../payments/services/payment_log_service.dart';

class ReportService {
  static Future<double> totalSales() async {
    final payments = await PaymentLogService.getPayments();
    return payments.fold(
      0.0,
      (sum, p) => sum + (p['amount'] as num).toDouble(),
    );
  }

  static Future<int> totalOrders() async {
    final payments = await PaymentLogService.getPayments();
    return payments.length;
  }
}
