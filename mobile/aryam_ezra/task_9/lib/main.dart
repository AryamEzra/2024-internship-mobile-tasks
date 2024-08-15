import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/product/data/models/product_model.dart';
import 'features/product/domain/entities/product.dart';
import 'features/product/domain/repository/product_repository.dart';
import 'features/product/domain/use_case/add_product.dart';
import 'features/product/domain/use_case/delete_product.dart';
import 'features/product/domain/use_case/get_product.dart';
import 'features/product/presentation/bloc/add_page/add_page_bloc.dart';
import 'features/product/presentation/bloc/details_page/details_page_bloc.dart';
import 'features/product/presentation/bloc/home_page/home_page_bloc.dart';
import 'features/product/presentation/pages/product_add_page.dart';
import 'features/product/presentation/pages/product_details_page.dart';
import 'features/product/presentation/pages/product_home_page.dart';
import 'features/product/presentation/widgets/navigation_animation.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(
          create: (context) {
            final bloc = getIt<HomePageBloc>();
            bloc.add(FetchAllProductsEvent());
            return bloc;
          },
        ),
        // Add other providers here if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        title: 'Product App',
        home: HomePage(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/details':
              final product = settings.arguments as Product;
              return MaterialPageRoute(
                builder: (context) {
                  return BlocProvider(
                    create: (context) => DetailsPageBloc(
                      getIt<GetProduct>(),
                      getIt<DeleteProduct>(),
                    )..add(FetchProductByIdEvent(GetProductParams(product.id))),
                    child: DetailsPage(id: product.id),
                  );
                },
                settings: settings,
              );
            case '/add_update':
              return SlidePageRoute(
                page: BlocProvider(
                  create: (context) => AddPageBloc(
                    getIt<AddProduct>(),
                  ),
                  child: AddPage(),
                ),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => HomePage(),
              );
          }
        },
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//       ),
//       title: 'Product App',
//       home: BlocProvider(
//         create: (context) {
//           final bloc = getIt<HomePageBloc>();
//           bloc.add(FetchAllProductsEvent());
//           return bloc;
//         },
//         child: HomePage(getIt<ProductRepository>()),
//       ),
//       onGenerateRoute: (settings) {
//         switch (settings.name) {
//           case '/details':
//             final product = settings.arguments as Product;
//             return MaterialPageRoute(
//               builder: (context) {
//                 return DetailsPage(product: product, id: product.id,);
//               },
//               settings: settings,
//             );
//           // case '/add_update':
//           //   return SlidePageRoute(page: AddUpdatePage());
//           // case '/update':
//           //   final args = settings.arguments as Map<String, dynamic>;
//           //   final product = args['product'] as Product;
//           //   return FadePageRoute(page: UpdatePage(product: product));
//           // case '/search':
//           //   return ScalePageRoute(page: SearchPage());
//           default:
//             return MaterialPageRoute(builder: (context) => HomePage(getIt<ProductRepository>()));
//         }
//       },
//     );
//   }
// }
