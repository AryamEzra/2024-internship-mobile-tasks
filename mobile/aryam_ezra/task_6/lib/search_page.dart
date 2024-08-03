import 'package:flutter/material.dart';
import 'package:task_6/image_container.dart';
import 'package:task_6/range_slidder.dart';
import 'product.dart';
import 'product_provider.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';
import 'image_container.dart';

class SearchPage extends StatelessWidget {
  List<Product> _products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color:  Color.fromARGB(255, 54, 104, 255), size: 20),
          onPressed: () {Navigator.pop(context);},
        ),
        title: Text(
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
                      suffixIcon: Icon(Icons.arrow_forward),
                      hintText: 'Leather',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                SizedBox(width:10),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 56,
                  height: 56, 
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 54, 104, 255),
                    borderRadius: BorderRadius.circular(6), 

                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
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
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Category', style: TextStyle(fontSize: 20),),
              ],
            ),
            SizedBox(height: 5,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(child: MyRange()),
            SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromARGB(255, 54, 104, 255),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('APPLY'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


