class Product {
  final String name;
  final double price;
  final String image;

  Product(this.name, this.price, this.image);
}

final products = List.generate(
  50,
  (i) => Product(
    'منتج ${i + 1}',
    (10 + i).toDouble(),
    'https://picsum.photos/200?random=$i',
  ),
);
