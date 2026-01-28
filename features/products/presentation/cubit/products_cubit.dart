import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/product_service.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductService service;

  ProductsCubit(this.service) : super(ProductsInitial());

  void loadProducts() {
    emit(ProductsLoading());
    service.getProducts().listen(
      (products) => emit(ProductsLoaded(products)),
      onError: (e) => emit(ProductsError(e.toString())),
    );
  }
}
