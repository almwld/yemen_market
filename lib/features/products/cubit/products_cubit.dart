import 'package:flutter_bloc/flutter_bloc.dart';
import 'products_state.dart';
import '../models/product.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(const ProductsInitial());

  Future<void> loadProducts() async {
    try {
      emit(const ProductsLoading());

      await Future.delayed(const Duration(seconds: 1));

      final products = const [
        Product(name: 'Laptop', price: 1200),
        Product(name: 'Phone', price: 800),
        Product(name: 'Headphones', price: 150),
      ];

      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
