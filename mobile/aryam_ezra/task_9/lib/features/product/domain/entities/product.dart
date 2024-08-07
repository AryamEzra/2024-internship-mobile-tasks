import 'dart:io';

class Product {
  String name;
  String description;
  String category;
  int id;
  double price;
  File? image;

  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.id,
    required this.price,
    required this.image,
  });
}
