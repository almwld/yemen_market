import '../../../core/constants/feature_flags.dart';
import '../../wallet/wallet_service.dart';

class PaymentHandler {
  static void onPaymentSuccess(double amount) {
    // تسجيل الرصيد في المحفظة إذا كانت الميزة مفعلة
    if (FeatureFlags.wallet) {
      WalletService.add(amount);
    }

    // لاحقًا:
    // AnalyticsService.log('payment_success', data: {'amount': amount});
  }
}
