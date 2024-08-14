import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/product/domain/repository/product_repository.dart';
import 'features/product/presentation/bloc/home_page/home_page_bloc.dart';
import 'features/product/presentation/pages/product_home_page.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      title: 'Product App',
      home: BlocProvider(
        create: (context) {
          final bloc = getIt<HomePageBloc>();
          bloc.add(FetchAllProductsEvent());
          return bloc;
        },
        child: HomePage(getIt<ProductRepository>()),
      ),
    );
  }
}
