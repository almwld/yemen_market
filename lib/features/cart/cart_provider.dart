import 'package:flutter/material.dart';
import '../../data/moc/products_moc.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  double get total =>
      _items.fold(0, (sum, p) => sum + p.price);

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }

  void remove(Product p) {
    _items.remove(p);
    notifyListeners();
  }
}
