import 'dart:io';

class Product {
  final String name;
  final String category;
  final int price;
  final String description;
  final File? imageFile;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imageFile,
  });
}
