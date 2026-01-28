class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final String merchantId;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.merchantId,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'images': images,
    'merchantId': merchantId,
    'createdAt': DateTime.now(),
  };

  factory Product.fromMap(Map<String, dynamic> map) => Product(
    id: map['id'],
    name: map['name'],
    description: map['description'],
    price: (map['price'] as num).toDouble(),
    images: List<String>.from(map['images']),
    merchantId: map['merchantId'],
  );
}
