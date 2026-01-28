import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/cart_service.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartService service;

  CartCubit(this.service) : super(CartInitial());

  void loadCart(String userId) {
    service.getCart(userId).listen(
      (items) => emit(CartLoaded(items)),
    );
  }
}
