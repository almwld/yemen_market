import '../models/payment_result.dart';

class PaymentCalculator {
  static PaymentResult applyDiscount({
    required double price,
    double discountPercent = 0,
  }) {
    final discountValue = price * (discountPercent / 100);
    final finalPrice = price - discountValue;

    return PaymentResult(
      originalPrice: price,
      discountPercent: discountPercent,
      finalPrice: finalPrice,
    );
  }
}
