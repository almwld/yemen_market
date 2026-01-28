class WalletService {
  Future<int> getBalance() async {
    await Future.delayed(const Duration(seconds: 1));
    return 25000; // رصيد تجريبي
  }
}
