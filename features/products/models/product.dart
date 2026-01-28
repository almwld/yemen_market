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

  factory Product.fromMap(String id, Map<String, dynamic> data) {
    return Product(
      id: id,
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      sellerId: data['sellerId'] ?? '',
      approved: data['approved'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'sellerId': sellerId,
      'approved': approved,
      'createdAt': DateTime.now(),
    };
  }
}
