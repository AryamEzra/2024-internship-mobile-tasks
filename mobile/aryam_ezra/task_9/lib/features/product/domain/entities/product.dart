import 'dart:io';

class Product {
  String name;
  String description;
  late String category;
  int id;
  double price;
  String image;

  Product({
    required this.name,
    required this.description,
    required this.id,
    required this.price,
    required this.image, required String category,
  });
}
