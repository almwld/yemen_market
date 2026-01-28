import 'admin_report_model.dart';

class AdminReportService {
  AdminReport generateReport({
    required String sellerId,
    required double totalSales,
    required double commission,
  }) {
    return AdminReport(
      sellerId: sellerId,
      totalSales: totalSales,
      totalCommission: commission,
      netProfit: totalSales - commission,
    );
  }
}
