class Order {
  final String id;
  final String sellerId;
  final double productPrice;
  final double commission;
  final double sellerProfit;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.sellerId,
    required this.productPrice,
    required this.commission,
    required this.sellerProfit,
    required this.createdAt,
  });

  factory Order.fromMap(String id, Map<String, dynamic> data) {
    return Order(
      id: id,
      sellerId: data['sellerId'],
      productPrice: data['productPrice'],
      commission: data['commission'],
      sellerProfit: data['sellerProfit'],
      createdAt: DateTime.parse(data['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sellerId': sellerId,
      'productPrice': productPrice,
      'commission': commission,
      'sellerProfit': sellerProfit,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
