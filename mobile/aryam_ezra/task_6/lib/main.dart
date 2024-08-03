import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_update_page.dart';
import 'details_page.dart';
import 'home_page.dart';
import 'navigation_animation.dart'; 
import 'search_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/details':
            return FadePageRoute(page: const DetailsPage());
          case '/add_update':
            return SlidePageRoute(page: const AddUpdatePage());
          case '/search':
            return ScalePageRoute(page: const SearchPage());
          default:
            return MaterialPageRoute(builder: (context) => const HomePage());
        }
      },
      initialRoute: '/',
    );
  }
}
