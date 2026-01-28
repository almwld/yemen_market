import '../../data/cart_item_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;
  CartLoaded(this.items);
}
