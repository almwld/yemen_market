import 'package:flutter/material.dart';
import '../../offers/presentation/offers_widget.dart';
import '../../marketplace/categories/presentation/categories_page.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: const Text('Yemen Market'),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
        ),
        SliverToBoxAdapter(child: OffersWidget()),
        SliverFillRemaining(child: CategoriesPage()),
      ],
    );
  }
}
