class Product {
  final String id;
  final String title;
  final double price;
  final List<String> images;
  final String category;
  final String vendorId;
  final String description;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.category,
    required this.vendorId,
    required this.description,
  });

  factory Product.fromMap(String id, Map<String, dynamic> data) {
    return Product(
      id: id,
      title: data['title'] ?? '',
      price: (data['price'] as num).toDouble(),
      images: List<String>.from(data['images'] ?? []),
      category: data['category'] ?? '',
      vendorId: data['vendorId'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
