class Wallet {
  final String ownerId;
  final double balance;

  Wallet({
    required this.ownerId,
    required this.balance,
  });

  factory Wallet.fromMap(Map<String, dynamic> data) {
    return Wallet(
      ownerId: data['ownerId'],
      balance: (data['balance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ownerId': ownerId,
      'balance': balance,
    };
  }
}
