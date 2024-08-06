import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_update_page.dart';
import 'details_page.dart';
import 'home_page.dart';
import 'navigation_animation.dart';
import 'product_provider.dart';
import 'search_page.dart';
import 'package:provider/provider.dart';
import 'update.dart';
import 'product.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/details':
              final int index = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) {
                  return DetailsPage(index: index);
                },
              );
              // return FadePageRoute(page: const DetailsPage());
            case '/add_update':
              return SlidePageRoute(page: AddUpdatePage());
            case '/update':
              final args = settings.arguments as Map<String, dynamic>;
              final int index = args['index'];
              final Product product = args['product'];
              return FadePageRoute(page: UpdatePage(index: index, product: product));
            
            case '/search':
              return ScalePageRoute(page: SearchPage());
            default:
              return MaterialPageRoute(builder: (context) => const HomePage());
          }
        },
        initialRoute: '/',
      ),
    );
  }
}
