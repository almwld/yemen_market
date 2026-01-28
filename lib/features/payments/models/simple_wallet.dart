class SimpleWallet {
  double balance;

  SimpleWallet({this.balance = 0});

  void deposit(double amount) {
    balance += amount;
  }

  bool withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      return true;
    }
    return false;
  }
}
