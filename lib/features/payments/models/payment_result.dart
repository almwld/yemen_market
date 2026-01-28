class PaymentResult {
  final double originalPrice;
  final double discountPercent;
  final double finalPrice;

  PaymentResult({
    required this.originalPrice,
    required this.discountPercent,
    required this.finalPrice,
  });
}
