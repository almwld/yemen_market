import '../../core/services/wallet_service.dart';

class AdminWalletService {
  static void addBalance(double amount) {
    WalletService.add(amount, title: 'شحن من الإدارة');
  }

  static void deductBalance(double amount) {
    WalletService.spend(amount, title: 'خصم من الإدارة');
  }
}
