import 'package:flutter/material.dart';
import 'product.dart';

// ignore: must_be_immutable
class ImageContainer extends StatelessWidget {
  ImageContainer({super.key, required this.product});

  Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
           ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),


          ),
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  height: 170, 
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    image: DecorationImage(
                      image: product.imageFile != null
                          ? FileImage(product.imageFile!)
                          : const AssetImage('image/boots.jpg') as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          ),
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(

                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          )
                      ,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height:5),
                              Text(
                                product.category,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 210, 205, 205),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('\$${product.price}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                            const SizedBox(height:5),
                            const Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow, size: 16),
                                Text('(4.0)  ',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 210, 205, 205),
                                    )),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}