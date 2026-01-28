import '../../payments/services/payment_log_service.dart';
import '../../reports/services/report_service.dart';

class AdminStatsService {
  static double get totalSales => ReportService.totalSales;

  static int get totalPayments =>
      PaymentLogService.all.length;

  static int get pendingPayments =>
      PaymentLogService.all
          .where((p) => p.status.name == 'pending')
          .length;
}
