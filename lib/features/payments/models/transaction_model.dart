enum TransactionType { order, commission, payout }

class TransactionModel {
  final String id;
  final String userId;
  final double amount;
  final TransactionType type;
  final DateTime createdAt;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.type,
    required this.createdAt,
  });
}
