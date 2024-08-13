import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/product/domain/use_case/get_all_products.dart';
import 'features/product/presentation/bloc/home_page/home_page_bloc.dart';
import 'features/product/presentation/pages/product_home_page.dart'; 

void main() {
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
          final bloc = HomePageBloc(GetAllProducts as GetAllProducts); 
          bloc.add(const FetchAllProductsEvent());
          return bloc;
        },
        child: const HomePage(),
      ),
    );
  }
}
