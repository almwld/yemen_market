class WalletTransaction {
  final String id;
  final double amount;
  final String type; // add | spend
  final String title;
  final DateTime date;

  WalletTransaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.title,
    required this.date,
  });
}
