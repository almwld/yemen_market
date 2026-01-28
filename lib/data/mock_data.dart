import '../models/product.dart';
import '../models/category.dart';

final categories = [
  Category(id: 'c1', title: 'جوالات', icon: '📱'),
  Category(id: 'c2', title: 'لابتوبات', icon: '💻'),
  Category(id: 'c3', title: 'سماعات', icon: '🎧'),
  Category(id: 'c4', title: 'إكسسوارات', icon: '⌚'),
];

final products = [
  Product(
    id: 'p1',
    name: 'آيفون 14',
    image: 'assets/images/iphone.png',
    price: 500,
    category: 'جوالات',
    isOffer: true,
  ),
  Product(
    id: 'p2',
    name: 'سامسونج S23',
    image: 'assets/images/samsung.png',
    price: 250,
    category: 'جوالات',
  ),
  Product(
    id: 'p3',
    name: 'سماعات',
    image: 'assets/images/headphones.png',
    price: 40,
    category: 'سماعات',
  ),
  Product(
    id: 'p4',
    name: 'لابتوب',
    image: 'assets/images/laptop.png',
    price: 800,
    category: 'لابتوبات',
  ),
];
