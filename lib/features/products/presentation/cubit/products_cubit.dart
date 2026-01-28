import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/products_repository.dart';
import '../../domain/product.dart';

abstract class ProductsState {}
class ProductsLoading extends ProductsState {}
class ProductsLoaded extends ProductsState {
  final List<Product> products;
  ProductsLoaded(this.products);
}
class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);
}

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository repo;
  ProductsCubit(this.repo) : super(ProductsLoading());

  Future<void> loadProducts() async {
    try {
      emit(ProductsLoading());
      final products = await repo.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
