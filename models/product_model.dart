class Product {
  final String id;
  final String name;
  final double price;
  final String sellerId;
  final bool approved;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.sellerId,
    required this.approved,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'sellerId': sellerId,
      'approved': approved,
    };
  }
}
