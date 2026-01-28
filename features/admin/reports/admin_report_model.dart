class AdminReport {
  final String sellerId;
  final double totalSales;
  final double totalCommission;
  final double netProfit;

  AdminReport({
    required this.sellerId,
    required this.totalSales,
    required this.totalCommission,
    required this.netProfit,
  });

  Map<String, dynamic> toJson() => {
    'seller_id': sellerId,
    'total_sales': totalSales,
    'total_commission': totalCommission,
    'net_profit': netProfit,
  };
}
