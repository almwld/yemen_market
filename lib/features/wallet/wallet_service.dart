class WalletService {
  static double _balance = 0;

  static double get balance => _balance;

  static void add(double amount) {
    _balance += amount;
  }

  static bool deduct(double amount) {
    if (_balance < amount) return false;
    _balance -= amount;
    return true;
  }
}
