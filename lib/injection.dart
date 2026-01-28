import 'package:get_it/get_it.dart';
import 'features/products/presentation/cubit/products_cubit.dart';

final sl = GetIt.instance;

void initInjection() {
  sl.registerFactory<ProductsCubit>(() => ProductsCubit());
}
