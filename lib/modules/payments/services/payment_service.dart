class PaymentService {
  static Future<bool> processPayment(double amount) async {
    // لاحقًا: API / بوابة دفع
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
