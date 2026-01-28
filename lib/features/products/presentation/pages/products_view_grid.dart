import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../widgets/product_card.dart';

class ProductsViewGrid extends StatelessWidget {
  const ProductsViewGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProductsLoaded) {
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];

              return ProductCard(
                title: product.name,
                price: '${product.price} ر.ي',
                image: 'assets/images/products/phone.png', // صورة مؤقتة
                onTap: () {
                  // لاحقًا: صفحة تفاصيل المنتج
                },
              );
            },
          );
        }

        if (state is ProductsError) {
          return Center(
            child: Text(state.message),
          );
        }

        return const Center(
          child: Text('لا توجد منتجات'),
        );
      },
    );
  }
}
