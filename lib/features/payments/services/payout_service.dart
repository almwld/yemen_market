class PayoutService {
  Future<bool> payout({
    required String sellerId,
    required double amount,
  }) async {
    // محاكاة تحويل
    await Future.delayed(const Duration(seconds: 2));
    return true; // نجح التحويل
  }
}
