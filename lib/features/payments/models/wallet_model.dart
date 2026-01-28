class Wallet {
  final String userId;
  final double balance;

  Wallet({
    required this.userId,
    required this.balance,
  });

  Wallet copyWith({double? balance}) {
    return Wallet(
      userId: userId,
      balance: balance ?? this.balance,
    );
  }
}
