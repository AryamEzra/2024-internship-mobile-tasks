import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';
import 'size_selector.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductProvider>(context, listen: false).products;

    if (index >= products.length) {
      return const Placeholder();
    }
    final product = products[index];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 35,
          width: 35,
          child: Center(
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: const CircleBorder(),
                backgroundColor: Colors.white,
                child: const Icon(
                  size: 15,
                  Icons.arrow_back_ios_new,
                  color: Color.fromARGB(255, 54, 104, 255),
                )),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: product.imageFile != null
                            ? FileImage(product.imageFile!)
                            : const AssetImage('image/boots.jpg')
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.category,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 210, 205, 205),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                    Text(
                                      '(4.0)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color:
                                            Color.fromARGB(255, 210, 205, 205),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      product.price,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Size:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            const SizeSelector(), // Replace with SizeSelector widget
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.description,
                style: const TextStyle(
                    fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .deleteProduct(index);
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius to get the desired curvature
                      ),
                    ),
                    child: const Text(
                      'DELETE',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/update',
                          arguments: {'product': product, 'index': index});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 104, 255),
                      foregroundColor: Colors.white, // White text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('UPDATE'),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
