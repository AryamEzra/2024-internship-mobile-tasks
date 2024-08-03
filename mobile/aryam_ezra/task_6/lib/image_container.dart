import 'package:flutter/material.dart';
import 'dart:io';

class ImageContainer extends StatelessWidget {
  final String name, category, description;
  final int price;
  final File? imageFile;

  const ImageContainer({
    Key? key,
    this.name = '',
    this.category = '',
    this.price = 0,
    this.description = '',
    this.imageFile,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Container(
  height: 170,
  width: double.infinity,
  padding: EdgeInsets.symmetric(horizontal: 8.0),
  child: imageFile != null
      ? Image.file(
          imageFile!,
          fit: BoxFit.cover,
        )
      : Image.asset(
          'assets/placeholder.png',
          fit: BoxFit.cover,
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
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$name',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '$category',
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
                              Text(
                                '\$ $price',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow, size: 16),
                              const Text(
                                '(4.0)  ',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 210, 205, 205),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
