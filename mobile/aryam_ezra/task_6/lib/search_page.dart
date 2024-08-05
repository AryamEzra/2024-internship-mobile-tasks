import 'package:flutter/material.dart';
import 'details_page.dart';
import 'image_container.dart';
import 'range_slidder.dart';
import 'product.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';
import 'bottom_sheet.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.arrow_forward),
                      hintText: 'Leather',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 54, 104, 255),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const FilterBottomSheet(),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: productProvider.products.length,
                itemBuilder: (context, index) {
                  final product = productProvider.products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: index,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageContainer(
                        product: product,
                      ),
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
