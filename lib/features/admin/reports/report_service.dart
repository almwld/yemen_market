import 'report_model.dart';

class ReportService {
  AdminReport generate({
    required int orders,
    required int sellers,
    required double revenue,
    required double commissionRate,
  }) {
    return AdminReport(
      totalOrders: orders,
      totalSellers: sellers,
      totalRevenue: revenue,
      marketCommission: revenue * commissionRate,
    );
  }
}
