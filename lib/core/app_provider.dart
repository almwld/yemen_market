import 'package:flutter/material.dart';
import '../data/moc/products_moc.dart';

class Order {
  final List<Product> items;
  final double total;
  final DateTime date;

  Order(this.items, this.total) : date = DateTime.now();
}

class AppProvider extends ChangeNotifier {
  // 🛒 Cart
  final List<Product> cart = [];

  double get cartTotal =>
      cart.fold(0, (sum, p) => sum + p.price);

  void addToCart(Product p) {
    cart.add(p);
    notifyListeners();
  }

  void removeFromCart(Product p) {
    cart.remove(p);
    notifyListeners();
  }

  // 📦 Orders
  final List<Order> orders = [];

  void checkout() {
    if (cart.isEmpty) return;
    orders.add(Order(List.from(cart), cartTotal));
    cart.clear();
    notifyListeners();
  }
}
