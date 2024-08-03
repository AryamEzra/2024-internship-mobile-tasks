import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/image_container.dart';
import 'details_page.dart';
import 'add_update_page.dart';
import 'search_page.dart';
import 'product.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Product> _products = [];

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yMMMMd').format(DateTime.now());
    
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(204, 204, 204, 1),
                ),
                height: 50,
                width: 50,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text(
                          formattedDate,
                          
                          style: GoogleFonts.syne(
                            fontSize: 13,
                            color: const Color.fromRGBO(170, 170, 170, 1),
                          ),
                        ),
                        
                      ),
                      Row(
                        children: [
                          
                          Text('Hello, ',
                              style: GoogleFonts.sora(
                                fontSize: 15,
                                color: const Color.fromRGBO(102, 102, 102, 1),
                                fontWeight: FontWeight.w500,
                              )),
                          Text(
                            'Aryam',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    width: 1.0,
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.notifications_outlined,
                      color: Color.fromARGB(255, 164, 157, 157), size: 30),
                  onPressed: () {
                    // todo
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      // padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              // Text(
                              //   'Avalilable products',
                              //   style: GoogleFonts.poppins(
                              //     textStyle: TextStyle(
                              //         fontSize: 25,
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Avalilable products',
                                  style: const TextStyle(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          width: 1.0,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                          color: const Color.fromRGBO(217, 217, 217, 1),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return GestureDetector(
                      onTap: () {
                        // You can navigate to a detail page here if needed
                      },
                      child: ImageContainer(
                        name: product.name,
                        category: product.category,
                        price: product.price,
                        description: product.description,
                        imageFile: product.imageFile,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final product = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUpdatePage()),
          );

          if (product != null && product is Product) {
            _addProduct(product);
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Color.fromARGB(255, 54, 104, 255),
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}