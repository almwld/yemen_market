enum PaymentStatus {
  pending,
  approved,
  rejected,
}

class PaymentRecord {
  final double amount;
  final DateTime date;
  PaymentStatus status;

  PaymentRecord({
    required this.amount,
    required this.date,
    this.status = PaymentStatus.pending,
  });
}
