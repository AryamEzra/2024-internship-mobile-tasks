import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import '../widgets/custom_back_button.dart';

class DetailsPage extends StatelessWidget {
  final Product product;

  const DetailsPage({required Key key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const CustomBackButton(),
      body: Column(
        children: <Widget>[
          // Image.network(product.image),
          Text(product.name),
          Text(product.description),
          Text(product.price.toString()),
        ],
      ),
    );
  }
}
