import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http; // Add this line to import the 'http' package
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/connectivity/network_info.dart';
import '../../data/data_sources/product_local_data_source.dart';
import '../../data/data_sources/product_remote_data_source.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../bloc/search_page/search_page_bloc.dart'; // Adjust the import according to your project structure

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color.fromARGB(255, 54, 104, 255), size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Search Product',
        ),
        centerTitle: true,
      ),
      // body: BlocProvider<SearchPageBloc>(
      //   // create: (context) async => SearchPageBloc(ProductRepositoryImpl(
      //   //   ProductRemoteDataSourceImpl(client: http.Client()),
      //   //   ProductLocalDataSourceImpl(sharedPreferences: await SharedPreferences.getInstance()),
      //   //   NetworkInfoImpl(),
      //   // )),
      //   child: Container(
      //     padding: EdgeInsets.all(16),
      //     child: BlocListener<SearchPageBloc, SearchPageState>(
      //       listener: (context, state) {
      //         // TODO: implement listener
      //       },
      //       child: BlocBuilder<SearchPageBloc, SearchPageState>(
      //         builder: (context, state) {
      //           if (state is SearchPageInitialState) {
      //             return Center(
      //               child: Text('Search Product'),
      //             );
      //           } else if (state is SearchPageLoadingState) {
      //             return Center(
      //               child: CircularProgressIndicator(),
      //             );
      //           } else if (state is SearchPageLoadedState) {
      //             return ListView.builder(
      //               itemCount: state.products.length,
      //               itemBuilder: (context, index) {
      //                 return ListTile(
      //                   title: Text(state.products[index].name),
      //                   subtitle: Text(state.products[index].description),
      //                   onTap: () {
      //                     Navigator.pushNamed(context, '/product_detail',
      //                         arguments: state.products[index]);
      //                   },
      //                 );
      //               },
      //             );
      //           } else if (state is SearchPageErrorState) {
      //             return Center(
      //               child: Text(state.message),
      //             );
      //           }
      //           return Container();
      //         },
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
