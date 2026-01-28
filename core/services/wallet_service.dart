import '../models/wallet_transaction.dart';

class WalletService {
  static double _balance = 0;
  static final List<WalletTransaction> _transactions = [];

  static double get balance => _balance;
  static List<WalletTransaction> get transactions => _transactions;

  static void add(double amount, {String title = 'شحن رصيد'}) {
    _balance += amount;
    _transactions.insert(
      0,
      WalletTransaction(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        amount: amount,
        type: 'add',
        title: title,
        date: DateTime.now(),
      ),
    );
  }

  static bool spend(double amount, {String title = 'عملية شراء'}) {
    if (_balance < amount) return false;

    _balance -= amount;
    _transactions.insert(
      0,
      WalletTransaction(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        amount: amount,
        type: 'spend',
        title: title,
        date: DateTime.now(),
      ),
    );
    return true;
  }
}
