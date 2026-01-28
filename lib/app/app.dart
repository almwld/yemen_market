import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../injection.dart';
import '../features/products/presentation/cubit/products_cubit.dart';
import '../features/home/presentation/pages/home_page.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ProductsCubit>()..loadInitial(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yemen Market',
        theme: ThemeData(useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
