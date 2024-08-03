import 'package:flutter/material.dart';

import 'size_selector.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  color:  Color.fromARGB(255, 54, 104, 255),
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage('images/image.png'),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Men\'s shoe',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 210, 205, 205),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Derby Leather',
                                    style: TextStyle(
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
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
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
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '  \$120',
                                      style: TextStyle(
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
              child: Text('Size:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            const SizeSelector(), // Replace with SizeSelector widget
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                style: TextStyle(fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1)),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, 
                children: [
                  const SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: () {},
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
                    onPressed: () {Navigator.pushNamed(context, '/add_update');},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 54, 104, 255), 
                      foregroundColor: Colors.white, // White text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12), 
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