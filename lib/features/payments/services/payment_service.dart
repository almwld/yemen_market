class PaymentService {
  static Future<bool> pay({
    required double amount,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    return true; // محاكاة نجاح الدفع
  }
}
