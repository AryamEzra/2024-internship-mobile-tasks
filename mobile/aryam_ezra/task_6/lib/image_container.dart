import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

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

                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('images/image.png'),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Derby Leather Shoes',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height:5),
                              Text(
                                'Men\'s shoe',
                                style: TextStyle(
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
                                Text('\$120',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                            SizedBox(height:5),
                            Row(
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