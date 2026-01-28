import 'package:get_it/get_it.dart';

// Services
import 'features/auth/data/auth_service.dart';
import 'features/products/data/product_service.dart';
import 'features/cart/data/cart_service.dart';
import 'features/orders/data/order_service.dart';

// Cubits
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/products/presentation/cubit/products_cubit.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Services
  sl.registerLazySingleton<AuthService>(() => AuthService());
  sl.registerLazySingleton<ProductService>(() => ProductService());
  sl.registerLazySingleton<CartService>(() => CartService());
  sl.registerLazySingleton<OrderService>(() => OrderService());

  // Cubits
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
  sl.registerFactory<ProductsCubit>(() => ProductsCubit(sl()));
  sl.registerFactory<CartCubit>(() => CartCubit(sl()));
}
