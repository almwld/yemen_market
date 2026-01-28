import 'package:flutter/material.dart';
import '../../data/moc/products_moc.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> items = [];

  void add(Product p) {
    items.add(p);
    notifyListeners();
  }

  double get total =>
      items.fold(0, (sum, p) => sum + p.price);
}
