class AdminProduct {
  final String id;
  final String name;
  final double price;
  final String sellerId;
  final bool approved;

  AdminProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.sellerId,
    required this.approved,
  });

  AdminProduct copyWith({bool? approved}) {
    return AdminProduct(
      id: id,
      name: name,
      price: price,
      sellerId: sellerId,
      approved: approved ?? this.approved,
    );
  }
}
