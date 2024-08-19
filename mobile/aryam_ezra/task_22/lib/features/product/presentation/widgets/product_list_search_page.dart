import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import 'item_card.dart';
class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: product,
            );
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ProductItemCard(product: product),
          ),
        );
      },
    );
  }
}
