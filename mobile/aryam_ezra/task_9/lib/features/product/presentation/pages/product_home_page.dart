import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_page/home_page_bloc.dart';
import '../widgets/custom_app_bar_home_page.dart';
import '../widgets/item_card.dart';
import '../widgets/search_button.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(left:16, right:16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Available products',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                buildSearchButton(context),
              ],
            ),
            Expanded(
              child: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is HomePageLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is HomePageLoadedState) {
                    return ItemCard(products: state.products);
                  } else if (state is HomePageErrorState) {
                    return Center(child: Text(state.message));
                  } else {
                    return Center(child: Text('No products available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_update');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: const Color.fromARGB(255, 54, 104, 255),
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
