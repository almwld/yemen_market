import '../../payments/services/wallet_service.dart';

class OrderFinancialService {
  final WalletService _wallet = WalletService();

  Map<String, double> calculateOrder(double totalPrice) {
    final commission = _wallet.calculateCommission(totalPrice);
    final sellerProfit = _wallet.sellerNetProfit(totalPrice);

    return {
      'total': totalPrice,
      'commission': commission,
      'seller_profit': sellerProfit,
    };
  }
}
